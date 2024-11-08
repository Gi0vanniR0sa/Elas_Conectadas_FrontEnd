import 'package:conectadas_app/service/api_post_service.dart';
import 'package:conectadas_app/service/auth_service.dart';
import 'package:conectadas_app/utils/model_post.dart';
import 'package:conectadas_app/widgets/auth/custom_textfield.dart';
import 'package:conectadas_app/widgets/common/custom_button.dart';
import 'package:conectadas_app/widgets/common/custom_header.dart';
import 'package:flutter/material.dart';

class PostCreationPage extends StatefulWidget {
  const PostCreationPage({super.key});
  @override
  _PostCreationPageState createState() => _PostCreationPageState();
}

Future<int> getAdminId() async {
  String? userId = await AuthService.getUserId();
  return int.parse(userId!);
}

class _PostCreationPageState extends State<PostCreationPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  PostType? _selectedType;
  final PostService postService = PostService();

  void createPost() async {
  String title = _titleController.text;
  String content = _contentController.text;

  if (title.isEmpty || content.isEmpty || _selectedType == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Please fill in all fields.")),
    );
    return;
  }

  int adminId = await getAdminId(); // Obtemos o ID do administrador logado

  // Criação do post
  Post newPost = Post(
    title: title,
    content: content,
    type: _selectedType!,
    admins: [
      PostOnAdmins(adminId: adminId, postId: 0),
    ],
  );

  try {
    // Chama o serviço para criar o post e envia o novo post com os dados
    await postService.createPost(newPost);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Post created successfully!")),
    );
    _titleController.clear();
    _contentController.clear();
    setState(() {
      _selectedType = null;
    });
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Failed to create post: $e")),
    );
  }
}

  final Map<PostType, String> postTypeNames = {
    PostType.EVENT: "Eventos",
    PostType.COURSE: "Cursos",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: const Text(
          'Adicionar Post',
          style: TextStyle(color: Colors.white),
        ),
        appBar: AppBar(),
        widgets: const <Widget>[Icon(Icons.more_vert)],
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Adicione',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),
                CustomTextField(controller: _titleController, label: 'Título'),
                const SizedBox(height: 10.0),
                CustomTextField(controller: _contentController, label: 'Descrição'),
                const SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: DropdownButton<PostType>(
                    isExpanded: true,
                    value: _selectedType,
                    hint: const Text("Tipo de post"),
                    items: postTypeNames.entries.map((entry) {
                      return DropdownMenuItem<PostType>(
                        value: entry.key,
                        child: Text(entry.value),
                      );
                    }).toList(),
                    onChanged: (PostType? newType) {
                      setState(() {
                        _selectedType = newType;
                      });
                    },
                    underline: SizedBox(),
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomButton(text: "Create Post", onPressed: createPost),
              ],
            ),
          ),
        ),
      ),
    );
  }
}