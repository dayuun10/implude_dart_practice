String upper(String? name) =>
    name?.toUpperCase() ?? 'no'; //name이 null이 아니면 ?? 왼쪽, null이면 오른쪽 실행

typedef lint = List<int>; //이제부터 List<int>는 lint라고 부른다

lint reverse(lint list) => (list.reversed).toList();

void main() {
  print(
    "\n————————————————————————————————————————————— 실행 시작 —————————————————————————————————————————————\n",
  );

  //—————————————————————————————————————————————— 삼항? ——————————————————————————————————————————————

  int? a;
  a ??= 0; //a의 값이 없다면 0을 넣기
  print(a);

  int? b;
  b = (b != null) ? 10 : 0; //삼항 연산자는 c언어랑 같나봄

  print(upper('Gayun'));
  print(upper(null));

  print(reverse([1, 2, 3, 4, 5, 6, 7]));

  print(
    "\n———————————————————————————————————————————————— 끝 ————————————————————————————————————————————————\n",
  );
}
