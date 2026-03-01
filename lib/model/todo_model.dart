
class TodoModel     {
  final String name;
  final int id;
  final bool completed;

  const TodoModel(this.id, this.name, this.completed);

  TodoModel copyWith({String? name, int? id, bool? completed}) {
    return TodoModel(
        id ?? this.id, name ?? this.name, completed ?? this.completed);
  }

}
