import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

import '../utils/colors.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({Key? key}) : super(key: key);

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  @override
  Widget build(BuildContext context) {
    final pdfController = PdfController(
      document: PdfDocument.openAsset('assets/jithin_resume.pdf'),
    );
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      // key: scaffoldKey,
      appBar: AppBar(
        title: Text("Resume"),
        backgroundColor: AppColors.pRIMARYCOLOR,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
            size: 32.sm,
          ),
          onPressed: () {
            // pdfController.dispose();
            Navigator.of(context, rootNavigator: true).pop();
          },
        ),
      ),
      body: Center(
        child: PdfView(
          key: scaffoldKey,
          scrollDirection: Axis.vertical,
          controller: pdfController,
        ),
      ),
    );
  }
}
