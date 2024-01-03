import 'package:ez_build/app/data/local/my_shared_pref.dart';
import 'package:ez_build/app/modules/location/controllers/location_controller.dart';
import 'package:ez_build/app/modules/location/views/widgets/location_tile.dart';
import 'package:ez_build/config/provider/strings_manager.dart';
import 'package:ez_build/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({super.key});

  void setLocation(String? location, context) {
    if (location == null) {
      return;
    }
    Provider.of<StringsManager>(context, listen: false).setLocation(location);
    MySharedPref.setLocation(location);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      init: LocationController(),
      id: 'Location',
      builder: (_) {
        return Scaffold(
          backgroundColor: context.theme.colorScheme.background,
          appBar: AppBar(
            backgroundColor: context.theme.colorScheme.background,
            elevation: 1,
            title: Text(
              Provider.of<StringsManager>(context).chooseLocation,
              style: context.theme.textTheme.headlineSmall,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: ElevatedButton(
                  onPressed: () async {
                    await controller
                        .getCurrentLocation()
                        .then((value) => setLocation(value, context));
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: SvgPicture.asset(
                          AssetsManager.location,
                          height: 16,
                        ),
                      ),
                      Text(Provider.of<StringsManager>(context).myLocation,
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
                    controller: controller.locationController,
                    onChanged: (value) {
                      controller.placeAutoComplete(value);
                    },
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText:
                          Provider.of<StringsManager>(context).searchLocation,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Icon(FontAwesomeIcons.magnifyingGlass),
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
                          setLocation(controller.predictions[index].description,
                              context);

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
