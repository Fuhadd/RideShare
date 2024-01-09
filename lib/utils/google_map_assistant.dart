import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:ride_share/constants/custom_string.dart';
import 'package:ride_share/models/directions_model.dart';

class GoogleMapAssistants {
  //This function below gets the user current location details including address
  static Future<String> searchAddressForGeographicCoordinates(
      Position position, context) async {
    String mapKey = ConstantString.googleMapsAPIKey;
    String apiUrl =
        "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";

    String humanReadableAddress = "";

    var requestResponse = await fetchDataFromUrl(apiUrl);

    if (requestResponse != "Error Occured. Failed no response") {
      humanReadableAddress = requestResponse["results"][0]["formatted_address"];
      DirectionsModel userPickUpAddress = DirectionsModel();
      userPickUpAddress.locationLatitude = position.latitude;
      userPickUpAddress.locationLongitude = position.longitude;
      userPickUpAddress.locationName = humanReadableAddress;
    }

    return humanReadableAddress;
  }

  //Internal Functions

  static Future<dynamic> fetchDataFromUrl(String url) async {
    final dio = Dio();
    Response response;
    response = await dio.get(url);
    print(response.data.toString());
    try {
      if (response.statusCode == 200) {
        return response.data;
      } else {
        print(
            "Error Occured. Failed no response ==> ${response.data.toString()}");
        return "Error Occured. Failed no response";
      }
    } catch (e) {
      print("Error Occured. Failed no response ==> ${e.toString()}");
      return "Error Occured. Failed no response";
    }
  }
}
