import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_share/constants/custom_colors.dart';
import 'package:ride_share/constants/custom_string.dart';
import 'package:ride_share/utils/spacers.dart';
import 'package:ride_share/widgets/custom_button.dart';
import 'package:ride_share/widgets/date_time_container.dart';
import 'package:ride_share/widgets/location_container.dart';
import 'package:ride_share/widgets/map_container.dart';
import 'package:ride_share/widgets/ride_container.dart';
import 'package:ride_share/widgets/riders_container.dart';

class RideDetailsScreen extends StatefulWidget {
  const RideDetailsScreen({super.key});

  @override
  State<RideDetailsScreen> createState() => _RideDetailsScreenState();
}

class _RideDetailsScreenState extends State<RideDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: CustomColors.blackColor,
            size: 25,
          ),
          onPressed: () {
            Navigator.canPop(context) ? Navigator.pop(context) : null;
          },
        ),
        title: Text(
          "Ride Share",
          style: TextStyle(
            fontSize: 23.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacer(30.h),
                const RideContainer(
                  showTotalSeats: true,
                ),
                verticalSpacer(30.h),
                Divider(
                  color: CustomColors.blackColor.withOpacity(0.5),
                ),
                verticalSpacer(30.h),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Text(
                        "Riders",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    verticalSpacer(20.h),
                    const RidersContainer(),
                    const RidersContainer(),
                    verticalSpacer(70.h),
                  ],
                ),
              ],
            ),
          ),
          CustomButton(
            onTap: () {
              Navigator.canPop(context) ? Navigator.pop(context) : null;
            },
          )
        ],
      ),
    );
  }
}
