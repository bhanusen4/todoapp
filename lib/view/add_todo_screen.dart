import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/model/todo_model.dart';
import 'package:todoapp/provider/todo_provider.dart';
import 'package:todoapp/view/widget/flutter_toast.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size =  MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              TextField(
                controller: nameController,

                decoration: const InputDecoration(
                   hintText: 'Enter Name',
                    fillColor: Colors.white,
                    constraints: BoxConstraints(maxHeight: 50, minHeight: 50),
                    focusedBorder: OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(),
                    disabledBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width:size.width ,
                child: ElevatedButton(

                    onPressed: () {
                      final name = nameController.text.trim();
                      if (name.isEmpty) {
                        FlutterToast.showToast('Enter name');
                      } else {
                        context.read<TodoProvider>().addTodo(TodoModel(
                            DateTime.now().microsecondsSinceEpoch, name, false));

                        Navigator.of(context).pop();

                      }
                    },
                    child: const Text('Add',style: TextStyle(color: Colors.black),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
