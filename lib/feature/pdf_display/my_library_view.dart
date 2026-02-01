import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kitap_yuzu_profil/core/routes/app_routes.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/feature/pdf_display/my_libray_controller.dart';

class MyLibraryView extends StatelessWidget {
  const MyLibraryView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyLibraryController());

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const _LibraryAppBar(),
        body: Column(
          children: [
            const _LibraryTabBar(),

            Expanded(
              child: TabBarView(
                children: [
                  const _MyBooksTab(), // Kitaplarım
                  const _ImportedPdfsTab(), // Listelerim
                ],
              ),
            ),
          ],
        ),
        floatingActionButton: const _AddButton(),
      ),
    );
  }
}

class _ImportedPdfsTab extends StatelessWidget {
  const _ImportedPdfsTab();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyLibraryController>();

    return Obx(() {
      if (controller.importedPdfs.isEmpty) {
        return const Center(child: Text('Henüz içe aktarılmış PDF yok'));
      }

      return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.importedPdfs.length,
        itemBuilder: (_, index) {
          final pdf = controller.importedPdfs[index];

          return ListTile(
            leading: const Icon(Icons.picture_as_pdf),
            title: Text(pdf.name),
            subtitle: Text(
              '${pdf.importedAt.day}.${pdf.importedAt.month}.${pdf.importedAt.year}',
            ),
            onTap: () {
              Get.toNamed(
                AppRoutes.reader,
                arguments: {'pdfPath': pdf.path, 'isAsset': pdf.isAsset},
              );
            },
          );
        },
      );
    });
  }
}

class _AddButton extends StatelessWidget {
  const _AddButton();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyLibraryController>();

    return FloatingActionButton(
      onPressed: controller.importPdf,
      child: const Icon(Icons.add),
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

/* -------------------- TAB 1 : KİTAPLARIM -------------------- */

class _MyBooksTab extends StatelessWidget {
  const _MyBooksTab();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _ImportBanner(),
        _LibraryFilterRow(),
        Expanded(child: _LibraryContent()),
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
          color: AppColors.green5,
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
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(const Color(0xFF8A8A8A)),
            ),
            onPressed: () {},
            icon: const Icon(Icons.sort),
            label: const Text('Sırala'),
          ),
          const SizedBox(width: 12),
          OutlinedButton.icon(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all(const Color(0xFF8A8A8A)),
            ),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 87,
              height: 87,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                color: AppColors.yellow3,
              ),
              child: Image.asset(
                'assets/atomic_habits.png',
                width: 75,
                height: 75,
                fit: BoxFit.none,
              ),
            ),

            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(title, style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(width: 6),
                      Icon(icon, color: Color(0xFF8A8A8A), size: 16),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.more_horiz),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Color(0xFF8A8A8A)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
