import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_app/core/constant/color.dart';
import 'package:pdfx/pdfx.dart';
import 'package:islamic_app/features/quran/controller/quran_controller.dart';

class DisplayQuran extends StatelessWidget {
  final int pageNumber;
  const DisplayQuran({
    super.key,
    required this.pageNumber,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuranController());
    controller.pdfControllerPinch.initialPage = pageNumber;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorCode.mainColor,
          onPressed: () {},
          child: const Icon(Icons.bookmark),
        ),
        body: SafeArea(
          child: PdfViewPinch(
            controller: controller.pdfControllerPinch,
            padding: 5,
          ),
        ),
      ),
    );
  }
} 
// PdfView(
//             scrollDirection: Axis.horizontal,
//             controller: controller.pdfController,
//             onPageChanged: (page) {},
//             renderer: (PdfPage page) => page.render(
//               width: page.width * 4.2,
//               height: page.height * 6,
//             ),
//           ),
