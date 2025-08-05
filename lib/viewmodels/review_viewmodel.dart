// ReviewViewModel:

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/review.dart';

import '../repositories/review_repository.dart';

/// 리뷰 저장소 제공자
final reviewRepositoryProvider = Provider<ReviewRepository>(
  (ref) => ReviewRepository(),
);

/// 특정 지역의 리뷰 리스트 스트림 프로바이더
final reviewListProvider = StreamProvider.autoDispose.family<List<Review>, String>(
  (ref, locationTitle) {
    final repo = ref.watch(reviewRepositoryProvider);
    return repo.streamReviews(locationTitle);
  },
);

/// 리뷰 추가용 StateNotifier
class ReviewNotifier extends StateNotifier<AsyncValue<void>> {
  final ReviewRepository _repo;

  ReviewNotifier(this._repo) : super(const AsyncValue.data(null));

  /// 리뷰 추가 메서드
  Future<void> add(String locationTitle, String author, String content, int rating) async {
    state = const AsyncValue.loading();
    try {
      final review = Review(
        locationTitle: locationTitle,
        author: author,
        content: content,
        rating: rating,
        date: DateTime.now(),
      );
      await _repo.addReview(review);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// 리뷰 추가 StateNotifierProvider
final reviewNotifierProvider = StateNotifierProvider<ReviewNotifier, AsyncValue<void>>(
  (ref) => ReviewNotifier(ref.read(reviewRepositoryProvider)),
);
