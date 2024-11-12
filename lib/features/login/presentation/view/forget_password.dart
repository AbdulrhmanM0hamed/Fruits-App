import 'package:e_commerce/core/utils/common/custom_app_bar.dart';
import 'package:e_commerce/features/login/presentation/view/verification_code_view.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:e_commerce/core/utils/common/custom_text_form_field.dart';
import 'package:e_commerce/core/utils/common/elvated_button.dart';
import 'package:e_commerce/core/utils/constants/values_manger.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});
  static const String routeName = "forgotPassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context , "نسيان كلمة المرور"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextFormField(
              hintText: "ادخل رقم الهاتف ", // يجب أن تتأكد من أن هذه الترجمة موجودة في ملف الترجمة.
              icon: const Icon(Icons.phone),
            ),
            const SizedBox(height: AppSize.s20),
            CustomElevatedButton(
              onPressed: () {
                // منطق التنقل إلى صفحة كود التحقق
                Navigator.pushNamed(context, VerificationCodeView.routeName);
              },
              buttonText: "نسيت كلمة المرور "
            ),
          ],
        ),
      ),
    );
  }
}
