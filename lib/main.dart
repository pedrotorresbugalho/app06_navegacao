import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navegação',

      //
      // ROTAS DE NAVEGAÇÃO
      //
      initialRoute: 't1',
      routes: {
        't1': (context) => Tela1(),
        't2': (context) => Tela2(),
        't3': (context) => Tela3(),
        't4': (context) => Tela4(),
      },
    ),
  );
}

//
// Classe para Troca de Dados entre as Telas
//
class Cadastro {
  final String nome;
  final String email;
  final int idade;
  Cadastro(this.nome, this.email, this.idade);
}

//
// TELA 1
//
class Tela1 extends StatefulWidget {
  const Tela1({Key? key}) : super(key: key);

  @override
  _Tela1State createState() => _Tela1State();
}

class _Tela1State extends State<Tela1> {
  var nome = TextEditingController();
  var email = TextEditingController();
  var idade = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 1'),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                child: Column(
                  children: [
                    TextField(
                      controller: nome,
                      decoration: InputDecoration(
                        labelText: 'Nome',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: email,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: idade,
                      decoration: InputDecoration(
                        labelText: 'Idade',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          //Encapsular os dados que serão
                          //trocados entre as telas
                          var obj = Cadastro(
                              nome.text, email.text, int.parse(idade.text));

                          Navigator.pushNamed(context, 't2', arguments: obj);
                        });
                      },
                      child: Text('enviar'),
                    )
                  ],
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, 't2');
              },
              child: Text('próximo'),
            ),
          ],
        ),
      ),
    );
  }
}

//
// TELA 2
//
class Tela2 extends StatefulWidget {
  const Tela2({Key? key}) : super(key: key);

  @override
  _Tela2State createState() => _Tela2State();
}

class _Tela2State extends State<Tela2> {
  @override
  Widget build(BuildContext context) {
    //
    // RECUPERAR OS DADOS QUE FORAM TRANSMITIDOS
    //
    var obj;
    if (ModalRoute.of(context)!.settings.arguments != null) {
      obj = ModalRoute.of(context)!.settings.arguments as Cadastro;
    } else {
      obj = Cadastro('', '', 0);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 2'),

        //
        // REMOVER O BOTÃO VOLTAR DO APPBAR
        //
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Nome'),
            Text(
              obj.nome,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Email'),
            Text(
              obj.email,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Text('Idade'),
            Text(
              obj.idade.toString(),
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 300,
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('anterior'),
                  ),
                ),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 't3');
                    },
                    child: Text('próximo'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//
// TELA 3
//
class Tela3 extends StatelessWidget {
  const Tela3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 3'),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('anterior'),
                  ),
                ),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 't4');
                    },
                    child: Text('próximo'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//
// TELA 4
//
class Tela4 extends StatelessWidget {
  const Tela4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela 4'),
      ),
      body: Container(
        padding: EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('anterior'),
            ),
          ],
        ),
      ),
    );
  }
}
