import 'dart:async';

import 'package:app/ui/helpers/colors.dart';
import 'package:app/ui/helpers/utilities.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacementNamed(context, '/employees-home');
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = UIUtilities.getSize(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Extry',
                  style: TextStyle(fontSize: 30, fontFamily: 'Gilroy'),
                ),
                UIUtilities.createSizedBox(width: 10),
                Image.asset(
                  'assets/images/Group_4865.png',
                  width: 50,
                  height: 50,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                margin: EdgeInsets.only(bottom: screenSize.height * 0.05),
                child: const Text('Extry',
                    style: TextStyle(color: ExtryColors.placeHolder))),
          )
        ],
      ),
    );
  }
}
