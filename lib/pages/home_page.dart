// HomePage:
// 1) SearchAppBar 배치
// 2) 더미 결과를 ListView.builder로 출력
// ──────────────────────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/search_appbar.dart';         // 위젯 임포트
import '../widgets/location_list_item.dart';   

/// HomePage: 검색창과 결과 리스트를 보여주는 화면
class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {     // 더미 데이터 생성: ListView에 표시할 샘플 결과 5개
  
    final dummyResults = List.generate(
      5,
      (i) => {
        'title': '지역 $i',
        'category': '카테고리 $i',
        'roadAddress': '도로명 주소 $i',
      },
    );

    return Scaffold(
      appBar: SearchAppBar(              // AppBar: SearchAppBar 위젯을 사용해 검색창 노출
        onSubmitted: (query) {
          // TODO: 검색 API 호출 로직 연동
          debugPrint('검색어 입력: $query');
        },
      ),

      
      // Body: ListView.builder로 LocationListItem 출력      
      body: ListView.builder(
        itemCount: dummyResults.length,
        itemBuilder: (context, index) {
          final item = dummyResults[index];

          return LocationListItem(
            title: item['title']!,
            category: item['category']!,
            roadAddress: item['roadAddress']!,
          );
        },
      ),
    );
  }
}
