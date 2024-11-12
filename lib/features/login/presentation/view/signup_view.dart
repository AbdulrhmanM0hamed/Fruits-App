import 'package:e_commerce/core/utils/common/custom_app_bar.dart';
import 'package:e_commerce/features/login/presentation/view/widgets/signup_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  static const routeName = 'SignupView';
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context , S.current.signup),
      body: SignupViewBody() ,
    );
  }
}