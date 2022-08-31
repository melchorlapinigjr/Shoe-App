import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/splash_screen/splash_screen_view_model.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      viewModelBuilder: () => SplashScreenViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('lib/resources/assets/images/app_logo.png'),
              ],
            ),
          ),
        );
      }
    );
  }
}