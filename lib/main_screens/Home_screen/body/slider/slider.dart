import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/devies/http_client.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SliderWithIndicator extends StatefulWidget {
  const SliderWithIndicator({super.key});

  @override
  State<SliderWithIndicator> createState() => _SliderWithIndicatorState();
}

class _SliderWithIndicatorState extends State<SliderWithIndicator> {
  int activeIndex = 0; // Tracks the active carousel index
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
          return const Center(child: CircularProgressIndicator()); // Show loading indicator
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}', style: TextStyle(color: Colors.red)));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No products available"));
        }

        List<Map<String, dynamic>> product = snapshot.data!;

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: dark ? Colors.grey : Colors.grey.shade200,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: CarouselSlider.builder(
                  itemCount: product.length,
                  itemBuilder: (context, index, realIndex) {
                    final item = product[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              item['title'] ?? 'No Title',
                              style: Theme.of(context).textTheme.headlineMedium,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                item['thumbnail'] ?? '',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.broken_image, size: 50),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(seconds: 3),
                    autoPlayInterval: const Duration(seconds: 3),
                    enlargeCenterPage: true, // Highlight the center item
                    aspectRatio: 16 / 8,
                    enlargeFactor: 1.2,
                    viewportFraction: 0.8, // Width of each item
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index; // Update the active index
                      });
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Add the circular indicator
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
              count: 4,
              effect: const ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: Colors.black87,
                dotColor: Colors.grey,
              ),
            ),
          ],
        );
      },
    );
  }
}
