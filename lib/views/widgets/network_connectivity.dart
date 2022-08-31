// // import 'dart:async';
// // import 'dart:developer' as developer;
// //
// // import 'package:connectivity_plus/connectivity_plus.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:internet_connection_checker/internet_connection_checker.dart';
// //
// // class NetworkConnectivity extends StatefulWidget {
// //   const NetworkConnectivity({Key? key}) : super(key: key);
// //
// //   @override
// //   State<NetworkConnectivity> createState() => _NetworkConnectivityState();
// // }
// //
// // class _NetworkConnectivityState extends State<NetworkConnectivity> {
// //   ConnectivityResult _connectivityStatus = ConnectivityResult.none;
// //   final Connectivity _connectivity = Connectivity();
// //   late StreamSubscription<ConnectivityResult> _connectivitySubscription;
// //   // late StreamSubscription subscription;
// //   // var isDeviceConnected = false;
// //   // bool isAlertSet = false;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     initConnectivity();
// //
// //     _connectivitySubscription =
// //         _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
// //     // getConnectivity();
// //     // super.initState();
// //
// //   }
// //
// //   // getConnectivity() =>
// //   //     subscription = Connectivity().onConnectivityChanged.listen(
// //   //             (ConnectivityResult result) async {
// //   //               isDeviceConnected = await InternetConnectionChecker().hasConnection;
// //   //               if(!isDeviceConnected && isAlertSet == false){
// //   //                 showDialogBox();
// //   //                 setState(() => isAlertSet = true);
// //   //               }
// //   //             });
// //
// //   @override
// //   void dispose() {
// //    _connectivitySubscription.cancel();
// //    // subscription.cancel();
// //     super.dispose();
// //   }
// //
// //
// //   Future<void> initConnectivity () async {
// //     late ConnectivityResult result;
// //     try{
// //       result = await _connectivity.checkConnectivity();
// //     } on PlatformException catch (e){
// //       developer.log('Couldn\'t check connectivity status', error: e);
// //       return;
// //     }
// //     if(!mounted){
// //       return Future.value(null);
// //     }
// //     return _updateConnectionStatus (result);
// //   }
// //
// //   Future<void> _updateConnectionStatus (ConnectivityResult result) async{
// //     setState(() {
// //       _connectivityStatus = result;
// //     });
// //   }
// //
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Text('Connection Status: ${_connectivityStatus.toString()}'),
// //
// //         // child: ElevatedButton(
// //         //   onPressed: () => Navigator.push(
// //         //       context,
// //         //       MaterialPageRoute(builder: (context) => const Text('second page')),
// //         //   ),
// //         //   child: Text('Next Page'),
// //         // ),
// //       ),
// //     );
// //     //     return Center(
// //     //   child: getConnectivity(),
// //     // );
// //   }
// //   // showDialogBox() => showCupertinoDialog<String>(
// //   //     context: context,
// //   //     builder: (_) => CupertinoAlertDialog(
// //   //       title: Text('No Connection'),
// //   //       content: Text('Please check your internet connectivity'),
// //   //       actions: <Widget> [
// //   //         TextButton(
// //   //             onPressed: (){},
// //   //             child: Text('Ok'),
// //   //         )
// //   //       ],
// //   //     )
// //   // );
// // }
//

