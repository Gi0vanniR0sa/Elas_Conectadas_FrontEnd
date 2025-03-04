import 'package:conectadas_app/pages/posts/adm/create_posts.dart';
import 'package:conectadas_app/service/auth_service.dart';
import 'package:conectadas_app/service/login_or_register.dart';
import 'package:conectadas_app/widgets/common/bottom_bar.dart';
import 'package:conectadas_app/widgets/common/custom_header.dart';
import 'package:conectadas_app/widgets/posts/custom_floating_action_button.dart';
import 'package:flutter/material.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});
  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final AuthService authService = AuthService();
  bool isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  Future<void> checkUserStatus() async {
    bool isLoggedIn = await authService.isLoggedIn();
    if (!isLoggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginOrRegister()),
      );
    }
    String? role = await AuthService.getUserRole();
    setState(() {
      isButtonVisible = role == 'ADMIN';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: const Text(
          'Cursos',
          style: TextStyle(color: Colors.white),
        ),
        appBar: AppBar(),
        widgets: const <Widget>[Icon(Icons.more_vert)],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: const IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'VAZIO',
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: CustomFloatingActionButton(
        context: context,
        destinationScreen: const PostCreationPage(),
        isVisible: isButtonVisible,
      ),
      bottomNavigationBar: const AppBottomTabs(),
    );
  }
}

/*import 'package:conectadas_app/pages/posts/adm/create_posts.dart';
import 'package:conectadas_app/service/api_service.dart';
import 'package:conectadas_app/service/auth_service.dart';
import 'package:conectadas_app/widgets/common/bottom_bar.dart';
import 'package:conectadas_app/widgets/common/custom_header.dart';
import 'package:conectadas_app/widgets/posts/custom_floating_action_button.dart';
import 'package:conectadas_app/widgets/posts/filter_type.dart';
import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});
  @override
  State<PostPage> createState() => _PostListPageState();
}

class _PostListPageState extends State<PostPage> {
  
  NEEDS TO FEATCH DATA FROM API
  TO LIST THE POSTS

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppHeader(
        title: const Text('Eventos e Cursos', style: TextStyle(color: Colors.white)),
        appBar: AppBar(),
        widgets: const <Widget>[Icon(Icons.more_vert)],
        actions: const [],
      ),


      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [

                    FilterRowWidget(
                      statuses: statuses,
                      selectedStatus: _selectedStatus,
                      onStatusChanged: (status) {
                        setState(() {
                          _selectedStatus = status;
                        });
                      },
                    ),

                    Expanded(
                      child: _filteredRecords().isEmpty
                          ? Center(
                              child: Text(
                                "Nenhuma produção com status '${_selectedStatus}'",
                                style: TextStyle(fontSize: 14),
                              ),
                            )
                          : ListView.builder(
                              itemCount: _filteredRecords().length,
                              itemBuilder: (context, index) {
                                final cut = _filteredRecords()[index];
                                return CutCardWidget(
                                  cut: cut,
                                  onDelete: () => _confirmDeleteCut(cut['id']),
                                  onTap: () async {
                                    final bool? updated = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductionCutDetailsPage(cut: cut),
                                      ),
                                    );
                                    if (updated == true) {
                                      _fetchCutRecords();
                                    }
                                  },
                                );
                              },
                            ),
                    ),
                    
                 ],
                ),
              ),
            ),
          );
        },
      ),



      floatingActionButton: CustomFloatingActionButton(
        context: context,
        destinationScreen: const CreatePost(),
        isVisible: isButtonVisible,
      ),
      bottomNavigationBar: const AppBottomTabs(),
    );
  }
}*/
