import 'package:flutter/material.dart';
import 'package:islamic_app/core/shared/shared_perf.dart';

class Tab3Screen extends StatelessWidget {
  const Tab3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(SharedPrefController().currentPage.toString()),
      ),
    );
  }
}