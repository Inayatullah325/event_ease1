import 'package:event_ease/Provider/dashboard_provider.dart';
import 'package:event_ease/Provider/managerlist_provider.dart';
import 'package:event_ease/UI/Screens/Dashboard.dart';
import 'package:event_ease/UI/Screens/Manager_details.dart';
import 'package:event_ease/UI/Screens/navigationbottombar.dart';
import 'package:event_ease/UI/Screens/Splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Provider/HomeScreen_provider.dart';
import 'Provider/ThemeProvider.dart';
import 'UI/Screens/BookingScreen.dart';
import 'UI/Screens/ManagerUI/ManagerNavigationBar.dart';
import 'UI/Screens/ProfileScreen/Manager_profile.dart';
import 'UI/Screens/ProfileScreen/UserProfile.dart';
import 'UI/Screens/LoginSignupScreens/login_screen.dart';
import 'UI/Screens/navigationbuttombarr.dart';
import 'UI/Screens/LoginSignupScreens/signuppage.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ResponsiveSizer (
    builder: (context, orientation, ScreenType){
      return MyApp();

    },
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_) => favprovider()),
        ChangeNotifierProvider(create: (_) => event_categoroy()),
        ChangeNotifierProvider(create: (_) => class_dashboard_provider()),
        ChangeNotifierProvider(create: (_) => Themechangeprovider()),
    ],
    child: Builder(
        builder: (BuildContext context){
          final Themeprovider =  Provider.of<Themechangeprovider>(context);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: Themeprovider.thememode,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.red,
        ),
        home:   SplashScreen(),
      );

    }),
    );
  }
}
