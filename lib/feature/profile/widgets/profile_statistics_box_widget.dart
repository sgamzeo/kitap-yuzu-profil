import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/constants/app_dimens.dart';

class ProfileStatisticsBox extends StatelessWidget {
  const ProfileStatisticsBox();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: .circular(10),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(AppDimens.s),
        child: Column(
          children: [
            Text("687", style: TextStyle(fontWeight: .w700)),
            Text("Kitap okudu"),
            SizedBox(height: AppDimens.s),
          ],
        ),
      ),
    );
  }
}
