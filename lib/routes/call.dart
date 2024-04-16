import 'package:bottom_nav/bottom_nav.dart';
import 'package:extensionresoft/extensionresoft.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mdlive_healthcare_app_ui/data/constants/constants.dart';
import 'package:mdlive_healthcare_app_ui/main.dart';
import 'package:mdlive_healthcare_app_ui/utils/extensions.dart';

class Call extends StatefulWidget {
  const Call({Key? key}) : super(key: key);

  @override
  State<Call> createState() => _CallState();
}

class _CallState extends State<Call> {
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        //'$didPop'.toast;
        //didPop.log;
        print(didPop);
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(color: Colors.white, image: DecorationImage(image: ExactAssetImage(Constants.doctor), fit: BoxFit.cover)),
          child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.transparent, Color(0xc0000000)], begin: Alignment.topCenter, end: Alignment.bottomCenter, stops: [0.6, 1]),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 56),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      IconButton(
                        padding: const EdgeInsets.all(12),
                        onPressed: () => finish(context),
                        color: Colors.white,
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black26,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        ),
                        icon: const Icon(CupertinoIcons.chevron_back),
                      ),
                      Container(
                        height: 125,
                        width: 95,
                        decoration: BoxDecoration(
                          boxShadow: const [BoxShadow(color: Colors.grey, blurRadius: 5)],
                          borderRadius: BorderRadius.circular(15),
                          image: const DecorationImage(image: ExactAssetImage(Constants.patient), fit: BoxFit.fitHeight),
                        ),
                      ),
                    ]),
                    Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                          IconButton(
                            padding: const EdgeInsets.all(15),
                            iconSize: 32,
                            tooltip: 'Microphone',
                            onPressed: () => 'Mute microphone'.toast,
                            color: Colors.white,
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white12,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            ),
                            icon: const Icon(CupertinoIcons.mic_fill),
                          ),
                          IconButton(
                            padding: const EdgeInsets.all(15),
                            iconSize: 36,
                            tooltip: 'Hang up',
                            onPressed: () => 'End call'.toast,
                            color: Colors.white,
                            style: IconButton.styleFrom(
                              elevation: 10,
                              shadowColor: Colors.black,
                              backgroundColor: Colors.red,
                              shape: const CircleBorder(),
                            ),
                            icon: const Icon(CupertinoIcons.phone_down_fill),
                          ),
                          IconButton(
                            padding: const EdgeInsets.all(15),
                            iconSize: 36,
                            tooltip: 'Video call',
                            onPressed: () => 'Switch to video call'.toast,
                            color: Colors.white,
                            style: IconButton.styleFrom(
                              backgroundColor: Colors.white12,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            ),
                            icon: const Icon(CupertinoIcons.video_camera_solid),
                          ),
                        ]),
                        20.spaceY(),
                        Material(
                          color: Colors.transparent,
                          child: 'Dr. Jessica Cartner'.edit(textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        10.spaceY(),
                        Material(
                          color: Colors.transparent,
                          child: '00:45:21'.edit(textStyle: TextStyle(color: color.onInverseSurface)),
                        )
                      ],
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
