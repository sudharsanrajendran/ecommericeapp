import 'package:flutter/material.dart';

import '../../features/push_notification/pushnotification_api.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              // Curved Header
              ClipPath(
                clipper: InwardCurvedClipper(),
                child: Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.blue, Colors.deepPurple],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
              ),








              // Circular Decorations
              Positioned(
                top: 50,
                left: 30,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 120,
                right: 40,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Positioned(
                top: 200,
                left: 100,
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              // Profile Avatar
              Positioned(
                top: 120,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 50, color: Colors.blue),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Your Name",
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        NotificationService.showNotification(
                          id: 1,
                          title: "Hello!",
                          body: "This is a local notification in Flutter.",
                        );
                      },
                      child: Text("Show Notification"),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom Clipper for Inward Curve
class InwardCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, 0) // Start from top left
      ..lineTo(0, size.height - 50) // Bottom left start of curve
      ..arcToPoint(
        Offset(size.width, size.height - 50), // End at bottom right
        radius: Radius.elliptical(size.width / 2, 60), // Curve inward
        clockwise: true,
      )
      ..lineTo(size.width, 0) // Go to top right
      ..close(); // Close the shape

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
