import 'package:e_commerce/core/utils/constants/assets.dart';
import 'package:e_commerce/core/utils/constants/values_manger.dart';
import 'package:e_commerce/features/login/presentation/view/widgets/socail_button.dart';
import 'package:flutter/material.dart';

class SocailButtonsLogin extends StatelessWidget {
  const SocailButtonsLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialButton(
          onPressed: () {},
          buttonText: "تسجيل بواسطة Google",
          iconPath: AssetsManager.googleIcon,
        ),
        const SizedBox(height: AppSize.s12),
        SocialButton(
          onPressed: () {},
          buttonText: "تسجيل بواسطة Facebook",
          iconPath: AssetsManager.facebookIcon,
        ),
        const SizedBox(height: AppSize.s12),
        SocialButton(
          onPressed: () {},
          buttonText: "تسجيل بواسطة Apple",
          iconPath: AssetsManager.appleIcon,
        ),
      ],
    );
  }
}
