import 'package:flutter/material.dart';
import 'package:suro/HomeM.dart';
import 'package:suro/chathome.dart';
import 'package:suro/customUI/loginscreen.dart';
import 'package:suro/home_carousel.dart';
import 'package:suro/lawsOrders.dart';
import 'package:suro/list.dart';
import 'package:suro/login_screen.dart';
import 'package:suro/profile.dart';
import 'package:suro/search.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:suro/splash.dart';
import 'package:suro/user_identity.dart';
import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: backgroundC),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: greys, // Change the color of the drawer icon here
          ),
        ),
      ),
      home: const SafeArea(child: Splash()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _onDrawerItemClicked() {
    // TODO: Implement the functionality for the selected drawer item.
    // Example: You can use Navigator to navigate to another page.
    // Navigator.push(context, MaterialPageRoute(builder: (context) => AnotherPage()));
  }
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Center the Surroboon text in the AppBar
            Expanded(
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(
                      color: iconcolor,
                      fontWeight: FontWeight.bold,
                      letterSpacing:
                          1.1 // Change the color of the app bar title here
                      ),
                ),
              ),
            ),
            // Place the bell icon at the end of the AppBar
            IconButton(
              icon: Icon(Icons.login),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => user_identity()));
                // TODO: Implement the functionality for the bell icon here
                // For example, show notifications or perform a specific action.
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: heading, // Change the color of the drawer here
              ),
              child: Text(
                'header',
                style: TextStyle(
                  color: Colors.white, // Change the color of the text here
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Laws and Orders'),
              onTap: () {
                _onDrawerItemClicked();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TermsConditionsPage()));
              },
            ),
            ListTile(
              title: Text('Dialog Flow'),
              onTap: () {
                _onDrawerItemClicked();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
            ),
            // Add more ListTile widgets for additional drawer items
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.add, size: 30),
          Icon(Icons.list, size: 30),
          Icon(Icons.compare_arrows, size: 30),
          Icon(Icons.call_split, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: iconcolor,
        buttonBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ... Rest of the code ...

            // Wrap the CarouselSlider with a Container and specify a fixed height

            Container(
              height: 200, // Set the desired height for the carousel
              child: ComplicatedImageDemo(),
            ),
            SizedBox(
              height: 30,
            ),
            // Expanded(
            // height: 250,
            // Add the Expanded widget here
            Search(),
            // ),
            SizedBox(
              height: 10,
            ),
            // LoginScreen(),
            SizedBox(height: 10),
            Expanded(child: Listsmall()),

            // Listsmall()
            //  Search(),
          ],
        ),
      ),
    );
  }
}
