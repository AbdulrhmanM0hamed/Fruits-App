import 'package:e_commerce/core/services/shared_preferences.dart';
import 'package:e_commerce/core/utils/common/custom_text_form_field.dart';
import 'package:e_commerce/core/utils/common/elvated_button.dart';
import 'package:e_commerce/core/utils/common/password_field.dart';
import 'package:e_commerce/core/utils/constants/constants.dart';
import 'package:e_commerce/features/auth/presentation/view/controller/signup_cubit/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/custom_check_box.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/hava_an_account.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/terms_and_condition.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewBody extends StatefulWidget{
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, userName;
  bool isAgreed = false; 

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight * 0.03,
          horizontal: screenWidth * 0.05,
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                onSaved: (value) => userName = value!,
                hintText: S.current!.fullName,
                suffixIcon: const Icon(Icons.person),
              ),
              SizedBox(height: screenHeight * 0.02),
              CustomTextFormField(
                onSaved: (value) => email = value!,
                hintText: S.current!.email,
                suffixIcon: const Icon(Icons.email),
              ),
              SizedBox(height: screenHeight * 0.02),
              PasswordField(
                onSaved: (value) => password = value!,
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 CustomCheckBox(
                    initialValue: isAgreed,
                    onChanged: (value) {
                      setState(() {
                        isAgreed = value ;
                      });
                    },
                  ),
              const    TermsAndConditons(),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              CustomElevatedButton(
                onPressed: () {
                 Prefs.setBool(KIsloginSuccess, true);
                  if (isAgreed) {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<SignUpCubit>().createUserWithEmailAndPassword(
                            userName,
                            email,
                            password,
                          );
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  } else {
                    // عرض Snackbar إذا لم يقم المستخدم بالموافقة
                    ScaffoldMessenger.of(context).showSnackBar(
                   const   SnackBar(
                        content: Text('يرجى الموافقة على الشروط والأحكام قبل المتابعة.'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                buttonText: "إنشاء حساب جديد",
              ),
            const  HavaAnAccount(),
            ],
          ),
        ),
      ),
    );
  }
}

