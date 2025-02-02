import 'package:flutter/material.dart';

import '../../../../utils/devies/http_client.dart';
import '../../../../utils/helpers/helper_functions.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  late Future<List<Map<String, dynamic>>> futureProducts;

  @override
  void initState() {
    super.initState();
    futureProducts = Thttphelper().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    final dark = Thelper.isdarkmode(context);

    return FutureBuilder<List<Map<String, dynamic>>>(
      future: futureProducts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No categories available"));
        }

        List<Map<String, dynamic>> products = snapshot.data!;

        return SizedBox(// Fixed height for categories
          child: ListView.builder(
            scrollDirection: Axis.horizontal, // Horizontal scrolling
            itemCount: products.length,
            itemBuilder: (context, index) {
              final category = products[index];
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CircleAvatar(
                      radius: 30, // Adjust size as needed
                      backgroundColor: dark ? Colors.black : Colors.white,
                      backgroundImage: category['thumbnail'] != null
                          ? NetworkImage(category['thumbnail'])
                          : null, // Prevents error if thumbnail is null
                      child: category['thumbnail'] == null
                          ? const Icon(Icons.image_not_supported, size: 30)
                          : null, // Shows icon if no image
                    ),
                  ),
                  const SizedBox(height: 5),

                ],
              );
            },
          ),
        );
      },
    );
  }
}
