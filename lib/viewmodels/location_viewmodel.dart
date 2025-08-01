// Riverpod StateNotifier 로 검색 상태(loading, data, error) 관리

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/location.dart';
import '../repositories/location_repository.dart';

/// LocationRepository 제공자
final locationRepositoryProvider = Provider<LocationRepository>(
  (ref) => LocationRepository(),
);

/// AsyncValue<List<Location>> 상태 관리 노티파이어
class LocationNotifier extends StateNotifier<AsyncValue<List<Location>>> {
  final LocationRepository _repo;

  LocationNotifier(this._repo) : super(const AsyncValue.loading());

  /// 검색 실행
  Future<void> search(String query) async {
    state = const AsyncValue.loading();

    try {
      final results = await _repo.search(query);
      state = AsyncValue.data(results);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// LocationNotifier 프로바이더
final locationViewModelProvider = StateNotifierProvider<
    LocationNotifier, AsyncValue<List<Location>>>(
  (ref) => LocationNotifier(ref.read(locationRepositoryProvider)),
);
