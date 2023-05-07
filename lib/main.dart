import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      title: 'Meu Formulário',
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  bool _switchValue = false;
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Streaming accout'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nome completo:',
              ),
              validator: (value) {
                if (value!.isEmpty == true) {
                  return 'Por favor, digite seu nome.';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'E-mail:',
              ),
              validator: (value) {
                if (value!.isEmpty == true) {
                  return 'Por favor, digite seu e-mail.';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Senha:',
              ),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty == true) {
                  return 'Por favor, digite sua senha.';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            Text('Escolha seu pacote de uso:'),
            RadioListTile(
              title: Text('básico'),
              value: 1,
              groupValue: 0,
              onChanged: (int? value) {},
            ),
            RadioListTile(
              title: Text('Premium'),
              value: 2,
              groupValue: 0,
              onChanged: (int? value) {},
            ),
            SizedBox(height: 16.0),
            Text('Liberar conteúdo adulto na plataforma:'),
            Switch(
              value: _switchValue,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('avalie a qualidade do formulário:'),
            Slider(
              value: _sliderValue,
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
              min: 0.0,
              max: 100.0,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState != null) {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Criando conta...')),
                    );
                  }
                }
              },
              child: Text('Criar conta'),
            ),
          ],
        ),
      ),
    );
  }
}
