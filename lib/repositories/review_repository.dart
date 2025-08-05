// ReviewRepository:
// cloud_firestore를 사용하여 리뷰를 저장(add)
// 및 지정된 지역의 모든 리뷰를 스트림(stream)으로 불러오기

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/review.dart';

class ReviewRepository {
  final FirebaseFirestore _firestore;

  ReviewRepository([FirebaseFirestore? firestore])
      : _firestore = firestore ?? FirebaseFirestore.instance;

  /// 리뷰 저장
  Future<void> addReview(Review review) async {
    final col = _firestore.collection('reviews');
    await col.add(review.toMap());
  }

  /// 특정 지역(locationTitle)의 리뷰 스트림 조회
  Stream<List<Review>> streamReviews(String locationTitle) {
    return _firestore
        .collection('reviews')
        .where('locationTitle', isEqualTo: locationTitle)
        .orderBy('date', descending: true)
        .snapshots()
        .map((snap) => snap.docs
            .map((doc) => Review.fromMap(doc.data()))
            .toList());
  }
}
