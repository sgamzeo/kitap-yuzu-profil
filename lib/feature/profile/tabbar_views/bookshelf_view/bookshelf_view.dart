import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/components/custom_horizontal_gallery.dart';
import 'package:kitap_yuzu_profil/core/constants/app_dimens.dart';

part './widgets/book_card_widget.dart';
part './widgets/currently_reading_widget.dart';
part './widgets/read_books_widget.dart';
part './widgets/favorite_authors_widget.dart';

class BookshelfView extends StatelessWidget {
  const BookshelfView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimens.defaultPagePadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            _CurrentlyReadingWidget(),
            SizedBox(height: AppDimens.l),
            _ReadBooksWidget(),
            SizedBox(height: AppDimens.l),
            _FavoriteAuthors(),
            SizedBox(height: AppDimens.l),
          ],
        ),
      ),
    );
  }
}
