import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meald/services/AuthService.dart';
import 'package:meald/services/UserService.dart';

class Login extends StatefulWidget {
  
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String email;
  late String password;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  
  final userdata = GetStorage();

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      userdata.write('isLogged', true);

      Authservice.login(_emailController.text,_passwordController.text,context);

    }
  }

  Widget _button() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50.0),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 70, 3),
        borderRadius: BorderRadius.circular(15),
      ),
      child: ElevatedButton(
        onPressed: _login,
        child: Text(
          'Se Connecter',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
    );
  }

 Widget _inputs() {
  return Expanded(
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Theme.of(context).colorScheme.surface,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            onChanged: () {
              setState(() {}); 
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  "E-Mail",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 245, 250, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "Entrez votre email",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
                    onSaved: (String? value) {
                      email = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Entrer votre email";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Mot De Passe",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 245, 250, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Entrez votre Mot De Passe",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    ),
                    onSaved: (String? value) {
                      password = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Entrer votre mot de passe";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (bool? value) {},
                    ),
                    Text(
                      "Me Reconnaitre",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Mot De Passe Oubliée?",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 70, 3),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                _button(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Vous N'avez Pas De Compte?",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/Signup');
                      },
                      child: Text(
                        "S'inscrire",
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 70, 3),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 4, 23),
      body: Column(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              child: Text(
                'Se Connecter',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Veillez Se Connecter Sur Votre Profil Existant',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(119, 255, 255, 255),
            ),
          ),
          SizedBox(height: 100),
          _inputs(),
        ],
      ),
    );
  }
}
