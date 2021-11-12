import 'package:app/ui/helpers/colors.dart';
import 'package:app/ui/helpers/utilities.dart';
import 'package:app/ui/widgets/bottom_navigation.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'indicator.dart';

class MainReportView extends StatelessWidget {
  const MainReportView({Key? key}) : super(key: key);

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'گزارش ها',
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
          Column(
            children: [PieChartView()],
          )
        ],
      ),
      bottomNavigationBar:
          createBottomNavigation(context, NavigationTypes.reports, screenSize),
    );
  }
}

class PieChartView extends StatefulWidget {
  const PieChartView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback:
                          (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections()),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const <Widget>[
                Indicator(
                  color: Color(0xff0293ee),
                  text: 'حاضر',
                  isSquare: true,
                ),
                SizedBox(
                  width: 10,
                ),
                Indicator(
                  color: Color(0xfff8b250),
                  text: 'مرخصی',
                  isSquare: true,
                ),
                SizedBox(
                  width: 10,
                ),
                Indicator(
                  color: Color(0xff845bef),
                  text: 'ماموریت',
                  isSquare: true,
                ),
                SizedBox(
                  width: 10,
                ),
                Indicator(
                  color: Color(0xff13d38e),
                  text: 'غیبت',
                  isSquare: true,
                ),
              ],
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 60,
            title: '07:35',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontFamily: 'IRANYekan',
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 25,
            title: '02:22',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontFamily: 'IRANYekan',
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '0:49',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontFamily: 'IRANYekan',
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 0,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
