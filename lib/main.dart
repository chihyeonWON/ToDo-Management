import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore 라이브러리

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Firebase 초기화
  runApp(MyApp());
}

// 할 일 클래스
class Todo {
  bool isDone = false;
  String title;

  Todo(this.title, {this.isDone = false});
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

  Widget _buildItemWidget(DocumentSnapshot doc) {
    final todo = Todo(doc['title'], isDone: doc['isDone']); // 문서를 받아서 todo객체를 생성
    return ListTile(
      onTap:() => _toggleTodo(todo), // Todo : 클릭 시 완료/취소되도록 수정
      title:Text(
        todo.title, // 할 일
        style:todo.isDone ? TextStyle( // 완료일 때는 스타일 적용
          decoration:TextDecoration.lineThrough, // 취소선
          fontStyle: FontStyle.italic, // 이탤릭체
        ) : null, // 그 외에는 아무 스타일 적용 안함
      ),
      trailing: IconButton( // 뒤에는 쓰레기통 아이콘을 배치
        icon:Icon(Icons.delete_forever),
        onPressed:() => _deleteTodo(todo), //Todo : 쓰레기통 클릭 시 삭제되도록 수정
      )
    );
  }

  // 할 일 추가 메서드
  void _addTodo(Todo todo) {
    FirebaseFirestore.instance.collection('todo')
        .add({'title': todo.title, 'isDone': todo.isDone});
    _todoController.text = '';
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
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection('todo').snapshots(), // todo 컬렉션의 모든 문서를 스트림으로 얻음 스트림은 자료가 변경되었을 때 반응하여 화면을 다시 그려줌
              builder: (context, snapshot) {
                if(!snapshot.hasData) {
                  return CircularProgressIndicator(); // 자료가 없을 때 로딩 표시
                }
                final documents = snapshot.data?.docs; // 모든 문서를 얻습니다.
                return Expanded(
                  child:ListView(
                    children: documents!.map((doc) => _buildItemWidget(doc)).toList()),
                );
              }
            ),
          ],
        )
      )
    );
  }
}





