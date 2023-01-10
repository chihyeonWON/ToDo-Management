# ToDo-Mangement

```
개발 툴 : Flutter
개발 언어 : Dart
개발 일시 : 2023-01-09 ~
개발자 : Won Chi Hyeon
```

### 앱소개
```
앱 이름 : ToDo-Mangement
앱 기능 : 할 일 추가, 목록 표시, 완료/미완료 체크, 할 일 삭제 (CRUD(Create, Read, Update, Delete 기능)
          모든 자료는 클라우드 Database인 Firestore에 저장
핵심 구성 요소 : 파이어베이스 : 서버의 다양한 기능을 복잡한 지식 없이 사용하도록 제공되는 서비스
                 Firestore : 파이어베이스에서 제공하는 클라우드 DB 서비스
```

#### 화면 구성
```
할 일 관리 앱은 하나의 페이지에서 CRUD의 기능을 수행합니다. 따라서 변화가 있는
StatefulWidget 클래스로 한 화면을 구성하였습니다.
```
![image](https://user-images.githubusercontent.com/58906858/211239890-727866e3-1de1-42d8-b60f-7e4435a7057e.png)

#### 할 일 입력받는 TextField 생성
```
할 일을 입력받을 TextField를 생성합니다.
할 일 문자열을 조작할 컨트롤러를 연결하고 Expanded로 감싸서 추가 버튼 이외의
영역을 모두 채우도록 하였습니다.
```
![image](https://user-images.githubusercontent.com/58906858/211240755-e71ff074-bfaf-41dc-853d-deaeaf80d234.png)

#### 할 일을 추가하는 버튼 생성
```
할 일을 추가하는 ElevatedButton을 생성합니다.
클릭 시 발생할 이벤트는 나중에 작성합니다.
```
![image](https://user-images.githubusercontent.com/58906858/211240997-fe134883-7cfc-4ca3-ad50-9ccb5d17ab63.png)

#### 할 일 목록 리스트 추가
```
추가한 할 일 목록을 리스트의 형태로 보여주는 ListView를 생성합니다.
역시 Expanded로 감싸서 ListView가 남은 영역을 꽉 채우도록 하였습니다.
```
![image](https://user-images.githubusercontent.com/58906858/211241299-cc3f68c3-1b6f-43a8-8c67-9e7af9209a99.png)

#### 할 일 목록 리스트의 텍스트, 삭제 버튼 메서드 생성
```
할 일 목록 리스트는 추가한 문자열 텍스트와 후행에 삭제 아이콘인 쓰레기통 아이콘이 들어갑니다.
Todo 객체를 인수로 받고 ListTile 위젯 안에 이 문자열과 아이콘을 넣고 반환하는 _buildItemWidget 메서드를 생성합니다.
리스트의 문자열을 클릭 시 이탤릭체와 취소선이 나타나도록 설정하였습니다.
```
![image](https://user-images.githubusercontent.com/58906858/211242287-7b067d89-cf10-4684-aab0-3e68f5811f4f.png)

#### 작성한 할 일 목록이 ListView에 표시되도록 수정
```
할 일 목록을 작성하고 추가버튼을 누르면 리스트에 추가되고 이 추가된 리스트 객체가 ListView에 표시되도록 수정하였습니다.
ListView에는 앞서 작성한 _buildItemWidget에서 반환된 ListTile이 들어가게 됩니다.
```
![image](https://user-images.githubusercontent.com/58906858/211242621-d38fe18d-9aa8-4c98-9d1f-294322e618d9.png)

#### 할 일 추가, 삭제, 완료/미완료 메서드 생성
```
Todo 객체를 인수로 받아서 할 일 추가, 삭제, 완료/미완료의 기능을 수행하는 메서드를 생성하였습니다.
```
![image](https://user-images.githubusercontent.com/58906858/211458845-8245656c-5964-4614-905a-57ec3e4eb6cd.png)

#### 할 일 추가 기능을 추가 버튼에 추가
```
앞 서 생성한 할 일 추가 메서드인 _addTodo를 추가버튼 안에 onPressed 프로퍼티에 추가합니다.
할 일을 입력하고 추가버튼을 누르면 Todo 객체 리스트의 할 일로 저장되고 저장된 할 일이
ListTile의 형식에 따라 보여지게 됩니다.
```
![image](https://user-images.githubusercontent.com/58906858/211459556-d3d119c0-c44c-499f-8f69-8f61d4b2ce2a.png)
