import 'package:flutter/material.dart';

class TripsScreenWidget extends StatelessWidget {
  const TripsScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trajets')),
      body: const Center(child: Text('Écran Trajets — placeholder')),
    );
  }
}
