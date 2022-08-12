import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/resources/assets/icons/svg_icons.dart';
import 'package:flutter_shoe_app/views/application/application_view_model.dart';
import 'package:flutter_shoe_app/views/home/homepage_view.dart';
import 'package:flutter_shoe_app/views/login/log_in_view_model.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
        viewModelBuilder: () => LoginViewModel(),
        builder: (context, viewModel, child) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                  child: Container(
                    color: Colors.white,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
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
                            padding: EdgeInsets.all(20),
                          ),
                          const Text(
                            'ShoeApp',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(24, 5, 16, 16),
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
                                  hintText: "Email:",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(24, 5, 16, 16),
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32),
                            ),
                            child: SizedBox(
                              width: 320,
                              height: 38,
                              child: TextFormField(
                                obscureText: viewModel.isObscure ? true : false,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                    icon: const Padding(
                                      padding:
                                          EdgeInsets.only(top: 0, right: 10),
                                      child: Icon(
                                        Icons.remove_red_eye,
                                        color: Colors.black,
                                      ),
                                    ),
                                    onPressed: () {
                                      viewModel.changeObscure();
                                    },
                                  ),
                                  hintText: "Password:",
                                  border: const OutlineInputBorder(),
                                ),
                              ),
                            ),
                          ),
                          const Align(
                              alignment: Alignment.topRight,
                              child: Padding(
                                padding: EdgeInsets.only(right: 20, bottom: 10),
                                child: Text(
                                  'forgot password',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              )),
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
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(12)),
                              padding:
                                  const EdgeInsets.fromLTRB(50, 20, 50, 16),
                              width: MediaQuery.of(context).size.width,
                              child: const Center(
                                  child: Text(
                                'LOG IN',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          InkWell(
                            onTap: () {
                              viewModel.signInGoogle(context);
                            },
                            onTapCancel: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(12)),
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 4, left: 20),
                                      child:
                                          SvgPicture.asset(SvgIcons.googleIcon),
                                    ),
                                    const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'GOOGLE',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          InkWell(
                            onTap: () => viewModel.loginFacebook(context),
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(12)),
                              width: MediaQuery.of(context).size.width,
                              child: Stack(children: const [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 4, left: 20),
                                    child: Icon(Icons.facebook_rounded),
                                  ),
                                ),
                                Center(
                                    child: Text(
                                  'FACEBOOK',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ))
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
