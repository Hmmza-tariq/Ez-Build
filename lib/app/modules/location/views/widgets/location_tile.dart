import 'package:ez_build/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LocationListTile extends StatelessWidget {
  const LocationListTile({
    Key? key,
    required this.location,
    required this.press,
  }) : super(key: key);

  final String location;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          horizontalTitleGap: 12,
          leading: SvgPicture.asset(
            AssetsManager.locationPin,
          ),
          title: Text(
            location,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.theme.textTheme.displaySmall,
          ),
        ),
        const Divider(
          height: 4,
          thickness: 4,
          indent: 16,
          endIndent: 16,
        ),
      ],
    );
  }
}
