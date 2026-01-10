part of '../profile_page.dart';

class _BookshelfView extends StatelessWidget {
  const _BookshelfView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimens.defaultPagePadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Row(
              children: [
                Text("Şu an okudukları", style: TextStyle(fontWeight: .w700)),
                SizedBox(width: AppDimens.xs),
                Text(
                  "2",
                  style: TextStyle(color: AppColors.unselectedLabelColor),
                ),
              ],
            ),
            SizedBox(height: AppDimens.s),
            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: .horizontal,
                itemBuilder: (context, index) {
                  return const BookCard();
                },
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemCount: 2,
              ),
            ),
            SizedBox(height: AppDimens.l),

            //
            Row(
              children: [
                Text("Okuduğu kitaplar", style: TextStyle(fontWeight: .w700)),
                SizedBox(width: AppDimens.xs),

                Text(
                  "40",
                  style: TextStyle(color: AppColors.unselectedLabelColor),
                ),
              ],
            ),
            SizedBox(height: AppDimens.s),
            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: .horizontal,
                itemBuilder: (context, index) {
                  return const BookCard();
                },
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemCount: 30,
              ),
            ),

            SizedBox(height: AppDimens.l),
            //vertical
            const Text(
              "Favori Yazarları",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: AppDimens.s),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(width: 30, color: Colors.black),

                    const Text('Lorem Ipsum'),
                  ],
                ),
              ),
              separatorBuilder: (_, __) => const SizedBox(height: 4),
              itemCount: 10,
            ),
            SizedBox(height: AppDimens.l),
          ],
        ),
      ),
    );
  }
}

class BookCard extends StatelessWidget {
  const BookCard();

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
