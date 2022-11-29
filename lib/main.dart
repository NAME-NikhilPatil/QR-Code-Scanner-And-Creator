import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scan/Provider/scan_data.dart';
import 'package:qr_code_scan/components/bottom_navigation.dart';
import 'package:qr_code_scan/model/history.dart';
import 'package:qr_code_scan/model/saved_setting.dart';

import 'model/create.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SaveSetting.init();
  await ScreenUtil.ensureScreenSize();
  await Hive.initFlutter();
  Hive.registerAdapter(HistoryAdapter());
  Hive.registerAdapter(CreateQrAdapter());
  await Hive.openBox<History>('history');
  await Hive.openBox<CreateQr>('create');
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: const Size(375, 667),
      minTextAdapt: true,
      builder: (context, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => ScanData()),
          ],
          child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Qr Code Scanner',
              theme: ThemeData(),
              home: const MyNavigationBar()),
        );
      },
      child: const MyNavigationBar(),
    );
  }
}
