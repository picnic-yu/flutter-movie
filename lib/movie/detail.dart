import 'package:flutter/material.dart';
class MovieDetail extends StatefulWidget {
  MovieDetail({Key key, @required this.id,@required this.title}) : super(key: key);
  String id;
  String title;
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(widget.title),
        centerTitle: true,
      ),
      body: Text(widget.id),
    );
  }
}