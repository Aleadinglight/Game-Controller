import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Controller extends StatelessWidget{

  final channel= IOWebSocketChannel.connect('ws://192.168.0.100:3000');

  void _sendMoveLeft(){
    channel.sink.add('Left');
  }

  void _sendMoveRight(){
    channel.sink.add('Right');
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.red,
              onPressed: _sendMoveLeft,
              child: new Text("<"),
            ),
            new RaisedButton(
              padding: const EdgeInsets.all(8.0),
              textColor: Colors.white,
              color: Colors.red,
              onPressed: _sendMoveRight,
              child: new Text(">"),
            ),
          ],
        ),
      )
    );
  }
}
