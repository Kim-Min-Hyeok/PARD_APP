import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pard_app/controllers/bottombar_controller.dart';
import 'package:pard_app/controllers/point_controller.dart';
import 'package:pard_app/controllers/schedule_controller.dart';
import 'package:pard_app/controllers/user_controller.dart';
import 'package:pard_app/model/user_model/user_model.dart';
import 'package:pard_app/utilities/text_style.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRController extends GetxController {
  var result = Rx<Barcode?>(null); // 스캔한 결과
  QRViewController? controller; // qr 커트롤러
  BottomBarController bController = Get.find();
  bool isScanned = false; // 한 번만 찍게 하려고
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  UserController userController = Get.find();
  final ScheduleController scheduleController = Get.put(ScheduleController());
  final PointController pointController = Get.find();

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) async {
      if (!isScanned) {
        // isScanned이 false일 때만 스캔 처리
        isScanned = true; // 스캔을 true로 설정
        result.value = scanData;
        UserModel user = userController.userInfo.value!;
    //     if (scheduleController.upcomingSchedules.isEmpty) {
    //   userController.updateAttend(user, "지");
    //       await pointController.lateQR(user, 4);

    //       Get.back(); //찍으면 홈으로 돌아감
    //       bController.selectedIndex.value = 0;
    //       print(bController.selectedIndex);

    //       Get.dialog(Dialog(
    //         backgroundColor: const Color(0xFF1A1A1A),
    //         child: Column(
    //             mainAxisSize: MainAxisSize.min,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             children: [
    //               Container(
    //                 width: 327.w,
    //                 height: 264.h,
    //                 decoration: ShapeDecoration(
    //                   color: const Color(0xFF1A1A1A),
    //                   shape: RoundedRectangleBorder(
    //                     side: const BorderSide(
    //                         width: 0.50, color: Color(0xFF5262F5)),
    //                     borderRadius: BorderRadius.circular(8),
    //                   ),
    //                 ),
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                   children: [
    //                     SizedBox(
    //                       height: 10.h,
    //                     ),
    //                     Text('출석체크',
    //                         style: displaySmall.copyWith(
    //                           color: const Color(0xFF5262F5),
    //                         )),
    //                     SizedBox(
    //                       height: 10.h,
    //                     ),
    //                     SizedBox(
    //                       width: 56.w,
    //                       height: 56.h,
    //                       child: Image.asset(
    //                         'assets/images/warning.png',
    //                         fit: BoxFit.fill,
    //                       ),
    //                     ),
    //                     Text('지각 처리되었어요',
    //                         textAlign: TextAlign.center,
    //                         style: titleSmall.copyWith(
    //                           color: const Color(0xFFFF5A5A),
    //                         )),
    //                     SizedBox(
    //                       height: 10.h,
    //                     ),
    //                     Container(
    //                         width: 254.w,
    //                         height: 44.h,
    //                         decoration: ShapeDecoration(
    //                           gradient: const LinearGradient(
    //                             begin: Alignment(1.00, -0.03),
    //                             end: Alignment(-1, 0.03),
    //                             colors: [Color(0xFF5262F5), Color(0xFF7B3FEF)],
    //                           ),
    //                           shape: RoundedRectangleBorder(
    //                             borderRadius: BorderRadius.circular(30),
    //                           ),
    //                         ),
    //                         child: TextButton(
    //                             onPressed: () {
    //                               Get.offNamed('home');
    //                             },
    //                             child: Text(
    //                               '다음부터 안그럴게요',
    //                               style: headlineMedium.copyWith(
    //                                 color: Colors.white,
    //                               ),
    //                             ))),
    //                     SizedBox(
    //                       height: 10.h,
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ]),
    //       ));
    // }
        DateTime currentTime = DateTime.now();
        print("Scanned QR Code: ${result.value!.code}");
        print("Scanned Time: $currentTime");

        Duration timeDifference = currentTime
            .difference(scheduleController.upcomingSchedules.first.dueDate);
        int differenceInMinutes =
            timeDifference.inMinutes.abs(); //일정 등록한 시간과 qr찍은 시간 분차이
            print('33333333333333333333333');
            print(differenceInMinutes);
        //지각
        if (differenceInMinutes<=30 && result.value!.code == "https://me-qr.com/uoN4lOs1") 
        {
          userController.updateAttend(user, "출");
          await pointController.attendQR(user, 6);

          Get.back(); //찍으면 홈으로 돌아감
          bController.selectedIndex.value = 0;
          print(bController.selectedIndex);

          Get.dialog(Dialog(
            backgroundColor: const Color(0xFF1A1A1A),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 327.w,
                    height: 264.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF1A1A1A),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50, color: Color(0xFF5262F5)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('출석체크',
                            style: displaySmall.copyWith(
                              color: const Color(0xFF5262F5),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 56.w,
                          height: 58.h,
                          child: Image.asset(
                            'assets/images/check_success.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text('출석이 완료되었어요.',
                            textAlign: TextAlign.center,
                            style: titleSmall.copyWith(
                              color: const Color(0xFF64C59A),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                            width: 254.w,
                            height: 44.h,
                            decoration: ShapeDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment(1.00, -0.03),
                                end: Alignment(-1, 0.03),
                                colors: [Color(0xFF5262F5), Color(0xFF7B3FEF)],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  Get.offNamed('home');
                                },
                                child: Text(
                                  '세미나 입장하기',
                                  style: headlineMedium.copyWith(
                                    color: Colors.white,
                                  ),
                                ))),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ]),
          ));
        }
         if(scheduleController.upcomingSchedules.isEmpty || currentTime.isAfter(scheduleController.upcomingSchedules.first.dueDate)){
          userController.updateAttend(user, "지");
          await pointController.lateQR(user, 4);

          Get.back(); //찍으면 홈으로 돌아감
          bController.selectedIndex.value = 0;
          print(bController.selectedIndex);

          Get.dialog(Dialog(
            backgroundColor: const Color(0xFF1A1A1A),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 327.w,
                    height: 264.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF1A1A1A),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50, color: Color(0xFF5262F5)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('출석체크',
                            style: displaySmall.copyWith(
                              color: const Color(0xFF5262F5),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        SizedBox(
                          width: 56.w,
                          height: 56.h,
                          child: Image.asset(
                            'assets/images/warning.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text('지각 처리되었어요',
                            textAlign: TextAlign.center,
                            style: titleSmall.copyWith(
                              color: const Color(0xFFFF5A5A),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                            width: 254.w,
                            height: 44.h,
                            decoration: ShapeDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment(1.00, -0.03),
                                end: Alignment(-1, 0.03),
                                colors: [Color(0xFF5262F5), Color(0xFF7B3FEF)],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  Get.offNamed('home');
                                },
                                child: Text(
                                  '다음부터 안그럴게요',
                                  style: headlineMedium.copyWith(
                                    color: Colors.white,
                                  ),
                                ))),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ]),
          ));
        } 
      }

      if(result.value!.code != "https://me-qr.com/uoN4lOs1"){
        Get.dialog(Dialog(
            backgroundColor: const Color(0xFF1A1A1A),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 327.w,
                    height: 264.h,
                    decoration: ShapeDecoration(
                      color: const Color(0xFF1A1A1A),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 0.50, color: Color(0xFF5262F5)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 10.h,
                        ),
                        Text('출석체크',
                            style: displaySmall.copyWith(
                              color: const Color(0xFF5262F5),
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        
                        
                        Text('유효하지 않은 QR 코드입니다.\n다시 시도해주세요.',
                            textAlign: TextAlign.center,
                            style: titleSmall.copyWith(
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                            width: 254.w,
                            height: 44.h,
                            decoration: ShapeDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment(1.00, -0.03),
                                end: Alignment(-1, 0.03),
                                colors: [Color(0xFF5262F5), Color(0xFF7B3FEF)],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: TextButton(
                                onPressed: () {
                                  Get.offNamed('home');
                                },
                                child: Text(
                                  '확인',
                                  style: headlineMedium.copyWith(
                                    color: Colors.white,
                                  ),
                                ))),
                        SizedBox(
                          height: 10.h,
                        ),
                      ],
                    ),
                  ),
                ]),
          ));
      }
    });
  }

  void onPermissionSet(bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      Get.snackbar('Error', 'No permission');
    }
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}
