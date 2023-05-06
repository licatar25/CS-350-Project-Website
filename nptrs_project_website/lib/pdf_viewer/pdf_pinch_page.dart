import 'package:flutter/material.dart';
import 'package:pdfx/pdfx.dart';

class PdfViewerPage extends StatelessWidget {
  const PdfViewerPage({super.key, required String documentPath});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("PDF Viewer Page")),
    );
  }
}

class PinchPage extends StatefulWidget {
  const PinchPage({super.key, required this.documentPath});
  final String documentPath;

  @override
  State<PinchPage> createState() => _PinchPageState();
}

enum DocShown { sample, tutorial, hello, password }

class _PinchPageState extends State<PinchPage> {
  static const int _initialPage = 1;
  late PdfControllerPinch _pdfControllerPinch;

  @override
  void initState() {
    _pdfControllerPinch = PdfControllerPinch(
      document: PdfDocument.openAsset(widget.documentPath),
      initialPage: _initialPage,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pdfControllerPinch.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PdfViewPinch(
      builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
        options: const DefaultBuilderOptions(),
        documentLoaderBuilder: (_) =>
            const Center(child: CircularProgressIndicator()),
        pageLoaderBuilder: (_) =>
            const Center(child: CircularProgressIndicator()),
        errorBuilder: (_, error) => Center(child: Text(error.toString())),
      ),
      controller: _pdfControllerPinch,
    );
  }
}
