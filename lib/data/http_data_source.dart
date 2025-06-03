import 'package:dio/dio.dart';
import 'package:recipe_app/data/data_source.dart';

class HttpDataSource implements DataSource {
  @override
  Future<Map> fetchData() async {
    try {
      Response response =
          await Dio().get('https://www.themealdb.com/api/json/v1/1/random.php');
      if (response.statusCode == 200) {
        print('Success');
      }
      return response.data.first;
    } catch (e) {
      print('Error fetching users: $e');
      return {};
    }
  }
}
