import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class SyncfusionPdfHelper {
  PdfViewerController? controller;

  void initController() {
    controller = PdfViewerController();
  }

  void clearSelection() {
    controller?.clearSelection();
  }
}
