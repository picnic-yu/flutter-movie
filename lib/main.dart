import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text('电影列表'),
          centerTitle: true,
          // 右侧行为按钮
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search),onPressed: (){},)
          ],
        ),
        body: Text('33'),
        bottomNavigationBar:Container(
          decoration: BoxDecoration(
            color: Colors.black
          ),
          height: 50,
          child: TabBar(
            labelStyle: TextStyle(height: 0,fontSize: 10),//文本不占高度 height0
            tabs: <Widget>[
              Tab(icon: Icon(Icons.movie_filter),text: '正在热映',),
              Tab(icon: Icon(Icons.movie_creation),text: '即将上映',),
              Tab(icon: Icon(Icons.local_movies),text: 'Top200',),
            ],
          ),
        ) ,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.all(0),
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('南川'),
                accountEmail: Text('164005206@qq.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('http://b-ssl.duitang.com/uploads/item/201706/22/20170622131955_h4eZS.thumb.700_0.jpeg'),
                ),
                decoration: BoxDecoration(
                  // 背景图片
                  
                  image: DecorationImage(
                    fit:BoxFit.cover,
                    image:NetworkImage('https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1557465057727&di=7676697988ddeff34e9f4012c8937f89&imgtype=0&src=http%3A%2F%2Fimg17.3lian.com%2Fd%2Ffile%2F201702%2F10%2F6649171de5aa01019848317d778a3410.jpg') )
                ),
              ),
              ListTile(title: Text('用户反馈'),trailing: Icon(Icons.feedback),),
              ListTile(title: Text('系统设置'),trailing: Icon(Icons.settings),),
              ListTile(title: Text('我要发布'),trailing: Icon(Icons.send),),
              Divider(),
              ListTile(title: Text('注销'),trailing: Icon(Icons.exit_to_app),)
            ],
          ),
        ),
      ),
    );
  }
}
