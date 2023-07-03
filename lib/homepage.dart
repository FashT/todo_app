import 'package:flutter/material.dart';
import 'database.dart';
import 'package:hive/hive.dart';
import '/dialog_box.dart';

import 'todo_tile.dart';

class Hompage extends StatefulWidget {
  const Hompage({Key? key}) : super(key: key);

  @override
  State<Hompage> createState() => _HompageState();
  
}

class _HompageState extends State<Hompage> {

void  initState(){
if (_myBox.get('TODOLIST')== null ) {
  db.createInitiaData();
}else{
  db.loadData(); 
}
}


  ToDoDataBase db = ToDoDataBase();
  final _myBox = Hive.box('mybox');
final _controller = TextEditingController();


void buttonSaved(){
setState(() {
  db.toDoList.add([_controller.text, false]);
  _controller.clear();
});
Navigator.of(context).pop();
db.updateDataBase();
}

  

  void createNewTask() {
    showDialog(
        context: context,
        builder: (_) {
          return DialogBox(
          buttonSaved: buttonSaved,
          onCancel: () => Navigator.of(context).pop() ,
          controller: _controller,
          
          );
        });
  }

  void deleteTask(int index){
setState(() {
  db.toDoList.removeAt(index);
});
db.updateDataBase();

  }

  void checkBoxChanged(bool? value, int index) {
    setState(
      
      () {
        db.toDoList[index][1] = !db.toDoList[index][1];
      },
    );
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        elevation: 0,
        title: const Center(
          child: Text(
            'T0D0',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return toDoTile(
            db.toDoList[index][0], db.toDoList[index][1], 
            (value)=> checkBoxChanged(value, index), (_)=> deleteTask(index));
          
        },
        itemCount:db.toDoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
      
        child: const Icon(Icons.add),
      ),
    );
  }
}
