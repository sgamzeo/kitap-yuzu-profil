part of '../bookshelf_view.dart';

class _ReadBooksWidget extends StatelessWidget {
  const _ReadBooksWidget();

  @override
  Widget build(BuildContext context) {
    return CustomHorizontalGallery(
      title: 'Okuduğu kitaplar',
      description: "40",
      itemCount: 20,
      child: _BookCardWidget(),
    );
  }
}
