import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterwolrd_br/app/components/components.dart';
import 'package:flutterwolrd_br/app/modules/login/components/text_field_form.dart';
import 'package:flutterwolrd_br/app/modules/signup/signup_controller.dart';
import 'package:flutterwolrd_br/app/shared/auth/auth_controller.dart';
import 'package:gen_profile/gen_profile.dart';

class SignupPage extends StatefulWidget {
  final String title;
  const SignupPage({Key key, this.title = "Signup"}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final SignupController signupController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: Components.backgroundDecoration(),
        padding: EdgeInsets.all(40.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Observer(
                builder: (_) {
                  return TFF.textFieldForm(
                      labelText: 'E-mail',
                      onChanged: signupController.setEmail,
                      validateString: signupController.validateEmail,
                      initialValue: signupController.email);
                },
              ),
              Observer(
                builder: (_) {
                  return TFF.textFieldForm(
                      labelText: 'Senha',
                      onChanged: signupController.setPassword,
                      validateString: signupController.validatePassword,
                      initialValue: signupController.password);
                },
              ),
              Observer(
                builder: (_) {
                  return TFF.textFieldForm(
                    labelText: 'Confirmar Senha',
                    onChanged: signupController.setPassword,
                    validateString: signupController.validatePassword,
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return RaisedButton(
                    onPressed: !signupController.isButtonDisabled
                        ? signupController.cadastrar
                        : null,
                    child: Text(!signupController.isButtonDisabled
                        ? 'Cadastrar'
                        : 'Preencha os dados corretamente!'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
