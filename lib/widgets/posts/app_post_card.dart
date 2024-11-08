import 'package:flutter/material.dart';

//WILL BE LISTED IN THE POSTS LIST

class PostCard extends StatelessWidget {
  final String imgUrl, title;
  final VoidCallback onTap;
  final Map<String, dynamic> cut;

  const PostCard({
    super.key,
    required this.cut,
    required this.imgUrl,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.brown.shade50,
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16.0),
        title: Text(
          'Código: ${cut['code']}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.brown.shade900,
          ),
        ),
        subtitle: Text(
          'Status: ${cut['status']}',
          style: TextStyle(color: Colors.black87),
        ),
        onTap: onTap,
      ),
    );
  }
}