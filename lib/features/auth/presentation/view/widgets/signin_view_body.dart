
import 'dart:io';

import 'package:e_commerce/core/services/shared_preferences.dart';
import 'package:e_commerce/core/utils/common/custom_text_form_field.dart';
import 'package:e_commerce/core/utils/common/elvated_button.dart';
import 'package:e_commerce/core/utils/common/password_field.dart';
import 'package:e_commerce/core/utils/constants/assets.dart';
import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:e_commerce/core/utils/constants/constants.dart';
import 'package:e_commerce/core/utils/constants/font_manger.dart';
import 'package:e_commerce/core/utils/constants/styles_manger.dart';
import 'package:e_commerce/core/utils/constants/values_manger.dart';
import 'package:e_commerce/features/auth/presentation/view/forget_password.dart';
import 'package:e_commerce/features/auth/presentation/view/controller/signin_cubit/sign_in_cubit.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/custom_divider.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/dont_have_account.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/socail_button.dart';
import 'package:e_commerce/generated/l10n.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SigninViewBody extends StatefulWidget {
   SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
   
  late String email , password ; 

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
               CustomTextFormField(

                 onSaved: (value) =>   email = value! ,
                hintText: S.current!.email,
                suffixIcon: const Icon(Icons.email),
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
               PasswordField(
                onSaved: (value) => password = value!   ,
                
              ),
              const SizedBox(
                height: AppSize.s18,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ForgotPasswordView.routeName);
                },
                child: Text(
                  S.current!.forgotPassword,
                  style: getSemiBoldStyle(fontFamily: FontConstant.cairo, fontSize: FontSize.size14, color: TColors.primary),
                ),
              ),
              const SizedBox(
                height: AppSize.s40,
              ),
              CustomElevatedButton(onPressed: () {
                Prefs.setBool(KIsloginSuccess, true);
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                 context.read<SignInCubit>().signInWithEmailAndPassword(email, password);
                }
                else {
                  autovalidateMode = AutovalidateMode.onUserInteraction;
                  setState(() {
                    
                  });
                }
              }, buttonText: S.current!.login,),
              const SizedBox(
                height: AppSize.s20,
              ),
             const DontHaveAccount(),
              const SizedBox(
                height: AppSize.s40,
              ),
          const    CustomDivider(),
              const SizedBox(height: AppSize.s20), 
             Column(
      children: [
        SocialButton(
          onPressed: () {
            context.read<SignInCubit>().signInWithGoogle();
          },
          buttonText: "تسجيل بواسطة Google",
          iconPath: AssetsManager.googleIcon,
        ),
        const SizedBox(height: AppSize.s12),
        SocialButton(
          onPressed: () {
            context.read<SignInCubit>().signInWithFacebook();
          },
          buttonText: "تسجيل بواسطة Facebook",
          iconPath: AssetsManager.facebookIcon,
        ),
        const SizedBox(height: AppSize.s12),
      // Platform.isIOS ?  SocialButton(
      //     onPressed: () {},
      //     buttonText: "تسجيل بواسطة Apple",
      //     iconPath: AssetsManager.appleIcon,
      //   ) : const SizedBox(),
       SocialButton(
          onPressed: () {},
          buttonText: "تسجيل بواسطة Apple",
          iconPath: AssetsManager.appleIcon,
        ) 
      
      ],
    ),
            ],
          ),
        ),
      ),
    );
  }
}

