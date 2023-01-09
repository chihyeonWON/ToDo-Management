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
