import 'package:app/service_locator.dart';
import 'package:app/ui/helpers/theme.dart';
import 'package:app/ui/pages/employees/home/employees_home_exit_view.dart';
import 'package:app/ui/pages/employees/home/employees_home_view.dart';
import 'package:app/ui/pages/employees/reports/entries_view.dart';
import 'package:app/ui/pages/employees/reports/exits_view.dart';
import 'package:app/ui/pages/employees/reports/main_report_view.dart';
import 'package:app/ui/pages/employees/scan_qr/scan_qr_view.dart';
import 'package:app/ui/pages/home/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ٌExtry',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      locale: const Locale('fa'),
      supportedLocales: const [
        Locale('fa', 'IR'),
      ],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      initialRoute: '/splash',
      routes: <String, WidgetBuilder>{
        '/splash': (BuildContext context) => const SplashView(),
        '/employees-home': (BuildContext context) => const EmployeesHomeView(),
        '/employees-home-exit': (BuildContext context) =>
            const EmployeesHomeExitView(),
        '/scan-qr': (BuildContext context) => const ScanQrView(),
        '/entries-report': (BuildContext context) => const EntriesReportView(),
        '/exits-report': (BuildContext context) => const ExitsReportView(),
        '/reports': (BuildContext context) => const MainReportView(),
      },
    );
  }
}
