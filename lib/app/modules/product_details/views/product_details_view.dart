import 'package:dots_indicator/dots_indicator.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:ez_build/config/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../utils/assets.dart';
import '../../../components/custom_button.dart';
import '../controllers/product_details_controller.dart';
import 'widgets/rounded_button.dart';

class ProductDetailsView extends GetView<ProductDetailsController> {
  const ProductDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.4,
                    ),
                    child: PageView.builder(
                        itemCount: controller.product.images.length,
                        onPageChanged: (index) {
                          controller.changeImage(index);
                        },
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(18.r),
                            child: Image.asset(
                              controller.product.images[index],
                              fit: BoxFit.cover,
                              // height: 500.h,
                              // ).animate().slideX(
                              //       duration: const Duration(milliseconds: 300),
                              //       begin: 1,
                              //       curve: Curves.easeInSine,
                            ),
                          );
                        }),
                  ),
                  GetBuilder<ProductDetailsController>(
                      id: 'Index',
                      builder: (context) {
                        return DotsIndicator(
                          dotsCount: controller.product.images.length,
                          position: controller.index,
                          decorator: DotsDecorator(
                            size: const Size.square(8.0),
                            activeSize: const Size(20.0, 8.0),
                            activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        );
                      }),
                  Positioned(
                    top: 30.h,
                    left: 20.w,
                    right: 20.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RoundedButton(
                          onPressed: () => Get.back(),
                          child: SvgPicture.asset(AssetsManager.backArrowIcon,
                              fit: BoxFit.none),
                        ),
                        GetBuilder<ProductDetailsController>(
                          id: 'FavoriteButton',
                          builder: (_) => RoundedButton(
                            onPressed: () =>
                                controller.onFavoriteButtonPressed(),
                            child: Align(
                              child: SvgPicture.asset(
                                controller.product.isFavorite
                                    ? AssetsManager.favFilledIcon
                                    : AssetsManager.favOutlinedIcon,
                                width: 16.w,
                                height: 15.h,
                                colorFilter: controller.product.isFavorite
                                    ? null
                                    : const ColorFilter.mode(
                                        Colors.white, BlendMode.srcIn),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Text(
                  controller.product.title,
                  style: theme.textTheme.bodyLarge,
                ).animate().fade().slideX(
                      duration: const Duration(milliseconds: 300),
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
              ),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Rs ${controller.product.price}',
                      style: theme.textTheme.displayMedium,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on, color: Color(0xFFFFC542)),
                        5.horizontalSpace,
                        Text(
                          controller.product.location,
                          style: theme.textTheme.bodyMedium?.copyWith(
                              fontSize: 16.sp, fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ).animate().fade().slideX(
                      duration: const Duration(milliseconds: 300),
                      begin: -1,
                      curve: Curves.easeInSine,
                    ),
              ),
              20.verticalSpace,
              Divider(
                color: Colors.grey,
                height: 5.h,
                thickness: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      '${Provider.of<StringsManager>(context).quantity}: ${controller.product.quantity}',
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ).animate().fade().slideX(
                          duration: const Duration(milliseconds: 300),
                          begin: -1,
                          curve: Curves.easeInSine,
                        ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: Text(
                      '${Provider.of<StringsManager>(context).category}: ${controller.product.category}',
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                          fontSize: 14.sp, fontWeight: FontWeight.w500),
                    ).animate().fade().slideX(
                          duration: const Duration(milliseconds: 300),
                          begin: -1,
                          curve: Curves.easeInSine,
                        ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey,
                height: 5.h,
                thickness: 1.h,
              ),
              10.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: ExpandableText(
                  '${Provider.of<StringsManager>(context).description}: ${controller.product.description}',
                  expandText: Provider.of<StringsManager>(context).readMore,
                  collapseText: Provider.of<StringsManager>(context).showLess,
                  maxLines: 3,
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(fontSize: 14.sp, fontWeight: FontWeight.w500),
                  linkColor: Colors.blue,
                  animation: true,
                  animationDuration: const Duration(milliseconds: 300),
                ),
              ),
              10.verticalSpace,
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 20.w),
              //   child: GetBuilder<ProductDetailsController>(
              //     id: 'Size',
              //     builder: (_) => Row(
              //       children: [
              //         SizeItem(
              //           onPressed: () => controller.changeSelectedSize('S'),
              //           label: 'S',
              //           selected: controller.selectedSize == 'S',
              //         ),
              //         10.horizontalSpace,
              //         SizeItem(
              //           onPressed: () => controller.changeSelectedSize('M'),
              //           label: 'M',
              //           selected: controller.selectedSize == 'M',
              //         ),
              //         10.horizontalSpace,
              //         SizeItem(
              //           onPressed: () => controller.changeSelectedSize('L'),
              //           label: 'L',
              //           selected: controller.selectedSize == 'L',
              //         ),
              //         10.horizontalSpace,
              //         SizeItem(
              //           onPressed: () => controller.changeSelectedSize('XL'),
              //           label: 'XL',
              //           selected: controller.selectedSize == 'XL',
              //         ),
              //       ],
              //     ).animate().fade().slideX(
              //           duration: const Duration(milliseconds: 300),
              //           begin: -1,
              //           curve: Curves.easeInSine,
              //         ),
              //   ),
              // ),
              // 20.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: CustomButton(
                  text: Provider.of<StringsManager>(context).contactSeller,
                  onPressed: () => controller.onAddToChatPressed(),
                  // disabled: controller.product.quantity! > 0,
                  fontSize: 16.sp,
                  radius: 12.r,
                  verticalPadding: 12.h,
                  hasShadow: true,
                  shadowColor: theme.primaryColor,
                  shadowOpacity: 0.3,
                  shadowBlurRadius: 4,
                  shadowSpreadRadius: 0,
                ).animate().fade().slideY(
                      duration: const Duration(milliseconds: 300),
                      begin: 1,
                      curve: Curves.easeInSine,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
