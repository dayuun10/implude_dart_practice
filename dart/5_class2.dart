enum Team{blue,red}

class Human{
  var age;
  var name;
  Human({this.name, this.age});
  void intro(){
      print('$name은 $age살');
  }
}



class Player extends Human{
  late final Team team ;
  
  Player({
    required this.team,
    required super.name,
    required super.age
    });
  @override
  void intro(){
    super.intro();
    print("${this.team.name}팀이다.");
  }
}



void main(){
  print("\n————————————————————————————————————————————— 실행 시작 —————————————————————————————————————————————\n",);

  var player = Player(team: Team.blue, name: 'SUNNY', age: 14);
  player.intro();

  print("\n———————————————————————————————————————————————— 끝 ————————————————————————————————————————————————\n",);

}