
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../utils/constants/Tcolors.dart';
import '../../../../utils/constants/Tsize.dart';
import '../../../../utils/devies/http_client.dart';
import '../../../../utils/helpers/helper_functions.dart';

class CardsView extends StatefulWidget {
  const CardsView({super.key});

  @override
  State<CardsView> createState() => _CardsViewState();
}

class _CardsViewState extends State<CardsView> {
  late Future<List<Map<String, dynamic>>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = Thttphelper().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final dark = Thelper.isdarkmode(context);

    return Scaffold(
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Failed to load products!', style: TextStyle(color: Colors.red)),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No products available"));
          }

          List<Map<String, dynamic>> products = snapshot.data!;

          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.7,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final item = products[index];

              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Tsize.productimageradius),
                ),
                color: dark ? Tcolors.darkgray : Colors.grey.shade200,
                child: Stack(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Iconsax.heart, color: Colors.red),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                item['thumbnail'] ?? '',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image, size: 50),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            item['title'] ?? 'No Title',
                            style: Theme.of(context).textTheme.titleSmall,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item['brand'] ?? 'Unknown Brand',
                                  style: Theme.of(context).textTheme.bodySmall,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                ),
                              ),
                              const SizedBox(width: 5),
                              const Icon(Iconsax.tick_circle, color: Colors.blueAccent),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Text(
                                '\$${item['price'].toString()}',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                              const Spacer(),
                              const Icon(Icons.star, color: Colors.yellow),
                              const SizedBox(width: 5),
                              Text(
                                item['rating'].toString(),
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),


                          GestureDetector(
              onTap: (){

              },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: dark ? Colors.grey : Colors.white,
                                                     borderRadius: BorderRadius.circular(10),
                              ),
                                          child: Center(
                                            child: const Text(
                                            "Add to Cart",
                                            style: TextStyle(color: Colors.black87, fontSize: 16),
                                            ),
                                          )
                            ),
                          )

                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
