import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://images.news18.com/ibnlive/uploads/2016/04/ironman.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("SL"),
              backgroundColor: Colors.brown,
            ),
          )
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: FadeInImage(
          image: NetworkImage(
              'https://sm.ign.com/ign_es/screenshot/default/avengers-endgame-12k-6y-2560x1440_6sp9.jpg'
              ),
              placeholder: AssetImage('assets/jar-loading.gif'),
              fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.airline_seat_legroom_reduced),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
