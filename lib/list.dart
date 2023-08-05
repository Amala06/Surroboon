import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:suro/constants.dart';
import 'dart:convert';

import 'package:suro/profile.dart';

class PizzaItem {
  String id;
  String name;
  String email;
  String pic;
  String age;
  String country;
  String weight;
String height;
String useOfAlchohol;
String preg;
String  anyIll; //more things will be added here
String periodHistory;
String martial;
String city;


  PizzaItem({
    required this.id,
    required this.name,
    required this.email,
    required this.pic,
    required this.age,

    required this.country,
    required this.weight,
    required this.height,
    required this.useOfAlchohol,
    required this.preg,
    required this.anyIll,
    required this.periodHistory,
    required this.martial,
    required this.city,



    
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
  // {  id: pizzaData['_id'],
  //           name: pizzaData['name'],
  //           email: pizzaData['email'],
  //           pic: pizzaData['pic'],
  //           age: pizzaData['age'].toString(),            
  //           country: pizzaData['country'], 
  //           weight:pizzaData['weight'].toString(),
  //           height:pizzaData['height'].toString(),
  //           useOfAlchohol:pizzaData['useOfAlchohol'] ,
  //           preg:pizzaData['pregnancyExperiance'],
  //           anyIll:pizzaData['anyIllness'],
  //           periodHistory:pizzaData['periodsHistory'],
  //           martial:pizzaData['maritalStatus'],
  //           city:pizzaData['city'],  }

  Future<void> fetchDataFromAPI() async {
    final response = await http.get(Uri.parse(
        'https://surodishibackend-production.up.railway.app/api/user/suro/'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // print(data);
      if (data is List) {
        List<PizzaItem> pizzaItems = [];
        for (var pizzaData in data) {
          pizzaItems.add(PizzaItem(
            id: pizzaData['_id'],
            name: pizzaData['name'],
            email: pizzaData['email'],
            pic: pizzaData['pic'],
            age: "20",            
            country:pizzaData['country'], 
            weight:"50",
            height:"5'4",
            useOfAlchohol:"NO" ,
            preg:"Yes",
            anyIll:"NO illness",
            periodHistory:"Good",
            martial:"Married",
            city:pizzaData['city'],          

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
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
            child: Container(
              color: Color.fromARGB(255, 250, 247, 248),
              child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(items[index].pic),
                    radius: 40,
                  ),
                  // img:Image.network(items[index].pic),
                  title: Text(
                    items[index].name,
                    style: const TextStyle(
                        color: iconcolor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        letterSpacing: 1.1),
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
                          Text(items[index].email),
                          Spacer(),
                          Row(
                            children: [
                                                            Text("Age : "),

                              Text(items[index].age),
                            ],
                          ),
                          // Text(
                          //   items[index].name,
                          //   style: const TextStyle(
                          //     color: Color.fromARGB(255, 70, 70, 70),
                          //   ),
                          // ),
                          Spacer(),
                          // Text(items[index].name),
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
                          Text(items[index].country),
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              // Navigate to the next page when the link is tapped.
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Profile(
                                            pizzaName: items[index].name,
                                            pizzaBest: items[index].email,
                                            targetid: items[index].id,
                                            targetname: items[index].name,
                                            targetpic: items[index].pic,
                                            age: items[index].age,
                                            country: items[index].country,
                                            weight: items[index].weight,
                                            height: items[index].height,
                                            useOfAlchohol: items[index].useOfAlchohol,
                                            preg: items[index].preg,
                                            anyIll: items[index].anyIll,
                                            periodHistory: items[index].periodHistory,
                                            martial: items[index].martial,
                                            city: items[index].city,


                                            
                                           
                                          )));
                            },
                            child: Text(
                              "Explore",
                              style: TextStyle(
                                color: greys,
                                fontWeight: FontWeight.w500,
                                decoration: TextDecoration.underline,
                              ),
                            ),
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
