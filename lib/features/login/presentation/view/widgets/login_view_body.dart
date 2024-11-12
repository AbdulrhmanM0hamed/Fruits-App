
import 'package:e_commerce/core/utils/common/custom_text_form_field.dart';
import 'package:e_commerce/core/utils/common/elvated_button.dart';
import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:e_commerce/core/utils/constants/font_manger.dart';
import 'package:e_commerce/core/utils/constants/styles_manger.dart';
import 'package:e_commerce/core/utils/constants/values_manger.dart';
import 'package:e_commerce/features/login/presentation/view/widgets/custom_divider.dart';
import 'package:e_commerce/features/login/presentation/view/widgets/dont_have_account.dart';
import 'package:e_commerce/features/login/presentation/view/widgets/social_buttons_login.dart';

import 'package:flutter/material.dart';


class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
             CustomTextFormField(
              hintText: "البريد الالكتروني",
              icon: const Icon(Icons.email),
            ),
            const SizedBox(
              height: AppSize.s18,
            ),
             CustomTextFormField(
              hintText: "كلمة المرور",
              icon: Icon(Icons.remove_red_eye),
            ),
            const SizedBox(
              height: AppSize.s18,
            ),
            Text(
              "هل نسيت كلمة المرور ؟",
              style: getSemiBoldStyle(fontFamily: FontConstant.cairo, fontSize: FontSize.size14, color: TColors.primary),
            ),
            const SizedBox(
              height: AppSize.s40,
            ),
            CustomElevatedButton(onPressed: () {}, buttonText: "تسجيل دخول"),
            const SizedBox(
              height: AppSize.s20,
            ),
           const DontHaveAccount(),
            const SizedBox(
              height: AppSize.s40,
            ),
        const    CustomDivider(),
            const SizedBox(height: AppSize.s20), 
        const    SocailButtonsLogin(),
          ],
        ),
      ),
    );
  }
}

