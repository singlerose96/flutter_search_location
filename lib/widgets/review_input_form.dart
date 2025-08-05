// lib/widgets/review_input_form.dart
// 리뷰 입력 폼 위젯:
// 텍스트 입력, 별점 선택, 제출 버튼 UI

import 'package:flutter/material.dart';

class ReviewInputForm extends StatefulWidget {
  /// 사용자가 작성한 내용과 별점을 전달받는 콜백
  final void Function(String content, int rating) onSubmit;

  const ReviewInputForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  State<ReviewInputForm> createState() => _ReviewInputFormState();
}

class _ReviewInputFormState extends State<ReviewInputForm> {
  final TextEditingController _controller = TextEditingController();
  int _selectedRating = 5;  // 기본 별점

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 텍스트 입력 필드
          TextField(
            controller: _controller,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: '리뷰를 입력하세요',
              border: OutlineInputBorder(),
            ),
          ),

          const SizedBox(height: 12),

          // 별점 선택용 버튼들
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              final starIndex = index + 1;
              return IconButton(
                icon: Icon(
                  _selectedRating >= starIndex
                      ? Icons.star
                      : Icons.star_border,
                  color: Colors.amber,
                ),
                onPressed: () {
                  setState(() {
                    _selectedRating = starIndex;
                  });
                },
              );
            }),
          ),

          const SizedBox(height: 12),

          // 제출 버튼
          ElevatedButton(
            onPressed: () {
              final text = _controller.text.trim();
              if (text.isEmpty) return;

              widget.onSubmit(text, _selectedRating);

              _controller.clear();
              setState(() {
                _selectedRating = 5;
              });
            },
            child: const Text('등록'),
          ),
        ],
      ),
    );
  }
}
