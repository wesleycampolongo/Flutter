import 'package:flutter/material.dart';
import 'package:flutter_fproject/language.dart';
import 'package:flutter_fproject/main.dart';

class AddLanguage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nova Linguagem"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Nome da linguagem",
                    labelText: "Nome da linguagem"
                ),
                controller: _nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o nome da linguagem';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Detalhe da linguagem",
                    labelText: "Detalhe da linguagem"
                ),
                controller: _detailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o Detalhe da linguagem';
                  }
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Language language = Language(
                            _nameController.text,
                            _detailController.text
                        );
                        Navigator.pop(context, language);
                      }
                    },
                    child: const Text('Gravar')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
