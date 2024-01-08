import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ride_share/constants/custom_colors.dart';
import 'package:ride_share/constants/custom_string.dart';
import 'package:ride_share/utils/spacers.dart';
import 'package:ride_share/widgets/date_time_container.dart';
import 'package:ride_share/widgets/location_container.dart';
import 'package:ride_share/widgets/map_container.dart';
import 'package:ride_share/widgets/ride_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

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
            Navigator.pop(context);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpacer(30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: CustomColors.blackColor.withOpacity(0.6)),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: TabBar(
                  labelColor: CustomColors.whiteColor,
                  unselectedLabelColor: CustomColors.greyTextColor,
                  labelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: CustomColors.blackColor,
                  ),
                  controller: _tabController,
                  tabs: const [
                    Tab(
                      text: 'Upcoming',
                    ),
                    Tab(
                      text: 'Completed',
                    ),
                    Tab(
                      text: 'Create New',
                    ),
                  ],
                ),
              ),
            ),
            verticalSpacer(50.h),
            const RideContainer(),
            verticalSpacer(30.h),
            Divider(
              color: CustomColors.blackColor.withOpacity(0.5),
            ),
            verticalSpacer(30.h),
            const RideContainer()
          ],
        ),
      ),
    );
  }
}
