import 'package:conectadas_app/service/api_ads_service.dart';
import 'package:conectadas_app/utils/model_ads.dart';
import 'package:conectadas_app/widgets/auth/custom_textfield.dart';
import 'package:conectadas_app/widgets/common/custom_button.dart';
import 'package:conectadas_app/widgets/common/custom_header.dart';
import 'package:flutter/material.dart';

class AdCreationPage extends StatefulWidget {
  const AdCreationPage({super.key});
  @override
  _AdCreationPageState createState() => _AdCreationPageState();
}

class _AdCreationPageState extends State<AdCreationPage> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  AdType? _selectedType;
  final AdService adService = AdService();

  final Map<AdType, String> adTypeNames = {
    AdType.PRODUCT: "Produto",
    AdType.SERVICE: "Serviço",
    AdType.COLLAB: "Colaboração",
  };

  void createAd() async {
    String title = _titleController.text;
    String content = _contentController.text;

    if (title.isEmpty || content.isEmpty || _selectedType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill in all fields.")),
      );
      return;
    }

    Ad newAd = Ad(
      title: title,
      content: content,
      type: _selectedType!,
    );

    try {
      await adService.createAds(newAd);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ad created successfully!")),
      );
      _titleController.clear();
      _contentController.clear();
      setState(() {
        _selectedType = null;
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to create ad: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppHeader(
        title: const Text(
          ' ',
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
                  'Crie seu Anúncio',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20.0),
                CustomTextField(controller: _titleController, label: 'Título'),
                const SizedBox(height: 10.0),
                CustomTextField(
                    controller: _contentController, label: 'Descrição'),
                const SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: DropdownButton<AdType>(
                    isExpanded: true,
                    value: _selectedType,
                    hint: const Text("Tipo de anúncio"),
                    items: adTypeNames.entries.map((entry) {
                      return DropdownMenuItem<AdType>(
                        value: entry.key,
                        child: Text(entry.value),
                      );
                    }).toList(),
                    onChanged: (AdType? newType) {
                      setState(() {
                        _selectedType = newType;
                      });
                    },
                    underline: const SizedBox(),
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomButton(text: "Criar", onPressed: createAd),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
