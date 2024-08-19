import 'package:counter/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class TDetailsPage extends StatelessWidget {
  final String name;
  final String category;
  final double price;
  final String description;

  TDetailsPage({
    Key? key,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
  }) : super(key: key);
  final pages = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

  final String text =
      "A derby leather shoe is classix and versatile NUREDIN footwear option charachterized by its open lacing system where the shoelace eyelats are sewn on top of the vamp(the upperpart of the shoe). th" *
          5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('images/yamato.jpg'),
                Positioned(
                  top: 60,
                  left: 30,
                  child: Container(
                    width: 40, // Set the width of the icon
                    height: 40, // Set the height
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),

                    child: AspectRatio(
                      aspectRatio: 1,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.blue,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        category,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow[600],
                          ),
                          Text('(4.0)',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              )),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "name",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "price",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Size:',
                      style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 75, // Adjust this value as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: pages.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: index == 2 ? Colors.blue : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade500
                                    .withOpacity(0.5), // Shadow color
                                spreadRadius: 0.0, // Shadow spread radius
                                blurRadius: 1, // Shadow blur radius
                                offset: const Offset(0, 1), // Shadow position
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              pages[index],
                              style: TextStyle(
                                color: index == 2 ? Colors.white : Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      color: Colors.grey.shade800,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: BottomAppBar(
                padding: EdgeInsets.all(20),
                height: 100,
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    TCustomActionButton(action: 'DELETE'),
                    TCustomActionButton(action: 'UPDATE'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
