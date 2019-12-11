import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_wms/provider/locationload_provide.dart';
import 'package:flutter_wms/provider/logistics_provide.dart';
import 'package:flutter_wms/provider/photp_gallery_provide.dart';
import 'package:flutter_wms/provider/duanzi_provide.dart';
import 'package:flutter_wms/provider/print_order_privoder.dart';
import 'package:flutter_wms/utils/tire_export.dart';
import 'package:provider/provider.dart';
import 'common/app_global.dart';
import 'pages/loginpage/login.dart';
import 'pages/tabbar_page.dart';
import 'provider/currentIndex.dart';
import 'provider/login_provide.dart';
import 'router/routes.dart';
import 'utils/common_utils.dart';

void main() {
  final router = new Router();
  Routes.configureRoutes(router);
  Global.init().then((e) {
    runApp(
      MultiProvider(
        providers: <SingleChildCloneableWidget>[
          ChangeNotifierProvider.value(value: CurrentIndexProvide()),
          ChangeNotifierProvider.value(value: Global.useStatusStatus),
          ChangeNotifierProvider.value(value: LoginProvide()),
          ChangeNotifierProvider.value(value: PrintOrderListProvide()),
          ChangeNotifierProvider.value(value: DuanZiProvide()),
          ChangeNotifierProvider.value(value: PhotpGalleryProvide()),
          ChangeNotifierProvider.value(value: LogisticsDetalProvide()),
          ChangeNotifierProvider.value(value: LocationloadProvide()),
        ],
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Routes.router.generator,
            theme: ThemeData(
              primaryColor: CommonColors.mainColor,
              primarySwatch: Colors.amber,
            ),
            localizationsDelegates: [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate],
            locale: const Locale("en", "US"),
            supportedLocales: [const Locale("zh", "CH"), const Locale("en", "US")],
            home: Consumer<UseStatusProvide>(builder: (context, status, child) {
              if (status.isLogin) {
                return TabbarPage();
              } else
                return LoginPage();
            })));
  }
}
