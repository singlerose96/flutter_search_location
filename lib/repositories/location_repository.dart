// ──────────────────────────────────────────────────────────────────────────────
// LocationRepository
// dio 를 사용해 Naver Local Search API 호출
// search(query) 에서 List<Location> 반환
// ──────────────────────────────────────────────────────────────────────────────

import 'package:dio/dio.dart';
import '../models/location.dart';
import '../utils/naver_api_constants.dart';

class LocationRepository {
  final Dio _dio;

  /// 선택적 Dio 인스턴스 주입 가능
  LocationRepository([Dio? dio]) : _dio = dio ?? Dio();

  /// 지역 검색 API 호출
  Future<List<Location>> search(String query) async {
    final response = await _dio.get(
      NAVER_LOCAL_ENDPOINT,
      queryParameters: {
        'query': query,
        'display': 20,
      },
      options: Options(
        headers: {
          'X-Naver-Client-Id': NAVER_CLIENT_ID,
          'X-Naver-Client-Secret': NAVER_CLIENT_SECRET,
        },
      ),
    );

    // JSON 'items' 배열을 Location 객체 리스트로 매핑
    final items = (response.data['items'] as List)
        .map((e) => Location.fromJson(e as Map<String, dynamic>))
        .toList();

    return items;
  }
}
