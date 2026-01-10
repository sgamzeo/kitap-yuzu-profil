part of '../profile_page.dart';

class _ProfileBannerWidget extends StatelessWidget {
  const _ProfileBannerWidget();

  final currentUser = "sena gamze";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppDimens.cardL,
      child: Column(
        children: [
          _buildAvatar(),
          SizedBox(height: AppDimens.s),
          Text(currentUser),
        ],
      ),
    );
  }

  CircleAvatar _buildAvatar() {
    return CircleAvatar(
      radius: 41,
      backgroundColor: AppColors.black,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: AppColors.backgroundColor,
        child: Icon(Icons.person, size: AppDimens.avatarM),
      ),
    );
  }
}
