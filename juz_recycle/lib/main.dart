import 'package:flutter/cupertino.dart';
// import 'package:camera/camera.dart';

import 'Pages/library.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // Obtain a list of the available cameras on the device.
//   final cameras = await availableCameras();
//
//   // Get a specific camera from the list of available cameras.
//   final firstCamera = cameras.first;
//
//   runApp(const MyApp());
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var appTitle = "Juz Recycle";

    return CupertinoApp(
      title: appTitle,
      theme: const CupertinoThemeData(
        brightness: Brightness.light,
        primaryColor: CupertinoColors.activeGreen,
        barBackgroundColor: CupertinoColors.darkBackgroundGray,
        scaffoldBackgroundColor: CupertinoColors.lightBackgroundGray,
        textTheme: CupertinoTextThemeData(
          navTitleTextStyle: TextStyle(
            inherit: false,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          navLargeTitleTextStyle: TextStyle(
            inherit: false,
            fontWeight: FontWeight.bold,
            fontSize: 32,
          ),
        ),
      ),
      // home: StartPage(title: appTitle),
      initialRoute: "start",
      routes: {
        "start": (context) => StartPage(title: appTitle),
        "/": (context) => const MainPage(),
      },
    );
  }
}
