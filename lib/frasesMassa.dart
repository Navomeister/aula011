import 'dart:math';
import 'package:aula011/frase.dart';
import 'package:flutter/material.dart';

class Frases extends StatefulWidget {
  const Frases({super.key});

  @override
  State<Frases> createState() => _FrasesState();
}

class _FrasesState extends State<Frases> {
  int atual = 0;

// cria os objetos Frase que vão ser usados
  List<Frase> lista = [
    Frase(
        frase:
            "Ei, olha o que eu achei outro dia! É uma pedra de estimação... Maneiro, né? Vou chamar ele de Hector!!",
        urlImagem:
            "https://static.wikia.nocookie.net/omori/images/7/71/Hector_Sticker.png/revision/latest?cb=20221105051929&format=original"),
    Frase(
        frase:
            "Ah, isso!! Finalmente ar fresco!! A natureza é realmente incrível. Bem, vamos indo!",
        urlImagem:
            "https://static.wikia.nocookie.net/omori/images/a/a9/DWKEL3.png/revision/latest?cb=20210111043409&format=original"),
    Frase(
        frase: "Ei, qual foi... eu juro que tomei banho hoje.",
        urlImagem:
            "https://static.wikia.nocookie.net/omori/images/4/42/DWKEL7.png/revision/latest?cb=20210111043945&format=original"),
    Frase(
        frase: "Sinto muito pela situação. Vai melhorar logo logo, aguenta aí!",
        urlImagem:
            "https://static.wikia.nocookie.net/omori/images/f/fe/DWAUBREY2.png/revision/latest?cb=20210111044353&format=original"),
    Frase(
        frase:
            "Eeh... você tá cometendo um grande erro. Você não pode casar consigo mesmo...",
        urlImagem:
            "https://static.wikia.nocookie.net/omori/images/f/f8/DWAUBREY5.png/revision/latest?cb=20210111045057&format=original"),
    Frase(
        frase: "Olá! Bem vindo de volta! Tudo pronto pra ir?",
        urlImagem:
            "https://static.wikia.nocookie.net/omori/images/1/18/DWHERO2.png/revision/latest?cb=20210520085048&format=original"),
    Frase(
        frase:
            "Você nunca sabe quando vai precisar da ajuda de alguém. Somos mais fortes trabalhando juntos!",
        urlImagem:
            "https://static.wikia.nocookie.net/omori/images/9/9b/DWHERO3.png/revision/latest?cb=20210111035434&format=original"),
    Frase(
        frase: "...",
        urlImagem:
            "https://static.wikia.nocookie.net/omori/images/c/ce/Omori_Portrait.png/revision/latest?cb=20210329090846&format=original"),
    Frase(
        frase: "Por favor, dinheiros...",
        urlImagem:
            "https://static.wikia.nocookie.net/omori/images/3/38/Omoli_Sticker.png/revision/latest?cb=20210720083420&format=original"),
    Frase(
        frase: "Tá tudo bem, não se preocupa. Acidentes acontecem...",
        urlImagem:
            "https://static.wikia.nocookie.net/omori/images/4/4a/DWBASIL2.png/revision/latest?cb=20210521063034&format=original")
  ];
  // pega um número aleatório entre 0 e 10 (tamanho da lista)
  var aleatorio = Random().nextInt(10);

  // função para pegar outro número aleatório
  void _mudar() {
    // adicional para evitar repetir a frase
    atual = aleatorio;
    while (atual == aleatorio) {
      setState(() {
        aleatorio = Random().nextInt(lista.length);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // front end do aplicativo
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases Aleatórias de OMORI"),
        // adiciona uma imagem de fundo para o AppBar
        flexibleSpace: Image(
            image: NetworkImage(
                "https://modworkshop.net/mydownloads/previews/85614_1663385681_b5d551de7d6707c3345902b9065f0219.webp"),
            fit: BoxFit.cover),
        // tira a cor de fundo
        backgroundColor: Colors.transparent,
      ),

      // corpo central do app
      // Stack para poder colocar elementos um em cima do outro
      body: Stack(
        children: <Widget>[
          // Container contendo a imagem de fundo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/736x/26/48/b7/2648b7c558b49bff37c8522746b4d5bf.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Coluna centralizada(?) com os elementos em cima da imagem de fundo
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Título do corpo centralizado
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Frase do dia:",
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                ),
              ),

              // Imagem da Frase centralizada
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Image.network(
                    lista[aleatorio].urlImagem,
                    width: 200,
                    height: 200,
                    scale: 0.5,
                  ),
                ),
              ),

              // Frase centralizada, com tamanho fixo para evitar que o botão se desloque
              Center(
                child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Container(
                      height: 100,
                      child: Text(
                        lista[aleatorio].frase,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ),

              // Botão com padding para dar espaço da Frase
              Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                    height: 75,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: _mudar,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 57, 238, 231),
                        foregroundColor: Color.fromARGB(255, 30, 73, 190),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        textStyle: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 116, 21, 255)),
                      ),
                      child: Text('Nova Frase'),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
