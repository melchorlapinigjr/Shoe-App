import 'package:flutter/material.dart';

class ProfilePageView extends StatefulWidget {
  const ProfilePageView({Key? key}) : super(key: key);

  @override
  State<ProfilePageView> createState() => _ProfilePageViewState();
}

class _ProfilePageViewState extends State<ProfilePageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                        border:
                            Border.all(color: Colors.black.withOpacity(0.5)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(20),
                        child: Icon(
                          Icons.person,
                          color: Colors.black,
                          //fit: BoxFit.fill,
                          size: 100,
                        ),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'NAME',
                  textAlign: TextAlign.center,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 50),
                  child: Text(
                    'I.D',
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
                  onTap: () {},
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
  }
}
