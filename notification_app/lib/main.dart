import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_core/localizations/localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notification_app/routes/routes.gr.dart';
import 'package:notification_app/theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyMainApp());
}

final appRouter = AppRouter();

class MyMainApp extends StatefulWidget {
  const MyMainApp({Key? key}) : super(key: key);
  static final navigatorKey = GlobalKey<NavigatorState>();

  @override
  State<MyMainApp> createState() => _MyMainAppState();
}

class _MyMainAppState extends State<MyMainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      builder: (context, child) {
        return Consumer<LocaleProvider>(
          builder: (context, provider, child) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp.router(
                  title: 'Flutter Demo',
                  theme: theme(),
                  localizationsDelegates: const [
                    AppLocalizations.delegate, //ung dung
                    CoreLocalizations.delegate, //mac dinh cua thu vien
                    ExternalLocalizations.delegate, //da ngon ngu tu file .json
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  locale: provider.locale,
                  supportedLocales: L10n.support,
                  routerDelegate: appRouter.delegate(),
                  routeInformationParser: appRouter.defaultRouteParser(),
                );
              },
            );
          },
        );
      },
    );
  }

  // void listenNotification() => NotificationService.onNotifications.stream
  //     .listen((onClickedNotification) {});
  // void onClickedNotification (String?)
}
