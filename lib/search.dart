import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:suro/constants.dart';
import 'package:suro/list.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<String> items = [
    'Age',
    'Price',
    'Locality',
    'Ethencity',

    // Add more items as needed
  ];

  final List<String> items1 = [
    'Past Record',
    'Nationality',
    'Food Preference',
    // Add more items as needed
  ];

  int _selectedItemIndex = -1; // Track the index of the selected item

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
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(6.0),
                    child: TextField(
                      // controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Enter your preferred location ',
                        hintStyle: TextStyle(
                            color: heading), // Change hint text color to pink
                        border: InputBorder.none, // Remove the default border
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // Perform search functionality here
                  },
                  icon: Icon(Icons.search),
                  color: iconcolor, // Customize the color of the search icon
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
                crossAxisCount: 4, // Number of columns in the grid
                crossAxisSpacing: 8.0, // Spacing between columns
                mainAxisSpacing: 8.0, // Spacing between rows
                mainAxisExtent: 38,
              ),
              itemCount: items.length, // Total number of items in the grid
              itemBuilder: (context, index) {
                // Build each grid item
                final isSelected = index == _selectedItemIndex;
                final color = isSelected ? heading : backgroundC;

                final textcolor = isSelected ? backgroundC : heading;
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedItemIndex = index;
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: color, // Background color of each grid item
                      child: Center(
                        child: Text(
                          items[index],
                          style: TextStyle(
                              color: textcolor,
                              fontWeight:
                                  FontWeight.bold), // Customize the text color
                        ),
                      ),
                    ),
                  ),
                );
              },
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
              itemCount: items1.length, // Total number of items in the grid
              itemBuilder: (context, index) {
                // Build each grid item
                final isSelected = index == _selectedItemIndex;
                final color = isSelected ? heading : backgroundC;

                final textcolor = isSelected ? backgroundC : heading;
                return InkWell(
                  onTap: () {
                    setState(() {
                      _selectedItemIndex = index;
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      color: color, // Background color of each grid item
                      child: Center(
                        child: Text(
                          items1[index],
                          style: TextStyle(
                              color: textcolor,
                              fontWeight:
                                  FontWeight.bold), // Customize the text color
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Listsmall()
        ],
      ),
    );
  }
}
