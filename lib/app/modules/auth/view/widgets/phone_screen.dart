import 'package:ez_build/app/modules/auth/view/widgets/phone_controller.dart';
import 'package:ez_build/app/routes/app_pages.dart';
import 'package:ez_build/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhoneScreen extends GetView<PhoneController> {
  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.primaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetsManager.logo, height: 200.h, width: 200.w),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 36.w),
                child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: context.theme.scaffoldBackgroundColor,
                    ),
                    child: GetBuilder<PhoneController>(
                      init: PhoneController(),
                      id: 'Phone',
                      builder: (_) {
                        return Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Phone Number',
                              ),
                              keyboardType: TextInputType.phone,
                              style: context.theme.textTheme.displayMedium
                                  ?.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              onChanged: (value) {
                                controller.phone = value;
                              },
                            ),
                            controller.isEntered
                                ? TextFormField(
                                    decoration: const InputDecoration(
                                      hintText: 'OTP',
                                    ),
                                    keyboardType: TextInputType.phone,
                                    style: context.theme.textTheme.displayMedium
                                        ?.copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    onChanged: (value) {
                                      controller.otp = value;
                                    },
                                  )
                                : Container(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: controller.isEntered
                                    ? MainAxisAlignment.spaceAround
                                    : MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: () async {
                                      String? result;

                                      result =
                                          await controller.authUserWithPhone();
                                      if (result != null) {
                                        Get.snackbar('Error', result,
                                            snackPosition: SnackPosition.BOTTOM,
                                            colorText: Colors.white,
                                            backgroundColor: Colors.red);
                                      }
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10.w, right: 10.w),
                                      child: Text(
                                        'Get OTP',
                                        style: context
                                            .theme.textTheme.displayMedium
                                            ?.copyWith(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  controller.isEntered
                                      ? ElevatedButton(
                                          onPressed: () async {
                                            String? result;

                                            result = await controller
                                                .authUserWithOTP();

                                            if (result != null) {
                                              Get.snackbar('Error', result,
                                                  snackPosition:
                                                      SnackPosition.BOTTOM,
                                                  colorText: Colors.white,
                                                  backgroundColor: Colors.red);
                                            } else {
                                              // ignore: use_build_context_synchronously
                                              FocusScope.of(context).unfocus();
                                              Get.offNamed(Routes.BASE);
                                            }
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w, right: 10.w),
                                            child: Text(
                                              'Verify',
                                              style: context
                                                  .theme.textTheme.displayMedium
                                                  ?.copyWith(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        )
                                      : const SizedBox()
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    )),
              ),
            ],
          ),
        ));
  }
}
