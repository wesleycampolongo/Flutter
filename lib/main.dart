import 'package:flutter/material.dart';
import 'package:flutter_fproject/add_language.dart';
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
                primarySwatch: Colors.lightBlue,
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

  //List<bool> selects = [false, false, false, false, false];
  List selects = List.generate(5, (index) => false);
  List labels = [
    "android native","ionic native","flutter","react native","ios native"
  ];

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
          Navigator.pushNamed(
              context,
              "/add"
          );
        },
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> buildChoices(){
    return List.generate(labels.length, (index) => getChoiceOption(index));
  }


  Widget getChoiceOption (int index) {
    return ChoiceChip(
      label: Text(labels[index]),
      selected: selects[index],
      onSelected: (value){
        setState(() {
          selects[index] = value;
        });
      },
    );
  }


  List<Widget> buildListItens(){
    return [
      if (selects[0]) getNativeAndroidOption,
      if (selects[1]) getIonicOption,
      if (selects[2]) getFlutterOption,
      if (selects[3]) getReactNativeOption,
      if (selects[4]) getNativeiOSOption
    ];
  }

  Widget getNativeAndroidOption = const Card(
    child: ListTile(
      leading: Icon(Icons.android),
      title: Text('Android Nativo'),
      subtitle: Text('Linguagens C, Java e Kotlin'),
    ),
  );

  Widget getIonicOption = const Card(
    child: ListTile(
      leading: Icon(Icons.blur_circular),
      title: Text('Ionic'),
      subtitle: Text('Linguagens JavaScipt e TypeScript'),
    ),
  );

  Widget getFlutterOption = const Card(
    child: ListTile(
      leading: FlutterLogo(),
      title: Text('Flutter'),
      subtitle: Text('Linguagens C, Java e Kotlin'),
    ),
  );

  Widget getReactNativeOption = Card(
    child: ListTile(
      leading: SvgPicture.asset("images/react.svg"),
      title: const Text('React Nativo'),
      subtitle: const Text('Linguagens C, Java e Kotlin'),
    ),
  );

  Widget getNativeiOSOption = Card(
    child: ListTile(
      leading: SvgPicture.asset("images/apple.svg"),
      title: const Text('iOS Native'),
      subtitle: const Text('Languages C, Java e Kotlin'),
    ),
  );

}