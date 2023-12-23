import 'package:ez_build/app/modules/auth/view/widgets/phone_controller.dart';
import 'package:ez_build/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PhoneScreen extends GetView<PhoneController> {
  const PhoneScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PhoneController>(
      init: PhoneController(),
      id: 'Phone',
      builder: (_) {
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
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'Phone Number',
                            ),
                            keyboardType: TextInputType.phone,
                            style:
                                context.theme.textTheme.displayMedium?.copyWith(
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
                            child: ElevatedButton(
                              onPressed: controller.isEntered
                                  ? controller.authUserWithOTP
                                  : controller.authUserWithPhone,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(left: 10.w, right: 10.w),
                                child: Text(
                                  controller.isEntered ? 'Verify' : 'Get OTP',
                                  style: context.theme.textTheme.displayMedium
                                      ?.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
