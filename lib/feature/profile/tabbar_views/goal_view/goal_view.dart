import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';

class GoalView extends StatelessWidget {
  const GoalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimens.defaultPagePadding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            GoalCard(),
            SizedBox(height: AppDimens.s),
            GoalCard(),
            SizedBox(height: AppDimens.s),
            GoalCard(),
            SizedBox(height: AppDimens.s),
          ],
        ),
      ),
    );
  }
}

class GoalCard extends StatelessWidget {
  const GoalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: .circular(15),
        color: Colors.white70,
      ),
      child: Padding(
        padding: AppDimens.cardL,
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .start,

          children: [
            Text(
              "2026 OKUMA HEDEFİ",
              style: TextStyle(fontSize: 16, fontWeight: .w600),
            ),
            SizedBox(height: AppDimens.xs),
            LinearProgressIndicator(
              value: 0.79,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              minHeight: 8,
            ),
            Text("22/28 kitap - %79 tamamlandı"),
            SizedBox(height: AppDimens.xl),
            Wrap(
              spacing: AppDimens.xl,
              runSpacing: AppDimens.m,
              children: [
                Item(name: '22 books read'),
                Item(name: '28 books'),
                Item(name: '7.2 pages'),
                Item(name: '0 reviews'),
                Item(name: '53 quotes'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final String name;
  const Item({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: [
        Icon(Icons.account_balance_sharp, size: 20),
        SizedBox(width: AppDimens.xs),
        Text(name),
      ],
    );
  }
}
