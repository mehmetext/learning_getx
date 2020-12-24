import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learning_getx/controller/counter_controller.dart';
import 'package:learning_getx/view/settings_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  CounterController _counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home_appbar_text".tr),
        actions: [
          _settingsBtnWidget,
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'how_many_pushed'.tr,
            ),
            Obx(
              () => Text(
                "${_counterController.counter}",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(
                  () => FloatingActionButton(
                    heroTag: "1",
                    onPressed: _counterController.counter > 0
                        ? () {
                            _counterController.decreaseCounter();
                          }
                        : null,
                    tooltip: "decrease".tr,
                    child: Icon(Icons.remove),
                  ),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  heroTag: "2",
                  onPressed: () {
                    _counterController.setZero();
                  },
                  tooltip: 'set_zero'.tr,
                  child: Icon(Icons.exposure_zero),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  heroTag: "3",
                  onPressed: () {
                    _counterController.incrementCounter();
                  },
                  tooltip: 'increment'.tr,
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _settingsBtnWidget => IconButton(
        onPressed: () => Get.to(
          SettingsView(),
          transition: Transition.topLevel,
        ),
        icon: Icon(Icons.settings),
      );
}
