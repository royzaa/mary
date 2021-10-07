// // import 'package:flutter/material.dart';
// // import 'package:flutter_unity_widget/flutter_unity_widget.dart';

// // class ArScreen extends StatelessWidget {
// //   ArScreen({Key? key}) : super(key: key);

// //   late UnityWidgetController _unityWidgetController;
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(title: const Text('Portal Screen')),
// //       body: Center(
// //         child: UnityWidget(
// //           onUnityCreated: (controller) => _unityWidgetController = controller,
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:math' as math;

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_unity_widget/flutter_unity_widget.dart';
// import 'package:get/get.dart';

// import '../../services/shared_preferences.dart';
// import '../../services/unity_controller.dart';

// // ignore: must_be_immutable
// class ArScreen extends StatefulWidget {
//   const ArScreen({Key? key}) : super(key: key);

//   @override
//   State<ArScreen> createState() => _ArScreenState();
// }

// class _ArScreenState extends State<ArScreen> {
//   final _unityController = Get.find<UnityController>();

//   @override
//   void initState() {
//     SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
//     WidgetsBinding.instance!.addPostFrameCallback((_) {
//       if (DataSharedPreferences.getFirstLaunchAR() == false) {
//         Future.delayed(
//             const Duration(milliseconds: 5500),
//             () => showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     title: Text(
//                       'Tips',
//                       style: TextStyle(
//                           fontSize: 20, color: Theme.of(context).primaryColor),
//                     ),
//                     content: const Text(
//                       "You should point your device camera in large surface area",
//                       style: TextStyle(fontSize: 14, color: Colors.black),
//                     ),
//                     actions: [
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pop(context);
//                           DataSharedPreferences.setFirstLaunchAR(true);
//                         },
//                         child: Text(
//                           "I understand",
//                           style: TextStyle(
//                               fontSize: 16,
//                               color: Theme.of(context).primaryColor),
//                         ),
//                       )
//                     ],
//                   ),
//                 ));
//       }
//     });
//     super.initState();
//   }

//   @override
//   void dispose() {
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     super.dispose();
//   }

//   void _setScaleFactorValue(String multipy) {
//     _unityController.unityController!
//         .postMessage('GameManager', 'SetScaleFactor', multipy);
//   }

//   RxDouble scaleFactor = 1.0.obs;
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         await _unityController.unityController!.pause();
//         Navigator.of(context).pop();
//         return false;
//       },
//       child: Scaffold(
//         body: Stack(
//           alignment: Alignment.center,
//           children: [
//             SizedBox(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               child: UnityWidget(
//                 onUnitySceneLoaded: (info) {
//                   if (!(info!.isLoaded!)) {
//                     _unityController.unityController!.create();
//                     debugPrint('new UnityAR player has already created');
//                   }
//                 },
//                 onUnityCreated: (controller) async {
//                   _unityController.unityController = controller;
//                   final _isPaused =
//                       await _unityController.unityController!.isPaused();
//                   debugPrint('unity player isPaused: $_isPaused');
//                   final _isLoaded =
//                       (await _unityController.unityController!.isLoaded());
//                   debugPrint('unity player isloaed: $_isLoaded');
//                   if (_isPaused!) {
//                     Future.delayed(
//                       const Duration(milliseconds: 50),
//                       () async {
//                         try {
//                           await _unityController.unityController!.resume();
//                         } catch (e) {
//                           throw "error when resume: " + e.toString();
//                         }
//                       },
//                     );
//                   }

//                   // if (!(await _unityController.unityController!.isLoaded())!) {
//                   //   Future.delayed(const Duration(milliseconds: 50), () async {
//                   //     try {
//                   //       final _createdUnityPlayer =
//                   //           await _unityController.unityController!.create();
//                   //       debugPrint(
//                   //           'unity player isCreated: $_createdUnityPlayer');
//                   //       debugPrint('unity player isCreated: -');
//                   //     } catch (e) {
//                   //       debugPrint('bigerror unity player' + e.toString());
//                   //     }
//                   //     debugPrint('bigerror unity player');
//                   //   });
//                   //   debugPrint('bigerror unity player 2');
//                   // }
//                 },
//               ),
//             ),
//             Positioned(
//               bottom: 30,
//               child: ElevatedButton.icon(
//                 onPressed: () async {
//                   Navigator.of(context).pop();
//                   await _unityController.unityController!.pause();
//                 },
//                 icon: const Icon(Icons.arrow_back),
//                 label: const Text(
//                   'Back',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ),
//             Positioned(
//               right: -20,
//               child: Transform.rotate(
//                 angle: math.pi * 3 / 2,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Transform.rotate(
//                       angle: math.pi / 2,
//                       child: const Text(
//                         '1x',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Obx(
//                       () => Slider(
//                         min: 0.4,
//                         max: 4.0,
//                         thumbColor: Colors.white,
//                         activeColor: Colors.white,
//                         value: scaleFactor.value,
//                         onChanged: (value) {
//                           scaleFactor.value = value;

//                           _setScaleFactorValue(value.toString());
//                         },
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Transform.rotate(
//                       angle: math.pi / 2,
//                       child: const Text(
//                         '10x',
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
