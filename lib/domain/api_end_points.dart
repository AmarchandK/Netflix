import 'package:netflix/core/const_strings.dart';
import 'package:netflix/infrastructure/api_key.dart';

class ApiEndPoints {
  static const downloads = '$baseURL/trending/all/day?api_key=$apiKey';
  static const search = '$baseURL/search/movie?api_key=$apiKey';
}
