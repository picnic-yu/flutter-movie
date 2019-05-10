import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import './detail.dart';
Dio dio = new Dio();
class MovieList extends StatefulWidget {
  // 固定写法
  MovieList({Key key,@required this.mt}) : super(key: key);
  // 电影类型
  final String mt;

  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> with AutomaticKeepAliveClientMixin {
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
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  // 通过widget实例
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
          itemCount:mList.length,
          itemBuilder: (BuildContext ctx, int i ){
            var mitem = mList[i];
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx) {
                  return MovieDetail(id:mitem['id'],title:mitem['title']);
                }));
              },
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(width: 1,color: Colors.black87)
                  )
                ),
                
                child: Row(
                  children: <Widget>[
                    Image.network(mitem['images']['small'],width: 130,height: 180,fit: BoxFit.cover,),
                    Container(
                      height: 200,
                      padding: EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("电影名称: ${mitem['title']}"),
                          Text("上映年份: ${mitem['year']}年"),
                          Text('电影类型: ${mitem['genres'].join(' ')}'),
                          Text("评分: ${mitem['rating']['average']}分"),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    
    
    
  }

  getMovieList () async {
    int offset = (page - 1) * pageSize;
    // 分页
    var res = await dio.get('http://www.liulongbin.top:3005/api/v2/movie/${widget.mt}?start=$offset&count=$pageSize');
    var result = res.data;
    // print(result);
    setState((){
      mList = result['subjects'];
      total = result['total'];
    });
    print(mList);
  }
}