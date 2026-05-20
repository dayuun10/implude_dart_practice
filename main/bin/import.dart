import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

const apiKey = '194A29FD663C7A4A86EB9B88F9A8135D';

var firstText;
var researchResult;

Future<void> selectWord(String search) async { //api 요청을 주고 받기까지 시간이 조금 걸릭기 때문에 이 함수가 기다려야 되는 함수라는 걸 알려줌
  researchResult = await http.get(
    Uri.parse(
      'https://stdict.korean.go.kr/api/search.do?key=$apiKey&q=$search&req_type=json'
    ));
}

void main() async {
  firstText = String.fromCharCode(44032 + Random().nextInt(11172)); //랜덤한 앞글자 하나 생성(한글)
  await selectWord(firstText);
  print(researchResult.body);
}