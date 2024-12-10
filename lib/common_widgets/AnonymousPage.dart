import 'package:flutter/material.dart';

class AnonymousPage extends StatelessWidget {
  const AnonymousPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hotel Details'),
      ),
      body: const Center(
        child: Text(
          'Details of the selected hotel',
          style: TextStyle(fontSize: 18.0),
        ),
      ),
    );
  }
}
