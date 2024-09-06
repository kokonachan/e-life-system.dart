import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class EstimateCreatePage extends HookConsumerWidget {
  const EstimateCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: Text('見積書作成画面'),
    );
  }
}
