import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_quickstart/page/splash_page.dart';

import 'page/account_page.dart';
import 'page/login_page.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://jzxvsnvdclhubjuyzecb.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imp6eHZzbnZkY2xodWJqdXl6ZWNiIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODcyMjU5NTYsImV4cCI6MjAwMjgwMTk1Nn0.qOAuvE1ZRWsjKt7L1BB0STHRfZImKEkHozi_34zKjZc',
    authFlowType: AuthFlowType.pkce,
  );
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashPage(),
        '/login': (context) => const LoginPage(),
        '/account': (context) => const AccountPage()
      },
    );
  }
}
