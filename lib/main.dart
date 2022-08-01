import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/login/log_in_view.dart';
import 'package:stacked/stacked.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Avalon',
        canvasColor: Colors.white,
        backgroundColor: Colors.white,
      ),
      title: 'Shoe App',
      home: ViewModelBuilder<ApplicationViewModel>.reactive(
        builder: (context, model, child) {
          //return const HomepageView();
          return const LoginView();
        },
        viewModelBuilder: () => ApplicationViewModel(),
        disposeViewModel: false,
      ),
    );
  }
}
