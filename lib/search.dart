import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:suro/constants.dart';
import 'package:suro/list.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _textEditingController=TextEditingController();
  bool show=false;
  String text='';
  final List<String> items = [
    'Age',

    'Price',
    'Locality',
    // 'Food Preference',
    'Ethencity',
    'Past Record',
    'Nationality',

    // Add more items as needed
  ];

  int _selectedItemIndex = -1; // Track the index of the selected item
Future<List<Map<String, dynamic>>> fetchSearchData(String searchParam) async {
    final baseUrl =
        'https://surodishibackend-production.up.railway.app/api/surrogate/suro/$searchParam';
    final response = await http.get(Uri.parse(baseUrl));
     // final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
     
      return List<Map<String, dynamic>>.from(jsonData);
      
    }
     else {
      throw Exception('Failed to load search data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: ,
      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[
                  100], // Set the background color of the entire widget to off-white
              borderRadius: BorderRadius.circular(15.0), // Add border radius
            ),
            child: Row(
              children: [
                 Expanded(
                  child: Padding(
                  padding: EdgeInsets.all(6.0),
                  child: TextField(
                    controller: _textEditingController,
                    textAlign: TextAlign.center, // Center the entered text
                    decoration: InputDecoration(
                      hintText: 'Enter your preferred location',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: iconcolor,
                      ), // Change hint text color to pink
                      border: InputBorder.none, // Remove the default border
                      alignLabelWithHint: true, // Center the hint text
                    ),
                  ),
                )

                ),
                IconButton(
                  onPressed: () async{
                    // Perform search functionality here
                        // fetchSearchData(_textEditingController.text);
          final searchParam = _textEditingController.text;
          setState(() {
            text=searchParam;
          });
                    if (searchParam.isEmpty) {
                      // Show an error message or handle the empty search parameter case
                      print("Error empty");
                      return ;
                    }

                    final searchData = await fetchSearchData(text);
                    setState(() {
                      show = true;
                      // Use the fetched data here if needed
                    });
                  },
                  icon: Icon(Icons.search),
                  color: Color.fromARGB(255, 70, 70,
                      70), // Customize the color of the search icon
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            color: Colors
                .white, // Set the background color of the GridView.builder to white
            child: GridView.builder(
              // Use GridView.builder
              shrinkWrap:
                  true, // This is important to allow the GridView to work inside a Column
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns in the grid
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisSpacing: 8.0, // Spacing between rows
                mainAxisExtent: 38,
              ),
              itemCount: items.length, // Total number of items in the grid
              itemBuilder: (context, index) {
                // Build each grid item
                final isSelected = index == _selectedItemIndex;
                final color = isSelected ? iconcolor : iconcolor2;
                final border = isSelected ? iconcolor : Colors.transparent;
                final textcolor = isSelected ? Colors.white : Colors.white;
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedItemIndex = index;
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(27),
                    child: Container(
                      decoration: BoxDecoration(
                        color: color,
                        border: Border.all(
                          color:
                              border, // Set the border color to purple when selected
                          width: 2.0, // Set the border width as desired
                        ),
                      ),
                      // color: color, // Background color of each grid item
                      child: Center(
                        child: Text(
                          items[index],
                          style: TextStyle(
                              color: textcolor,
                              fontWeight:
                                  FontWeight.w300), // Customize the text color
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          show?
                          Container(
                            child: FutureBuilder<List<Map<String, dynamic>>>(
                                // future: Future.error('some error'),

                                      future: fetchSearchData(text),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return CircularProgressIndicator();
                                        } else if (snapshot.hasError) {
                                          return Text('Error: ${snapshot.error}');
                                        } else {
                                          // Render ListTiles based on fetched search data
                                          return Column(
                                            children: snapshot.data!
                                                .map(
                                                  (item) => ListTile(
                            title: Text(item['title']),
                            subtitle: Text(item['subtitle']),
                            // Customize ListTile based on your API data
                            // ... (Add more ListTile properties as needed)
                                                  ),
                                                )
                                                .toList(),
                                          );
                                        }
                                      },
                                    ),
                          ):Container()


          // Listsmall()
        ],
      ),
    );
  }
}
