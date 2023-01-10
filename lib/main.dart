import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// 할 일 클래스
class Todo {
  bool isDone = false;
  String title;

  Todo(this.title);
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
  final _items = <Todo>[]; // Todo 객체 리스트

  // 할 일 문자열 조작을 위한 컨트롤러
  var _todoController = TextEditingController();

  Widget _buildItemWidget(Todo todo) {
    return ListTile(
      onTap:() {}, // Todo : 클릭 시 완료/취소되도록 수정
      title:Text(
        todo.title, // 할 일
        style:todo.isDone ? TextStyle( // 완료일 때는 스타일 적용
          decoration:TextDecoration.lineThrough, // 취소선
          fontStyle: FontStyle.italic, // 이탤릭체
        ) : null, // 그 외에는 아무 스타일 적용 안함
      ),
      trailing: IconButton( // 뒤에는 쓰레기통 아이콘을 배치
        icon:Icon(Icons.delete_forever),
        onPressed:(){}, //Todo : 쓰레기통 클릭 시 삭제되도록 수정
      )
    );
  }

  // 할 일 추가 메서드
  void _addTodo(Todo todo) {
    setState((){
      _items.add(todo);
      _todoController.text = ''; // 할 일 입력 필드를 비움
    });
  }

  // 할 일 삭제 메서드
  void _deleteTodo(Todo todo) {
    setState(() {
      _items.remove(todo);
    });
  }

  // 할 일 완료/미완료 메서드
  void _toggleTodo(Todo todo) {
    setState((){
      todo.isDone = !todo.isDone;
    });
  }

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
                ElevatedButton(
                    onPressed: () => _addTodo(Todo(_todoController.text)),
                    child: Text('추가'),
                ),
              ],
            ),
            Expanded(
              child:ListView(
                children:_items.map((todo) => _buildItemWidget(todo)).toList(),
              ),
            ),
          ],
        )
      )
    );
  }
}





