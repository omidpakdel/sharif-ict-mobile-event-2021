import 'package:app/ui/helpers/colors.dart';
import 'package:app/ui/helpers/utilities.dart';
import 'package:app/ui/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class EntriesReportView extends StatelessWidget {
  const EntriesReportView({Key? key}) : super(key: key);

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'گزارش ورودی ها',
        style: TextStyle(
          color: ExtryColors.title,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          fontFamily: 'Kalameh',
        ),
      ),
    );
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
              height: screenSize.height * 0.86,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return listItem(screenSize);
                },
                itemCount: 20,
                shrinkWrap: true,
              ),
            )
          ]),
        ],
      ),
    );
  }

  SizedBox listItem(Size screenSize) {
    return SizedBox(
      height: screenSize.height * 0.21,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Container(
          width: screenSize.width * 0.9,
          height: screenSize.height * 0.5,
          decoration: BoxDecoration(
            color: ExtryColors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                width: 5,
                decoration: const BoxDecoration(
                  color: ExtryColors.accent,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              UIUtilities.createSizedBox(width: 5),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 25,
                        width: 60,
                        decoration: BoxDecoration(
                          color: ExtryColors.accent.withOpacity(0.3),
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5),
                            bottomRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'اتمام کار',
                            style: TextStyle(
                                color: ExtryColors.accent,
                                fontFamily: 'IRANYekan',
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'شرکت فراگستر مهر',
                        style: TextStyle(
                          fontFamily: 'IRANYekan',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: ExtryColors.title,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'شرکت فراگستر مهر',
                            style: TextStyle(
                              fontFamily: 'IRANYekan',
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: ExtryColors.description,
                            ),
                          ),
                        ),
                        UIUtilities.createSizedBox(
                            width: screenSize.width * 0.25),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            '08:00',
                            style: TextStyle(
                              fontFamily: 'IRANYekan',
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: ExtryColors.title,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
