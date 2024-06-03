import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FeedList extends StatefulWidget {
  const FeedList({super.key, required this.imageUrl});

  final String imageUrl;
  @override
  State<FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  // 좋아요 여부
  bool isFavorite = false;
  bool isFavorite2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 이미지
        Image.network(widget.imageUrl,
            height: 400, width: double.infinity, fit: BoxFit.cover),
        // 아이콘 목록
        Row(
          children: [
            IconButton(
              icon: Icon(
                CupertinoIcons.heart,
                color: isFavorite ? Colors.green : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                });
              },
            ),
            IconButton(
              icon: Icon(
                CupertinoIcons.chat_bubble,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
            Spacer(), // 빈 공간 추가
            IconButton(
              icon: Icon(
                CupertinoIcons.bookmark,
                color: isFavorite2 ? Colors.red : Colors.black,
              ),
              onPressed: () {
                setState(() {
                  isFavorite2 = !isFavorite2;
                });
              },
            )
          ],
        ),

        // 좋아요
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "3 likes",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        // 피드 글작성
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("네온과 고양이, 최고의 조합 😎 \n#CatLife #NeonVibes"),
        ),
        // 날짜
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "May 29",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
