import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'할 일 관리',
      theme:ThemeData(
        primarySwatch: Colors.blue,
      ),
        home:TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // 할 일 목록을 저장할 리스트
  final _items = [];

  // 할 일 문자열 조작을 위한 컨트롤러
  var _todoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('남은 할 일'),
      ),
      body:Padding(
        padding:const EdgeInsets.all(8.0),
        child:Column(
          children:<Widget>[
            Row(
              children:<Widget>[
                Expanded(
                  child:TextField(
                    controller:_todoController,
                  ),
                ),
              ]
            )
          ]
        )
      )
    );
  }
}





