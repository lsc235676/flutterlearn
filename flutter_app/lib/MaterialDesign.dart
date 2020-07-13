import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
 *用于学习 Material Design 设计风格
 */
void main() {
////1.设置主页
//  runApp(SetMianPage());
//  //2.路由跳转,routers
//  runApp(TestRouters());
//  //3.Scaffold脚手架组件
//  runApp(TestScaffold());
////  4.AppBar应用组件按钮
//  runApp(TestAppBar());
////  5.BottomNavigationBar底部导航条件组
//  runApp(TestBottomNavigationBar());
////  6.DefaultTabController它是TabBar和TabBarView的控制器是关联这两个组件的桥梁
//  runApp(DefaultTabControllerSample());
//  7.TabBar组件 使用的例子
  runApp(TabBarSample());
}

//=======================================================================1.设置主页
class SetMianPage extends StatelessWidget {
  //这是整个应用的主组件
  @override
  Widget build(BuildContext context) {
    //Materia 风格应用
    return MaterialApp(
      title: 'MaterialApp 示例',
      //设置首页
      home: MyhomePage(),
    );
  }
}

//这是一个可以改变的 Widget
class MyhomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyhomePageState();
  }
}

class _MyhomePageState extends State<MyhomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MaterialApp 示例')),
      body: Center(
        child: Text(
          '主页',
          style: TextStyle(
              fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

//=======================================================================2.路由跳转,routers
class TestRouters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '路由跳转,routers',
      //路由配置
      routes: {
        '/first': (BuildContext context) => FirstPage(), //添加路由
        '/second': (BuildContext context) => SecondPage(),
      },
      home: SetMianPage(),
      //设置主题
      theme: ThemeData(
        //主题色
        primarySwatch: Colors.green,
      ),
      initialRoute: '/first', //初始路由页面为 first页面
    );
  }
}

//第一路由页面
class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('这是第一页'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //路由跳转到第二个页面
            Navigator.pushNamed(context, '/second');
          },
          child: Text(
            '这是第一页',
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
    );
  }
}

//第二路由页面
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('这是第二页'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            //路由跳转到第一个页面
            Navigator.pushNamed(context, '/first');
          },
          child: Text(
            '这是第二页',
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
    );
  }
}

//=======================================================================3.Scaffold脚手架组件
class TestScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scaffold脚手架组件',
      home: LayoutDemo(),
    );
  }
}

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //头部元素，比如：左侧返回按钮，中间标题，右侧菜单
      appBar: AppBar(
        title: Text('Scaffold脚手架组件'),
      ),
      //视图类容部分，通常作为应用页面的主显示区域
      body: Center(
        child: Text('Scaffold'),
      ),
      //底部导航栏
      bottomNavigationBar: BottomAppBar(
        child: Container(height: 50),
      ),
      //添加FAB 按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: '增加',
        child: Icon(Icons.add),
      ),
      //FAB 按钮居中显示
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

//=======================================================================4.AppBar应用组件按钮
class TestAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppBar应用组件按钮',
      home: Scaffold(
        appBar: AppBar(
          //左侧图标
          leading: Icon(Icons.backspace),
          //标题
          title: Text('AppBar应用组件按钮'),
          //操作按钮集
          actions: [
            //图标按钮
            IconButton(
              icon: Icon(Icons.search),
              tooltip: '搜索',
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.add),
              tooltip: '添加',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

//=======================================================================5.BottomNavigationBar底部导航条件组
class TestBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyBottomNavigationBar(),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatefulWidget {
  MyBottomNavigationBar({Key key}) : super(key: key);

  @override
  MyBottomNavigationBarState createState() => MyBottomNavigationBarState();
}

class MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  //当前选中项索引
  int _selectedIndex = 1;

  //导航栏按钮选中对应数据
  final _widgetOptions = [
    Text('Index 0:信息'),
    Text('Index 1:通讯录'),
    Text('Index 2:发现'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //顶部应用按钮
      appBar: AppBar(
        title: Text('BottomNavigationBar底部导航条件组'),
      ),
      //中间内容显示区域
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      //底部导航按钮集
      bottomNavigationBar: BottomNavigationBar(
        items: [
          //底部导航栏按钮项，包含图标及文本
          BottomNavigationBarItem(icon: Icon(Icons.chat), title: Text('信息')),
          BottomNavigationBarItem(
              icon: Icon(Icons.contacts), title: Text('通讯录')),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('发现')),
        ],
        currentIndex: _selectedIndex, //当前选中项的索引
        fixedColor: Colors.deepPurple, //选项中项的颜色
        onTap: _onItemTapped, //选择按下处理
      ),
    );
  }

  //选择按下处理，设置当前索引 为 index
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

//=======================================================================6.DefaultTabController它是TabBar和TabBarView的控制器是关联这两个组件的桥梁
class DefaultTabControllerSample extends StatelessWidget {
  final List<Tab> myTabs = [Tab(text: '选项卡一'), Tab(text: '选项卡二')];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //用来组装 TabBar和TabBarView
      home: DefaultTabController(
        //选项卡长度
        length: myTabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('AppBar标题'),
            //添加选项卡按钮，注意此bottom表示在AppBar底部，在整个页面上来看还处于顶部区域
            bottom: TabBar(
              tabs: myTabs,
            ),
          ),
          body: TabBarView(
            children:
                myTabs.map((Tab tab) => Center(child: Text(tab.text))).toList(),
          ),
        ),
      ),
    );
  }
}

//=======================================================================7.TabBar组件 使用的例子
class ItemView {
  final String title; //标题
  final IconData icon;

  const ItemView(this.title, this.icon); //图标
}

//选项卡的类目
const List<ItemView> items = const <ItemView>[
  const ItemView('自驾', Icons.directions_car),
  const ItemView('自行车', Icons.directions_bike),
  const ItemView('轮船', Icons.directions_boat),
  const ItemView('公交车', Icons.directions_bus),
  const ItemView('火车', Icons.directions_railway),
  const ItemView('步行', Icons.directions_walk),
];

//被选中的视图
class SelectedView extends StatelessWidget {
  //视图数据
  final ItemView item;

  const SelectedView({Key key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //获取文本主题样式
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    //添加卡片组件，展示有质感
    return Card(
      //卡片颜色
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //垂直方向最小化处理
          crossAxisAlignment: CrossAxisAlignment.center, //水平方向居中对齐
          children: <Widget>[
            Icon(item.icon, size: 128, color: textStyle.color),
            Text(item.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

class TabBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //用来组装 TabBar和TabBarView
      home: DefaultTabController(
        length: items.length,//选项卡数量
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,//设置可以滚动
              //选项卡 按钮由文本及图表组成
              tabs: items.map((ItemView item) {
                return Tab(
                  icon: Icon(item.icon),
                  text: item.title,
                );
              }).toList(),
            ),
          ),
          //添加选项卡视图
          body: TabBarView(
            //迭代显示选项卡视图
            children: items.map((ItemView itemView) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: SelectedView(item: itemView),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
