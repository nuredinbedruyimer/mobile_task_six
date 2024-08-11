import 'package:counter/widgets/product_card.dart';
import 'package:flutter/material.dart';

class THomePage extends StatelessWidget {
  const THomePage({super.key});
  List<Widget> _buildGridCards(int count) =>
      List.generate(count, (index) => const ProductCard());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},

        backgroundColor: const Color.fromARGB(
            255, 22, 3, 190), // Set the background color to blue
        child: const Icon(
          Icons.add, // Use the add icon
          color: Colors.white,
          size: 32, // Set the icon color to white
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              ListTile(
                leading: Container(
                  width: 50.0,
                  height: 40.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10.0), // Set the amount of the radius

                    image: const DecorationImage(
                      image: AssetImage('images/yamato.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Text('July 14 2023',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500,
                    )),
                subtitle: Text.rich(
                  TextSpan(
                    text: 'Hello, ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ), // Default style for the text
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Nuredin',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
                trailing: Container(
                  height: 40,
                  width: 50,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: IconButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        side: BorderSide(
                            color:
                                Colors.grey.shade500), // Set the outline color
                      ),
                      icon: Icon(
                        Icons.notification_add,
                        color: Colors.grey.shade800,
                        size: 25, // Set the icon color
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                title: const Text('Available Products',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    )),
                trailing: Container(
                  height: 50,
                  width: 50,
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: IconButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        side: BorderSide(
                            color:
                                Colors.grey.shade300), // Set the outline color
                      ),
                      icon: Center(
                        child: Icon(
                          Icons.search,
                          color: Colors.grey.shade400,
                          size: 30, // Set the icon color
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ..._buildGridCards(3),
            ],
          ),
        ),
      ),
    );
  }
}
