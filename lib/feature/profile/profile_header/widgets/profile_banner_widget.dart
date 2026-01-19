part of '../profile_header.dart';

class _ProfileBannerWidget extends StatelessWidget {
  const _ProfileBannerWidget();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 141,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/mock_banner.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Center(
            child: CircleAvatar(
              radius: 33,
              backgroundImage: const AssetImage('assets/mock_avatar.png'),
            ),
          ),
        ),
      ],
    );
  }
}
