import 'package:flutter/material.dart';

class ReviewCreateScreen extends StatefulWidget {
  const ReviewCreateScreen({super.key});
  static const String name='/create-review';

  @override
  State<ReviewCreateScreen> createState() => _ReviewCreateScreenState();
}

class _ReviewCreateScreenState extends State<ReviewCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Review'),
      ),
      body: Column(
        children: [
          TextFormField(

          )
        ],
      ),
    );
  }
}
