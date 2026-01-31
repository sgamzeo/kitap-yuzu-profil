import 'package:flutter/material.dart';

class MyLibraryView extends StatelessWidget {
  const MyLibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const _LibraryAppBar(),
        body: Column(
          children: const [
            _LibraryTabBar(),
            _ImportBanner(),
            _LibraryFilterRow(),
            Expanded(child: _LibraryContent()),
          ],
        ),
        floatingActionButton: const _AddButton(),
      ),
    );
  }
}

class _LibraryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _LibraryAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Kitaplığım'),
      leading: const BackButton(),
      actions: [
        IconButton(
          icon: const Icon(Icons.ios_share_outlined),
          onPressed: () {},
        ),
        IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _LibraryTabBar extends StatelessWidget {
  const _LibraryTabBar();

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      tabs: [
        Tab(text: 'Kitaplarım'),
        Tab(text: 'Listelerim'),
      ],
    );
  }
}

class _ImportBanner extends StatelessWidget {
  const _ImportBanner();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F6F2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: const [
            CircleAvatar(
              backgroundColor: Color(0xFFE1E6D8),
              child: Icon(Icons.download, color: Colors.black),
            ),
            SizedBox(width: 12),
            Expanded(child: Text('Goodreads / Diğer Platformlardan Aktar')),
          ],
        ),
      ),
    );
  }
}

class _LibraryFilterRow extends StatelessWidget {
  const _LibraryFilterRow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.sort),
            label: const Text('Sırala'),
          ),
          const SizedBox(width: 12),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.search),
            label: const Text('Ara'),
          ),
        ],
      ),
    );
  }
}

class _LibraryContent extends StatelessWidget {
  const _LibraryContent();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 16),
      children: const [
        _LibrarySection(
          title: 'Okuyorum',
          subtitle: '8 Kitap',
          icon: Icons.remove_red_eye_outlined,
        ),
        _LibrarySection(
          title: 'Okuduklarım',
          subtitle: '8 Kitap',
          icon: Icons.nights_stay_outlined,
        ),
      ],
    );
  }
}

class _LibrarySection extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const _LibrarySection({
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(width: 6),
                Icon(icon, size: 16),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(subtitle),
          ),
          const SizedBox(height: 12),
          const _HorizontalBookList(),
        ],
      ),
    );
  }
}

class _HorizontalBookList extends StatelessWidget {
  const _HorizontalBookList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, __) => const _BookCoverCard(),
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemCount: 5,
      ),
    );
  }
}

class _BookCoverCard extends StatelessWidget {
  const _BookCoverCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add));
  }
}
