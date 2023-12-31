import 'package:flutter/material.dart';
import 'package:suro/chathome.dart';
import 'package:suro/customUI/loginscreen.dart';
import 'package:suro/home_carousel.dart';
import 'package:suro/list.dart';
import 'package:suro/search.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.pink, // Change the color of the drawer icon here
          ),
        ),
      ),
      // home: const SafeArea(child: ChatHome()),
      home:  SafeArea(child: LoginScreen()),
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
                    color: Colors
                        .pink, // Change the color of the app bar title here
                  ),
                ),
              ),
            ),
            // Place the bell icon at the end of the AppBar
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
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
                color: Colors.pink, // Change the color of the drawer here
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white, // Change the color of the text here
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Drawer Item 1'),
              onTap: () {
                _onDrawerItemClicked();
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Drawer Item 2'),
              onTap: () {
                _onDrawerItemClicked();
                Navigator.pop(context);
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
        color: const Color.fromARGB(255, 240, 79, 133),
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
            Expanded(child: Listsmall()),

            // Listsmall()
            //  Search(),
          ],
        ),
      ),
    );
  }
}
