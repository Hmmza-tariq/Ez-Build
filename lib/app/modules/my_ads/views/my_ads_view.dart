import 'package:ez_build/app/components/product_item_edit.dart';
import 'package:ez_build/app/routes/app_pages.dart';
import 'package:ez_build/config/provider/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../components/no_data.dart';
import '../../../components/screen_title.dart';
import '../controllers/my_ads_controller.dart';

class MyAdsView extends GetView<MyAdsController> {
  const MyAdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          30.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, top: 10.h),
                child: ScreenTitle(
                  title: Provider.of<StringsManager>(context).myAds,
                  dividerEndIndent: 200,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    bottomLeft: Radius.circular(20.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(right: 20.w),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 5.w,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(Routes.FAVORITES);
                      },
                      icon: Icon(
                        Icons.favorite_rounded,
                        color: Colors.white,
                        size: 30.w,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          20.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: GetBuilder<MyAdsController>(
              init: MyAdsController(),
              id: 'MyAds',
              builder: (_) => controller.products.isEmpty
                  ? NoData(
                      text: Provider.of<StringsManager>(context).noItemInAds)
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.w,
                        mainAxisSpacing: 15.h,
                        mainAxisExtent: 260.h,
                      ),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) => ProductItemEdit(
                        product: controller.products[index],
                      ),
                    ),
            ),
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}
