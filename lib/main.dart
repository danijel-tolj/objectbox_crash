import 'package:flutter/material.dart';
import 'package:objectbox_crash/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

late Store store;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final p = await getApplicationDocumentsDirectory();

  store = openStore(directory: '${p.path}/db1');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  KeyValue? value;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () async {
                final box = store.box<KeyValue>();
                box.put(KeyValue()
                  ..key = "A"
                  ..value = "B");

                final query = box.query(KeyValue_.key.equals("A")).build();
                final insertedValue = query.find();

                setState(() {
                  value = insertedValue.firstOrNull;
                });
              },
              child: Text(value?.value ?? 'No value'),
            ),
          ],
        ),
      ),
    );
  }
}

@Entity()
class KeyValue {
  @Id()
  int id = 0;

  @Index()
  String? key;
  String? value;
}
