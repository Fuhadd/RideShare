import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_share/constants/custom_colors.dart';
import 'package:ride_share/utils/spacers.dart';

class DateTimeContainer extends StatelessWidget {
  const DateTimeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 40.h,
              width: 40.w,
              decoration: BoxDecoration(
                border:
                    Border.all(color: CustomColors.blackColor.withOpacity(0.6)),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.person),
            ),
            horizontalSpacer(10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "11/Sep/2023",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                verticalSpacer(5.h),
                Row(
                  children: [
                    Text(
                      "4 Seats",
                      style: TextStyle(
                          fontSize: 12.sp, color: CustomColors.greyTextColor),
                    ),
                    horizontalSpacer(5.w),
                    Text(
                      "46min 10sec",
                      style: TextStyle(
                          fontSize: 12.sp, color: CustomColors.greyTextColor),
                    ),
                    horizontalSpacer(10.w),
                    Text(
                      "40.4 mile",
                      style: TextStyle(
                          fontSize: 12.sp, color: CustomColors.greyTextColor),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Text(
          "8:12PM",
          style: TextStyle(
              fontSize: 12.sp, color: CustomColors.lightGreyTextColor),
        ),
      ],
    );
  }
}
