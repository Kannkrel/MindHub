import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notification $index'),
            subtitle: Text('This is a notification message.'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              // Handle notification tap
            },
          );
        },
      ),
    );
  }
}
