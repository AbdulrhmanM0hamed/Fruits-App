import 'package:e_commerce/core/utils/common/custom_text_form_field.dart';
import 'package:e_commerce/core/utils/common/elvated_button.dart';
import 'package:e_commerce/core/utils/constants/colors.dart';
import 'package:e_commerce/core/utils/constants/font_manger.dart';
import 'package:e_commerce/core/utils/constants/styles_manger.dart';
import 'package:e_commerce/features/login/presentation/view/login_view.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

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
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Aligns the children to the start
          children: [
            CustomTextFormField(
              hintText: "الاسم كامل",
              icon: Icon(Icons.person),
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive spacing
            CustomTextFormField(
              hintText: "البريد الإلكترونى",
              icon: Icon(Icons.email),
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive spacing
            CustomTextFormField(
              hintText: "كلمة المرور",
              icon: Icon(Icons.remove_red_eye),
            ),
            SizedBox(height: screenHeight * 0.03), // Responsive spacing
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCheckBox(
                ),
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
                onPressed: () {}, buttonText: "إنشاء حساب جديد"),

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
                        Navigator.pushNamed(
                          context, LoginView.routeName
                        );
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
    );
  }
}

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key});

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(10, -12), // Move the checkbox to the right
      child: Transform.scale(
        scale: 1.4, // Increase the size of the checkbox
        child: Checkbox(
          value: isChecked,
          onChanged: (value) {
            setState(() {
              isChecked = value ?? false;
            });
          },
          side: BorderSide(
            width: 1, 
            color: TColors.darkGrey.withOpacity(0.5),
          ),
          activeColor: TColors.primary, // Color when checked
        ),
      ),
    );
  }
}