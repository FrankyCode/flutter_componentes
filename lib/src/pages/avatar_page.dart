import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
      ),
     floatingActionButton: FloatingActionButton(
        child: Icon(Icons.airline_seat_legroom_reduced),
        onPressed: (){
          Navigator.pop(context);
        },
      ),
    );
  }
}