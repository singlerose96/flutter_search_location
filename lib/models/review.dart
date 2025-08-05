// Firestore 'reviews' 컬렉션에 저장할 리뷰 한 건의 구조를 정의합니다.

class Review {
  final String locationTitle;  // 리뷰 대상 지역명
  final String author;         // 작성자 식별자(UID 등)
  final String content;        // 리뷰 내용
  final int rating;            // 별점 (1~5)
  final DateTime date;         // 작성 일시

  Review({
    required this.locationTitle,
    required this.author,
    required this.content,
    required this.rating,
    required this.date,
  });

  /// Firestore 저장용 Map 
  Map<String, dynamic> toMap() {
    return {
      'locationTitle': locationTitle,
      'author': author,
      'content': content,
      'rating': rating,
      'date': date.toIso8601String(),
    };
  }

  /// Firestore DocumentSnapshot → Review 객체 
  factory Review.fromMap(Map<String, dynamic> map) {
    return Review(
      locationTitle: map['locationTitle'] as String,
      author:        map['author']        as String,
      content:       map['content']       as String,
      rating:        map['rating']        as int,
      date:          DateTime.parse(map['date'] as String),
    );
  }
}
