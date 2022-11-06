import 'package:flutter/material.dart';
import 'package:ui_practice/constants/colors.dart';
import 'package:ui_practice/model/dataroutine.dart';

class Routine extends StatelessWidget {
  final DataRoutine routine;
  final handleRoutine;
  final deleteRoutine;

  const Routine({Key? key, required this.routine,required this.handleRoutine,required this.deleteRoutine})  : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        onTap: () {
          handleRoutine(routine);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(routine.checkDone! ? Icons.check_box: Icons.check_box_outline_blank , color: td_blue,),
        title: Text(routine.text! , style: TextStyle(fontSize: 20, color:td_black, decoration:routine.checkDone! ?  TextDecoration.lineThrough :null ),),
        trailing: Container(
          padding: const EdgeInsets.all(0.0),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: td_red,
            borderRadius: BorderRadius.circular(5.0),
          ),

          child: IconButton(
            color: td_bg_color,
            iconSize: 20,
            icon: const Icon(Icons.delete),
            onPressed: () {
              deleteRoutine(routine.id!);
            },
          ),
        ),
      ),
    );
  }
}
