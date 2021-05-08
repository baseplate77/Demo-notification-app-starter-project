import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';

import 'PushNotification.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        title: 'demo notification app',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PushNotification _notificationInfo;
  int _totalNotifications;

// TODO : handling notification
  void registerNotification() {}

  @override
  void initState() {
    _totalNotifications = 0;
    registerNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3d84b8),
        title: Text("Demo Notification App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Notification Recived",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          NotificationBadge(totalNotifications: _totalNotifications),
          _notificationInfo != null
              ? Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.center,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'TITLE: ${_notificationInfo.title}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'BODY: ${_notificationInfo.body}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}

class NotificationBadge extends StatelessWidget {
  const NotificationBadge({
    Key key,
    @required int totalNotifications,
  })  : _totalNotifications = totalNotifications,
        super(key: key);

  final int _totalNotifications;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color(0xFF77acf1),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        "$_totalNotifications",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
