import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/app_dimens.dart';
import 'package:kitap_yuzu_profil/feature/profile/tabbar_views/wall_view/widgets/acqusition_card_widget.dart';

class WallView extends StatelessWidget {
  final String bio = '''
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam malesuada ut quam id laoreet. 
Pellentesque sed neque libero. Donec tincidunt justo id ligula vehicula, non eleifend ante finibus.
Maecenas dapibus diam id lacus vestibulum, ac finibus augue pulvinar. Fusce nec ligula iaculis leo molestie finibus sed eu neque. 
In nec mauris vel ipsum congue interdum. Mauris ac suscipit sapien, vitae lacinia mauris. Maecenas vel porta risus. Vivamus dapibus tortor enim, eu elementum odio porta eget. Aliquam laoreet consequat mi quis tincidunt. Cras eu massa iaculis, laoreet odio lobortis, convallis enim. 
Praesent a ultricies ipsum. Maecenas nunc risus, lobortis id libero ut, dictum efficitur quam. Nullam quis diam a risus imperdiet rutrum sed vitae neque. Sed fringilla odio velit, eget tempor eros euismod in.''';

  const WallView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimens.defaultPagePadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text("Biyografi", style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: AppDimens.s),
            Text(
              bio,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.wireframeMetin2,
              ),
              textAlign: .center,
            ),
            SizedBox(height: AppDimens.l),

            //kazanımlar
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  "Kazanımlar",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.unselectedLabelColor,
                ),
              ],
            ),
            SizedBox(height: AppDimens.m),

            AcqusitionCardWidget(
              title: 'Topluluk Lideri 👑',
              description:
                  'Kurduğu kitap kulübü 100 üyeyi geçen ve aktif etkileşim sağlayan öncüler içindir.',

              caption: '2023te kazanıldı.',
              avatar: 'assets/crown_star_badge.png',
            ),

            AcqusitionCardWidget(
              title: 'Okuma Canavarı👑',
              description:
                  "Yılda 50'den fazla kitap okuyan kullanıcılara verilir",

              caption: 'Seviye 3 (Tamamlandı)',
              avatar: 'assets/ribbon_coin_badge.png',
            ),
          ],
        ),
      ),
    );
  }
}
