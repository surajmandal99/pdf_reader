import 'package:flutter/material.dart';
import 'package:internet_file/internet_file.dart';
import 'package:pdfx/pdfx.dart';

class PdfScreen extends StatefulWidget {
  final int index;
  final String? path;
  const PdfScreen({
    Key? key,
    required this.index,
    this.path,
  }) : super(key: key);

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  late PdfController pdfController;

  //pdf ko url harnuparnay

  var url = "https://yaz.in/assets/flutter/Flutter%20Cheat%20Sheet.pdf";

  //fun to load the pdf

  loadController() async {
    switch (widget.index) {
      case 0:
        PdfController(document: PdfDocument.openAsset('assets/pdf/desc.pdf'));
        break;
      case 1:
        PdfController(document: PdfDocument.openData(InternetFile.get(url)));
        break;
      case 2:
        pdfController = PdfController(
            document: PdfDocument.openFile(widget.path.toString()));
        break;
      default:
    }
    // pdfController =
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    loadController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.center,
            child: Text(
              pdfController.pagesCount == null
                  ? " "
                  : "Pages: ${pdfController.pagesCount}",
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w300),
            ),
          )
        ],
        title: const Text("Filename",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        color: Colors.black,
        child: Center(
            child: PdfView(
          controller: pdfController,
        )),
      ),
    );
  }
}
