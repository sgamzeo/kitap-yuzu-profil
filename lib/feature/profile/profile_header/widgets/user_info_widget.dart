part of '../profile_header.dart';

class _UserInfoWidget extends StatelessWidget {
  const _UserInfoWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            ProfileMock.name,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: AppColors.primary),
          ),

          Text(
            ProfileMock.username,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            ProfileMock.bio,
            textAlign: .center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: AppColors.wireframeMetin2,
              fontWeight: .w200,
              fontStyle: .italic,
            ),
          ),

          SizedBox(height: AppDimens.s),
          Row(
            mainAxisAlignment: .center,
            children: [
              _FollowStatsBoxWidget(
                count: ProfileMock.followers,
                label: 'Takipçiler',
              ),
              SizedBox(width: AppDimens.m),
              _FollowStatsBoxWidget(
                count: ProfileMock.following,
                label: "Takip Ediliyor",
              ),
            ],
          ),
          SizedBox(height: AppDimens.s),
          CustomButton(text: 'Profili düzenle'),
        ],
      ),
    );
  }
}
