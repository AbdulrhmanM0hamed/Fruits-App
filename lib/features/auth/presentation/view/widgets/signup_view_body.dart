import 'package:e_commerce/core/utils/common/custom_text_form_field.dart';
import 'package:e_commerce/core/utils/common/elvated_button.dart';
import 'package:e_commerce/core/utils/common/password_field.dart';
import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:e_commerce/core/utils/constants/font_manger.dart';
import 'package:e_commerce/core/utils/constants/styles_manger.dart';
import 'package:e_commerce/features/auth/presentation/view/login_view.dart';
import 'package:e_commerce/features/auth/presentation/view/view_model/signin_cubit/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/custom_check_box.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password, userName;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    // Get the screen size
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: screenHeight *
              0.03, // Adjust vertical padding based on screen height
          horizontal: screenWidth *
              0.05, // Adjust horizontal padding based on screen width
        ),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Aligns the children to the start
            children: [
              CustomTextFormField(
                onSaved: (value) => userName = value!,
                hintText: S.current.fullName,
                suffixIcon: const Icon(Icons.person),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              CustomTextFormField(
                onSaved: (value) => email = value!,
                hintText: S.current.email,
                suffixIcon: const Icon(Icons.email),
              ),
              SizedBox(height: screenHeight * 0.02), // Responsive spacing
              PasswordField(
                onSaved: (value) => password = value!,
              ),
              SizedBox(height: screenHeight * 0.03), // Responsive spacing
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomCheckBox(),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: "من خلال إنشاء حساب ,فإنك توافق على ",
                        style: getSemiBoldStyle(
                          fontFamily: FontConstant.cairo,
                          fontSize: FontSize.size14, // Responsive font size
                          color: TColors.textSecondary,
                        ),
                        children: [
                          TextSpan(
                            text: "الشروط والاحكام الخاصة بنا",
                            style: getSemiBoldStyle(
                              fontFamily: FontConstant.cairo,
                              fontSize: FontSize.size14, // Responsive font size
                              color: TColors.primary,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start, // Aligns text to start
                      overflow: TextOverflow
                          .clip, // Allows text to wrap to the next line
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.03), // Responsive spacing

              CustomElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context
                          .read<SignUpCubit>()
                          .createUserWithEmailAndPassword(
                            userName,
                            email,
                            password,
                          );
                      // Perform form submission logic here
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  buttonText: "إنشاء حساب جديد"),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "لديك حساب بالفعل؟",
                    style: getSemiBoldStyle(
                      fontFamily: FontConstant.cairo,
                      fontSize: FontSize.size16, // Responsive font size
                      color: TColors.textSecondary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, LoginView.routeName);
                    },
                    child: Text(
                      "تسجيل الدخول",
                      style: getSemiBoldStyle(
                        fontFamily: FontConstant.cairo,
                        fontSize: FontSize.size16, // Responsive font size
                        color: TColors.primary,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


