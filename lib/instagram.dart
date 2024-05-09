import 'package:flutter/material.dart';

class insta extends StatelessWidget {
  const insta({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Instagram", style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 1, child: Container(
                padding: EdgeInsets.only(top:5,right:5, bottom:10, left: 5),
                  child: Image.asset('images/chew.png'))),
              Expanded(flex: 6, child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('username',style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Ubicación, Mundo')
                  ],
                ),
              )),
              Container(child: Expanded(flex: 1, child: Icon(Icons.more_horiz)))
            ],
          ),
          Image.asset('images/space.jpg'),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(padding: EdgeInsets.only(top:5,left:10),child: Icon(Icons.favorite_border, size: 30)),
              Container(padding: EdgeInsets.only(top:5,left:18),child: Icon(Icons.mode_comment_outlined, size: 30)),
              Container(padding: EdgeInsets.only(top:5,left:25),child: Icon(Icons.send_outlined, size: 30)),
              Container(
                  padding: EdgeInsets.only(top:5,left:220),
                  child: Icon(Icons.bookmark_border, size: 30))
            ],
          ),
          Row(
            children: [
              Container(padding: EdgeInsets.only(left: 10,top: 3),child: Text("1k likes", style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
          Row(
            children: [
              Container(padding: EdgeInsets.only(left: 10, top: 3),child: Text("username", style: TextStyle(fontWeight: FontWeight.bold))),
              Container(padding: EdgeInsets.only(left: 5, top: 3),child: Text("Este es un post"))
            ],
          ),
          Row(
            children: [
              Container(padding: EdgeInsets.only(left:10, top: 3),child: Text("View comments", style: TextStyle(color: Colors.grey)))
            ],
          )
        ],
      ),
    );
  }
}
