import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
Dio dio = new Dio();
class MovieList extends StatefulWidget {
  // 固定写法
  MovieList({Key key,@required this.mt}) : super(key: key);
  // 电影类型
  final String mt;

  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int page = 1;
  int pageSize = 10;
  var mList = [];
  var total = 0;
  // 控件被创建时候 会初始化
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMovieList();
  }
  // 通过widget实例
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text(widget.mt),
    );
  }

  getMovieList () async {
    int offset = (page - 1) * pageSize;
    // 分页
    var res = await dio.get('http://www.liulongbin.top:3005/api/v2/movie/${widget.mt}?start=$offset&count=$pageSize');
    var result = res.data;
    print(result);
    setState((){
      mList = result['subject'];
      total = result['total'];
    });
  }
}