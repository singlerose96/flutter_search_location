// HomePage
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/search_appbar.dart';         // 위젯 임포트
import '../widgets/location_list_item.dart';   
import '../viewmodels/location_viewmodel.dart';



class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locAsync = ref.watch(locationViewModelProvider);


    return Scaffold(
      appBar: SearchAppBar(              // AppBar: SearchAppBar 위젯을 사용해 검색창 노출
        onSubmitted: (query) {
         debugPrint('검색어 입력: $query');
        ref.read(locationViewModelProvider.notifier).search(query);
          // TODO: 검색 API 호출 로직 연동
        },
      ),

      
 // Body: ListView.builder로 LocationListItem 출력      
   body: locAsync.when(
   data: (list) {
    if (list.isEmpty) {
      return const Center(child: Text('검색 결과가 없습니다.'));
    }

          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              final item = list[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/review',
                    arguments: item.title,  // 선택된 지역명 전달
                  );
                },
                child: LocationListItem(
                  title: item.title,
                  category: item.category,
                  roadAddress: item.roadAddress,
                ),
              );
            },
          );
        },

loading: () => const Center(child: Text('어디로 갈까요?')), // 로딩 중 메시지
error: (e, _) => Center(child: Text('Error: $e')),
     ),
    );
  }
}
  
