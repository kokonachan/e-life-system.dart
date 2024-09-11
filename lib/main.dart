import 'package:e_life_system/config/firebase/firebase_options.dart';
import 'package:e_life_system/feature/estimate_list/estimate_list_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'イーライフ見積もりシステム',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Zen_Kaku_Gothic_Antique',
      ),
      home: const EstimateListPage(),
    );
  }
}
