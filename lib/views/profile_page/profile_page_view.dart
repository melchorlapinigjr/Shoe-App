import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/app/app.router.dart';
import 'package:flutter_shoe_app/views/profile_page/dialogs/policy.dart';
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
                                    backgroundImage: NetworkImage(viewModel
                                            .user!.avatar ??
                                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTEWOF4Helqj7_TvdkNW6NS6oey-2JjfKNdew&usqp=CAU'),
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
                                viewModel.user!.email ?? '',
                                textAlign: TextAlign.center,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await viewModel.navigationService.pushNamed(Routes.MyPurchases);
                              },
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Row(
                                    children: const [
                                      Padding(
                                        padding: EdgeInsets.all(12),
                                        child: Icon(
                                          Icons.shopping_bag_outlined,
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            'My Purchases',
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
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (builder) {
                                      return const PrivacyPolicyDialog(
                                          mdFileName: 'contact_us.md');
                                    });
                              },
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
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (builder) {
                                      return const PrivacyPolicyDialog(
                                          mdFileName: 'privacy_policy.md');
                                    });
                              },
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
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (builder) {
                                      return const PrivacyPolicyDialog(
                                          mdFileName:
                                          'terms_and_conditions.md');
                                    });
                              },
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
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        title: const Text(
                                          'Sign Out',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 24,
                                          ),
                                        ),
                                        content:
                                            const Text('Confirm Sign Out?'),
                                        actions: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                height: 40,
                                                child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                    const Color(0xff14FC24),
                                                  )),
                                                  onPressed: () {
                                                    viewModel.navigationService
                                                        .pop();
                                                  },
                                                  child: const Center(
                                                      child: Text(
                                                    'No',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 16,
                                                    ),
                                                  )),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 16,
                                              ),
                                              SizedBox(
                                                height: 40,
                                                child: ElevatedButton(
                                                  style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(
                                                    const Color(0xffE30405),
                                                  )),
                                                  onPressed: () {
                                                    viewModel.sharedPreference
                                                        .logOut();
                                                    viewModel.navigationService
                                                        .pop();
                                                    viewModel.navigationService
                                                        .pushReplacementNamed(
                                                            Routes.LoginView);
                                                  },
                                                  child: const Center(
                                                      child: Text(
                                                    'Yes',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 18,
                                                    ),
                                                  )),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      );
                                    });
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
