import 'package:flutter/material.dart';
import 'package:flutter_study/i10n/localization_intl.dart';
import 'package:flutter_study/states/index.dart';
import 'package:flutter_study/widgets/index.dart';
import 'package:flutter_study/service/index.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  bool _isFirst = true;
  bool _nameAutoFocus = true;
  bool pwdShow = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (_isFirst) { // 该段代码不能放initState里面,会报错
      _isFirst = false;
      var globalState = Provider.of<GlobalState>(context);
      _unameController.text = globalState.userName;
      if (_unameController.text.isNotEmpty) {
        _nameAutoFocus = false;
      }
    }
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context).login)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: _nameAutoFocus,
                controller: _unameController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).userName,
                  hintText: AppLocalizations.of(context).userName,
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (v) {
                  return v.trim().isNotEmpty ? null : AppLocalizations.of(context).userNameRequired;
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                  labelText: AppLocalizations.of(context).password,
                  hintText: AppLocalizations.of(context).password,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(pwdShow ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        pwdShow = !pwdShow;
                      });
                    },
                  ),
                ),
                obscureText: !pwdShow,
                validator: (v) {
                  return v.trim().isNotEmpty ? null : AppLocalizations.of(context).passwordRequired;
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(height: 55.0),
                  child: RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text(AppLocalizations.of(context).login),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        this._onLogin();
                      }
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onLogin() async {
    showLoading(context);
    var data = await apiService.getUser('hubingym');
    hideLoading(context);
    print(data);
  }
}
