import 'package:flutter/material.dart';
import '../../pdf_viewer/pdf_pinch_page.dart';
import 'package:url_launcher/url_launcher.dart';

class TeamReports extends StatefulWidget {
  const TeamReports({super.key});

  @override
  State<TeamReports> createState() => _TeamReportsState();
}

class _TeamReportsState extends State<TeamReports> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: const EdgeInsetsDirectional.all(24),
            child: Column(children: [
              Text.rich(TextSpan(children: [
                TextSpan(
                  text: "Weekly Reports\n",
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ])),
              const SizedBox(height: 8),
              GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2,
                ),
                children: buttons,
              ),
            ])));
  }
}

class ProgramListBodyRoute extends MaterialPageRoute {
  ProgramListBodyRoute(String documentPath)
      : super(builder: (context) => PdfViewerPage(documentPath: documentPath));

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}

class DocumentButton extends StatelessWidget {
  final String documentPath;
  final String documentName;

  const DocumentButton({
    super.key,
    required this.documentPath,
    required this.documentName,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async {
        if (!await launchUrl(Uri.parse(documentPath))) {
          throw Exception('Could not launch $documentPath');
        }

        // FIXME: (add support for pdf viewer) Navigator.of(context).push(ProgramListBodyRoute(documentPath));
      },
      color: Theme.of(context).colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(documentName),
    );
  }
}

List<DocumentButton> buttons = List.generate(
    16,
    (index) => DocumentButton(
        documentName: 'Week${index + 1}.pdf',
        documentPath: '/weekly-reports/Week${index + 1}.pdf'));

List<DocumentButton> fancyButtons = const [
  DocumentButton(
      documentName: 'Requirements Document.pdf',
      documentPath: '/SoftwareRequirementsSpecification.pdf'),
  DocumentButton(
      documentName: 'Testing Document.pdf',
      documentPath: '/TestingRequirements.pdf'),
  DocumentButton(
      documentName: 'AllDocuments.zip', documentPath: '/AllDocuments.zip'),
  DocumentButton(
    documentName: 'Week1-16.zip',
    documentPath: '/Week1-16.zip',
  ),
];
