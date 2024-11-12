import 'package:e_commerce/core/utils/common/custom_app_bar.dart';
import 'package:e_commerce/features/login/presentation/view/widgets/forget_password_view_body.dart';
import 'package:flutter/material.dart';


class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const String routeName = "forgotPassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context , "نسيان كلمة المرور"),
      body: const ForgetPasswordViewBody(),
    );
  }
}

