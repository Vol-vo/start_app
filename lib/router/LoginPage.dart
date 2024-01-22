import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../features/crypto_list/crypto_list.dart';
import '../data/loginData.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginData _loginData = LoginData();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _seePassword = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        automaticallyImplyLeading: false,
      ),
      body: Center(
          key: _formKey,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your email',
                    ),
                    validator: (val){
                      if(val!.isEmpty){
                        return "Empty";
                      }
                      return null;
                    },
                    onSaved: (inValue){
                      _loginData.setLogin(inValue!);
                      if (kDebugMode) {
                        print(_loginData.getLogin());
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    obscureText: _seePassword,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter your password',
                    ),
                    validator: (String? inValue){
                      if (inValue!.length < 10){
                        return 'Password must be >= 10 in length';
                      }
                      return null;
                    },
                    onSaved: (inValue){
                      _loginData.setPassword(inValue!);
                      if (kDebugMode) {
                        print(_loginData.getPassword());
                      }
                    },
                  ),
                ),
                ElevatedButton(
                    onPressed: (){
                      var key = _formKey.currentState?.validate();
                      if (key != null){
                        _formKey.currentState!.save();
                        Navigator.pushNamed(context, "/coinList");
                      }
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MainPageApp()),
                      );
                    },
                    child: const Text("Log in")
                )
              ],
            ),
          )
      ),
    );
  }

}