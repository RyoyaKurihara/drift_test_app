import 'package:drift_test_app/database/datas.dart';
import 'package:flutter/material.dart';

void main() {
  final database = DatabaseClassName();
  runApp(MyApp(
    database: database,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.database});

  final DatabaseClassName database;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Flutter DB Home Page',
        database: database,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.database});

  final String title;
  final DatabaseClassName database;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late final TextEditingController _titleController;
  int? _editingDataId;

  @override
  void initState(){
    super.initState();
    _titleController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _insertData() async {
    final title = _titleController.text;
    final id = DateTime.now().millisecondsSinceEpoch;
    final data = RecordsClass(id: id, title: title);
    await insertData(widget.database, data);
    _titleController.clear();
  }

  Future<void> _deleteData( RecordsClass data ) async{
    await deleteData(widget.database, data);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: StreamBuilder<List<RecordsClass>>(
          stream: watchAllData(widget.database),
          builder: (context, snapshot) {
            final tableName = snapshot.data ?? [];
            return ListView.builder(
                itemCount: tableName.length,
                itemBuilder: (context, index) {
                  final data = tableName[index];
                  return ListTile(
                      title: Text(snapshot.data![index].title),
                      subtitle: const Text('date'),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => _deleteData(data),
                      ));
                });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _insertData(),
        child: const Icon(Icons.add),
      ),
      bottomSheet: SizedBox(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            left: 16,
            top: 32,
            right: 16,
            bottom: 16,
          ),
          child: TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
