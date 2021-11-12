import 'dart:async';

import 'package:app/ui/helpers/colors.dart';
import 'package:app/ui/helpers/date.dart';
import 'package:app/ui/helpers/svg_icons.dart';
import 'package:app/ui/helpers/utilities.dart';
import 'package:app/ui/pages/employees/scan_qr/scan_qr_view.dart';
import 'package:app/ui/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EmployeesHomeExitView extends StatefulWidget {
  const EmployeesHomeExitView({Key? key}) : super(key: key);

  @override
  State<EmployeesHomeExitView> createState() => _EmployeesHomeExitViewState();
}

class _EmployeesHomeExitViewState extends State<EmployeesHomeExitView> {
  var date = FarsiDate().getDate();
  var time = FarsiDate().getTime();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateTime();
  }

  updateTime() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        setState(() {
          time = FarsiDate().getTime();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = UIUtilities.getSize(context);
    return Scaffold(
      appBar: appBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(children: [
            UIUtilities.createSizedBox(height: screenSize.height * 0.01),
            SizedBox(
              height: screenSize.height * 0.21,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                date,
                                style: const TextStyle(
                                  fontFamily: 'IRANYekan',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ExtryColors.title,
                                ),
                              ),
                              Text(
                                time,
                                style: const TextStyle(
                                  fontFamily: 'IRANYekan',
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: ExtryColors.title,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'خراسان رضوی، مشهد',
                                style: TextStyle(
                                  fontFamily: 'IRANYekan',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: ExtryColors.description,
                                ),
                              ),
                              Text(
                                '24°C',
                                style: TextStyle(
                                  fontFamily: 'IRANYekan',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: ExtryColors.description,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.16,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'خروج در ساعت 16:30',
                                style: TextStyle(
                                  fontFamily: 'IRANYekan',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ExtryColors.title,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'شرکت فراگستر مهر',
                                style: TextStyle(
                                  fontFamily: 'IRANYekan',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: ExtryColors.description,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.12,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(MdiIcons.clockOutline,
                                  color: ExtryColors.accent),
                              UIUtilities.createSizedBox(width: 10),
                              const Text(
                                'مدت زمان سپری شده',
                                style: TextStyle(
                                  fontFamily: 'IRANYekan',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ExtryColors.accent,
                                ),
                              ),
                              UIUtilities.createSizedBox(
                                  width: screenSize.width * 0.35),
                              const Text(
                                '8:00',
                                style: TextStyle(
                                  fontFamily: 'IRANYekan',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: ExtryColors.accent,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            UIUtilities.createSizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                  margin: EdgeInsets.only(bottom: screenSize.height * 0.03),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(width: 1, color: ExtryColors.e8)),
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/exits-report');
                    },
                    color: ExtryColors.input,
                    disabledColor: ExtryColors.description,
                    minWidth: screenSize.width * 0.9,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    height: screenSize.height * 0.06,
                    elevation: 0,
                    child: const Text(
                      'گذارش خروجی ها',
                      style: TextStyle(
                          color: ExtryColors.title,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'IRANYekan'),
                    ),
                  )),
            ),
          ]),
          scanButton(screenSize),
        ],
      ),
      bottomNavigationBar:
          createBottomNavigation(context, NavigationTypes.home, screenSize),
    );
  }

  Align scanButton(Size screenSize) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
            margin: EdgeInsets.only(bottom: screenSize.height * 0.03),
            child: MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ScanQrView(
                        mode: 2,
                      ),
                    ));
              },
              color: ExtryColors.danger,
              disabledColor: ExtryColors.description,
              minWidth: screenSize.width * 0.9,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              height: screenSize.height * 0.06,
              elevation: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.string(ExtrySvgIcons.scanner),
                  UIUtilities.createSizedBox(width: 10),
                  const Text(
                    'اسکن بارکد',
                    style: TextStyle(
                        color: ExtryColors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'IRANYekan'),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'ورود و خروج',
        style: TextStyle(
          color: ExtryColors.title,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          fontFamily: 'Kalameh',
        ),
      ),
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(width: 1.5, color: ExtryColors.placeHolder),
        ),
        child: const Icon(
          MdiIcons.menu,
          color: ExtryColors.title,
        ),
      ),
      //   actions: [
      //     Container(
      //       margin: const EdgeInsets.all(4),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(10),
      //         // border: Border.all(width: 1.5, color: ExtryColors.placeHolder),
      //       ),
      //       child: const Icon(
      //         Icons.notifications_outlined,
      //         color: ExtryColors.title,
      //       ),
      //     ),
      //   ],
    );
  }
}
