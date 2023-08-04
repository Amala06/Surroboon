import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:suro/profile.dart';

class PizzaItem {
  String id;
  String name;
  int qty;
  String pic;
  String desc;
  int reviews;
  String top;
  int med;
  int small;
  int large;
  bool veg;
  bool bestSell;

  PizzaItem({
    required this.id,
    required this.name,
    required this.qty,
    required this.pic,
    required this.desc,
    required this.reviews,
    required this.top,
    required this.med,
    required this.small,
    required this.large,
    required this.veg,
    required this.bestSell,
  });
}

class Listsmall extends StatefulWidget {
  const Listsmall({Key? key}) : super(key: key);

  @override
  State<Listsmall> createState() => _ListsmallState();
}

class _ListsmallState extends State<Listsmall> {
  // final PizzaItem userData;
  // _ListsmallState({required this.userData});
  List<PizzaItem> items = []; // List to store the fetched data
  int count = 0;
  @override
  void initState() {
    super.initState();
    fetchDataFromAPI();
  }

  Future<void> fetchDataFromAPI() async {
    final response = await http
        .get(Uri.parse('https://pizzabackend-ax85.onrender.com/api/food/menu'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data is List) {
        List<PizzaItem> pizzaItems = [];
        for (var pizzaData in data) {
          pizzaItems.add(PizzaItem(
            id: pizzaData['_id'],
            name: pizzaData['name'],
            qty: pizzaData['qty'],
            pic: pizzaData['pic'],
            desc: pizzaData['desc'],
            reviews: pizzaData['reviews'],
            top: pizzaData['top'],
            med: pizzaData['med'],
            small: pizzaData['small'],
            large: pizzaData['large'],
            veg: pizzaData['veg'],
            bestSell: pizzaData['bestSell'],
          ));
        }

        setState(() {
          items = pizzaItems;
        });
      } else {
        throw Exception('Invalid response format from API');
      }
    } else {
      throw Exception('Failed to fetch data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            child: Container(
              color: Color.fromARGB(255, 250, 247, 248),
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(items[index].pic),
                    radius: 35,
                  ),
                  // img:Image.network(items[index].pic),
                  title: Text(
                    items[index].name,
                    style: const TextStyle(
                        color: Colors.pink, fontWeight: FontWeight.bold),
                  ),
                  // title: InkWell(
                  //   onTap: () {
                  //     Navigator.pop(context);
                  //     Text(
                  //       items[index].name,
                  //       style: TextStyle(
                  //           color: Colors.pink, fontWeight: FontWeight.bold),
                  //     );
                  //   },
                  // ),
                  subtitle: Column(
                    children: [
                      Row(
                        children: [
                          Text(items[index].name),
                          Spacer(),
                          Text(items[index].name),
                        ],

                        // Add more widgets to display additional data from the API
                      ),
                      Row(
                        children: [
                          // GestureDetector(
                          //   onTap: () {
                          //     // Navigate to the next page when the link is tapped.
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) => Profile()));
                          //   },
                          //   child: Text("Explore.."),
                          // ),
                          // Spacer(),
                          Text(items[index].name),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              // Navigate to the next page when the link is tapped.
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile(
                                            pizzaName: items[index].name,
                                            pizzaBest: items[index].bestSell,
                                            pizzapic: items[index].pic,
                                          )));
                            },
                            child: Text("Explore.."),
                          ),
                        ],

                        // Add more widgets to display additional data from the API
                      ),
                    ],
                  )),
            ),
          );
        },
      ),
    );
  }
}
