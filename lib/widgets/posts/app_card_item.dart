import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String imgUrl, title, desc, displayText;
  final VoidCallback onTap;
  const CardItem({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.desc,
    required this.displayText,
    required this.onTap,
  });
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card( shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
      child: Row( crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120.0,
            height: 120.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imgUrl,
                fit: BoxFit.fill,
              )
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  const SizedBox(height: 8.0),
                  Text( title,
                    maxLines: 1,
                    style: const TextStyle( fontSize: 20.0, fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text( desc,
                    maxLines: 1,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 8.0),
                ],
              ),
            ),
          ),
        ],
      ),
      ),
    );
  }
}