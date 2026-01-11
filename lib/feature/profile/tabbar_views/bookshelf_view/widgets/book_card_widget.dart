part of '../bookshelf_view.dart';

class _BookCardWidget extends StatelessWidget {
  const _BookCardWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container(width: 100, color: Colors.white60)),
        SizedBox(height: AppDimens.s),
        Text("Lorem Ipsum"),
      ],
    );
  }
}
