import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          'Inbox',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey[800],
              child: Icon(Icons.person, color: Colors.grey[600]),
            ),
            title: Text(
              'User ${index + 1}',
              style: const TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              'Sent you a message',
              style: TextStyle(color: Colors.grey[400]),
            ),
            trailing: Text(
              '${index + 1}h',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          );
        },
      ),
    );
  }
}
