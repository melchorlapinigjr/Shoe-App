import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/profile_page/profile_page_view_model.dart';
import 'package:flutter_shoe_app/views/widgets/circular_%20progress.dart';
import 'package:stacked/stacked.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfilePageViewModel>.reactive(
        onModelReady: (model) => model.initialize(),
        viewModelBuilder: () => ProfilePageViewModel(),
        builder: (context, viewModel, child) {
          return viewModel.setBusy
              ? CircularProgress()
              : SafeArea(
                  child: Scaffold(
                      body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 140,
                                  width: 140,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.black, width: 2),
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      viewModel.user!.avatar!,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              viewModel.user!.name,
                              textAlign: TextAlign.center,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 5, bottom: 50),
                              child: Text(
                                viewModel.user!.email,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Row(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Icon(
                                          Icons.badge,
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'My Membership',
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.black26,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Row(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Icon(
                                          Icons.phone_in_talk,
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Contact Us',
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.black26,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Row(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Icon(
                                          Icons.privacy_tip,
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Privacy Policy',
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.black26,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Row(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Icon(
                                          Icons.list_alt,
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Terms and Conditions',
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.black26,
                            ),
                            InkWell(
                              onTap: () {
                                viewModel.logOut();
                              },
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Row(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Icon(
                                          Icons.logout,
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'Log Out',
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              color: Colors.black26,
                            ),
                          ],
                        )),
                  )),
                );
        });
  }
}
