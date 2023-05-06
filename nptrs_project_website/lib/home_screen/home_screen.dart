import "package:flutter/material.dart";
import "widgets/project_overview.dart";
import 'widgets/team_overview.dart';
import 'widgets/team_reports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("NPTRS Majorizer",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontWeight: FontWeight.bold))),
        body: Center(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
              padding: EdgeInsetsDirectional.symmetric(
                  vertical: 16,
                  horizontal: MediaQuery.of(context).size.width * 0.1),
              children: [
                const ProjectOverview(),
                const SizedBox(height: 8),
                const TeamOverview(),
                const SizedBox(height: 8),
                Card(
                  child: Padding(
                      padding: const EdgeInsetsDirectional.all(24),
                      child: Column(children: [
                        Text.rich(TextSpan(children: [
                          TextSpan(
                            text: "Team Reports\n",
                            style: Theme.of(context).textTheme.headlineMedium,
                          )
                        ])),
                        const SizedBox(height: 8),
                        GridView(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 2,
                          ),
                          children: fancyButtons,
                        ),
                      ])),
                ),
                const SizedBox(height: 8),
                const TeamReports(),
                const SizedBox(height: 50),
              ]),
        )));
  }
}

List<DocumentButton> fancyButtons = const [
  DocumentButton(
      documentName: 'Requirements Document.pdf',
      documentPath: 'assets/assets/SoftwareRequirementsSpecification.pdf'),
  DocumentButton(
      documentName: 'Testing Document.pdf',
      documentPath: 'assets/assets/TestingRequirements.pdf'),
  DocumentButton(
      documentName: 'AllDocuments.zip',
      documentPath: 'assets/assets/AllDocuments.zip'),
  DocumentButton(
    documentName: 'Week1-16.zip',
    documentPath: 'assets/assets/Week1-16.zip',
  ),
];
