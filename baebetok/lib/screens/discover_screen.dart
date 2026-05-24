import 'package:flutter/material.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.grey[400]),
            prefixIcon: Icon(Icons.search, color: Colors.grey[400]),
            filled: true,
            fillColor: Colors.grey[900],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(2),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.65,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: 20,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.grey[800],
            child: Center(
              child: Icon(
                Icons.image,
                color: Colors.grey[600],
                size: 50,
              ),
            ),
          );
        },
      ),
    );
  }
}
