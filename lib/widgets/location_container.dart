import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ride_share/constants/custom_colors.dart';
import 'package:ride_share/constants/custom_string.dart';
import 'package:ride_share/screens/app_view_model.dart';
import 'package:ride_share/utils/spacers.dart';

class LocationContainer extends StatefulHookConsumerWidget {
  final bool showTotalSeats;
  const LocationContainer({
    super.key,
    required this.showTotalSeats,
  });

  @override
  ConsumerState<LocationContainer> createState() => _LocationContainerState();
}

class _LocationContainerState extends ConsumerState<LocationContainer> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            ConstantString.locationCircle,
                            height: 14.h,
                          ),
                        ],
                      ),
                      verticalSpacer(3.h),
                      Container(
                        height: 25.h,
                        width: 1,
                        decoration: const BoxDecoration(color: Colors.black),
                      ),
                      verticalSpacer(3.h),
                      SvgPicture.asset(
                        ConstantString.locationPin,
                        height: 16.h,
                      ),
                    ],
                  ),
                  horizontalSpacer(10.w),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    ref.watch(userCurrentAddressProvider) ??
                                        "Douglas Crescent Road",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        color: CustomColors.blackColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          verticalSpacer(29.h),
                          Text(
                            "Logan Avenue",
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: CustomColors.blackColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: widget.showTotalSeats,
                child: Column(
                  children: [
                    verticalSpacer(15.h),
                    Text(
                      "5 Seats Booked",
                      style: TextStyle(
                          fontSize: 14.sp, color: CustomColors.blackColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          // height: 40.h,
          decoration: BoxDecoration(
              color: CustomColors.blackColor,
              borderRadius: BorderRadius.circular(3.r)),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  child: SvgPicture.asset(
                    ConstantString.nairaSign,
                    height: 14.h,
                    fit: BoxFit.cover,
                  ),
                ),
                horizontalSpacer(2.w),
                SizedBox(
                  height: 18,
                  child: Text(
                    "2000",
                    style: TextStyle(
                        fontSize: 16.sp, color: CustomColors.whiteColor),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
