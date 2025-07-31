import 'package:flutter/material.dart';

// SearchAppBar 위젯 : 검색창이 포함된 AppBar 역할
class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// 검색어 입력 후 호출될 콜백
  final ValueChanged<String> onSubmitted;

  const SearchAppBar({
    Key? key,
    required this.onSubmitted,
  }) : super(key: key);

  @override 
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); //PreferredSizeWidget. : AppBar 자리에서 검색창 기능 제공


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,   // 🟢 AppBar 배경 흰색
      elevation: 1,                    // 🟢 살짝 그림자

      title: TextField(
        textInputAction: TextInputAction.search,  // 🔍 키보드의 검색 버튼

        // 🟣 검색어 입력 완료 시 호출
        onSubmitted: onSubmitted,

        decoration: InputDecoration(
          hintText: '위치를 입력하세요',      //hintText, 돋보기 아이콘, 포커스 시 테두리 색 변경 구현.
          hintStyle: const TextStyle(color: Colors.grey),

          filled: true,                          // 🟢 배경 채우기
          fillColor: Colors.white,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,                      // 좌우 패딩
            vertical: 8,                         // 상하 패딩
          ),

          // 기본 테두리
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(8),
          ),

          // 🟢 포커스 테두리
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.deepPurple),
            borderRadius: BorderRadius.circular(8),
          ),

          suffixIcon: const Icon(
            Icons.search,
            color: Colors.deepPurple,           // 🟢 돋보기 아이콘 색
          ),
        ),
      ),
    );
  }
}
