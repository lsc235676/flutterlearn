import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

void main() {
////  1.Hello World 程序
//  runApp(HelloWorld());
////2.使用 第三方包  url_launcher
//  runApp(UseOtherPakge());
////3.状态管理组件 StatefulWidget
//  runApp(TestStatefulWidget());
////  4.常用组件 Container
//  runApp(TestContainer());
////  5.常用组件 Image
//  runApp(TestImage());
////  6.常用组件 Text
//  runApp(MaterialApp(
//    title: '常用组件 Text',
//    home: TestText(),
//  ));
////  7.常用组件 Icon
//  runApp(TestIcon());
////  8.常用组件 IconButton,该组件可交互
//  runApp(TestIconButton());
////  9.常用组件 RaisedButton,该组件可交互，会有触摸效果
//  runApp(TestRaisedButton());
////  10.常用组件 Listview,基础列表
//  runApp(TestListView());
////  11.常用组件 Listview,基础列表 设置水平方向
//  runApp(TestListviewHoritation());
////  12.常用组件 Listview 和其构造器itemBuilder
// runApp(new TestListviewAndItemBuilder(items: new List<String>.generate(500,(i) => "Itemm $i"),));
////  13.常用组件 GridView 网格列表组件
//  runApp(new TestGridView());
  //14.常用组件 Form 和 TextFormField 表单组件
  runApp(LoginPage());
}

//===================================================================1.Hello World 程序
class HelloWorld extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcom to Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Welcom to Flutter'),
        ),
        body: Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}

//===================================================================2.使用 第三方包  url_launcher
//搜索第三方包的地址 https://pub.flutter-io.cn/
class UseOtherPakge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '使用第三方包示例',
      home: Scaffold(
        appBar: AppBar(
          title: Text('使用第三方包示例'),
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () {
              //指定url 并发起请求
              const url = 'https://www.baidu.com';
              //调用 url_launcher 包里面的 launch 方法
              launch(url);
            },
            child: Text('打开百度'),
          ),
        ),
      ),
    );
  }
}

//===================================================================3.状态管理组件 StatefulWidget
//TestStatefulWidget 不需要做状态管理，所以集成StatelessWidget
class TestStatefulWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 示例',
      theme: ThemeData(
        //自定义主题
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '无状态和有状态组件示例'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //构造方法
  MyHomePage({Key key, this.title}) : super(key: key);

  //标题
  final String title;

  //必须重写 createState 方法
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

//状态必须继承 State 类，注意后面需要指定<MyHomePage>
class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0; //计数器

  void _incrementCounter() {
    //调用 State 类里面的 setState 方法来更改状态值,使得计数器加1
    setState(() {
      //计数器变量，每次点击让其加1
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      //居中布局
      body: Center(
        //垂直布局
        child: Column(
          //主轴居中对齐
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('你点击右下角的次数:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ), //绑定计数器的值
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, //点击+按钮调用自增函数
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
    );
  }
}

//===================================================================4.常用组件 Container
class TestContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Container 容器组件',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Container 容器组件'),
        ),
        body: Center(
          child: Container(
            width: 200,
            height: 200,
            //使子类居中显示
            alignment: Alignment.center,
            //添加边框装饰效果
            decoration: BoxDecoration(
              color: Colors.white,
              //设置上下左右 四个边框样式
              border: new Border.all(
                  color: Colors.grey, //边框颜色
                  width: 8 //边框粗细
                  ),
              borderRadius:
                  const BorderRadius.all(const Radius.circular(8)), //边框的弧度
            ),
            child: Text(
              'Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28),
            ),
          ),
        ),
      ),
    );
  }
}

//===================================================================5.常用组件 Image
class TestImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image 组件',
      home: ImageDemo(),
    );
  }
}

class ImageDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //居中展示
    return Center(
      //添加网络图片
      child: Image.network(
        //图片url
        'https://www.baidu.com/img/dong_54209c0ff3da32eecc31f340c08a18f6.gif',
        //填充模式
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

//===================================================================6.常用组件Text
class TestText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('文本组件'),
      ),
      body: Column(
        children: <Widget>[
          //文件组件
          Text(
            '红色字体+黑色删除线+18号+斜体+粗体',
            style: TextStyle(
                //字体颜色
                color: const Color(0xffff0000),
                //文本装饰器(删除线)
                decoration: TextDecoration.lineThrough,
                //文本装饰器颜色
                decorationColor: const Color(0xff000000),
                //字体大小
                fontSize: 18,
                //字体粗细
                fontWeight: FontWeight.bold,
                //文字间距
                letterSpacing: 2),
          ),
          Text(
            '橙色+下划线+24号',
            style: TextStyle(
                color: const Color(0xffff9900),
                decoration: TextDecoration.underline,
                fontSize: 24),
          ),
          Text(
            '上划线+虚线+23号',
            style: TextStyle(
              decoration: TextDecoration.overline,
              decorationStyle: TextDecorationStyle.dashed,
              fontSize: 23,
              //字体样式
              fontStyle: FontStyle.normal,
            ),
          ),
          Text(
            '23号+斜体+加粗+字间距6',
            style: TextStyle(
                fontSize: 23,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                letterSpacing: 6),
          ),
        ],
      ),
    );
  }
}

//===================================================================7.常用组件 icon,该组件不可交互
class TestIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '常用组件 icon,该组件不可交互',
      home: Scaffold(
        appBar: AppBar(
          title: Text('常用组件 icon,该组件不可交互'),
        ),
        body: Icon(
          //图标类容
          Icons.phone,
          //图标颜色
          color: Colors.green[600],
          //图标大小
          size: 80,
        ),
      ),
    );
  }
}

//===================================================================8.常用组件 IconButton,该组件可交互
class TestIconButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '常用组件 IconButton,该组件可交互',
      home: Scaffold(
        appBar: AppBar(
          title: Text('常用组件 IconButton,该组件可交互'),
        ),
        body: Center(
          //添加图标按钮
          child: IconButton(
            //图标元素
            icon: Icon(
              Icons.volume_up,
              size: 48.0,
              color: Colors.green[800],
            ),
            //按钮提示
            tooltip: '按下操作',
            //按下事件响应
            onPressed: () {
              print('按下操作');
            },
          ),
        ),
      ),
    );
  }
}

//===================================================================9.常用组件 RaisedButton,该组件可交互，会有触摸效果
class TestRaisedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '常用组件 RaisedButton,该组件可交互，会有触摸效果',
      home: Scaffold(
        appBar: AppBar(
          title: Text('常用组件 RaisedButton,该组件可交互，会有触摸效果'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('RaisedButton 组件'),
            onPressed: () {
              print('按下操作');
            },
          ),
        ),
      ),
    );
  }
}

//===================================================================10.常用组件 Listview,基础列表
class TestListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '常用组件 Listview,基础列表',
      home: Scaffold(
        appBar: AppBar(
          title: Text('常用组件 Listview,基础列表'),
        ),
        //添加基础列表 Listviw
        body: ListView(
          //添加静态数据
          children: <Widget>[
            //ListTitle 是一种样式相对固定的列表项，比如 微信的 "发现" 页面
            ListTile(
              leading: Icon(Icons.alarm),
              title: Text('Alarm'),
            ),
            ListTile(
              leading: Icon(Icons.voice_chat),
              title: Text('voice_chat'),
            ),
            ListTile(
              leading: Icon(Icons.save),
              title: Text('save'),
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('mail'),
            ),
          ],
        ),
      ),
    );
  }
}

