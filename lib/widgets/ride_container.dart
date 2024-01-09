import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_share/screens/ride_details_screen.dart';
import 'package:ride_share/utils/spacers.dart';
import 'package:ride_share/widgets/date_time_container.dart';
import 'package:ride_share/widgets/location_container.dart';
import 'package:ride_share/widgets/map_container.dart';

class RideContainer extends StatelessWidget {
  final bool showTotalSeats;
  final CameraPosition? cameraPosition;

  const RideContainer({
    super.key,
    this.showTotalSeats = false,
    this.cameraPosition,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const RideDetailsScreen(),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            const DateTimeContainer(),
            verticalSpacer(20.h),
            MapContainer(cameraPosition: cameraPosition),
            verticalSpacer(25.h),
            LocationContainer(showTotalSeats: showTotalSeats)
          ],
        ),
      ),
    );
  }
}
