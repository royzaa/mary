import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_unity_widget/flutter_unity_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../services/shared_preferences.dart';
import '../../services/unity_controller.dart';

// ignore: must_be_immutable
class ArScreen extends StatefulWidget {
  const ArScreen({Key? key}) : super(key: key);

  @override
  State<ArScreen> createState() => _ArScreenState();
}

class _ArScreenState extends State<ArScreen> {
  final _unityController = Get.find<UnityController>();
  final RxDouble _scaleFactor = 1.0.obs;
  final RxDouble _rotation = 0.0.obs;
  int _currentVehicleIndex = 0;
  final PageController _pageController = PageController(viewportFraction: 0.3);
  int duration = DataSharedPreferences.getArUiDuration();
  String length = '';
  String width = '';
  String height = '';
  bool _isFirstScene = true;

  final _vehicles = <String>[
    'Air Balloon',
    'Ambulans',
    'ATV',
    'Bicylce',
    'Blimp',
    'Bulldozer',
    'Bus',
    'Camper',
    'Car',
    'Carriage',
    'Cement Truck',
    'Combine Harvester',
    'Crane',
    'Digger',
    'Dump Truck',
    'Ferry',
    'Fire Engine',
    'Garbage Truck',
    'Gondola',
    'Helicopter',
    'Jetski',
    'Kick Scooter',
    'Limousine',
    'Mini Van',
    'Motorcycle',
    'Pickup Truck',
    'Plane',
    'Police Car',
    'Race Car',
    'Row Boat',
    'Sail Boat',
    'Scooter',
    'Ship',
    'Skateboard',
    'Space Shuttle',
    'Speed Boat',
    'Sport Car',
    'Steam Roller',
    'Submarine',
    'SUV',
    'Taxi',
    'Tractor Trainer',
    'Tracktor',
    'Train',
    'Trem',
    'Trolleybus',
    'Van',
    'Yatch'
  ];

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (DataSharedPreferences.getFirstLaunchAR() == false) {
        Future.delayed(
          const Duration(milliseconds: 5250),
          () => showHint(),
        );
      }
    });
    super.initState();
  }

  void _setScaleFactorValue(String multipy) {
    _unityController.unityController!
        .postMessage('Game Manager', 'ScalePrefab', multipy);
  }

  void _setRotation(String degree) {
    _unityController.unityController!
        .postMessage('Game Manager', 'RotatePrefab', degree);
  }

  void _setVehicleIndex(String index) {
    _unityController.unityController!
        .postMessage('Game Manager', 'ChangePrefabIndex', index);
  }

  void _restartScene(String message) {
    _unityController.unityController!
        .postMessage('Game Manager', 'RestartScene', message);
  }

  void _changeScene(String index) {
    _unityController.unityController!
        .postMessage('Game Manager', 'ChangeScene', index);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          DataSharedPreferences.setArUiDuration(0);
          await _unityController.unityController!.pause();
          Navigator.of(context).pop();
          _restartScene('restart');
          return false;
        },
        child: Scaffold(
          body: Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: UnityWidget(
                  onUnityMessage: (message) {
                    if (message.toString().contains(':')) {
                      setState(() {
                        if (message.toString().contains('length')) {
                          length = message.toString().split(':')[1];
                        } else if (message.toString().contains('width')) {
                          width = message.toString().split(':')[1];
                        } else if (message.toString().contains('height')) {
                          height = message.toString().split(':')[1];
                        }
                      });
                    } else if (message == 'mary') {
                      setState(() {
                        _isFirstScene = !_isFirstScene;
                      });
                    }
                  },
                  onUnitySceneLoaded: (info) {
                    if (!(info!.isLoaded!)) {
                      _unityController.unityController!.create();
                      debugPrint('new UnityAR player has already created');
                    }
                  },
                  onUnityCreated: (controller) async {
                    _unityController.unityController = controller;
                    final _isPaused =
                        await _unityController.unityController!.isPaused();
                    debugPrint('unity player isPaused: $_isPaused');
                    final _isLoaded =
                        (await _unityController.unityController!.isLoaded());
                    debugPrint('unity player isloaed: $_isLoaded');
                    if (_isPaused!) {
                      Future.delayed(
                        const Duration(milliseconds: 50),
                        () async {
                          try {
                            await _unityController.unityController!.resume();
                          } catch (e) {
                            throw "error when resume: " + e.toString();
                          }
                        },
                      );
                    }
                  },
                ),
              ),
              _isFirstScene
                  ? FutureBuilder(
                      future: Future.delayed(
                        Duration(seconds: duration),
                        () {
                          return 1;
                        },
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Stack(
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: 30.h,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 150.h,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                          left: 0,
                                          child: ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                                primary: Theme.of(context)
                                                    .primaryColor),
                                            onPressed: () async {
                                              DataSharedPreferences
                                                  .setArUiDuration(0);
                                              Navigator.of(context).pop();
                                              await _unityController
                                                  .unityController!
                                                  .pause();
                                            },
                                            icon: const Icon(Icons.arrow_back),
                                            label: const Text(
                                              'Back',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: showHint,
                                                child: Icon(
                                                  Icons.error_outline_outlined,
                                                  color: Colors.white
                                                      .withOpacity(0.5),
                                                  size: 50.r,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 25.h,
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  _changeScene('1');
                                                  setState(() {
                                                    _isFirstScene =
                                                        !_isFirstScene;
                                                  });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  primary: Colors.white12,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.videogame_asset,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      size: 50.r,
                                                    ),
                                                    const Text(
                                                      'Newton\'s \nsimulation',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                                primary: Theme.of(context)
                                                    .primaryColor),
                                            onPressed: () async {
                                              _restartScene('restart');
                                              setState(() {
                                                _currentVehicleIndex = 0;
                                              });
                                            },
                                            icon: const Icon(Icons.refresh),
                                            label: const Text(
                                              'Refresh',
                                              style: TextStyle(fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 40,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      length.isNotEmpty
                                          ? 'Length: $length'
                                          : '',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14.h,
                                    ),
                                    Text(
                                      width.isNotEmpty ? 'Width: $width' : '',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 14.h,
                                    ),
                                    Text(
                                      height.isNotEmpty
                                          ? 'Height: $height'
                                          : '',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: -85.w,
                                child: Transform.rotate(
                                  angle: math.pi * 3 / 2,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Transform.rotate(
                                        angle: math.pi / 2,
                                        child: Text(
                                          '-',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Obx(
                                        () => SizedBox(
                                          width: 250.w,
                                          child: Slider(
                                            min: 1 / 3,
                                            max: 3,
                                            thumbColor: Colors.white,
                                            activeColor: Colors.white,
                                            value: _scaleFactor.value,
                                            onChanged: (value) {
                                              _scaleFactor.value = value;

                                              _setScaleFactorValue(_scaleFactor
                                                  .value
                                                  .toString());
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Transform.rotate(
                                        angle: math.pi / 2,
                                        child: Text(
                                          '+',
                                          style: TextStyle(
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 40.h,
                                height: 110.h,
                                width: MediaQuery.of(context).size.width,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    PageView.builder(
                                      clipBehavior: Clip.none,
                                      allowImplicitScrolling: true,
                                      controller: _pageController,
                                      onPageChanged: (index) {
                                        _setVehicleIndex(index.toString());
                                        setState(() {
                                          _currentVehicleIndex = index;
                                          _scaleFactor.value = 1.0;
                                          length = '';
                                          width = '';
                                          height = '';
                                        });
                                      },
                                      itemCount: _vehicles.length,
                                      itemBuilder: (context, index) {
                                        return Transform.scale(
                                          scale: index == _currentVehicleIndex
                                              ? 1
                                              : 0.8,
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(35.r),
                                              border: Border.all(
                                                color: index ==
                                                        _currentVehicleIndex
                                                    ? Colors.white30
                                                    : Colors.transparent,
                                                width: 8.r,
                                              ),
                                            ),
                                            child: VehicleCard(
                                              name: _vehicles[index],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                    _currentVehicleIndex != 0
                                        ? Positioned(
                                            left: 0,
                                            child: Icon(
                                              Icons.arrow_back_ios_new,
                                              color: Colors.white,
                                              size: 23.r,
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                    _currentVehicleIndex != _vehicles.length - 1
                                        ? Positioned(
                                            right: 0,
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                              size: 23.r,
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 160.h,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '180??',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Obx(
                                      () => SizedBox(
                                        width: 250.w,
                                        child: Slider(
                                          min: -180,
                                          max: 180,
                                          thumbColor: Colors.white,
                                          activeColor: Colors.white,
                                          value: _rotation.value,
                                          onChanged: (value) {
                                            _rotation.value = value;
                                            _setRotation(value.toString());
                                          },
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '-180??',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 18.w,
                                  height: 18.w,
                                  child: CircularProgressIndicator(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  'Initializing...',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Theme.of(context)
                                        .primaryColor
                                        .withOpacity(0.7),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                      },
                    )
                  : const SizedBox(),
            ],
          ),
        ));
  }

  void showHint() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Tips',
          style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
        ),
        content: const Text(
          "You should point your device camera in large surface area",
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              DataSharedPreferences.setFirstLaunchAR(true);
            },
            child: Text(
              "I understand",
              style: TextStyle(
                  fontSize: 16, color: Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
    );
  }
}

class VehicleCard extends StatelessWidget {
  const VehicleCard({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(25.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.white12,
            blurRadius: 50,
            offset: Offset(3, 3),
            spreadRadius: 1,
          )
        ],
      ),
      child: Column(
        children: [
          const Icon(
            Icons.camera,
            color: Colors.white,
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: name.length <= 10 ? 12.sp : 10.sp,
            ),
          )
        ],
      ),
    );
  }
}
