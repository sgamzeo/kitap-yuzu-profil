part of '../profile_header.dart';

class _FollowStatsBoxWidget extends StatelessWidget {
  final int count;
  final String label;
  const _FollowStatsBoxWidget({required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$count',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: AppColors.wireframeMetin1,
              fontWeight: .w600,
            ),
          ),
          const TextSpan(text: ' '),
          TextSpan(
            text: label,
            style: Theme.of(
              context,
            ).textTheme.bodySmall?.copyWith(color: AppColors.wireframeMetin2),
          ),
        ],
      ),
    );
  }
}
