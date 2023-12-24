import 'package:ez_build/app/data/local/keys.dart';
import 'package:ez_build/app/data/local/my_shared_pref.dart';
import 'package:ez_build/utils/autocomplete_prediction.dart';
import 'package:ez_build/utils/network_utils.dart';
import 'package:ez_build/utils/place_auto_complete_response.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  List<AutocompletePrediction> _predictions = [];
  List<AutocompletePrediction> get predictions => _predictions;
  TextEditingController locationController =
      TextEditingController(text: MySharedPref.getLocation());
  void placeAutoComplete(String query) async {
    Uri url = Uri.https(
        'maps.googleapis.com',
        'maps/api/place/autocomplete/json',
        {"input": query, "key": KeysManager.googlePlaceApiKey});
    String? response = await NetworkUtils().fetchUrl(url);
    if (response != null) {
      debugPrint('response: $response');
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null && result.predictions!.isNotEmpty) {
        _predictions = result.predictions!;
      }
    }
    update(['Location']);
  }

  Future<String?> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      Get.snackbar("Permission Denied",
          "Please allow location permission from settings");
      await Geolocator.requestPermission();
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      debugPrint('position: $position');
      String? address = await NetworkUtils().getAddressFromLatLng(
          position.latitude.toString(), position.longitude.toString());
      debugPrint('address: $address');
      locationController.text = address;
      return address;
    }
    return null;
  }
}
