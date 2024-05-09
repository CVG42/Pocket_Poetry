import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YouTube', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Image.asset('images/jarjar2.jpg', width: 400,),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                      child: Text('20:30', style: TextStyle(color: Colors.white, fontSize: 14),),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(5)
                      ),
                    )
                  ],
                ),
              ),
          ]),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2, child: Container(
                padding: EdgeInsets.only(top:10,right:5, bottom:10),
                child: Image.asset('images/chew.png'),
              )),
              Expanded(flex: 8, child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Mozart Música clásica', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                    Text('Username', style: TextStyle(fontSize: 14, color: Colors.grey),),
                    Text('199k views - Hace 19 años', style: TextStyle(fontSize: 14, color: Colors.grey),),
                  ],
                ),
              )),
              Expanded(flex: 1, child: Container(
                padding: EdgeInsets.only(top:10),
                child: Icon(Icons.more_vert),
              )),
            ],
          )
        ],
      ),
    );
  }
}
