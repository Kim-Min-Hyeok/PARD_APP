import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pard_app/component/bottom.dart';
import 'package:pard_app/utilities/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    //final controller = PushNotificationController.to;
    /** push_notification controller 가져온다  */
    return Scaffold(
      backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(26, 26, 26, 1),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () => Get.offNamed('/home'),
        ),
        title: Text('마이 페이지', style: headlineLarge),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 375.w,
              height: 76.h,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(1.00, -0.03),
                  end: Alignment(-1, 0.03),
                  colors: [Color(0xFF5262F5), Color(0xFF7B3FEF)],
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 24.w,
                  ),
                  Text('운영진에게 전달하고 싶은 의견이 있나요?\n 피드백 창구를 활용해보세요!',
                      style: headlineSmall),
                  SizedBox(width: 12.w),
                  Container(
                    width: 90.w,
                    height: 22.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          '피드백 남기기',
                          style: TextStyle(
                            color: Color(0xFF5262F5),
                            fontSize: 9,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        SizedBox(
                          width: 10.w,
                          height: 10.h,
                          child: IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 10,
                              color: Color(0XFF5262F5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(height: 24.h),
                Row(
                  children: [
                    SizedBox(
                      width: 24.w,
                    ),
                    Text('내 정보', style: displaySmall),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  width: 327.w,
                  height: 96.h,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          width: 0.50, color: Color(0xFF5262F5)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 24.w,
                          ),
                          Container(
                            width: 42.w,
                            height: 24.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 4.h),
                            decoration: ShapeDecoration(
                              color: const Color(0xFF5262F5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                                /** generation값으로 대체 */
                                '2기',
                                style: titleMedium),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Container(
                            width: 79.w,
                            height: 24.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 4.h),
                            decoration: ShapeDecoration(
                              gradient: const LinearGradient(
                                begin: Alignment(1.00, -0.03),
                                end: Alignment(-1, 0.03),
                                colors: [Color(0xFF5262F5), Color(0xFF7B3FEF)],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                                /** part값으로 대체 */
                                '디자인 파트',
                                style: titleMedium),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Container(
                            width: 70.w,
                            height: 24.h,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 4.h),
                            decoration: ShapeDecoration(
                              color: const Color(0xFF7B3EEF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: Text(
                                /** member값으로 대체 */
                                '거친 파도',
                                style: titleMedium),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: Text('김파드님', style: displayMedium),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    SizedBox(width: 24.w),
                    Text('설정', style: displaySmall),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  width: 327.w,
                  height: 50.h,
                  decoration: const BoxDecoration(color: Color(0xFF2A2A2A)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: Text('알림 설정', style: headlineSmall),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 24.w),
                        // child: Obx(() {
                        //   return Switch(
                        //     value: controller.onOff.value,
                        //     onChanged: (value) {
                        //       controller.onOff.value = !controller.onOff.value;
                        //       print(controller.onOff.value);
                        //     },
                        //   );
                        // }),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 24.w,
                    ),
                    Text('이용 안내', style: displaySmall),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  width: 327.w,
                  height: 50.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2A2A2A),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: Text('개인정보 처리방침', style: headlineSmall),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 24.w),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color.fromRGBO(228, 228, 228, 1),
                            )),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 327.w,
                  height: 50.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2A2A2A),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: Text('서비스 이용약관', style: headlineSmall),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 24.w),
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color.fromRGBO(228, 228, 228, 1),
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 24.w,
                    ),
                    Text('계정', style: displaySmall),
                  ],
                ),
                SizedBox(
                  height: 8.h,
                ),
                Container(
                  width: 327.w,
                  height: 50.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2A2A2A),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: Text('로그아웃', style: headlineSmall),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 24.w),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        backgroundColor:
                                            const Color(0xFF1A1A1A),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 327.w,
                                                height: 192.h,
                                                decoration: ShapeDecoration(
                                                  color:
                                                      const Color(0xFF1A1A1A),
                                                  shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                        width: 0.50,
                                                        color:
                                                            Color(0xFF5262F5)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    SizedBox(
                                                      height: 24.h,
                                                    ),
                                                    Text('로그아웃',
                                                        style: displaySmall
                                                            .copyWith(
                                                          color: const Color(
                                                              0xFF5262F5),
                                                        )),
                                                    Text('로그아웃 하시겠습니까?',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: titleLarge),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceAround,
                                                      children: [
                                                        SizedBox(
                                                          width: 20.w,
                                                        ),
                                                        Container(
                                                          width: 116.w,
                                                          height: 44.h,
                                                          decoration:
                                                              ShapeDecoration(
                                                            color: const Color(
                                                                0xFF2A2A2A),
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          30),
                                                            ),
                                                          ),
                                                          child: TextButton(
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              child: Text(
                                                                '취소',
                                                                style:
                                                                    headlineMedium
                                                                        .copyWith(
                                                                  color: const Color(
                                                                      0xFFA2A2A2),
                                                                ),
                                                              )),
                                                        ),
                                                        Container(
                                                            width: 116.w,
                                                            height: 44.h,
                                                            decoration:
                                                                ShapeDecoration(
                                                              gradient:
                                                                  const LinearGradient(
                                                                begin:
                                                                    Alignment(
                                                                        1.00,
                                                                        -0.03),
                                                                end: Alignment(
                                                                    -1, 0.03),
                                                                colors: [
                                                                  Color(
                                                                      0xFF5262F5),
                                                                  Color(
                                                                      0xFF7B3FEF)
                                                                ],
                                                              ),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            30),
                                                              ),
                                                            ),
                                                            child: TextButton(
                                                                onPressed: () {
                                                                  Get.back();
                                                                },
                                                                child: Text(
                                                                  '확인',
                                                                  style: headlineMedium
                                                                      .copyWith(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ))),
                                                        SizedBox(
                                                          width: 20.w,
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 24.h,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ]),
                                      );
                                    });
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color.fromRGBO(228, 228, 228, 1),
                            )),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 327.w,
                  height: 50.h,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2A2A2A),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 24.w),
                        child: Text('탈퇴하기', style: headlineSmall),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 24.w),
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return Dialog(
                                        backgroundColor:
                                            const Color(0xFF1A1A1A),
                                        child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 327.w,
                                                height: 192.h,
                                                decoration: ShapeDecoration(
                                                  color:
                                                      const Color(0xFF1A1A1A),
                                                  shape: RoundedRectangleBorder(
                                                    side: const BorderSide(
                                                        width: 0.50,
                                                        color:
                                                            Color(0xFF5262F5)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    SizedBox(
                                                      height: 24.h,
                                                    ),
                                                    Text('회원탈퇴',
                                                        style: displaySmall
                                                            .copyWith(
                                                          color: const Color(
                                                              0xFF5262F5),
                                                        )),
                                                    Text.rich(
                                                      TextSpan(
                                                        children: [
                                                          const TextSpan(
                                                            text:
                                                                '회원 탈퇴를 원하시면\n공식 계정(',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Pretendard',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              height: 1.29,
                                                            ),
                                                          ),
                                                          TextSpan(
                                                            text:
                                                                'official@we-pard.com',
                                                            style: titleLarge
                                                                .copyWith(
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              color: const Color(
                                                                  0xFF5262F5),
                                                            ),
                                                            recognizer:
                                                                TapGestureRecognizer()
                                                                  ..onTap =
                                                                      () async {
                                                                    final Uri
                                                                        url =
                                                                        Uri.parse(
                                                                            'https://we-pard.com/');
                                                                    if (await canLaunchUrl(
                                                                        url)) {
                                                                      await launchUrl(
                                                                          url);
                                                                    } else {
                                                                      throw 'Could not launch $url';
                                                                    }
                                                                  },
                                                          ),
                                                          const TextSpan(
                                                            text:
                                                                ')으로         메일을 보내주세요. ',
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14,
                                                              fontFamily:
                                                                  'Pretendard',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              height: 1.29,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    SizedBox(
                                                      width: 20.w,
                                                    ),
                                                    Container(
                                                        width: 252.w,
                                                        height: 44.h,
                                                        decoration:
                                                            ShapeDecoration(
                                                          gradient:
                                                              const LinearGradient(
                                                            begin: Alignment(
                                                                1.00, -0.03),
                                                            end: Alignment(
                                                                -1, 0.03),
                                                            colors: [
                                                              Color(0xFF5262F5),
                                                              Color(0xFF7B3FEF)
                                                            ],
                                                          ),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                          ),
                                                        ),
                                                        child: TextButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child: Text(
                                                              '확인',
                                                              style:
                                                                  headlineMedium
                                                                      .copyWith(
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ))),
                                                    SizedBox(
                                                      width: 20.w,
                                                    ),
                                                    SizedBox(
                                                      height: 24.h,
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ]),
                                      );
                                    });
                              });
                            },
                            icon: const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Color.fromRGBO(228, 228, 228, 1),
                            )),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
