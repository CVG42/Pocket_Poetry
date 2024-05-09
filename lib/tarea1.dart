import 'package:flutter/material.dart';

class ActividadYoutube extends StatelessWidget {
  const ActividadYoutube({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actividad 1'),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('images/jarjar2.jpg'),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 45, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 10, child: Image.asset('images/chew.png')),
                Expanded(flex: 90, child: Container(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Jarjar Binks Classical Music for studying - Best hits of all time'),
                          Text('Blah blah', style: TextStyle(color: Colors.grey)),
                          Text('100k vistas - 7 días',style: TextStyle(color: Colors.grey))
                        ],
                      ),
                  ),
                ),
                ),
                Expanded(flex: 5, child: Icon(Icons.more_vert))
              ],
            ),
          )
          //Icon(Icons.more_vert),
        ],
      ),
    );
  }
}
