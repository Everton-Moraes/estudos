import 'package:flutter/material.dart';
import 'package:mercado/model/produto.dart';

const _appBar = 'Cadastrando Produto';
const _textoBotao = 'Cadastrar';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //Para pegar as informações do TextField necessitamos usar o TextEditingController
  final TextEditingController _controladorNome = TextEditingController();
  final TextEditingController _controladorQuantidade = TextEditingController();
  final TextEditingController _controladorValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text(_appBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controladorNome,
              //Comando para escolher o labelText
              decoration: InputDecoration(
                  labelText: 'Nome',
                  hintText: 'Nome do Produto',
              ),
              //Comando para escolher o tipo do teclado
              keyboardType: TextInputType.text,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _controladorQuantidade,
                decoration: InputDecoration(
                    labelText: 'Quantidade',
                    hintText: '000',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: TextField(
                controller: _controladorValor,
                decoration: InputDecoration(
                  labelText: 'Valor',
                  hintText: '0.00',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: RaisedButton(
                child: Text(_textoBotao),
                onPressed: () {
                  //Criado um método para facilitar no código
                  _cadastraProduto();
                },
              ),
            )
          ],
        ),
      ),
    ));
  }

  void _cadastraProduto() {
    //Pegando o conteúdo digitado ao clicar no botão (necessário o comando .text)
    final String nome = _controladorNome.text;
    final int quantidade = int.tryParse(_controladorQuantidade.text);
    final double valor = double.tryParse(_controladorValor.text);

    final Produto produtoNovo = Produto(nome, quantidade, valor);
    print(produtoNovo);
  }
}
