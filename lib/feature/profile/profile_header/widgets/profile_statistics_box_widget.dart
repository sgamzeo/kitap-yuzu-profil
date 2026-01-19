part of '../profile_header.dart';

class _ProfileStatisticsBox extends StatelessWidget {
  final int count;
  final String label;
  const _ProfileStatisticsBox({
    required this.count,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: AppColors.secondary),

        borderRadius: .circular(10),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(AppDimens.s),
        child: Column(
          children: [
            Text('$count', style: Theme.of(context).textTheme.bodyLarge),
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: AppColors.wireframeMetin2),
            ),
            SizedBox(height: AppDimens.s),
          ],
        ),
      ),
    );
  }
}
