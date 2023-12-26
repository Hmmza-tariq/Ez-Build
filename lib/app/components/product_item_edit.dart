import 'package:ez_build/config/theme/light_theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../data/models/product_model.dart';
import '../routes/app_pages.dart';

class ProductItemEdit extends StatelessWidget {
  final ProductModel product;
  const ProductItemEdit({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.PRODUCT_DETAILS_EDIT, arguments: product),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border:
                    Border.all(color: LightThemeColors.primaryColor, width: 4),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18.r),
                child: Image.asset(
                  product.images[0],
                  height: 200.h,
                  // width: 100.w,
                ).animate().slideX(
                      duration: const Duration(milliseconds: 200),
                      begin: 1,
                      curve: Curves.easeInSine,
                    ),
              ),
            ),
            10.verticalSpace,
            Expanded(
              child: Text(
                product.title,
                style: theme.textTheme.bodyMedium!
                    .copyWith(
                      overflow: TextOverflow.ellipsis,
                    )
                    .copyWith(),
                maxLines: 1,
              ).animate().fade().slideY(
                    duration: const Duration(milliseconds: 200),
                    begin: 1,
                    curve: Curves.easeInSine,
                  ),
            ),
            5.verticalSpace,
            Text('Rs ${product.price}', style: theme.textTheme.displaySmall)
                .animate()
                .fade()
                .slideY(
                  duration: const Duration(milliseconds: 200),
                  begin: 2,
                  curve: Curves.easeInSine,
                ),
          ],
        ),
      ),
    );
  }
}
