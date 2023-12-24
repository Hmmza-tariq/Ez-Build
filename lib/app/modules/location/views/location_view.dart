import 'package:ez_build/app/data/local/my_shared_pref.dart';
import 'package:ez_build/app/modules/location/controllers/location_controller.dart';
import 'package:ez_build/app/modules/location/views/widgets/location_tile.dart';
import 'package:ez_build/config/provider/strings.dart';
import 'package:ez_build/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      init: LocationController(),
      id: 'Location',
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // controller.placeAutoComplete('Pakistan');
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: const Size(double.infinity, 40),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        AssetsManager.location,
                        height: 16,
                      ),
                      Text("My Location",
                          style: context.theme.textTheme.displaySmall),
                    ],
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextFormField(
                    onChanged: (value) {
                      controller.placeAutoComplete(value);
                    },
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: "Search your location",
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: SvgPicture.asset(AssetsManager.locationPin),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                height: 4,
                thickness: 4,
                // color: secondaryColor5LightTheme,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: controller.predictions.length,
                    itemBuilder: (context, index) {
                      return LocationListTile(
                        press: () {
                          String location =
                              controller.predictions[index].description!;
                          Provider.of<StringsManager>(context, listen: false)
                              .setLocation(location);
                          MySharedPref.setLocation(location);
                          Get.back();
                        },
                        location: controller.predictions[index].description!,
                      );
                    }),
              ),
            ],
          ),
        );
      },
    );
  }
}
