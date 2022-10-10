import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:max_ecommerce_backend/firebase_options.dart';
import 'package:max_ecommerce_backend/screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'The Dankery Backend',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      getPages: [
        GetPage(
          name: '/products',
          page: () => ProductsScreen(),
        ),
        GetPage(
          name: '/products/new',
          page: () => NewProductScreen(),
        ),
        GetPage(
          name: '/orders',
          page: () => OrdersScreen(),
        ),
      ],
    );
  }
}
