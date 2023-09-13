import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:to_do_list_app/authorisation/appwriteAuth.dart';
import 'package:to_do_list_app/models/tofo.dart';
import 'package:to_do_list_app/to_do_item.dart';
import 'package:provider/provider.dart';

class ListCreationPage extends StatefulWidget {
  const ListCreationPage({super.key});

  @override
  State<ListCreationPage> createState() => _ListCreationPageState();
}

class _ListCreationPageState extends State<ListCreationPage> {
  final todoList = Todo.todolist();

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    TextEditingController addnotes = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(
        backgroundColor: Colors.purple[900],
        title: const Icon(
          Icons.menu,
          size: 30,
        ),
      ),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
                  child: TextField(
                    decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: "Search...",
                        fillColor: Colors.white70,
                        filled: true,
                        disabledBorder: const OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16.0))),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0)),
                        focusColor: Colors.transparent),
                  ),
                ),
              ),
              Expanded(
                  child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text(
                      "All TODOs",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0, top: 5.0),
                    child: Text(
                      "ToDo Items",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                  ),
                  for (Todo todo in todoList)
                    TodoItem(
                      toDoo: todo,
                      onTodoChanged: todoListhandler,
                      onTodoDelete: _deleteToDoItem,
                    )
                ],
              ))
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  height: 60.0,
                  width: 300.0,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 8.0),
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 8.0,
                          spreadRadius: 2.0,
                        )
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: TextField(
                    controller: addnotes,
                    decoration: const InputDecoration(
                        hintText: "Type here...", border: InputBorder.none),
                  ),
                )),
                Container(
                  height: 60.0,
                  width: 60.0,
                  margin: const EdgeInsets.only(right: 6.0),
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                  child: IconButton(
                      onPressed: () {
                        // print("presssed");
                        addToDoItem(addnotes.text);
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void todoListhandler(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void addToDoItem(String TOdo) {
    Provider.of<AppWriteProvider>(context, listen: false).createDocument(
        databaseId: '645a0047b14f9e14aa76',
        collectionId: '645a480c20f634f98152',
        documentId: '',
        data: {'todoS': TOdo});
    setState(() {
      todoList.add(Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: TOdo));
    });
  }
}
