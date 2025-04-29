import 'package:flutter/material.dart';
import 'package:portfolio/features/presentation/widgets/custom_appbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CustomScrollView(slivers: [CustomAppbar()]));
  }
}
