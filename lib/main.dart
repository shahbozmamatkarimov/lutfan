import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ecommerceapp/config/routes/router.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'IlmNur',
      debugShowCheckedModeBanner: false,
      // color: AppColors.backgroundColor,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF000000),
          // background: AppColors.backgroundColor,
        ),
        // useMaterial3: true,
      ),
      routerConfig: _router.config(),
      // routerDelegate: _router.delegate(),
      // routeInformationParser: _router.defaultRouteParser(),
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'Sneaker Shop',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //     scaffoldBackgroundColor: Colors.white,
    //   ),
    //   home: HomeScreen(),
    // );
  }
}
