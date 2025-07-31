// ──────────────────────────────────────────────────────────────────────────────
// LocationListItem 위젯:
// 검색 결과 각 항목을 보여주는 카드 UI.
// - title, category, roadAddress 텍스트를 세로로 정렬
// ──────────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';

//검색 결과 표시 위젯
class LocationListItem extends StatelessWidget {
  //지역명 (검색 결과 타이틀)
  final String title;

  //검색 결과 카테고리
  final String category;

  /// 도로명 주소
  final String roadAddress;

  /// 생성자
  const LocationListItem({
    Key? key,
    required this.title,
    required this.category,
    required this.roadAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(              //검색 결과 각 항목을 보여주는 카드 UI.
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),

      child: Padding(
        padding: const EdgeInsets.all(12),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 4),


            Text(
              category,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 4),

            
            Text(
              roadAddress,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
