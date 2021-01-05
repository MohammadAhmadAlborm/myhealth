import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:myhealth/NavigationBar/camera.dart';  
import 'search.dart';
import 'NavigationBar/bimCalculator.dart';
import 'NavigationBar/health.dart';
import 'NavigationBar/calorisCal.dart';
import 'NavigationBar/profile.dart';
import 'dashboard.dart';

void main() =>runApp(MyApp());
class MyApp extends StatelessWidget
{
  Widget build(BuildContext context)
  {
    return new MaterialApp(
      
      title: 'MyHealth',
      theme: ThemeData(
        primarySwatch: Colors.pink
        
      ),
      home: MyHomePage(),
      
      
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _MyHomePageState createState()=>_MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{
    

  int _currentIndex = 0;
  final List<Widget>_children=[
    HomeCaloris(),
    BimCalculator(),
    Dashboard(),
    MainCamera(),
    AccountPage(),

    

  ];
  GlobalKey _bottomNavigationKey = GlobalKey();
  void onTappedBar(int index)
  {
    setState(() {
      _currentIndex=index;
    });
  }
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(     
        title: Text('MyHealth'),
        actions:<Widget> [
          IconButton(
            onPressed: (){
              showSearch(context: context,delegate: DataSearch());
            },
            icon: Icon(Icons.search),
            color: Colors.white,
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(
          padding: EdgeInsets.zero,
          children:<Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink,
                ),
                child: Text('MyHealth',style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  ),
                  ),
                  ),
                  ListTile(
                    
                    leading: Icon(Icons.message),
                    title: Text('Messages'),
                    
                    ),
                    ListTile(
                      leading: Icon(Icons.account_circle),
                      title: Text('Profile'),
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings'),
                        ),
                        ],
                        ),
                        ),
                        bottomNavigationBar: CurvedNavigationBar(
                          
                          key: _bottomNavigationKey,
                          index: 0,
                          height: 50.0,
                          items: <Widget>[
                            Icon(Icons.today, size: 30),
                            Icon(Icons.local_fire_department, size: 30),
                            Icon(Icons.favorite, size: 30),
                            Icon(Icons.camera_alt,size: 30),
                            Icon(Icons.person, size: 30),


                            Icon(Icons.line_weight, size: 30),
                            

                          ],
                          color: Colors.white,
                          buttonBackgroundColor: Colors.white,
                          backgroundColor: Colors.pink,
                          animationCurve: Curves.easeInOut,
                          animationDuration: Duration(milliseconds: 600),
                          onTap: onTappedBar,
                          
                        ),
                        body: _children[_currentIndex],
                        
                        
    );
  }
} 

