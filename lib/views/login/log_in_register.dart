import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/resources/assets/icons/svg_icons.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/home/homepage_view.dart';
import 'package:flutter_shoe_app/views/login/log_in_view_model.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class LoginRegister extends StatefulWidget {
  const LoginRegister({Key? key}) : super(key: key);

  @override
  State<LoginRegister> createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, viewModel, child) {
          return SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                    child: Container(
                      color: Colors.white,
                      child: Align(
                          alignment: Alignment.center,
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 34,
                              ),
                              Center(
                                child: Image.asset(
                                  'lib/resources/assets/images/logo_shoes.jpg',
                                  height: 129.0,
                                  width: 127.0,
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(10),
                              ),
                              Center(
                                child: Image.asset(
                                  'lib/resources/assets/images/profile.png',
                                  height: 129.0,
                                  width: 127.0,
                                ),
                              ),
                              const Text(
                                'Browse',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                padding:
                                const EdgeInsets.fromLTRB(24, 5, 16, 16),
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32)),
                                width: MediaQuery.of(context).size.width,
                                child: SizedBox(
                                  width: 320,
                                  height: 38,
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      contentPadding:
                                      EdgeInsets.only(top: 4, left: 4),
                                      hintStyle: TextStyle(),
                                      hintText: "Name:",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                const EdgeInsets.fromLTRB(24, 5, 16, 16),
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32)),
                                width: MediaQuery.of(context).size.width,
                                child: SizedBox(
                                  width: 320,
                                  height: 38,
                                  child: TextFormField(
                                    obscureText:
                                    viewModel.isObscure ? true : false,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: const Padding(
                                          padding: EdgeInsets.only(
                                              top: 0, right: 10),
                                          child: Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.black,
                                          ),
                                        ),
                                        onPressed: () {
                                          viewModel.changeObscure();
                                        },
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                          top: 4, left: 4),
                                      hintText: "Password:",
                                      border: const OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                const EdgeInsets.fromLTRB(24, 5, 16, 16),
                                height: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(32)),
                                width: MediaQuery.of(context).size.width,
                                child: SizedBox(
                                  width: 320,
                                  height: 38,
                                  child: TextFormField(
                                    obscureText:
                                    viewModel.isObscure ? true : false,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        icon: const Padding(
                                          padding: EdgeInsets.only(
                                              top: 0, right: 10),
                                          child: Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.black,
                                          ),
                                        ),
                                        onPressed: () {
                                          viewModel.changeObscure();
                                        },
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                          top: 4, left: 4),
                                      hintText: "Re Enter Password:",
                                      border: const OutlineInputBorder(),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (_) {
                                        return ViewModelBuilder<
                                            ApplicationViewModel>.reactive(
                                            disposeViewModel: false,
                                            viewModelBuilder: () =>
                                                Provider.of<ApplicationViewModel>(
                                                    context),
                                            builder: (context, viewModel, child) {
                                              return const HomepageView();
                                            });
                                      }));
                                },
                                child: Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(12)),
                                  padding:
                                  const EdgeInsets.fromLTRB(50, 20, 50, 16),
                                  width: MediaQuery.of(context).size.width,
                                  child: const Center(
                                      child:  Text(
                                          'Register',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      )),
                                ),
                            ],
                          )),
                    ),
                  ),
                ])),
          );
        });
  }
}
