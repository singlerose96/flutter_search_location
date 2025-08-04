// lib/widgets/review_list_item.dart
// 리뷰 리스트 아이템 위젯:
// 작성자, 작성일, 별점, 내용을 카드 형태로 렌더링합니다.

import 'package:flutter/material.dart';

class ReviewListItem extends StatelessWidget {
  final String author;     // 리뷰 작성자
  final String content;    // 리뷰 내용
  final int rating;        // 별점 (1~5)
  final DateTime date;     // 작성일자

  const ReviewListItem({
    Key? key,
    required this.author,
    required this.content,
    required this.rating,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 날짜를 YYYY-MM-DD 형식으로 포맷
    final formattedDate = '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),

      child: Padding(
        padding: const EdgeInsets.all(12.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 작성자 및 작성일
            Row(
              children: [
                Text(
                  author,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  formattedDate,
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // 별점 표시
            Row(
              children: List.generate(5, (i) {
                return Icon(
                  i < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 20,
                );
              }),
            ),

            const SizedBox(height: 12),

            // 리뷰 내용
            Text(
              content,
            ),
          ],
        ),
      ),
    );
  }
}
