import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Card(
          elevation: 0,
          margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(20), // Set the amount of the radius
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 21 / 9,
                child: Image.asset(
                  'images/yamato.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                // padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Derby Leather Shoes',
                              style: TextStyle(
                                color: Colors.grey.shade800,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              '\$120',
                              style: TextStyle(
                                color: Colors.purple.shade800,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Men\'s Shoes',
                              style: TextStyle(
                                color: Colors.grey.shade500,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 184, 169, 101),
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
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
