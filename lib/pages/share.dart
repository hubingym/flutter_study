import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SharePage extends StatefulWidget {
  @override
  _SharePageState createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share Plugin Demo')
      ),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: 'Share:',
                hintText: 'Enter some text and/or link to share',
              ),
              maxLines: 4,
              onChanged: (String value) => setState(() { text = value; }),
            ),
            RaisedButton(
              child: const Text('Share'),
              onPressed: () {
                if (text.isNotEmpty) {
                  Share.share(text);
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
