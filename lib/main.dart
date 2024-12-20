import 'package:e_commerce/core/helpers_functions/on_genrated_routes.dart';
import 'package:e_commerce/core/services/custom_bloc_observer.dart';
import 'package:e_commerce/core/services/service_locator.dart';
import 'package:e_commerce/core/services/shared_preferences.dart';
import 'package:e_commerce/core/utils/theme/theme.dart';
import 'package:e_commerce/features/splash/presentation/view/splash_view.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  Bloc.observer = CustomBlocObserver();
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
    runApp(const FruitHub());
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
      Widget build(BuildContext context) {
        return MaterialApp(
          localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            locale: const Locale('ar'),
          theme: TAppTheme.lightTheme,
          themeMode: ThemeMode.system,
          darkTheme: TAppTheme.darkTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenratedRoutes,
          initialRoute: SplashView.routeName,
        );
      }
}