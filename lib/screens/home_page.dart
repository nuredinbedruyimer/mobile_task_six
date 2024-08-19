import 'package:flutter/material.dart';
import 'package:counter/screens/add.dart';
import 'package:counter/screens/search.dart';
import 'package:counter/widgets/product_card.dart';

class THomePage extends StatefulWidget {
  const THomePage({super.key});

  @override
  _THomePageState createState() => _THomePageState();
}

class _THomePageState extends State<THomePage> {
  List<Map<String, dynamic>> products = []; // Store products with their details

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _navigateAndAddItem() async {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TAddPage()),
      );

      if (result != null && result is Map<String, dynamic>) {
        setState(() {
          products.add(result);
        });
      }
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: _navigateAndAddItem,
        backgroundColor: const Color.fromARGB(255, 22, 3, 190),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
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
                    borderRadius: BorderRadius.circular(10.0),
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
                    ),
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
                        side: BorderSide(color: Colors.grey.shade500),
                      ),
                      icon: Icon(
                        Icons.notification_add,
                        color: Colors.grey.shade800,
                        size: 25,
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
                      onPressed: _navigateAndAddItem,
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        side: BorderSide(color: Colors.grey.shade300),
                      ),
                      icon: Center(
                        child: Icon(
                          Icons.search,
                          color: Colors.grey.shade400,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ...products.map((product) => ProductCard(
                    name: product['name'],
                    category: product['category'],
                    price: product['price'],
                    description: product['description'],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
