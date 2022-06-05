import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo_list/app/core/utils/extensions.dart';
import 'package:getx_todo_list/app/modules/detail/view.dart';
import 'package:getx_todo_list/app/modules/home/controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../data/models/task.dart';

class TaskCard extends StatelessWidget {
   final homectrl = Get.find<HomeController>();
   final Task task;
   TaskCard({Key? key, required this.task}) : super(key: key);

   @override
  Widget build(BuildContext context) {
     final color = HexColor.fromHex(task.color);
     final squaryWidth = Get.width -12.0.wp;
    return GestureDetector(
      onTap: (){
        homectrl.changeTask(task);
        homectrl.changeTodos(task.todos ?? []);
        Get.to(()=>DetailPage());
      },
      child: Container(
        width: squaryWidth /2,
        height: squaryWidth /2,
        margin: EdgeInsets.all(3.0.wp),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200]!,
              blurRadius: 7,
              offset: const Offset(0, 7),
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StepProgressIndicator(totalSteps: homectrl.isTodosEmpty(task)? 1 : task.todos!.length,
            currentStep: homectrl.isTodosEmpty(task) ? 0: homectrl.getDoneTodo(task),
              size: 5,
              padding: 0,
              selectedGradientColor: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [color.withOpacity(0.5),color],

              ),

              unselectedGradientColor: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white,Colors.white],

              ),
            ),
            Padding(
              padding: EdgeInsets.all(6.0.wp),
              child: Icon(IconData(task.icon,fontFamily: 'MaterialIcons'),
              color: color,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0.sp
                ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.0.wp,),
                Text('${task.todos?.length ?? 0} Task',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
                ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
