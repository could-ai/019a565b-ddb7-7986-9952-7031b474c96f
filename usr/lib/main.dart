import 'package:flutter/material.dart';
import 'screens/user_home_screen.dart';
import 'screens/admin_dashboard_screen.dart';
import 'screens/product_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق المنتجات',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
        fontFamily: 'Arial',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const UserHomeScreen(),
        '/admin': (context) => const AdminDashboardScreen(),
        '/product-details': (context) => const ProductDetailsScreen(),
      },
    );
  }
}
