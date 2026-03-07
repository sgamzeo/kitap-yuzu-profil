import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/quotation/book_cover_placeholder.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/quotation/book_picker_field.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/quotation/community_share_section.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/quotation/personal_note_field.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/quotation/quote_input_field.dart';
import 'package:kitap_yuzu_profil/feature/my_library/pdf_reader/widgets/quotation/share_button.dart';

class QuotationForm extends StatelessWidget {
  final TextEditingController bookController;
  final TextEditingController quoteController;
  final TextEditingController noteController;

  const QuotationForm({
    super.key,
    required this.bookController,
    required this.quoteController,
    required this.noteController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const BookCoverPlaceholder(),
        SizedBox(height: AppDimens.quotationSpacing),
        BookPickerField(controller: bookController),
        SizedBox(height: AppDimens.quotationSpacing),
        QuoteInputField(controller: quoteController),
        SizedBox(height: AppDimens.quotationSpacing),
        PersonalNoteField(controller: noteController),
        SizedBox(height: AppDimens.quotationSpacing),
        const CommunityShareSection(),
        SizedBox(height: AppDimens.pdfPageSpacing),
        const ShareButton(),
      ],
    );
  }
}
