import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterwolrd_br/app/modules/login/components/text_field_form.dart';
import 'package:flutterwolrd_br/app/modules/login/login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final LoginController loginController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Observer(
                  builder: (_) {
                    return Text_Field_Form.textFieldForm(
                      labelText: 'Login',
                      onChanged: loginController.setEmail,
                      validateString: loginController.validateEmail,
                    );
                  },
                ),
                Observer(
                  builder: (_) {
                    return Text_Field_Form.textFieldForm(
                      labelText: 'Senha',
                      onChanged: loginController.setPassword,
                      validateString: loginController.validatePassword,
                    );
                  },
                ),
                Observer(
                  builder: (_) {
                    return Text(loginController.userModel.email);
                    // loginController.userModel ? 'validados' : 'não validado',
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
