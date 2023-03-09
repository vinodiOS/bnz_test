import 'package:benzy_test/providers/home_provider.dart';
import 'package:benzy_test/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (ctx) => HomeProvider()),
        ],
        child: const MaterialApp(
          title: 'Benzy Test',
          home: HomePage(),
        ));
  }
}
