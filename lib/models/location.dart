// Location 모델
// Naver 지역 검색 API 결과 하나를 담는 클래스

class Location {
  final String title;
  final String category;
  final String roadAddress;

  Location({
    required this.title,
    required this.category,
    required this.roadAddress,
  });

  // JSON ↔ 객체 변환
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      title: json['title'] as String,
      category: json['category'] as String,
      roadAddress: json['roadAddress'] as String,
    );
  }
}
