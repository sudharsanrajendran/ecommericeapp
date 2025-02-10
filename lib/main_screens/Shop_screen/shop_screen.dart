import 'package:flutter/material.dart';
import 'package:ecommericeapp/utils/constants/Tcolors.dart';
import 'package:ecommericeapp/utils/constants/Tsize.dart';
import 'package:ecommericeapp/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/devies/http_client.dart';
import 'body/Tabbar.dart';
import 'header/store_header.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> with SingleTickerProviderStateMixin {
  late Future<List<Map<String, dynamic>>> futureProducts;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    futureProducts = Thttphelper().fetchProducts();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Method to filter products based on category
  List<Widget> filterProducts(List<Map<String, dynamic>> products, String category) {
    return products
        .where((product) => product['category'] == category)
        .map((product) {
      return ListTile(
        leading: product['thumbnail'] != null
            ? Image.network(product['thumbnail'])
            : null,
        title: Text(product['title']),
        trailing: Text("\$${product['price']}"),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final dark = Thelper.isdarkmode(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        title: Text("Store", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Iconsax.shopping_bag, size: Tsize.iconxl),
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              expandedHeight: 400,
              automaticallyImplyLeading: false,
              backgroundColor: dark ? Tcolors.grey : Tcolors.black,
              flexibleSpace: Padding(
                padding: EdgeInsets.all(Tsize.defaultspace - 20),
                child: ListView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    SizedBox(height: Tsize.spacebrwitems),
                    storeheader(),
                  ],
                ),
              ),
              bottom: Tabbar(
                tabcontroller: _tabController,
                tabs: [
                  Tab(child: Text("Groceries")),
                  Tab(child: Text("Beauty")),
                  Tab(child: Text("Fragrances")),
                  Tab(child: Text("Furniture")),
                ],
              ),
            ),
          ];
        },
        body: FutureBuilder<List<Map<String, dynamic>>>(
          future: null,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              List<Map<String, dynamic>> products = snapshot.data!;
              return TabBarView(
                controller: _tabController,
                children: [
                  // Groceries Tab
                  ListView(children: filterProducts(products, 'groceries')),
                  // Beauty Tab
                  ListView(children: filterProducts(products, 'beauty')),
                  // Fragrances Tab
                  ListView(children: filterProducts(products, 'fragrances')),
                  // Furniture Tab
                  ListView(children: filterProducts(products, 'furniture')),
                ],
              );
            } else {
              return Center(child: Text('No products found'));
            }
          },
        ),
      ),
    );
  }
}
