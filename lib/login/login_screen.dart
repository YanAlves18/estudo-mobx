import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:projeto/home/home_screen.dart';
import 'package:provider/provider.dart';

import 'login_store.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final loginStore = Provider.of<LoginStore>(context);

    return SafeArea(
      child: Scaffold(
          body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(32),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 16,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Observer(builder: (_) {
                    return TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                      onChanged: loginStore.setCpf,
                      enabled: true,
                      decoration: const InputDecoration(
                        hintText: "Cpf",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.account_circle),
                      ),
                      textAlignVertical: TextAlignVertical.center,
                    );
                  }),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(32),
                  ),
                  child: Observer(builder: (_) {
                    return TextField(
                      keyboardType: TextInputType.text,
                      onChanged: loginStore.setPassword,
                      enabled: true,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Senha',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock),
                      ),
                      textAlignVertical: TextAlignVertical.center,
                    );
                  }),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: Observer(builder: (_) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                        elevation: 2.0,
                      ),
                      onPressed: loginStore.canLogin
                          ? () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            }
                          : null,
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    );
                  }),
                ),
              ]),
            )),
      )),
    );
  }
}
