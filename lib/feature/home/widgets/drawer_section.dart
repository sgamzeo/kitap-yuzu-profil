import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kitap_yuzu_profil/core/constants/asset_constants.dart';
import 'package:kitap_yuzu_profil/core/theme/app_colors.dart';
import 'package:kitap_yuzu_profil/core/theme/theme_extensions.dart';

class DrawerSection extends StatefulWidget {
  final String title;
  final List<Widget> children;
  final bool isExpanded;

  const DrawerSection({
    super.key,
    required this.title,
    required this.children,
    this.isExpanded = false,
  });

  @override
  State<DrawerSection> createState() => _DrawerSectionState();
}

class _DrawerSectionState extends State<DrawerSection> {
  late bool _isExpanded;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.isExpanded;
  }

  @override
  Widget build(BuildContext context) {
    // Parse title to separate main text and count in parentheses
    final regex = RegExp(r'^(.+?)\s*(\(\d+\))$');
    final match = regex.firstMatch(widget.title);

    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.green5,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: match != null
                      ? Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: match.group(1),
                                style: Theme.of(context).textTheme.osP.copyWith(
                                  color: AppColors.black,
                                ),
                              ),
                              TextSpan(
                                text: ' ${match.group(2)}',
                                style: Theme.of(context).textTheme.osS2,
                              ),
                            ],
                          ),
                        )
                      : Text(
                          widget.title,
                          style: Theme.of(
                            context,
                          ).textTheme.osP.copyWith(color: AppColors.black),
                        ),
                ),
                Transform.rotate(
                  angle: _isExpanded ? 3.14159 : 0,
                  child: SvgPicture.asset(
                    IconConstants.down,
                    width: 15,
                    height: 7.5,
                    colorFilter: const ColorFilter.mode(
                      AppColors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_isExpanded) ...[
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Column(children: widget.children),
            ),
          ],
        ],
      ),
    );
  }
}
