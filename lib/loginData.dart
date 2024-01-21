class LoginData{
  String _login = "";
  String _password = "";

  bool setLogin(String login){
    if (login.contains("@")){
      _login = login;
      return true;
    }
    return false;
  }

  bool setPassword(String password){
    if (password.length >= 8){
      _password = password;
      return true;
    }
    return false;
  }

  Future<String> getPassword() async{
    return _password;
  }

  Future<String> getLogin() async {
    return _login;
  }
}