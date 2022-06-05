import 'package:equatable/equatable.dart';


class Task extends Equatable {
  // using of Equatable it help to check if
  final String title;
  final int icon;
  final String color;
  final List<dynamic>? todos;

  const Task({
    required this.title,
    required this.icon,
    required this.color,
    required this.todos,
  });

  Task copyWith({
    //copyWith that you don't mutate the original object, but instead return a new object with the same properties ..
    String? title,
    int? icon,
    String? color,
    List<dynamic>? todos,
  }) =>
      Task(
          title: title ?? this.title,
          icon: icon ?? this.icon,
          color: color ?? this.color,
          todos: todos ?? this.todos);

  //factory function that returns an instance of a class
  factory Task.fromJson(Map<String, dynamic> json) => Task(
      title: json['title'],
      icon: json['icon'],
      color: json['color'],
      todos: json['todos']);


  Map<String, dynamic> toJson() => {
    'title': title,
    'icon':icon,
    'color':color,
    'todos': todos,
  };

  @override
  List<Object?> get props => [title,icon,color];
}
