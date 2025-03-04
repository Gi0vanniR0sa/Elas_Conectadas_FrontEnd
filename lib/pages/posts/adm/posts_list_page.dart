import 'package:conectadas_app/pages/posts/adm/create_posts.dart';
import 'package:conectadas_app/service/auth_service.dart';
import 'package:conectadas_app/utils/model_post.dart';
import 'package:conectadas_app/widgets/common/custom_header.dart';
import 'package:conectadas_app/widgets/posts/custom_floating_action_button.dart';
import 'package:flutter/material.dart';

class PostsListPage extends StatefulWidget {
  const PostsListPage({super.key});
  @override
  State<PostsListPage> createState() => _PostsListPageState();
}

class _PostsListPageState extends State<PostsListPage> {
  final AuthService authService = AuthService();
  bool isButtonVisible = false;

  /*@override
  void initState() {
    super.initState();
    checkUserStatus();
  }

  Future<void> checkUserStatus() async {
    bool loggedIn = await authService.isLoggedIn();
    if (!loggedIn) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginOrRegister()),
      );
    } else{
      loggedIn = true;
    }
  }*/

  PostType? _selectedPostType;
  final Map<PostType, String> postTypeLabels = {
    PostType.COURSE: 'Course',
    PostType.EVENT: 'Event',
  };

  Widget buildFilterRow() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: PostType.values
              .map((type) => [
                    buildFilterButton(type),
                    const SizedBox(width: 5.0),
                  ])
              .expand((widget) => widget)
              .toList()
            ..removeLast(),
        ),
      ),
    );
  }

  // FILTRE OS POSTS POR TIPO
  Widget buildFilterButton(PostType type) {
    return ElevatedButton(
      onPressed: () {
        if (!mounted) return;
        setState(() {
          _selectedPostType = type;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: _selectedPostType == type
            ? const Color.fromARGB(255, 205, 165, 250)
            : Colors.white,
        foregroundColor: _selectedPostType == type
            ? Colors.white
            : const Color.fromARGB(255, 205, 165, 250),
      ),
      child: Text(postTypeLabels[type]!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: const Text('Posts', style: TextStyle(color: Colors.white)),
        appBar: AppBar(),
        widgets: const <Widget>[Icon(Icons.more_vert)],
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
                    //Paddin no topo da pagina
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 9.0, top: 9.0),
                        ),
                      ],
                    ),

                    buildFilterRow(),

                    /* CardItem(
                      imgUrl: 'imgUrl', title: 'title',
                      desc: 'desc', displayText: 'displayText',
                      onTap: () {},
                    ),*/
                  ],
                ),
              ),
            ),
          );
        },
      ),

      // Botão só aparece se o usuário estiver logado e tiver o role 'admin'
      floatingActionButton: isButtonVisible
          ? CustomFloatingActionButton(
              context: context,
              destinationScreen: const PostCreationPage(),
              isVisible: true,
            )
          : null,
    );
  }
}
