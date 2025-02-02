import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class WishlistService {
  static const String _wishlistKey = 'wishlist_items';

  // Save item to wishlist
  static Future<void> addToWishlist(String itemId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> wishlist = prefs.getStringList(_wishlistKey) ?? [];

    if (!wishlist.contains(itemId)) {
      wishlist.add(itemId);
      await prefs.setStringList(_wishlistKey, wishlist);
    }
  }

  // Remove item from wishlist
  static Future<void> removeFromWishlist(String itemId) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> wishlist = prefs.getStringList(_wishlistKey) ?? [];

    wishlist.remove(itemId);
    await prefs.setStringList(_wishlistKey, wishlist);
  }

  // Get wishlist items
  static Future<List<String>> getWishlist() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_wishlistKey) ?? [];
  }
}
