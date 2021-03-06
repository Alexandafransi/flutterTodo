import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getx_todo_list/app/core/utils/extensions.dart';
import 'package:getx_todo_list/app/core/values/colors.dart';
import 'package:getx_todo_list/app/data/models/task.dart';
import 'package:getx_todo_list/app/modules/home/controller.dart';
import 'package:getx_todo_list/app/widgets/icons.dart';

class AddCard extends StatelessWidget {
   AddCard({Key? key}) : super(key: key);
  final homectrl = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {

    final icons = getIcons();
    var squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth /2,
      height: squareWidth /2,
      margin: EdgeInsets.all(3.0.wp),
      child: InkWell(
        onTap: () async{
          await Get.defaultDialog(
            titlePadding: EdgeInsets.symmetric(vertical: 5.0.wp),
            radius: 5,
            title: 'Task Type',
            content: Form(
              key: homectrl.formKey,
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 3.0.wp),
                    child: TextFormField(
                      controller: homectrl.editCtrl,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Title',
                      ),
                      validator: (value){
                        if (value == null || value.trim().isEmpty){
                          return 'Please enter your task title';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: 5.0.wp),
                    child: Wrap(
                      spacing: 2.0.wp,
                      children: icons.map((e) => Obx((){
                        final index  = icons.indexOf(e);
                        return ChoiceChip(
                          selectedColor: Colors.grey[200],
                          pressElevation: 0,
                          backgroundColor: Colors.white,
                            label: e,
                            selected: homectrl.chipIndex.value == index,
                          onSelected: (bool selected){
                              homectrl.chipIndex.value = selected ? index: 0;
                          },
                        );
                      })).toList(),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      minimumSize: const Size(150, 40),
                    ),
                      onPressed: (){
                      if(homectrl.formKey.currentState!.validate()){
                        int icon = icons[homectrl.chipIndex.value].icon!.codePoint;
                        String color = icons[homectrl.chipIndex.value].color!.toHex();
                        var task = Task(title: homectrl.editCtrl.text, icon: icon, color: color, todos: const []);
                        Get.back();
                        homectrl.addTask(task)?
                            EasyLoading.showSuccess('Create success'):
                          EasyLoading.showError('Duplicated Task');
                      }
                      },
                      child: const Text('Confirm')
                  )
                ],
              ),
            )
          );
          homectrl.editCtrl.clear();
          homectrl.changeChipIndex(0);
        },
        child: DottedBorder(
          color: Colors.grey[400]!,
            dashPattern: const[8,4],
            child: Center(
              child: Icon(Icons.add,
              size: 10.0.wp,
                color: Colors.grey,
              ),
            )
        ),
      ),
    );
  }
}
