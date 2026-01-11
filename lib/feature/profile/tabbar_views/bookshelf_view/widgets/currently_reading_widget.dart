part of '../bookshelf_view.dart';

class _CurrentlyReadingWidget extends StatelessWidget {
  const _CurrentlyReadingWidget();

  @override
  Widget build(BuildContext context) {
    return CustomHorizontalGallery(
      title: "Şu an okudukları",
      description: '2',
      itemCount: 20,
      child: _BookCardWidget(),
    );
  }
}
