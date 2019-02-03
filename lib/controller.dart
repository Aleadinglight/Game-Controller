import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:game_controller/movingButton.dart';
class Controller extends StatelessWidget{

  final channel = IOWebSocketChannel.connect('ws://192.168.0.100:3000');

  void _sendMoveLeft(){
    channel.sink.add('Left');
    print("left");
  }

  void _sendMoveRight(){
    channel.sink.add('Right');
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MovingButton( 
                  name: new Text(">"), 
                  channel: this.channel,
                ),
                MovingButton(
                  name: new Text("<"),
                  channel: this.channel,
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
