//region imports
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:prokit_flutter/firebase_options.dart';
import 'package:prokit_flutter/fullApps/cloudStorage/model/CSDataModel.dart';
import 'package:prokit_flutter/locale/AppLocalizations.dart';
import 'package:prokit_flutter/main/screens/AppSplashScreen.dart';
import 'package:prokit_flutter/main/store/AppStore.dart';
import 'package:prokit_flutter/main/utils/AppTheme.dart';
import 'package:prokit_flutter/main/utils/flutter_web_frame/flutter_web_frame.dart';
import 'package:prokit_flutter/routes.dart';
import 'package:prokit_flutter/workingApps/chatGPTMailGeneration/utils/common.dart';

import 'locale/Languages.dart';
import 'main/utils/AppConstant.dart';
import 'main/utils/AppDataProvider.dart';
import 'main/utils/app_scroll_behaviour.dart';
//endregion

/// This variable is used to get dynamic colors when theme mode is changed
AppStore appStore = AppStore();

List<CSDataModel> getCloudboxList = getCloudboxData();
List<CSDrawerModel> getCSDrawerList = getCSDrawer();
int currentIndex = 0;
BaseLanguage? language;

// RemoteConfigDataModel remoteConfigDataModel = RemoteConfigDataModel();

late String darkMapStyle;
late String lightMapStyle;

void main() async {
  //region Entry Point
  WidgetsFlutterBinding.ensureInitialized();

  await initialize(aLocaleLanguageList: languageList());

  // Stripe.publishableKey = STRIPE_PAYMENT_PUBLISH`_KEY;

  appStore.toggleDarkMode(value: getBoolAsync(isDarkModeOnPref));
  await appStore.setLanguage(getStringAsync(SELECTED_LANGUAGE_CODE, defaultValue: defaultLanguage));

  darkMapStyle = await rootBundle.loadString('assets/mapStyles/dark.json');
  lightMapStyle = await rootBundle.loadString('assets/mapStyles/light.json');

  defaultRadius = 10;
  defaultToastGravityGlobal = ToastGravity.BOTTOM;
  if (isWeb) {
    maxScreenWidth = 475.0;
  }

  if (isMobile || isWeb) {
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) {
      if (isMobile) {
        MobileAds.instance.initialize();
      }
      setupFirebaseRemoteConfig();
      // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    });

    if (isMobile) {
      try {
        await OneSignal.shared.setAppId(OneSignalId);
      } catch (e) {
        print('${e.toString()}');
      }

      OneSignal.shared.setNotificationWillShowInForegroundHandler((OSNotificationReceivedEvent? event) {
        return event?.complete(event.notification);
      });

      OneSignal.shared.disablePush(false);
      OneSignal.shared.consentGranted(true);
      OneSignal.shared.requiresUserPrivacyConsent();
    }
  }

  runApp(MyApp());
  //endregion
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      maximumSize: Size(475.0, 812.0),
      enabled: kIsWeb,
      builder: (context) {
        return Observer(
          builder: (_) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: '$mainAppName${!isMobile ? ' ${platformName()}' : ''}',
            // home: AppSplashScreen(),
            theme: !appStore.isDarkModeOn ? AppThemeData.lightTheme : AppThemeData.darkTheme,
            initialRoute: AppSplashScreen.tag,
            routes: routes(),
            onGenerateInitialRoutes: (route) => [
              MaterialPageRoute(builder: (_) => AppSplashScreen(routeName: route.validate())),
            ],
            navigatorKey: navigatorKey,
            scrollBehavior: AppScrollBehavior(),
            supportedLocales: LanguageDataModel.languageLocales(),
            localizationsDelegates: [
              AppLocalizations(),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            localeResolutionCallback: (locale, supportedLocales) => locale,
            locale: Locale(appStore.selectedLanguageCode),
          ),
        );
      },
    );
  }
}
