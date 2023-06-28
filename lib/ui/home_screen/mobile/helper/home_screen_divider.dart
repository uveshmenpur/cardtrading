import 'package:flutter/material.dart';

class HomeScreenDivider extends StatelessWidget {
  const HomeScreenDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Divider(
        thickness: 1.5,
      ),
    );
  }
}
