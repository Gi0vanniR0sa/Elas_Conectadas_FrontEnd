import 'package:conectadas_app/pages/posts/adm/create_posts.dart';
import 'package:conectadas_app/pages/posts/user/ads_page.dart';
import 'package:conectadas_app/service/auth_service.dart';
import 'package:conectadas_app/widgets/common/bottom_bar.dart';
import 'package:conectadas_app/widgets/common/custom_header.dart';
import 'package:conectadas_app/widgets/posts/app_card_item.dart';
import 'package:conectadas_app/widgets/posts/custom_floating_action_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService authService = AuthService();
  bool isButtonVisible = false;

  /*authService.getUserRole();

  if (authService.userRole == 'USER') {
    isButtonVisible = true;
  };*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        widgets: const [],
      ),

      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 30),
            const TabBar(
              labelColor: Color.fromARGB(255, 184, 135, 239),
              unselectedLabelColor: Color.fromARGB(255, 121, 121, 121),
              indicatorColor: Color.fromARGB(255, 184, 135, 239),
              labelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Arial',
                fontSize: 20.0,
              ),
              tabs: <Widget>[
                Tab(text: "Produtos"),
                Tab(text: "Serviços"),
                Tab(text: "Parcerias"),
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  //TAB DE PRODUTOS
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CardItem(
                          imgUrl: 'assets/images/placeholder7.jpg',
                          title: 'Sandália',
                          desc: 'Sandália de Couro',
                          price: 'R\$ 99,90',
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AdsPage(),
                              ),
                            );
                          },
                        ),
                        CardItem(
                          imgUrl: 'assets/images/placeholder09.jpg',
                          title: 'Colete de Crochê', 
                          desc: 'Lindo colete de crochê feminino', 
                          price: 'R\$ 159,90',
                          onTap: () {
                            MaterialPageRoute(
                              builder: (context) => const AdsPage(), 
                            );
                          }
                        ),
                        CardItem(
                          imgUrl: 'assets/images/placeholder12.jpg',
                          title: 'Bolsa', 
                          desc: 'Bolsa de tecido com forro', 
                          price: 'R\$ 179,90',
                          onTap: () {
                            MaterialPageRoute(
                              builder: (context) => const AdsPage(), 
                            );
                          }
                        ),
                        CardItem(
                          imgUrl: 'assets/images/placeholder11.jpg',
                          title: 'Caneca', 
                          desc: 'Caneca personalizada lhama', 
                          price: 'R\$ 59,90',
                          onTap: () {
                            MaterialPageRoute(
                              builder: (context) => const AdsPage(), 
                            );
                          }
                        ),
                        CardItem(
                          imgUrl: 'assets/images/placeholder13.jpg',
                          title: 'Colar', 
                          desc: 'Caneca personalizada lhama', 
                          price: 'R\$ 99,90',
                          onTap: () {
                            MaterialPageRoute(
                              builder: (context) => const AdsPage(), 
                            );
                          }
                        ),
                      ],
                    ),
                  ),

                  //TAB DE SERVIÇOS
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CardItem(
                          imgUrl: 'assets/placeholder05.jpg',
                          title: 'Boleira',
                          desc: 'Bolos para festas',
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AdsPage(),
                              ),
                            );
                          },
                        ),
                        CardItem(
                          imgUrl: 'assets/placeholder10.jpg',
                          title: 'Lembrancinhas', 
                          desc: 'Lembrancinhas para maternidade safari', 
                          onTap: () {
                            MaterialPageRoute(
                              builder: (context) => const AdsPage(), 
                            );
                          }
                        ),
                      ],
                    ),
                  ),

                  //TAB DE PARCERIAS
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        CardItem(
                          imgUrl: 'assets/icon0.jpg',
                          title: ' ',
                          desc: ' ',
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AdsPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Botão só aparece se o usuário estiver logado e tiver o role 'USER'
      floatingActionButton: isButtonVisible
          ? CustomFloatingActionButton(
              context: context,
              destinationScreen: const PostCreationPage(),
              isVisible: true,
            )
          : null,

      bottomNavigationBar: const AppBottomTabs(),
    );
  }
}
