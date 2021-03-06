import 'package:flutter/material.dart';
import 'package:myhealth/Water/account_page.dart';
import 'package:myhealth/Water/history_page.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class WaterPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new WaterPageState();
  }
}

class WaterPageState extends State<WaterPage> {
  double waterSize = 100.0;
  double allWaterSize = 2300.0;
  double percent = .0;

  @override
  Widget build(BuildContext context) {
    final topAppBar = AppBar(
      elevation: 0.toDouble(),
      title: Text('Water Reminder'),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
    final bottomNavigation = BottomAppBar(
      notchMargin: 4.0,
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
              icon: Icon(
                Icons.calendar_today,
              ),
              onPressed: () {
                _gotoHistory();
              }),
          IconButton(
              icon: Icon(
                Icons.account_circle,
              ),
              onPressed: () {
                _gotoAccount();
              }),
        ],
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.local_drink),
        label: const Text('Drink'),
        backgroundColor: Colors.indigo,
        onPressed: _incrementCounterWater,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomNavigation,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 8.0,
              ),
              ListTile(
                title: Text(
                  'Welcome Huy Nguyen',
                  style: Theme.of(context).textTheme.headline,
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  '${DateFormat.yMMMd().format(new DateTime.now())}',
                  textAlign: TextAlign.center,
                ),
              ),
              Flexible(
                child: FractionallySizedBox(
                  heightFactor: 0.9,
                  widthFactor: 1.0,
                  alignment: Alignment.topCenter,
                  child: new CircularPercentIndicator(
                    radius: 200.0,
                    lineWidth: 13.0,
                    animation: true,
                    percent: percent <= 1.0 ? percent : 1.0,
                    center: new Text(
                      '${(percent * 100).roundToDouble()} %',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    footer: new Text(
                      '$waterSize / $allWaterSize ml',
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                    ),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.indigo,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _incrementCounterWater() {
    waterSize += 100;
    percent = waterSize / allWaterSize;
    setState(() {});
  }

  void _gotoHistory() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => HistoryPage()));
  }

  void _gotoAccount() {
    Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => AccountPage()));
  }
}
