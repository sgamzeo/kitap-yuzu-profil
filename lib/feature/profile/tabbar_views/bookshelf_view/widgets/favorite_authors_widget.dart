part of '../bookshelf_view.dart';

class _FavoriteAuthors extends StatelessWidget {
  const _FavoriteAuthors();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Row(
          mainAxisAlignment: .spaceBetween,
          children: [_buildTitle(), _buildSeeAll()],
        ),
        SizedBox(height: AppDimens.s),
        _buildList(),
      ],
    );
  }

  TextButton _buildSeeAll() {
    return TextButton(
      child: Text(
        "Tümünü Gör",
        style: TextStyle(color: AppColors.unselectedLabelColor),
      ),
      onPressed: () {},
    );
  }

  Text _buildTitle() {
    return const Text(
      "Favori Yazarları",
      style: TextStyle(fontWeight: FontWeight.w700),
    );
  }

  ListView _buildList() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (_, index) => Row(
        children: [
          SizedBox(
            width: 30,
            height: 30,
            child: Container(color: Colors.white70),
          ),
          SizedBox(width: AppDimens.xs),
          const Text('Lorem Ipsum'),
        ],
      ),
      separatorBuilder: (_, _) => const SizedBox(height: AppDimens.xs),
      itemCount: 10,
    );
  }
}
