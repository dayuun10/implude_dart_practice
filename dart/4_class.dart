//—————————————————————————————————————— 클래스 ——————————————————————————————————————
class Player {
  String name;
  int hp = 20;
  bool ismainch, isDream;

  String introduce() =>
      "${(this.name == 'Omori' || this.name == 'SUNNY')? '' : (isDream)? '꿈속 세계 ' : '현실 세계 '}${name}의 체력은 ${hp}이고, ${(ismainch) ? '주인공이다' : "주인공이 아니다"}";

  Player({this.name = 'none', this.hp = 10, this.ismainch = false, this.isDream = true}); //이거 하면 편하대

  Player.C_realworld({required String name, required bool ismainch})
    : this.name = name,
      this.ismainch = ismainch,
      this.hp = 20,
      this.isDream = false;

  Player.C_Dreamworld({required String name, required bool ismainch, required int hp})
    : this.name = name,
    this.ismainch = ismainch,
    this.hp = hp,
    this.isDream = true;

  Player.fromMap(Map<String, dynamic> pp)
  : name = pp['name'],
  ismainch = pp['ismainch'],
  isDream = pp['isDream'],
  hp = pp['hp'];

}


void main() {
  print("\n————————————————————————————————————————————— 실행 시작 —————————————————————————————————————————————\n",);

  var p1 = Player()
    ..name = 'Omori'
    ..hp = 100
    ..ismainch = true
    ..isDream = true; //편하다
  
  print(p1.introduce());

  var p2 = Player(
    name: 'Basil', 
    hp: 120, 
    ismainch: false, 
    isDream: true
  );
  print(p2.introduce());

  var P1 = Player.C_realworld(
    ismainch: true,
    name: 'SUNNY'
  );
  print(P1.introduce());

  var p3 = Player.C_Dreamworld(name: 'Kel', ismainch: false, hp: 80);
  print(p3.introduce());

  var p4 = [
    {
      'name' : 'hero',
      'hp' : 130,
      'isDream' : true,
      'ismainch' : false
    },
    {
      'name' : 'hero',
      'hp' : 20,
      'isDream' : false,
      'ismainch' : false
    }
  ]; //대충 이런 Map이 있으면

  p4.forEach((pp){
    var pp4 = Player.fromMap(pp);
    print(pp4.introduce());
  }); //오오오오
  
  print(
    "\n———————————————————————————————————————————————— 끝 ————————————————————————————————————————————————\n",
  );
}
