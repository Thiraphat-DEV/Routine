import 'package:flutter/material.dart';
import 'package:ui_practice/constants/colors.dart';
import 'package:ui_practice/widgets/routine.dart';
import 'package:ui_practice/model/dataroutine.dart' ;

class Home extends StatefulWidget {
  const Home({Key? key}): super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>{
   final routineList = DataRoutine.routineList();
   final _routineController = TextEditingController();

   List<DataRoutine> _searchRoutine = [];
  @override

  //init state
  void initState() {
    _searchRoutine = routineList;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: td_bg_color,
      appBar: _buildAppBar(),
    body: Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          children: [
              searchBar(),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 20, ),
                    child: Text('Routine With Boaty', style: TextStyle(fontSize: 30, fontFamily: 'Netflix', fontWeight: FontWeight.w600), textAlign: TextAlign.center,) ,
                  ),
                  for(DataRoutine routine in _searchRoutine.reversed )
                        Routine(routine: routine, handleRoutine: _handleRoutine, deleteRoutine: _deleteRoutine,)
                ],
              ),
            )
          ],
        ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(child: Container(margin: EdgeInsets.only(bottom: 10, right: 20, left: 20),
              decoration: BoxDecoration(color: Colors.white, boxShadow: const [BoxShadow(
                color: td_grey,
                offset: Offset(0.0, 0.0),
                blurRadius: 10.0,
                spreadRadius: 0.0,
              )],
              borderRadius: BorderRadius.circular(20.0),
              ),
                child: TextField(
                  controller: _routineController,
                  decoration: InputDecoration(
                    hintText: "Add Routine of a Day",
                    border: InputBorder.none,
                  ),
                  style: TextStyle(fontSize: 20),
                ),
              ),
              ),

              Container(
                margin: EdgeInsets.only(right: 10),
                child: ElevatedButton(
                  child: Text("+", style: TextStyle(fontSize: 40,color: Colors.lightGreenAccent),
                  ),
                onPressed: () {
                    _addRoutine(_routineController.text);
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: td_blue,
                    minimumSize: Size(60, 60),
                    elevation: 15,
                  ),

                ),
              )
            ],
          ),
        )
      ],
    ),
    );

    }

    //handler create routine
   void _handleRoutine(DataRoutine routine) {
    setState(() {
      routine.checkDone = routine.checkDone!;
    });
   }
  //delete routine
   void _deleteRoutine(String id) {
    setState(() {
      routineList.removeWhere((item) =>  item.id == id);
    });
   }
   
   //add routine
   void _addRoutine(String routineText) {
    setState(() {
      routineList.add(DataRoutine(id: DateTime.now().millisecondsSinceEpoch.toString(), text: routineText));
    });
   }

   //filter data routine
   void _filterData(String word) {
     List<DataRoutine>  results = [];
     //check word
     if(word.isEmpty) {
       results = routineList;
     }
     else {
       results = routineList.where((item) => item.text!.toLowerCase().contains(word.toLowerCase())).toList();
     }
    setState(() {
      _searchRoutine = results;
    });
   }
    Widget searchBar() {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child:  TextField(
          onChanged: (value) {
            _filterData(value);
          },
          decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 15),
            prefixIcon:  Icon(Icons.search, color: Colors.black54, size: 30,),
            prefixIconConstraints: BoxConstraints(maxHeight: 20.0, minWidth: 25),
            border: InputBorder.none,
            hintText: "Search Text",
            hintStyle: TextStyle(color: td_grey),
          ),
        ),
      );
    }

    AppBar _buildAppBar() {
     return AppBar(
        backgroundColor: td_bg_color ,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.menu, color: td_black, size: 35,),
            Container(
              height: 50,
              width: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network('https://scontent.fnak3-1.fna.fbcdn.net/v/t39.30808-1/297278583_1712645052439112_7814949233478281011_n.jpg?stp=dst-jpg_p240x240&_nc_cat=102&ccb=1-7&_nc_sid=7206a8&_nc_eui2=AeE54vcDI6KwgOSC_eiFLi7H-2KWRQ9Botn7YpZFD0Gi2Y-i8mSrkGFqj57h2oCSHnQ5adr9oKqRsOIgisuZzn6w&_nc_ohc=84Trt7YNa_QAX_mgvg1&tn=LRYJi1OInUJTMlAG&_nc_ht=scontent.fnak3-1.fna&oh=00_AfBFU9FpOII1bVTevbZRzUNlr6AvcROSSrgR2xRsoRlnJQ&oe=636B9874'),
              ),
            )
          ],
        ),
      );
    }
}
