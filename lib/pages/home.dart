// import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_study/widgets/index.dart';
import 'package:flutter_study/i10n/localization_intl.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).home),
      ),
      body: _buildBody(),
      drawer: MyDrawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(context),
            Expanded(child: _buildMenus(context)),
          ],
        ),
      ),
    );
  }

  _buildHeader(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.only(top: 40, bottom: 20),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ClipOval(
                child: Image.asset("assets/imgs/avatar-default.png", width: 80,),
              ),
            ),
            Text('请登录', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,)),
          ],
        ),
      ),
      onTap: () {
        // Navigator.of(context).pushNamed("login");
      },
    );
  }

  _buildMenus(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.color_lens),
          title: Text(AppLocalizations.of(context).theme),
          onTap: () => Navigator.pushNamed(context, "themes"),
        ),
        ListTile(
          leading: const Icon(Icons.language),
          title: Text(AppLocalizations.of(context).language),
          onTap: () => Navigator.pushNamed(context, "language"),
        ),
        ListTile(
          leading: const Icon(Icons.power_settings_new),
          title: Text(AppLocalizations.of(context).logout),
          onTap: () async {
            var res = await showAlertDialog(context, AppLocalizations.of(context).logoutTip);
            print(res);
          },
        ),
      ],
    );
  }
}
