import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_application/components/pages/tela_cadastro.dart';
import 'package:flutter_application/components/pages/tela_inicial.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../templates/botoes/text_botao.dart';
import '../templates/botoes/botao_icone.dart';
import '../templates/Inputs/estilo_text_fild.dart';
import '../templates/logo.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({Key? key}) : super(key: key);

  @override
  State<TelaLogin> createState() => _LoginState();
}

class _LoginState extends State<TelaLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();

  void _carregaCadastro() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TelaCadastro(),
      ),
    );
  }

  logar() async {
    var urlLogin = Uri.parse(
      "https://back-end-tcc-deploy.lavianii.repl.co/login/${_emailController.text}/${_senhaController.text}",
    );
    await http.get(
      urlLogin,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    ).then((value) async {
      if (value.statusCode == 200) {
        Iterable usuario = json.decode(value.body);
        loginModels.saveUsuario(usuario);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const TelaInicial(),
          ),
        );
      } else if (value.statusCode != 200) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("e-mail ou senha inválidos"),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.red,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0Xff77A8A6),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 100, 35, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Logo(),
                const SizedBox(height: 15),
                Form(
                  key: _formKey,
                  child: EstiloTextFild(
                    controller: _emailController,
                    label: 'Email',
                    hintText: 'Digite o email',
                    iconData: Icons.email_rounded,
                    obscureText: false,
                    textInputAction: TextInputAction.next,
                  ),
                ),
                const SizedBox(height: 1),
                EstiloTextFild(
                  controller: _senhaController,
                  label: 'Senha',
                  hintText: 'Digite a senha',
                  iconData: Icons.lock,
                  obscureText: true,
                  textInputAction: TextInputAction.send,
                  onFieldSubmitted: (_) => logar,
                ),
                const SizedBox(height: 50),
                BotaoIcone(
                  text: 'Entrar',
                  onPressed: logar,
                  icon: Icons.arrow_forward,
                  width: 150,
                  color: 0xff152C42,
                  colorText: 0xffffffff,
                  colorIcon: 0xffffffff,
                ),
                const SizedBox(height: 10),
                TextBotao(
                  colorText: 0xff152C42,
                  text: 'Me cadastrar',
                  onPressed: _carregaCadastro,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
