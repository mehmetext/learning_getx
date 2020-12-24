import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CounterController extends GetxController {
  RxInt _counter;
  GetStorage _box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    _counter = _getCounter().obs;
  }

  int _getCounter() => _box.read("counter") ?? 0;

  Future<void> _setCounter(int counterr) => _box.write("counter", counterr);

  int get counter => _counter.value;
  set counter(int counter) => _counter.value = counter;

  void incrementCounter() {
    counter++;
    _setCounter(counter);
    if (counter != 0 && counter % 10 == 0) {
      Get.snackbar(
        "bravo".tr,
        "counter_is".trArgs(["$counter"]),
        snackPosition: SnackPosition.TOP,
        isDismissible: true,
        dismissDirection: SnackDismissDirection.VERTICAL,
        backgroundColor: Colors.red,
        snackStyle: SnackStyle.FLOATING,
      );
    }
  }

  void decreaseCounter() {
    counter--;
    _setCounter(counter);
  }

  void setZero() {
    if (counter != 0) {
      Get.dialog(
        AlertDialog(
          title: Text("reset_counter".tr),
          content: Text("are_you_sure_reset_counter".tr),
          actions: [
            RaisedButton(
              onPressed: () {
                Get.back();
              },
              child: Text("no".tr),
            ),
            RaisedButton(
              onPressed: () {
                counter = 0;
                _setCounter(counter);
                Get.back();
              },
              child: Text("yes".tr),
            ),
          ],
        ),
      );
    } else {
      Get.snackbar("information".tr, "counter_already_zero".tr);
    }
  }
}
