import 'package:e_commerce/core/helpers_functions/on_genrated_routes.dart';
import 'package:e_commerce/features/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenratedRoutes,
      initialRoute: SplashView.routeName,
    );
  }
}