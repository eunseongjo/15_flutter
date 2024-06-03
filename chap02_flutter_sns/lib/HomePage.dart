import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'feedlist.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "https://gratisography.com/wp-content/uploads/2024/01/gratisography-cyber-kitty-1170x780.jpg",
      "https://gratisography.com/wp-content/uploads/2023/10/gratisography-cool-cat-1170x780.jpg",
      "https://gratisography.com/wp-content/uploads/2023/10/gratisography-witch-cat-1170x780.jpg",
      "https://gratisography.com/wp-content/uploads/2023/09/gratisography-duck-doctor-free-stock-photo-1170x780.jpg",
      "https://gratisography.com/wp-content/uploads/2023/06/gratisography-boxing-boxer-free-stock-photo-1170x780.jpg",
      "https://gratisography.com/wp-content/uploads/2023/06/gratisography-dj-gorilla-free-stock-photo-1170x780.jpg",
      "https://gratisography.com/wp-content/uploads/2023/06/gratisography-panda-ice-cream-free-stock-photo-1170x780.jpg",
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(CupertinoIcons.camera),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(CupertinoIcons.paperplane),
            onPressed: () {},
          )
        ],
        title: Image.asset(
          'assets1/images/og_logo.png',
          height: 32,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          String image = images[index];
          return FeedList(
            imageUrl: image,
          );
        },
      ),
    );
  }
}
