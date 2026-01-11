import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/constants/app_colors.dart';
import 'package:kitap_yuzu_profil/core/constants/app_dimens.dart';

class QuotationView extends StatelessWidget {
  const QuotationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimens.defaultPagePadding,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _QuotationCardWidget(),
            SizedBox(height: AppDimens.s),
            _QuotationCardWidget(),
            SizedBox(height: AppDimens.s),
            _QuotationCardWidget(),
            SizedBox(height: AppDimens.s),
            _QuotationCardWidget(),
            SizedBox(height: AppDimens.s),
            _QuotationCardWidget(),
            SizedBox(height: AppDimens.s),
            _QuotationCardWidget(),
            SizedBox(height: AppDimens.s),
            _QuotationCardWidget(),
            SizedBox(height: AppDimens.s),
            _QuotationCardWidget(),
          ],
        ),
      ),
    );
  }
}

class _QuotationCardWidget extends StatelessWidget {
  const _QuotationCardWidget();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: .circular(10),
      ),
      child: Padding(
        padding: AppDimens.cardM,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              "Bazen insan, 'ben iyiyim' dediğinde gözlerinin içine bakıp 'iyi değilsin biliyorum' diyecek birine ihtiyaç duyar.",
              style: TextStyle(fontStyle: .italic, fontSize: 13.33),
            ),
            SizedBox(height: AppDimens.s),
            Row(
              children: [
                Text('Şeker Portakalı'),
                SizedBox(width: AppDimens.xs),
                Text(
                  "Sayfa 156",
                  style: TextStyle(fontSize: 11.1, color: AppColors.black),
                ),
              ],
            ),
            SizedBox(height: AppDimens.s),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text('Az önce', style: TextStyle(fontSize: 11.1)),
                Row(
                  children: [
                    Icon(Icons.thumb_up_alt_outlined, size: 12),
                    SizedBox(width: AppDimens.xs),
                    Icon(Icons.chat_bubble_outline, size: 12),
                    SizedBox(width: AppDimens.xs),
                    Icon(Icons.repeat, size: 12),
                    SizedBox(width: AppDimens.xs),
                    Icon(Icons.edit_note_outlined, size: 12),
                    SizedBox(width: AppDimens.xs),
                    Icon(Icons.ios_share, size: 12),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
