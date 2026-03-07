import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/controllers/quotation_controller.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/quotation/quotation_appbar.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/quotation/quotation_form.dart';

class QuotationPage extends GetView<QuotationController> {
  const QuotationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const QuotationAppBar(),
      body: SingleChildScrollView(
        padding: AppDimens.quotationPagePadding,
        child: QuotationForm(
          bookController: controller.bookController,
          quoteController: controller.quoteController,
          noteController: controller.noteController,
        ),
      ),
    );
  }
}
