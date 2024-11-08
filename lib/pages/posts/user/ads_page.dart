import 'package:conectadas_app/widgets/common/bottom_bar.dart';
import 'package:conectadas_app/widgets/common/custom_header.dart';
import 'package:flutter/material.dart';


class AdsPage extends StatelessWidget {
  const AdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppHeader(
        title: const Text(' '),
        appBar: AppBar(),
        widgets: const <Widget>[Icon(Icons.more_vert)],
      ),

      body: Padding( padding: const EdgeInsets.all(10.0),
        child: Card( elevation: 3, shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(8),),
          child: const SingleChildScrollView( padding: EdgeInsets.all(8.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //CoverImageWidget(imagePath: 'assets/placeholder0.jpg',),
                // Conteiner com a data e o autor (alinhado à esquerda)
                Padding( padding: EdgeInsets.only(left: 15.0),
                  child: Column( crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 15),
                      Text( '10/10/2024',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text( 'Autor',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text( 'Curso de Marketing Digital',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
            
                // Título do curso (centralizado)
                SizedBox(height: 15),
                Center(
                  child: Text( 'Curso de Marketing Digital', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                ),

                // Conteúdo do curso (justificado)

                SizedBox(height: 15),
                /*LongTextDisplay(
                  text: '''
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                    At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti
                  ''',
                  padding: EdgeInsets.symmetric(horizontal: 15),
                ),*/
                SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: AppBottomTabs(),
    );
  }
}