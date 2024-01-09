import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ride_share/constants/custom_colors.dart';
import 'package:ride_share/screens/app_view_model.dart';
import 'package:ride_share/utils/spacers.dart';
import 'package:ride_share/widgets/custom_button.dart';
import 'package:ride_share/widgets/ride_container.dart';
import 'package:ride_share/widgets/riders_container.dart';

class RideDetailsScreen extends StatefulHookConsumerWidget {
  const RideDetailsScreen({super.key});

  @override
  ConsumerState<RideDetailsScreen> createState() => _RideDetailsScreenState();
}

class _RideDetailsScreenState extends ConsumerState<RideDetailsScreen> {
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
                RideContainer(
                  showTotalSeats: true,
                  cameraPosition: ref.watch(userCameraPositionProvider),
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
