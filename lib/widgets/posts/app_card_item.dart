import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final String? price; // ✅ opcional agora
  final VoidCallback onTap;
  const CardItem({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.desc,
    this.price,
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
            height: 135.0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), 
                bottomLeft: Radius.circular(10),
              ),
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
                  if(price != null && price!.isNotEmpty)
                    Semantics(
                      label: 'Preço',
                      value: price,
                      child: Text(
                        price!, 
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.green, 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
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