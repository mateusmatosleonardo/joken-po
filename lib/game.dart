import 'dart:math';
import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  var imageApp = const AssetImage("images/padrao.png");
  var message = "Escolha uma opção abaixo";

  optionSelected(String chooseUser) {
    var options = ["pedra", "papel", "tesoura"];
    var number = Random().nextInt(3);
    var chooseApp = options[number];

    //Exibição da imagem escolhida pelo App
    switch (chooseApp) {
      case "pedra":
        setState(() {
          imageApp = const AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          imageApp = const AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          imageApp = const AssetImage("images/tesoura.png");
        });
        break;
    }

    //Validação do ganhador
    //Usuário ganhador
    if ((chooseUser == "pedra" && chooseApp == "tesoura") ||
        (chooseUser == "tesoura" && chooseApp == "papel") ||
        (chooseUser == "papel" && chooseApp == "pedra")) {
      setState(() {
        message = "Parabéns!!! Você ganhou!";
      });
    } else if ((chooseApp == "pedra" && chooseUser == "tesoura") ||
        (chooseApp == "tesoura" && chooseUser == "papel") ||
        (chooseApp == "papel" && chooseUser == "pedra")) {
      setState(() {
        message = "Infelizmente você perdeu!";
      });
    } else {
      message = "Empatamos";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image(image: imageApp),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => optionSelected("pedra"),
                child: Image.asset("images/pedra.png", height: 95),
              ),
              GestureDetector(
                onTap: () => optionSelected("papel"),
                child: Image.asset("images/papel.png", height: 95),
              ),
              GestureDetector(
                onTap: () => optionSelected("tesoura"),
                child: Image.asset("images/tesoura.png", height: 95),
              )
            ],
          )
        ],
      ),
    );
  }
}
