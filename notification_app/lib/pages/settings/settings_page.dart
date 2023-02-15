import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:notification_app/routes/routes.gr.dart';
import 'package:notification_app/widgets/default_button.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: DefaultButton(
                    text: AppLocalizations.of(context)!.logOut.toUpperCase(),
                    width: double.infinity,
                    press: () {
                      context.router.replaceAll([const LoginRouter()]);
                    }),
              )
            ],
          ),
        ),
      )),
    );
  }
}
