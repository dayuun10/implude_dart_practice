import 'dart:io';
import 'dart:math'; //랜덤

var word = File(
  '/Users/hangayun/implude_dart_practice/main/assets/단어목록.txt',
).readAsLinesSync();
var crt_word = '0';
void randomWord() =>
    crt_word = word[Random().nextInt(word.length)]; //현재 단어를 랜덤으로 생성

void main() {
  List<String> nextWordList;
  List<String?> usedWord;
  bool writeAgrin;
  String input_word;
  var life = ['♥ ', '♥ ', '♥ '];

  randomWord();

  while (true) {
    //  crt_word . 한글자씩 쪼개서 리스트 만들기 . 리스트의 모든 값이 만족 하는가((리스트의 항목을 a라고 칠 때) a가 한글인가)
    // 랜덤으로 생성된 단어가 모두 한글로만 이루어져 있는가
    bool isAllKorean = crt_word
        .split('')
        .every((a) => a.codeUnitAt(0) >= 0xAC00 && a.codeUnitAt(0) <= 0xD7A3);
    bool isLong = crt_word.length >= 2;
    bool isNoun = crt_word.split('').last != '다';

    if (isNoun && isLong && isAllKorean) {
      break;
    } else {
      word.removeWhere(
        (wrongWord) => wrongWord == crt_word,
      ); //해당 잘못된 단어 지우기 => 단어 리스트에 중복이 있기 때문에
    }
    randomWord();
  }
  usedWord = [crt_word];

  print(
    "\n\n———————————————————————————————————————————— 끝말잇기 게임 ———————————————————————————————————————————\n\n",
  );
  print("지금부터 시작!\n");

  do {
    print("$crt_word\n");

    print("체력: ${life.join()}");
    stdout.write("\" ${crt_word.split('').last} \" (으)로 시작하는 단어를 입력하세요! => ");

    //단어 입력 받기
    input_word = stdin.readLineSync() ?? '';

    //단어 검사
    do {
      writeAgrin = false; //초기화

      var kindOfErrors = (input_word == '')? [[input_word == '', "단어가 입력되지 않았습니다."],]: [//null이 입력됐을 때
        [input_word.split('').every((a) =>a.codeUnitAt(0) < 0xAC00 || a.codeUnitAt(0) > 0xD7A3,),"단어는 한글로만 이루어져 있어야 합니다. ",],
        [input_word.length < 2, '단어는 두 글자 이상이여야 합니다. '],
        [usedWord.indexOf(input_word) != -1, "이미 사용된 적이 있는 단어입니다. "],
        [word.indexOf(input_word) == -1 && input_word != '',"존재하지 않는 단어입니다. ",],
        [usedWord.last!.split('').last != input_word.split('').first,"전 단어의 끝말과 입력하신 단어의 첫말이 맞지 않습니다.",],
        [input_word.split('').last == '다', "명사만을 입력 해주세요"],
      ];
      print(
        '\n—————————————————————————————————————————————————————————————————————————————————————\n',
      );
      kindOfErrors.forEach((item) {
        if (item[0] == true) {
          print(item[1]);
          writeAgrin = true;
        }
      });
      print('');

      if (writeAgrin && input_word != '') {
        life.removeLast();
      }
      if (life.length < 1) {
        print("3회 이상 입력에 실패하셨습니다. 끝말잇기에서 패배하셨습니다");
        print(
          "\n\n———————————————————————————————————————————— 끝말잇기 종료 ———————————————————————————————————————————\n\n",
        );
        exit(0);
      } else {
        if (writeAgrin) {
          print("체력: ${life.join()}");
          stdout.write(
            "\" ${crt_word.split('').last} \" (으)로 시작하는 단어를 입력하세요! => ",
          );
          input_word = stdin.readLineSync() ?? '';
        }
      }
    } while (writeAgrin);

    usedWord.add(input_word);

    nextWordList = word
        .where((word) => word.startsWith(input_word.split('').last))
        .toList();
    if (nextWordList.isNotEmpty) {
      crt_word =
          nextWordList[Random().nextInt(nextWordList.length)]; //현재 단어를 랜덤으로 생성

      while (true) {
        //  crt_word . 한글자씩 쪼개서 리스트 만들기 . 리스트의 모든 값이 만족 하는가((리스트의 항목을 a라고 칠 때) a가 한글인가)
        // 랜덤으로 생성된 단어가 모두 한글로만 이루어져 있는가
        bool isAllKorean = crt_word
            .split('')
            .every(
              (a) => a.codeUnitAt(0) >= 0xAC00 && a.codeUnitAt(0) <= 0xD7A3,
            );
        bool isLong = crt_word.length >= 2;
        bool isNoun = crt_word.split('').last != '다';
        bool isNotUsed = usedWord.indexOf(crt_word) == -1;

        if (isNoun && isLong && isAllKorean && isNotUsed) {
          usedWord.add(crt_word);
          break;
        } else {
          nextWordList.removeWhere((wrongWord) => wrongWord == crt_word);
          if (nextWordList.length == 0) {
            print("승리하셨습니다!");
            print(
              "\n\n———————————————————————————————————————————— 끝말잇기 종료 ———————————————————————————————————————————\n\n",
            );
            exit(0);
          } //해당 잘못된 단어 지우기 => 단어 리스트에 중복이 있기 때문에
          crt_word = nextWordList[Random().nextInt(nextWordList.length)];
        }
      }
    } else {
      print("승리하셨습니다!");
      print(
        "\n\n———————————————————————————————————————————— 끝말잇기 종료 ———————————————————————————————————————————\n\n",
      );
      break;
    }
  } while (life.length >= 1);
  exit(0);
}
