import 'package:ez_build/app/data/local/keys.dart';
import 'package:ez_build/utils/autocomplete_prediction.dart';
import 'package:ez_build/utils/network_utils.dart';
import 'package:ez_build/utils/place_auto_complate_response.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  List<AutocompletePrediction> _predictions = [];
  List<AutocompletePrediction> get predictions => _predictions;
  void placeAutoComplete(String query) async {
    Uri url = Uri.https(
        'maps.googleapis.com',
        'maps/api/place/autocomplete/json',
        {"input": query, "key": KeysManager.googlePlaceApiKey});
    String? response = await NetworkUtils().fetchUrl(url);
    if (response != null) {
      print('response: $response');
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null && result.predictions!.isNotEmpty) {
        _predictions = result.predictions!;
      }
    }
    update(['Location']);
  }
}
