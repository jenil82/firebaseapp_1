import 'package:firebaseapp_1/screen/home/controller/controller.dart';
import 'package:firebaseapp_1/utills/fire_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({Key? key}) : super(key: key);

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  HomeController homeController = Get.put(
    HomeController(),
  );
  var name;
  var offer;
  var description;
  var price;
  var id;
  var imagePath;

  @override
  void initState() {
    super.initState();
    name = homeController.dataList[0].name;
    id = homeController.dataList[0].id;
    description = homeController.dataList[0].description;
    offer = homeController.dataList[0].offer;
    price = homeController.dataList[0].price;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController namec = TextEditingController(text: "$name");
    TextEditingController pricec = TextEditingController(text: "$price");
    TextEditingController descriptionc =
    TextEditingController(text: "$description");
    TextEditingController offerc = TextEditingController(text: "$offer");
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text(
            "Update",
            style: TextStyle(
              fontSize: 22,
              color: Colors.black,
              letterSpacing: 1,
            ),
          ),
        ),
        backgroundColor: Colors.blue.shade100,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: namec,
                            cursorColor: Colors.black,
                            style:TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: "Name",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Row(
                      children: [

                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: pricec,
                            cursorColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: "Price",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: descriptionc,
                            cursorColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: "Description",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 10,
                      bottom: 10,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: offerc,
                            cursorColor: Colors.black,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            decoration: InputDecoration(
                              hintText: "Offer",
                              hintStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          value: homeController.selectedUCategory.value,
                          items: homeController.uCategoryList
                              .map(
                                (element) => DropdownMenuItem(
                              child: Text(element),
                              value: element,
                            ),
                          )
                              .toList(),
                          onChanged: (value) {
                            homeController.selectedUCategory.value = value!;
                          },
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          dropdownColor: Colors.blue.shade50,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      imagePath == null
                          ? Image.asset(
                        "",
                        height: 150,
                        width: 150,
                      )
                          : Image.file(imagePath),
                      SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: () async {
                          ImagePicker imagePicker = ImagePicker();
                          XFile? xFile = await imagePicker.pickImage(
                            source: ImageSource.gallery,
                          );
                          setState(() {
                            imagePath = xFile!.path;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 1,
                          ),
                          child: Text(
                            " Image",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    FbHelper.fbHelper.updateItem(
                      id: id,
                      name: namec.text,
                      price: pricec.text,
                      description: descriptionc.text,
                      offer: offerc.text,
                      category: homeController.selectedUCategory.value,
                      // image: imagePath,
                    );
                    Get.back();
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: 1,
                      ),
                      child: Text(
                        "Update",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}