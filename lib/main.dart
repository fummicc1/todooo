import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todooo/bloc/todo_list_bloc.dart';
import 'package:todooo/data/local_storage_client.dart';
import 'package:todooo/ui/pages/todo_list_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Provider(
    create: (_) => null,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todooo',
      theme: ThemeData(
        primaryColor: Color(0xFFf3d91f),
        backgroundColor: Color(0xFF212ae0),
      ),
      home: Provider<ToDoListBloc>(
          create: (_) => ToDoListBloc(LocalStorageClient()),
          dispose: (_, bloc) => bloc.dispose,
          child: ToDoListPage()),
    );
  }
}
