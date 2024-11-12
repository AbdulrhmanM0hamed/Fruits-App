import 'package:e_commerce/core/utils/common/custom_app_bar.dart';

import 'package:e_commerce/features/login/presentation/view/widgets/login_view_body.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = "login" ;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar(context , S.current.login),
      body:const LoginViewBody(),
    );
  }

}