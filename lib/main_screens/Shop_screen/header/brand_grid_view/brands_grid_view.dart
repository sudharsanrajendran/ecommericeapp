import 'package:ecommericeapp/utils/constants/Tsize.dart';
import 'package:ecommericeapp/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import '../../../../utils/devies/http_client.dart';

class Brands extends StatefulWidget {
  const Brands({super.key});

  @override
  State<Brands> createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  late Future<List<Map<String, dynamic>>> futureProducts;
  bool showAll = false; // Toggle state

  @override
  void initState() {
    super.initState();
    futureProducts = Thttphelper().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Tsize.defaultspace-20),
      child: FutureBuilder<List<Map<String, dynamic>>>(
        future: futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No products available."));
          }

          List<Map<String, dynamic>> products = snapshot.data!;
          int itemCount = showAll ? 8 : 4; // Show only 4 initially

          return Column(
            children: [
              Row(
                children: [
                  Text(
                    'Featured Brands..',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Spacer(),



                     GestureDetector(onTap: (){
                       setState(() {
                         showAll = !showAll; // Toggle state
                       });
                     },child: Text(showAll ? "Show Less" : "View All" ,style:Theme.of(context).textTheme.bodyMedium,)),

                ],
              ),
              SizedBox(height: 10,),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: List.generate(itemCount, (index) {
                  final item = products[index];
                  return Container(// Reduced width
                    padding: EdgeInsets.all(8), // Added some padding
                    decoration: BoxDecoration(
                      color: Thelper.isdarkmode(context) ? Colors.black87 : Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12), // Slightly reduced border radius
                    ),
                    child: Center(
                      child: Text(
                        item['brand'] ?? 'Unknown Brand',
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  );
                }),
              ),

            ],
          );
        },
      ),
    );
  }
}
