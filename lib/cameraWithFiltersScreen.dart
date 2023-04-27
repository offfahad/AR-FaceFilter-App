import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'dart:io' as Platform;

class CameraWithFiltersScreen extends StatefulWidget {
  @override
  State<CameraWithFiltersScreen> createState() =>
      _CameraWithFiltersScreenState();
}

class _CameraWithFiltersScreenState extends State<CameraWithFiltersScreen> {
  CameraDeepArController cameraDeepArController;
  String platformVersion = "Unknown";
  int currentPage = 0;
  final vp = PageController(viewportFraction: .24);
  Effects currentEffects = Effects.none;
  Filters currentFilters = Filters.none;
  Masks currentMask = Masks.none;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            //Deep AR Camera
            CameraDeepAr(
              onCameraReady: (isReady) {
                platformVersion = "Camera Status $isReady";
                print(platformVersion);
                setState(() {});
              },
              androidLicenceKey: "a31c8e4d92a9e94716b63a21ce6d38c9d019918f466f91db7854f485e7da193aa27322cd6cbf198f",
              cameraDeepArCallback: (c) async {
                cameraDeepArController = c;
                setState(
                  () {},
                );
              },
            ),
            //Face Mask Filters: Image Buttons
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(8, (page) {
                          bool active = currentPage == page;
                          return Platform.Platform.isIOS
                              ? GestureDetector(
                                  onTap: ()
                                      //ios app view
                                      {
                                    currentPage = page;
                                    cameraDeepArController.changeMask(page);
                                    setState(() {});
                                  },
                                  child: AvatarView(
                                      radius: active ? 65 : 30,
                                      borderColor: Colors.yellow,
                                      borderWidth: 2,
                                      isOnlyText: false,
                                      avatarType: AvatarType.CIRCLE,
                                      backgroundColor: Colors.red,
                                      imagePath:
                                          "assets/ios/${page.toString()}.jpg",
                                      placeHolder: Icon(Icons.person, size: 50),
                                      errorWidget: Container(
                                        child: Icon(Icons.person, size: 50),
                                      )),
                                )
                              : GestureDetector(
                                  onTap: ()
                                      //android app view
                                      {
                                    currentPage = page;
                                    cameraDeepArController.changeMask(page);
                                    setState(() {});
                                  },
                                  child: AvatarView(
                                      radius: active ? 65 : 30,
                                      borderColor: Colors.yellow,
                                      borderWidth: 2,
                                      isOnlyText: false,
                                      avatarType: AvatarType.CIRCLE,
                                      backgroundColor: Colors.red,
                                      imagePath:
                                          "assets/android/${page.toString()}.jpg",
                                      placeHolder: Icon(Icons.person, size: 50),
                                      errorWidget: Container(
                                        child: Icon(Icons.person, size: 50),
                                      )),
                                );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
