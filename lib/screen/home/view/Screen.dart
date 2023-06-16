import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebaseapp_1/screen/home/controller/controller.dart';
import 'package:firebaseapp_1/screen/home/modal/modal.dart';
import 'package:firebaseapp_1/utills/fire_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(
    HomeController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          leading: Icon(
            Icons.dehaze_rounded,
            color: Colors.black,
          ),
          title: Text(
            "SHOPCART",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          actions: [
            InkWell(
              onTap: () {
                FbHelper.fbHelper.signOut();
                Get.offAndToNamed('si');
              },
              child: Padding(
                padding: EdgeInsets.only(
                  top: 6,
                ),
                child: Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.login,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.blue.shade100,
        body: Column(
          children: [
            Expanded(
              child: StreamBuilder(
                stream: FbHelper.fbHelper.readItem(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  } else if (snapshot.hasData) {
                    List<HomeModal> dataList = [];
                    QuerySnapshot? snapData = snapshot.data;
                    for (var x in snapData!.docs) {
                      Map? data = x.data() as Map;
                      String name = data['name'];
                      String price = data['price'];
                      String description = data['description'];
                      String offer = data['offer'];
                      String category = data['category'];
                      HomeModal homeModal = HomeModal(
                        name: name,
                        price: price,
                        category: category,
                        offer: offer,
                        description: description,
                        id: x.id,
                      );
                      dataList.add(homeModal);
                    }
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            bottom: 10,
                            top: 10,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              homeController.dataList.clear();
                              var id = dataList[index].id;
                              var name = dataList[index].name;
                              var description = dataList[index].description;
                              var category = dataList[index].category;
                              var price = dataList[index].price;
                              var offer = dataList[index].offer;
                              UpdateModal updateModal = UpdateModal(
                                id: id,
                                description: description,
                                offer: offer,
                                category: category,
                                price: price,
                                name: name,
                              );
                              homeController.dataList.add(updateModal);
                              homeController.selectedUCategory.value =
                                  "${homeController.dataList[0].category}";
                              Get.toNamed('update_screen');
                            },
                            onDoubleTap: () {
                              var id = dataList[index].id;
                              FbHelper.fbHelper.deleteItem(
                                id: id,
                              );
                            },
                            onLongPress: () {
                              Get.toNamed('insert_screen');
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Container(
                                height: 500,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.blueAccent.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      offset: const Offset(
                                        5.0,
                                        5.0,
                                      ),
                                      blurRadius: 10.0,
                                      spreadRadius: 2.0,
                                    ), //BoxShadowBoxShadow
                                  ],
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
                                      Container(
                                        height: 200,
                                        width: 200,
                                        alignment: Alignment.center,

                                        child: Image.asset(
                                          "assets/img/3.png",
                                          height: 100,
                                          width: 100,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Expanded(
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                height:3 ,
                                                width: double.infinity,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "name : ${dataList[index].name}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                height:3 ,
                                                width: double.infinity,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Descreion : ${dataList[index].description}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 17,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                height:3 ,
                                                width: double.infinity,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "₹ ${dataList[index].price}.00",
                                                style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                height:3 ,
                                                width: double.infinity,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Category : ${dataList[index].category}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 17,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Container(
                                                height:3 ,
                                                width: double.infinity,
                                                color: Colors.white,
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: dataList.length,
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.toNamed('insert_screen');
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
