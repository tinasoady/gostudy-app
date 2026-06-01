import 'package:flutter/material.dart';

class NotificationsScreenWidget extends StatelessWidget {
  const NotificationsScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: const Center(child: Text('Écran Notifications — placeholder')),
    );
  }
}
