// import 'package:get/get.dart';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_todo_list/app/core/utils/keys.dart';
import 'package:getx_todo_list/app/data/models/task.dart';
import 'package:getx_todo_list/app/data/services/storage/services.dart';

class TaskProvider{
   final StorageService _storageService = Get.find<StorageService>();

//    {
//      'tasks':[
//        'title': 'work',
//         'color': '#exf444',
//         'icon': '#exf444',
//      ]
// }

   List<Task> readyTasks(){
     var tasks = <Task>[];
     jsonDecode(_storageService.ready(taskKey).toString())
     .forEach((e)=> tasks.add(Task.fromJson(e)));
     return tasks;
   }

   void writeTasks(List<Task> tasks){
     _storageService.write(taskKey, jsonEncode(tasks));
   }
}