import '../models/usuario_models.dart';

/* Classe utilizada para controlar as informaçoes do usuario.
   Existem dois metodos getUser pois tem retornos diferentes,
   e são utilizados para funçoes diferentes
*/ 

class LoginController {
  
  Iterable<dynamic> usuario = [];

  saveUsuario(Iterable user) async {
    if (user.isEmpty) {
      throw ('usuario vazio');
    }

    return usuario = user;
  }

  Future<Iterable> getUsuario() async {
    if (usuario.isEmpty) {
      throw ('usuario vazio');
    }
    return usuario;
  }

  Future<bool> verificarUsuario() async {
    final usuario = await getUsuario();

    if (usuario.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<List<Usuario>> getUser() async {
    Iterable user = await getUsuario();
    return user.map((model) => Usuario.fromJson(model)).toList();
  }

  Future<String> getEmail() async {
    List<Usuario> usuario = await getUser();
    return usuario.map((e) => e.email).first;
  }

  Future<String> getNome() async {
    List<Usuario> usuario = await getUser();
    return usuario.map((e) => e.nome).first;
  }

    Future<String> getSenha() async {
    List<Usuario> usuario = await getUser();
    return usuario.map((e) => e.senha).first;

  }

  Future<int> getId() async {
    List<Usuario> usuario = await getUser();
    return usuario.map((e) => e.id).first;

  }
}
