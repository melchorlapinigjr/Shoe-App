import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/resources/assets/icons/svg_icons.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
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
                        padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
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
                              contentPadding: EdgeInsets.only(top: 4, left: 4),
                              hintStyle: TextStyle(),
                              hintText: "Email:",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(24, 16, 16, 16),
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
                              contentPadding: EdgeInsets.only(top: 4, left: 4),
                              hintText: "Password:",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                      ),
                      const Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 20, bottom: 10),
                            child: Text(
                              'Forgot password',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          )),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.fromLTRB(50, 30, 50, 16),
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                            child: Text(
                          'LOG IN',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
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
                                padding:
                                    const EdgeInsets.only(top: 4, left: 20),
                                child: SvgPicture.asset(SvgIcons.googleIcon),
                              ),
                              const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'GOOGLE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Container(
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
                    ],
                  )),
            ),
          )),
    );
  }
}
