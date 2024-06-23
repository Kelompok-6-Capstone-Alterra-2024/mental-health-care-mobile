import 'package:get/get.dart';

import '../../data/models/point_model.dart';
import '../../data/services/point_service.dart';

class PoinController extends GetxController {
  var point = Point(status: false, message: '', data: Data(points: 0)).obs;
  var isLoading = false.obs;
  final PointService pointService = PointService();

  @override
  void onInit() {
    super.onInit();
    fetchPoints();
  }

  void fetchPoints() async {
    try {
      isLoading(true);
      var fetchedPoint = await pointService.getPoints();
      if (fetchedPoint != null) {
        point.value = fetchedPoint;
      }
    } finally {
      isLoading(false);
    }
  }

  final count = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
