import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/movies/presentation/screens/movie_screen.dart';

class test extends StatelessWidget {
  const test({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=> MainMoviesScreen()));
        }, child: Text('Screen'),),
      ),
    );
  }
}
