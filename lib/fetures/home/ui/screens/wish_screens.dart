import 'package:flutter/material.dart';

class WishScreens extends StatefulWidget {
  const WishScreens({super.key});

  @override
  State<WishScreens> createState() => _WishScreensState();
}

class _WishScreensState extends State<WishScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Wish'),
      ),
    );
  }
}
