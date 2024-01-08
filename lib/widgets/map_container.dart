import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart' as loc;
import 'package:ride_share/constants/custom_string.dart';
import 'package:ride_share/screens/app_view_model.dart';
import 'package:ride_share/utils/google_map_assistant.dart';

class MapContainer extends StatefulHookConsumerWidget {
  const MapContainer({
    super.key,
  });

  @override
  ConsumerState<MapContainer> createState() => _MapContainerState();
}

class _MapContainerState extends ConsumerState<MapContainer> {
  bool showIcon = false;
  String? humanReadableAddress;
  final loc.Location _locationController = loc.Location();
  Set<Polyline> polylineSet = {};
  Set<Marker> markersSet = {};
  Set<Circle> circlesSet = {};
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  GoogleMapController? newMapController;
  Position? userCurrentPosition;
  BitmapDescriptor? currentLocationIcon;

  static const CameraPosition _kdevNodeCameraPosition =
      CameraPosition(target: LatLng(6.5568768, 3.3488896), zoom: 12.4746);

  @override
  Widget build(BuildContext context) {
    createCurrentLocationIconMarker();
    return SizedBox(
      height: 170.h,
      width: double.infinity,
      // decoration: const BoxDecoration(color: Colors.red),
      child: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            mapType: MapType.normal,
            // myLocationEnabled: true,
            zoomGesturesEnabled: true,
            initialCameraPosition: _kdevNodeCameraPosition,
            polylines: polylineSet,
            markers: markersSet,
            circles: circlesSet,
            onMapCreated: (GoogleMapController controller) {
              _mapController.complete(controller);
              newMapController = controller;
              setState(() {});
              locateUserPosition();
            },
            // onCameraMove: (CameraPosition? position) {
            //   if (pickLocation != position!.target) {
            //     setState(() {
            //       pickLocation = position.target;
            //     });
            //   }
            // },
            // onCameraIdle: () {
            //   getAddressFromLatLng();
            // },
          ),
          Visibility(
            visible: showIcon,
            child: Container(
              height: 38.h,
              width: 38.w,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        ConstantString.redIcon,
                      ),
                      fit: BoxFit.fill)),
            ),
          ),
          Visibility(
            visible: showIcon,
            child: Padding(
              padding: EdgeInsets.only(left: 25.w, top: 20.h),
              child: Container(
                height: 38.h,
                width: 38.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          ConstantString.greenIcon,
                        ),
                        fit: BoxFit.fill)),
              ),
            ),
          )
        ],
      ),
    );
  }

  locateUserPosition() async {
    bool serviceEnabled;
    loc.PermissionStatus permissionGranted;

    serviceEnabled = await _locationController.serviceEnabled();
    if (serviceEnabled) {
      serviceEnabled = await _locationController.requestService();
    } else {
      return;
    }

    permissionGranted = await _locationController.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await _locationController.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        return;
      }
    }
    Position cPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    userCurrentPosition = cPosition;
    LatLng latLngPosition =
        LatLng(userCurrentPosition!.latitude, userCurrentPosition!.longitude);
    CameraPosition cameraPosition = CameraPosition(
      target: latLngPosition,
      zoom: 16,
    );

    newMapController!
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    Marker myLocationMarker = Marker(
      markerId: const MarkerId("originID"),
      infoWindow: const InfoWindow(
        title: "My Location",
        snippet: "Origin",
      ),
      position:
          LatLng(userCurrentPosition!.latitude, userCurrentPosition!.longitude),
      icon: currentLocationIcon!,
    );

    humanReadableAddress =
        await GoogleMapAssistants.searchAddressForGeographicCoordinates(
            userCurrentPosition!, context);

    ref.read(userCurrentAddressProvider.notifier).state = humanReadableAddress;
    await Future.delayed(const Duration(seconds: 1));
    setState(() {
      showIcon = true;
      // markersSet.add(myLocationMarker);
    });
  }

  createCurrentLocationIconMarker() {
    if (currentLocationIcon == null) {
      ImageConfiguration imageConfiguration =
          createLocalImageConfiguration(context, size: const Size(200, 200));
      BitmapDescriptor.fromAssetImage(
              imageConfiguration, ConstantString.avatarImage)
          .then((value) {
        currentLocationIcon = value;
      });
    }
  }
}
