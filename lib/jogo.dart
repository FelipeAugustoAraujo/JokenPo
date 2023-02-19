import "package:flutter/material.dart";
import "dart:math";


class Jogo extends StatefulWidget {
  const Jogo({Key? key}) : super(key: key);

  @override
  State<Jogo> createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imageApp  = AssetImage("image/padrao.png");
  String _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {

    var opcoes = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];


    switch(escolhaApp){
      case"pedra":
        setState(() {

          this._imageApp = AssetImage("image/pedra.png");

        });
        break;
      case"tesoura":
        setState(() {

          this._imageApp = AssetImage("image/tesoura.png");

        });
        break;
      case"papel":
        setState(() {

          this._imageApp = AssetImage("image/papel.png");

        });
        break;

    }
    if(
    (escolhaUsuario == "pedra" && escolhaApp == "tesoura" ||
        escolhaUsuario == "tesoura" && escolhaApp == "papel" ||
        escolhaUsuario == "papel" && escolhaApp == "pedra")
    ){

      setState(() {
        this._mensagem = "Parabens voce ganhou";
      });

    }else if (
    escolhaApp == "pedra" && escolhaUsuario == "tesoura" ||
        escolhaApp == "tesoura" && escolhaUsuario == "papel" ||
        escolhaApp == "papel" && escolhaUsuario == "pedra"

    ){

      setState(() {
        this._mensagem = "Que pena voce perdeu";
      });


    }else{

      setState(() {
        this._mensagem = "Empate";
      });


    }



  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          
          const Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(

              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(

                fontSize: 20,
                fontWeight: FontWeight.bold
              ),

            ),
          ),


          Image(image: this._imageApp),



           Padding(padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              this._mensagem,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),

            ),
          ),




          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              GestureDetector(

                onTap: () => _opcaoSelecionada("papel"),
                child: Image.asset("image/papel.png" , height: 100),


              ),
              GestureDetector(

                onTap: () => _opcaoSelecionada("pedra"),
                child : Image.asset("image/pedra.png" , height: 100),


              ),
              GestureDetector(

                  onTap:  () => _opcaoSelecionada("tesoura"),
                  child : Image.asset("image/tesoura.png", height: 100)


              ),



            ],

          )
        ],
      ),
    );
  }


}
