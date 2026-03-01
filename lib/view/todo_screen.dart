import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/view/add_todo_screen.dart';

import '../provider/todo_provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        actions: [
          Consumer<TodoProvider>(builder: (context, provider, _) {
            if (provider.todos.isEmpty) {
              return const SizedBox.shrink();
            }
            return PopupMenuButton<int>(
              itemBuilder: (context) => [
                // PopupMenuItem 1
                const PopupMenuItem(
                  value: 1,
                  child: Text("Mark All Completed"),
                ),
                // PopupMenuItem 2
                const PopupMenuItem(
                  value: 2,
                  // row with two children
                  child: Text("Marked All Uncompleted"),
                ),
                const PopupMenuItem(
                  value: 3,
                  // row with two children
                  child: Text("Delete All"),
                ),
              ],
              offset: const Offset(0, 55),
              color: Colors.white,
              elevation: 2,
              // on selected we show the dialog box
              onSelected: (value) {
                // if value 1 show dialog
                if (value == 1) {
                  provider.markedAllCompleted();
                } else if (value == 2) {
                  provider.unmarkedAll();
                } else if (value == 3) {
                  provider.deleteAll();
                }
              },
            );
          }),
        ],
      ),
      body: Consumer<TodoProvider>(builder: (context, provider, _) {
        if (provider.todos.isEmpty) {
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text('No Todo'),
              ),
            ],
          );
        }

        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            if (provider.todos.isEmpty) {
              return const SizedBox.shrink();
            }
            final todo = provider.todos[index];

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.limeAccent.shade400,
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  title: Text(
                    todo.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        decoration:
                            todo.completed ? TextDecoration.lineThrough : null,
                        decorationColor: Colors.black,
                        decorationThickness: 2),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      provider.deleteTodo(todo.id);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ),
              ),
            );
          },
          itemCount: provider.todos.length,
          separatorBuilder: (context, index) {
            return const SizedBox(
              height: 5,
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddTodoScreen()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
