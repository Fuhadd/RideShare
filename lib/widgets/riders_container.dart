import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_share/constants/custom_colors.dart';
import 'package:ride_share/constants/custom_string.dart';
import 'package:ride_share/utils/spacers.dart';

class RidersContainer extends StatelessWidget {
  const RidersContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ConstantString.avatarImage),
                          fit: BoxFit.cover),
                    ),
                  ),
                  horizontalSpacer(15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sara Jacob",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      verticalSpacer(8.h),
                      SizedBox(
                        height: 15.h,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.only(right: 6.w),
                                child: SvgPicture.asset(
                                  ConstantString.star,
                                  height: 12.h,
                                ),
                              );
                            }),
                      )
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
          ),
        ),
        verticalSpacer(15.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 27.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        ConstantString.locationPin,
                        height: 15.h,
                      ),
                      horizontalSpacer(15.w),
                      Text(
                        "Logan Avenue",
                        style: TextStyle(
                            fontSize: 14.sp, color: CustomColors.blackColor),
                      ),
                    ],
                  ),
                  Container(
                    height: 28.h,
                    width: 28.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: CustomColors.greenColor),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        ConstantString.phone,
                        height: 15.h,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        verticalSpacer(30.h),
        Divider(
          color: CustomColors.blackColor.withOpacity(0.5),
        ),
        verticalSpacer(30.h),
      ],
    );
  }
}
