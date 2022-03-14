import 'package:flutter/material.dart';
import 'package:flutter_fproject/add_language.dart';
import 'package:flutter_fproject/language.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Linguagens',
      theme: ThemeData(
                primarySwatch: Colors.green,
      ),
      initialRoute: '/',
      routes: {
        "/": (context) => const MyHomePage(title: "Minhas linguagens"),
        "/add": (context) => AddLanguage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List<Language> languages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Wrap(
              spacing: 10,
              children: buildChoices()
            ),
            Expanded(
              child: ListView(
                  children: buildListItens()
              ),
            ),
          ],
        ),
      ),
    floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_circle_outline),
        onPressed: (){
          Future future = Navigator.pushNamed(
              context, "/add"
          );
          future.then((value) {
            if (value != null) {
              setState(() {
                languages.add(value);
              });
            }
            debugPrint(value.name);
            debugPrint(value.detail);
          });
        },
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> buildChoices() =>
    languages
        .map((language) => getChoiceOption(language))
        .toList();



  Widget getChoiceOption (Language language) =>
    ChoiceChip(
      label: Text(language.name),
      selected: language.selected,
      onSelected: (value){
        setState(() {
          language.selected = value;
        });
      },
    );



  List<Widget> buildListItens() =>
    languages
        .where((element) => element.selected)
        .map((language) => getOption(language))
        .toList();

  Widget getOption (Language language) => Card(
    child: ListTile(
      leading: const Icon(Icons.blur_circular),
      title: Text(language.name),
      subtitle: Text(language.detail),
    ),
  );

  }