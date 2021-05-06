import 'package:flutter/material.dart';
import 'package:shared_pref/splashScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String username;
  String fullname;

  @override
  void initState() {
    super.initState();
    name();
  }

  void name() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
      fullname = prefs.getString('fullname');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Color(0xffF3AB0D),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.logout), onPressed: () {})
        ],
      ),
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "Selamat Datang",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Image.asset('assets/images/imageLogin.png'),
                  ],
                ),
              ),
            ),
            DraggableScrollableSheet(
                initialChildSize: 0.1,
                minChildSize: 0.1,
                maxChildSize: 0.5,
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color(0xffF3AB0D),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        )),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  )),
                              height: 10,
                              width: 100,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 30.0, bottom: 10.0),
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.grey,
                            ),
                          ),
                          Text(
                            "Username",
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Nama",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
