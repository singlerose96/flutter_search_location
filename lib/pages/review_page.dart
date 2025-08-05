// lib/pages/review_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/review_list_item.dart';
import '../widgets/review_input_form.dart';
import '../viewmodels/review_viewmodel.dart';

class ReviewPage extends ConsumerWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Navigator로 전달된 arguments에서 지역명을 읽어옴
    final locationTitle =
     ModalRoute.of(context)!.settings.arguments as String;

     //스낵바로 사용자 피드백 
     ref.listen<AsyncValue<void>>(reviewNotifierProvider, (prev, next) {
      next.when(
        data: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('리뷰 저장 성공')),
          );
        },
        loading: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('리뷰 저장 중...')),
          );
        },
        error: (e, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('리뷰 저장 실패: $e')),
          );
        },
      );
    });


    // 해당 지역의 리뷰 스트림 시계는 와치
    final reviewsAsync = ref.watch(reviewListProvider(locationTitle));

    return Scaffold(
      appBar: AppBar(
        title: Text(locationTitle), // AppBar에 지역명 표시
      ),

      body: Column(
        children: [
          Expanded(
            child: reviewsAsync.when(
              data: (reviews) {
                if (reviews.isEmpty) {
                  return const Center(child: Text('등록된 리뷰가 없습니다.'));
                }
                return ListView.builder(
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    final r = reviews[index];
                    return ReviewListItem(
                      author:  r.author,
                      content: r.content,
                      rating:  r.rating,
                      date:    r.date,
                    );
                  },
                );
              },
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('로딩 오류: $e')),
            ),
          ),

          const Divider(),  // 구분선

          // 리뷰 입력 폼: 사용자가 텍스트와 별점을 선택해 새 리뷰 작성
          ReviewInputForm(
            onSubmit: (content, rating) {
              ref
                  .read(reviewNotifierProvider.notifier)
                  .add(locationTitle, '익명', content, rating);
            },
          ),
        ],
      ),
    );
  }
}