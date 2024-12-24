import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:symptoms/home.dart';
import 'package:symptoms/scantabProvider.dart';
import 'package:symptoms/symptomSelector.dart';
import 'package:provider/provider.dart';
import 'onboardingScreen.dart'; // Assuming this is the onboarding introduction screen
import 'package:camera/camera.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Retrieve the available cameras
  final cameras = await availableCameras();

  runApp(
    MultiProvider(
      providers: [
        // ChangeNotifierProvider<SymptomsProvider>(
        //   create: (context) => SymptomsProvider(), // Inject ApiManager
        // ),
        ChangeNotifierProvider<ScanTabProvider>(
          create: (_) => ScanTabProvider(),
        ),
        Provider<List<CameraDescription>>.value(value: cameras),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App with Onboarding Manager',
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.light),
      themeMode: ThemeMode.system,
      home: AnimatedSplashScreen(
        splashIconSize: 200,
        backgroundColor: Colors.white,
        pageTransitionType: PageTransitionType.topToBottom,
        splashTransition: SplashTransition.rotationTransition,
        splash: const CircleAvatar(
          radius: 100,
          backgroundImage: AssetImage("assets/images/splash screen.jpeg"),
        ),
        nextScreen: const OnBoardingPage(),
      ),
      routes: {
        '/onboarding': (context) => const OnBoardingPage(),
        '/introduction': (context) => const OnBoardingPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
