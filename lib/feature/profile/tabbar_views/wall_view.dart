import 'package:flutter/material.dart';
import 'package:kitap_yuzu_profil/core/constants/app_colors.dart';
import 'package:kitap_yuzu_profil/core/constants/app_dimens.dart';

class WallView extends StatelessWidget {
  const WallView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimens.defaultPagePadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text("Biyografi", style: TextStyle(fontSize: 16)),
            SizedBox(height: AppDimens.s),
            Text(
              '''Merhaba! Ben Zeynep, nam-ı diğer Luna. 🌙 28 yaşındayım ve İstanbul'un kaosunda kelimelere sığınan bir metin yazarıyım. Çocukluğumda Narnia'ya açılan o dolabı aramakla başlayan serüvenim, şimdi distopik evrenlerde ve modern klasiklerin satır aralarında devam ediyor.
Burada sadece "okudum bitti" dediğim kitapları değil; beni derinden sarsan, uykularımı kaçıran veya kahkahalara boğan hikayeleri paylaşıyorum. Fantastik kurgu, bilim kurgu ve büyülü gerçekçilik favori türlerim olsa da, iyi yazılmış her metne şans veririm.
Hafta sonları genellikle Kadıköy'deki sahafları talan ederken veya üçüncü dalga kahvecilerde elimde bir kitapla (ve muhtemelen soğumuş bir latteyle) görülebilirim. Kitap kulübü buluşmalarını, spoiler vermeden yapılan derin analizleri ve yağmurlu gün okumalarını çok severim. Eğer sen de kitapların sadece kağıt yığını değil, başka hayatlara açılan kapılar olduğuna inanıyorsan doğru yerdesin. İş birlikleri ve öneriler için DM kutum her zaman açık! 📚''',
              style: const TextStyle(fontSize: 14),
              textAlign: .center,
            ),
            SizedBox(height: AppDimens.l),

            //kazanımlar
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("Kazanımlar", style: TextStyle(fontSize: 16)),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: AppColors.unselectedLabelColor,
                ),
              ],
            ),
            SizedBox(height: AppDimens.m),

            Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: .circular(10),
              ),
              child: Padding(
                padding: AppDimens.cardM,
                child: Row(
                  children: [
                    CircleAvatar(),
                    SizedBox(width: AppDimens.m),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Topluluk Lideri 👑",
                                style: TextStyle(fontSize: 16),
                              ),
                              Icon(Icons.verified_outlined, size: 16),
                            ],
                          ),
                          Text(
                            'Kurduğu kitap kulübü 100 üyeyi geçen ve aktif etkileşim sağlayan öncüler içindir.',
                          ),
                          Text(
                            '2023te kazanıldı.',
                            style: TextStyle(fontSize: 11.1),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
