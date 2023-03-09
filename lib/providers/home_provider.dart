import 'package:benzy_test/models/user_data_model.dart';
import 'package:benzy_test/networking/food_details_service.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  bool isLoading = false;
  FoodDetails? foodDetails;
  String error = "";
  double fineAmount = 0.0;

  fetchFoodDetails() async {
    isLoading = true;
    try {
      foodDetails = await fetchData();
      for (Report element in foodDetails?.reports ?? []) {
        if (element.optIns is Map) {
          String? brakfast = element.optIns["breakfast"];
          if (brakfast != null) {
            if (brakfast == "Pending") {
              fineAmount = fineAmount + 100;
            }
          }
          String? lunch = element.optIns["lunch"];
          if (lunch != null) {
            if (lunch == "Pending") {
              fineAmount = fineAmount + 100;
            }
          }
          String? dinner = element.optIns["dinner"];
          if (dinner != null) {
            if (dinner == "Pending") {
              fineAmount = fineAmount + 100;
            }
          }
        }
      }
    } catch (e) {
      error = e.toString();
    }
    isLoading = false;
    notifyListeners();
  }
}
