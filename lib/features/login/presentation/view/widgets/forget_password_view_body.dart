import 'package:e_commerce/core/utils/common/custom_text_form_field.dart';
import 'package:e_commerce/core/utils/common/elvated_button.dart';
import 'package:e_commerce/core/utils/constants/values_manger.dart';
import 'package:e_commerce/features/login/presentation/view/verification_code_view.dart';
import 'package:flutter/material.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        const  CustomTextFormField(
            hintText: "ادخل رقم الهاتف ", 
            icon:  Icon(Icons.phone),
          ),
          const SizedBox(height: AppSize.s20),
          CustomElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, VerificationCodeView.routeName);
            },
            buttonText: "نسيت كلمة المرور "
          ),
        ],
      ),
    );
  }
}
