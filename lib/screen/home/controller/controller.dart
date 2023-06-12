import 'package:firebaseapp_1/screen/home/modal/modal.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedICategory = "Other".obs;
  RxList<String> iCategoryList = <String>[
    "Mobiles",
    "Wearables",
    "TVs",
    "Monitors",
    "Tablets",
    "Laptops",
    "Computers",
    "Printers",
    "Scanners",
    "Other",
  ].obs;

  List<UpdateModal> dataList = <UpdateModal>[];

  var selectedUCategory = "Other".obs;
  RxList<String> uCategoryList = <String>[
    "Mobiles",
    "Wearables",
    "TVs",
    "Monitors",
    "Tablets",
    "Laptops",
    "Computers",
    "Printers",
    "Scanners",
    "Other",
  ].obs;
}

