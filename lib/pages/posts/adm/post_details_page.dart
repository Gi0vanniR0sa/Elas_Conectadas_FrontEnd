import 'package:conectadas_app/widgets/common/bottom_bar.dart';
import 'package:conectadas_app/widgets/common/custom_header.dart';
import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key,
  });

  //TODO IMPLEMENTAR A PÁGINA DE DETALHES DO POST
  //TODO GET POST DETAILS BY ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: const Text('Curso', style: TextStyle(color: Colors.white),),
        appBar: AppBar(),
        widgets: const <Widget>[Icon(Icons.more_vert)],
      ),

      body: Padding( padding: const EdgeInsets.all(10.0),
        child: Card( elevation: 3,
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8),),
          child: const SingleChildScrollView(
            padding: EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: AppBottomTabs(),
    );
  }
}