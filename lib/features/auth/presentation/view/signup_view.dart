import 'package:e_commerce/core/services/service_locator.dart';
import 'package:e_commerce/core/utils/common/custom_app_bar.dart';
import 'package:e_commerce/features/auth/presentation/view/view_model/signup_cubit/sign_up_cubit.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/signup_view_body_bloc_consumer.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  static const routeName = 'SignupView';
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(sl()),
      child: Scaffold(
          appBar: customAppBar(context, S.current!.signup),
          body: const  SignUpViewBodyBlocConsumer(), 
          ),
    );
  }
}
