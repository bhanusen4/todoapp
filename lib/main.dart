import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/provider/todo_provider.dart';
import 'package:todoapp/view/todo_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (BuildContext context) =>TodoProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(


        colorScheme: ColorScheme.fromSeed(seedColor: Colors.limeAccent),
        appBarTheme: AppBarTheme(color: Colors.limeAccent.shade400),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(backgroundColor:WidgetStateProperty.all(Colors.limeAccent.shade400,),shape: WidgetStateProperty.all(
            const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5)))
          ))
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor:Colors.limeAccent.shade400
        ),
        useMaterial3: true,
      ),
      home: const TodoScreen(  ),
    );
  }
}
