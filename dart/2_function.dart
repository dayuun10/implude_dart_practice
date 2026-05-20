void main(){
  //———————————————————————————————————————————— 함수 선언 ————————————————————————————————————————————
  void sayhello(String name){
    print("$name님 안녕하세요!");
  }

  String sayhello2(String name){ //var로는 안됨
    return "$name님 안녕하세요!";
  }

  String add(int a, int b) => "$a + $b = ${a+b}"; //코드가 한 줄일 땐 return 말고 저 화살표 써도 됨

  //한 번에 여러 값을 입력해야 할 때
  String name({String first_name = "병신", String last_name = "개"})=>"$last_name$first_name님 안녕하세요!"; //지역변수에 값을 넣어주는 이유: null safety에 걸려서
  //또는 required 쓰기 >> 대신 무조건 값이 들어가 있어야 됨
  String name2({required String first_name, required String last_name}) => "$first_name $last_name님 안녕하세요!";


  print("\n————————————————————————————————————————————— 실행 시작 —————————————————————————————————————————————\n");

  sayhello("가윤");
  print(sayhello2("가윤"));
  print(add(3,4));

  //name("가윤","한"); >> 좀 헷갈리고 알기 어려움 -> 그래서 
  print(name(
    last_name: "한",
    first_name: "가윤", //순서상관 x
  ));

  print(name()); //값이 없으면 기본값으로 나오게 가능
  //print(name2()); >>오류 
  print(name2(
    last_name: 'Han',
    first_name: 'Gayun',
  ));

  print("\n———————————————————————————————————————————————— 끝 ————————————————————————————————————————————————\n");
}