//===================================================================11.常用组件 Listview,基础列表 设置水平方向
class TestListviewHoritation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '常用组件 Listview,基础列表 设置水平方向',
      home: Scaffold(
        appBar: AppBar(
          title: Text('常用组件 Listview,基础列表 设置水平方向'),
        ),
        //添加容器
        body: Container(
          //顶部外边距20
          margin: EdgeInsets.symmetric(vertical: 20),
          //高度200
          height: 200,
          child: ListView(
            //设置水平方向排列
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              Container(
                width: 160,
                color: Colors.red,
              ),
              Container(
                width: 160,
                color: Colors.amber,
              ),
              Container(
                width: 160,
                child: Column(
                  children: <Widget>[
                    Text(
                      '水平',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Colors.black),
                    ),
                    Text(
                      '列表',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 36,
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.list,
                      color: Colors.green,
                    )
                  ],
                ),
              ),
              Container(
                width: 160,
                color: Colors.blue,
              ),
              Container(
                width: 160,
                color: Colors.yellow,
              ),
              Container(
                width: 160,
                color: Colors.pinkAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//===================================================================12.常用组件 Listview 和其构造器itemBuilder
class TestListviewAndItemBuilder extends StatelessWidget {
  final List<String> items;

  const TestListviewAndItemBuilder({Key key, this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '常用组件 Listview 和其构造器itemBuilder',
      home: Scaffold(
        appBar: AppBar(
          title: Text('常用组件 Listview 和其构造器itemBuilder'),
        ),
        //使用 ListView.builder 来构造列表项
        body: ListView.builder(
          //列表长度
          itemCount: items.length,
          //列表构造器:context为上下文，index表示列表索引
          itemBuilder: (context, index) {
            return ListTile(
              //左侧图标
              leading: Icon(Icons.alarm),
              //文本内容
              title: Text('${items[index]}'),
            );
          },
        ),
      ),
    );
  }
}

//===================================================================13.常用组件 GridView 网格列表组件
class TestGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '常用组件 GridView 网格列表组件',
      home: Scaffold(
        appBar: AppBar(
          title: Text('常用组件 GridView 网格列表组件'),
        ),
        //使用 GridView.count 来创建网格
        body: GridView.count(
          primary: false,
          //四周增加一定的空隙
          padding: const EdgeInsets.all(20),
          crossAxisSpacing: 30,
          //一行上放三列数据
          crossAxisCount: 3,
          //数据项：五列三行
          children: <Widget>[
            const Text('第一行第一列'),
            const Text('第一行第二列'),
            const Text('第一行第三列'),
            const Text('第二行第一列'),
            const Text('第二行第二列'),
            const Text('第二行第三列'),
            const Text('第三行第一列'),
            const Text('第三行第二列'),
            const Text('第三行第三列'),
            const Text('第四行第一列'),
            const Text('第四行第二列'),
            const Text('第四行第三列'),
            const Text('第五行第一列'),
            const Text('第五行第二列'),
            const Text('第五行第三列'),
          ],
        ),
      ),
    );
  }
}

//===================================================================14.常用组件 Form 和 TextFormField 表单组件
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  //全局key 用来获取Form 表单组件
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  //用户名
  String userName;

  //密码
  String password;

  void login() {
    //读取当前的Form 状态
    var loginForm = loginKey.currentState;
    //验证表单
    if (loginForm.validate()) {
      loginForm.save();
      print('userName:' + userName + 'password:' + password);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Form 表单示例'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              //添加类边框
              padding: const EdgeInsets.all(16),
              //添加Form 表单
              child: Form(
                key: loginKey,
                child: Column(
                  children: <Widget>[
                    //文本输入框表单组件
                    //文本输入框表单组件
                    TextFormField(
                      //装饰器
                      decoration: InputDecoration(
                        //提示文本
                        labelText: '请输入用户名',
                      ),
                      //接收输入参
                      onSaved: (value){
                        userName=value;
                      },
                      onFieldSubmitted: (value){},
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        //提示文本
                        labelText: '请输入密码',
                      ),
                      obscureText: true,
                      //验证表单
                      validator: (value){
                        return value.length<6?'密码长度不能小于6':null;
                      },
                      onSaved: (value){
                        password=value;
                      },

                    ),
                  ],
                ),
              ),
            ),
            //限定容器大小
            SizedBox(
              width: 340,
              height: 42,
              //添加登录按钮
              child: RaisedButton(
                onPressed: login,
                child: Text(
                  '登录',
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
