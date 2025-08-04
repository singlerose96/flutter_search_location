// lib/pages/review_page.dart

import 'package:flutter/material.dart';

import '../widgets/review_list_item.dart';
import '../widgets/review_input_form.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 각 리뷰는 작성자, 내용, 별점, 작성일
    // Navigator로 전달된 arguments에서 지역명을 읽어옴
    final locationTitle = ModalRoute.of(context)!.settings.arguments as String;

    // 더미 리뷰 데이터 (UI 확인용)
    final dummyReviews = List.generate(
      5,
      (index) => {
        'author': '사용자 $index',
        'content': '이곳은 리뷰 내용 $index 입니다. UI를 확인해보세요!',
        'rating': (index % 5) + 1,
        'date': DateTime.now().subtract(Duration(days: index)),
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('locationTitle'),  // 상단 바 제목
      ),

      body: Column(
        children: [
          // 리뷰 리스트: Expanded 영역에서 스크롤 가능한 ListView로 표시
          Expanded(
            child: ListView.builder(
              itemCount: dummyReviews.length,
              itemBuilder: (context, index) {
                final review = dummyReviews[index];
                return ReviewListItem(
                  author: review['author'] as String,
                  content: review['content'] as String,
                  rating: review['rating'] as int,
                  date: review['date'] as DateTime,
                );
              },
            ),
          ),

          const Divider(),  // 구분선

          // 리뷰 입력 폼: 사용자가 텍스트와 별점을 선택해 새 리뷰 작성
          ReviewInputForm(
            onSubmit: (content, rating) {
              // TODO: 실제 저장 로직 호출
              debugPrint('새 리뷰 등록: content=$content, rating=$rating');
            },
          ),
        ],
      ),
    );
  }
}
