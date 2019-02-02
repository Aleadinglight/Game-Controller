import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MovingButton extends StatelessWidget{
  final WebSocketChannel channel; 
  final Text name;
  
  // Constructor
  MovingButton({
    this.name, 
    this.channel,
  });
  
  void _sendMoveLeft(){
    channel.sink.add('Left');
    print("left");
  }

  void _sendMoveRight(){
    channel.sink.add('Right');
  }

  void _sendData(Text name){
    if (name.data == '<'){
      _sendMoveLeft();
    }
    if (name.data == '>'){
      _sendMoveRight();
    }
  }

  @override 
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 100.0,
      height: 100.0,
      child: new RaisedButton(
        padding: const EdgeInsets.all(8.0),
        textColor: Colors.white,
        color: Colors.red,
        onPressed: () => _sendData(name),
        child: name,
      ),
    );
  }
}