//
// import 'dart:async';
//
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
//
// class NetworkConnectivity extends StatefulWidget {
//   const NetworkConnectivity({Key? key}) : super(key: key);
//
//   @override
//   State<NetworkConnectivity> createState() => _NetworkConnectivityState();
// }
//
// class _NetworkConnectivityState extends State<NetworkConnectivity> {
//   StreamSubscription? internetConnection;
//   bool isOffline = false;
//
//   @override
//   void initState(){
//     internetConnection = Connectivity().onConnectivityChanged.listen((ConnectivityResult result){
//       if(result == ConnectivityResult.none){
//         setState(() {
//           isOffline = true;
//         });
//       } else if (result == ConnectivityResult.mobile){
//         setState(() {
//           isOffline = false;
//         });
//       } else if(result == ConnectivityResult.wifi){
//         setState(() {
//           isOffline = false;
//         });
//       }
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     internetConnection!.cancel();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//      // body: SingleChildScrollView(
//        // child: Column(
//          // children: [
//
//             // Container(
//             //   margin: EdgeInsets.all(30),
//             //   width: double.infinity,
//             //     child: Center(
//             //       child: Text("Check Connections",
//             //       style: TextStyle(fontSize: 20),
//             //       ),
//             //     ),
//             // ),
//             //Container(
//               child: errmsg("No Internet Connection Available", isOffline),
//             // ),
//         //   ],
//         // ),
//       //),
//     );
//   }
//
//   Widget errmsg(String text, bool show){
//     if(show == true){
//       return Container(
//         padding: EdgeInsets.all(10.00),
//         margin: EdgeInsets.only(bottom: 10.00),
//         color: Colors.red,
//         child: Row(
//           children: [
//             Container(
//               margin: EdgeInsets.only(right: 6.00),
//               child: Icon(Icons.info, color: Colors.white),
//             ),
//             Text(text, style: TextStyle(color: Colors.white)),
//           ],
//         ),
//       );
//     } else {
//       return Container();
//     }
//   }
// }

//
// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';
//
// Future<void> networkConnectivity() async {
//   // Check internet connection with singleton (no custom values allowed)
//   await execute(InternetConnectionChecker());
//
//   // Create customized instance which can be registered via dependency injection
//   final InternetConnectionChecker customInstance =
//   InternetConnectionChecker.createInstance(
//     checkTimeout: const Duration(seconds: 1),
//     checkInterval: const Duration(seconds: 1),
//   );
//
//   // Check internet connection with created instance
//   await execute(customInstance);
// }
//
// Future<void> execute(
//     InternetConnectionChecker internetConnectionChecker,
//     ) async {
//   // Simple check to see if we have Internet
//   // ignore: avoid_print
//   print('''The statement 'this machine is connected to the Internet' is: ''');
//   final bool isConnected = await InternetConnectionChecker().hasConnection;
//   // ignore: avoid_print
//   print(
//     isConnected.toString(),
//   );
//   // returns a bool
//
//   // We can also get an enum instead of a bool
//   // ignore: avoid_print
//   print(
//     'Current status: ${await InternetConnectionChecker().connectionStatus}',
//   );
//   // Prints either InternetConnectionStatus.connected
//   // or InternetConnectionStatus.disconnected
//
//   // actively listen for status updates
//   final StreamSubscription<InternetConnectionStatus> listener =
//   InternetConnectionChecker().onStatusChange.listen(
//         (InternetConnectionStatus status) {
//       switch (status) {
//         case InternetConnectionStatus.connected:
//         // ignore: avoid_print
//           print('Data connection is available.');
//
//           break;
//         case InternetConnectionStatus.disconnected:
//         // ignore: avoid_print
//           print('You are disconnected from the internet.');
//           NetworkConnectivity();
//           break;
//       }
//     },
//   );
//
//   // close listener after 30 seconds, so the program doesn't run forever
//   await Future<void>.delayed(const Duration(seconds: 30));
//   await listener.cancel();
// }
//
//
//

import 'package:flutter/material.dart';
import 'package:flutter_shoe_app/views/widgets/circular_%20progress.dart';

class NetworkConnectivity extends StatelessWidget {
  NetworkConnectivity({Key? key}) : super(key: key);

  //bool isbusy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AlertDialog(
          title: Text('No Internet'),
          content: Text('Check your connections'),
        ),
      ),
    );
    // return isbusy
    //     ? Scaffold(
    //       body: Center(
    //         child: CircularProgress(),
    //       ),
    //     )
    //     : Scaffold(
    //   body: AlertDialog(
    //     title: Text('No Internet'),
    //     content: Text('Check your connections'),
    //   ),
    // );
  }
}
