import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/food.dart';

abstract class FoodRepository {
  Future<List<Recipe>> getFoods();
}

class FoodRepositoryImpl extends FoodRepository {
  @override
  Future<List<Recipe>> getFoods() async {
    var response = await http.get(
        Uri.parse('https://forkify-api.herokuapp.com/api/search?q=pizza#'));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<Recipe> recipes = Food.fromJson(data).recipes;
      return recipes;
    } else {
      throw Exception('Failed');
    }
  }
}
