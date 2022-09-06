import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.router.dart';
import 'package:flutter_shoe_app/views/login/login_register_model.dart';
import 'package:stacked/stacked.dart';

class LoginRegister extends StatelessWidget with InputValidationMixin {
  LoginRegister({Key? key}) : super(key: key);

  final formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginRegisterModel>.reactive(
        viewModelBuilder: () => LoginRegisterModel(),
        builder: (context, viewModel, child) {
          return SafeArea(
            child: Scaffold(
                resizeToAvoidBottomInset: false,
                body: Form(
                  key: formGlobalKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: ListView(children: [
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
                                const Padding(
                                  padding: EdgeInsets.all(10),
                                ),
                                Visibility(
                                  visible: viewModel.isImageLoaded == false,
                                  child: Center(
                                    child: Image.asset(
                                      'lib/resources/assets/images/profile.png',
                                      height: 120.0,
                                      width: 120.0,
                                    ),
                                  ),
                                ),
                                Visibility(
                                    visible: viewModel.isImageLoaded == true,
                                    child:
                                        ImageView(viewModel.image?.path ?? '')),
                                const SizedBox(
                                  height: 25,
                                ),
                                InkWell(
                                  onTap: () {
                                    viewModel.getImages();
                                  },
                                  child: const Text(
                                    'Browse',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 36,
                                ),
                                TextFormField(
                                  controller: viewModel.nameFieldController,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    prefixIcon: const Icon(Icons.person),
                                    contentPadding:
                                        const EdgeInsets.only(top: 4, left: 4),
                                    labelText: "Name",
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    labelText: "Email",
                                    prefixIcon: const Icon(Icons.email),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  controller: viewModel.emailFieldController,
                                  validator: (email) {
                                    if (isEmailValid(email!)) {
                                      return null;
                                    } else {
                                      return 'Enter a valid email address';
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                TextFormField(
                                  controller: viewModel.passFieldController,
                                  obscureText:
                                      viewModel.isObscure ? true : false,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: const Padding(
                                        padding: EdgeInsets.only(right: 10),
                                        child: Icon(
                                          Icons.remove_red_eye,
                                          color: Colors.black,
                                        ),
                                      ),
                                      onPressed: () {
                                        viewModel.changeObscure();
                                      },
                                    ),
                                    contentPadding:
                                        const EdgeInsets.only(top: 4, left: 4),
                                    // ignore: prefer_const_constructors
                                    prefixIcon: Icon(Icons.lock),
                                    labelText: "Password:",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
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
                                  child: const SizedBox(
                                    width: 320,
                                    height: 38,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (formGlobalKey.currentState!
                                        .validate()) {
                                      formGlobalKey.currentState?.save();
                                      // use the email provided here
                                      viewModel.onRegister(
                                          viewModel.nameFieldController.text,
                                          viewModel.emailFieldController.text,
                                          viewModel.passFieldController.text);
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return AlertDialog(
                                              title: const Text(
                                                'You can now sign in with your account',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 24,
                                                ),
                                              ),
                                              actions: [
                                                Center(
                                                  child: SizedBox(
                                                    height: 40,
                                                    width: 80,
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                        const Color(0xff1F2732),
                                                      )),
                                                      onPressed: () async {
                                                        await viewModel
                                                            .navigationService
                                                            .popAllAndPushNamed(
                                                                Routes
                                                                    .LoginView);
                                                      },
                                                      child: const Center(
                                                          child: Text(
                                                        'Got It!',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 18,
                                                        ),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                    } else {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return AlertDialog(
                                              title: const Text(
                                                'It seems that some of your inputs are invalid.',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 24,
                                                ),
                                              ),
                                              actions: [
                                                Center(
                                                  child: SizedBox(
                                                    height: 40,
                                                    child: ElevatedButton(
                                                      style: ButtonStyle(
                                                          backgroundColor:
                                                              MaterialStateProperty
                                                                  .all(
                                                        const Color(0xff14FC24)
                                                            .withOpacity(0.7),
                                                      )),
                                                      onPressed: () {
                                                        viewModel
                                                            .navigationService
                                                            .pop();
                                                      },
                                                      child: const Center(
                                                          child: Text(
                                                        'Ok',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xff1F2732)),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          });
                                    }
                                  },
                                  child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      padding: const EdgeInsets.fromLTRB(
                                          50, 20, 50, 16),
                                      width: MediaQuery.of(context).size.width,
                                      child: const Center(
                                        child: Text(
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
                  ]),
                )),
          );
        });
  }
}

//form validation mixin
mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length > 7;

  bool isEmailValid(String email) {
    final pattern = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return pattern.hasMatch(email);
  }
}

class ImageView extends ViewModelWidget<LoginRegisterModel> {
  final String imagePath;

  const ImageView(this.imagePath, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, LoginRegisterModel viewModel) {
    return Container(
      height: 120.0,
      width: 120.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: const Color(0xFFD8D8D8),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Image.file(
          File(imagePath),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
