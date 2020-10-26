import 'package:es_cafeteria/providers/cart.dart';
import 'package:es_cafeteria/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'providers/item.dart';
import 'providers/items.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent,
  // ));
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight])
      .then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Items()),
        ChangeNotifierProvider(create: (ctx) => Cart()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
