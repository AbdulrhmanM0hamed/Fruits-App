import 'package:e_commerce/core/services/service_locator.dart';
import 'package:e_commerce/core/utils/common/custom_app_bar.dart';
import 'package:e_commerce/features/auth/presentation/view/controller/signin_cubit/sign_in_cubit.dart';
import 'package:e_commerce/features/auth/presentation/view/widgets/signin_view_body_bloc_consumer.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const String routeName = "login";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(sl()),
      child: Scaffold(
        appBar: customAppBar(context, S.current!.login),
        body: const SiginViewBodyBlocConsmer(),
      ),
    );
  }
}

