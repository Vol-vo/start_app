import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'loginData.dart';

void main() {
  runApp(const StartApp());
}

class StartApp extends StatelessWidget {
  const StartApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Start App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(title: 'Log in'),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});


  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginData _loginData = LoginData();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _seePassword = true;


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
                 },
                 onSaved: (inValue){
                   _loginData.login = inValue!;
                   if (kDebugMode) {
                     print(_loginData.login);
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
                 },
                 onSaved: (inValue){
                   _loginData.password = inValue!;
                   if (kDebugMode) {
                     print(_loginData.password);
                   }
                 },
               ),
             ),
             ElevatedButton(
                 onPressed: (){
                   var _key = _formKey.currentState?.validate();
                   if (_key != null){
                     _formKey.currentState!.save();
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => const MainPageApp()),
                     );
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

class MainPageApp extends StatelessWidget{
  const MainPageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: const Text("Welcome in Start app"),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
            )
          ],
        ),
      ),
    );
  }

}
