import 'dart:convert';
import 'package:flutter/services.dart'; // To load JSON file
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';


class ShopController extends GetxController{

  List<dynamic> wilayasData = []; // مصفوفة البيانات المحملة


  String selectedWilaya = "اختر ولاية";
  List<String> wilayas = [];
  List<String> communes = [];
  String selectedCommune = "اختر بلدية"; // البلدية المختارة
  @override
  void onInit() {
    super.onInit();
    loadWilayasFromJson(); // تحميل البيانات عند تهيئة الـ Controller
  }
  // Future<void> uploadWilayasData() async {
  //   // Load JSON data from assets (make sure the file is in your assets folder)
  //   String jsonString = await rootBundle.loadString('assets/algeria_cities.json');
  //
  //   // Parse the JSON data
  //   List<dynamic> wilayasList = jsonDecode(jsonString);
  //
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  //   for (var wilaya in wilayasList) {
  //     String wilayaCode = wilaya['wilaya_code'];
  //     String wilayaName = wilaya['wilaya_name'];
  //     String communeName = wilaya['commune_name'];
  //     String dairaName = wilaya['daira_name'];
  //
  //     // Create a reference to the wilaya document in Firestore
  //     DocumentReference wilayaRef = firestore.collection('wilayas').doc(wilayaCode);
  //
  //     // Set the wilaya data
  //     await wilayaRef.set({
  //       'name': wilayaName,
  //       'code': wilayaCode,
  //     });
  //
  //     // Add communes as a subcollection
  //     await wilayaRef.collection('communes').add({
  //       'commune_name': communeName,
  //       'daira_name': dairaName,
  //     });
  //   }
  // }

  Future<void> loadWilayasFromJson() async {
    // تحميل ملف JSON
    String jsonString = await rootBundle.loadString('assets/algeria_cities.json');
    // فك ترميز JSON إلى قائمة
    wilayasData = jsonDecode(jsonString);
    // استخراج أسماء الولايات فقط وإضافتها إلى القائمة
      wilayas = wilayasData
          .map<String>((entry) => entry['wilaya_name'].toString().trim())
          .toSet() // تحويل القائمة إلى مجموعة لإزالة التكرارات
          .toList();
      update();
  }

    void selectWilaya(String wilaya) {
    selectedWilaya = wilaya;
    loadCommunesForSelectedWilaya();
    selectedCommune = "اختر بلدية"; // إعادة تعيين البلدية المختارة
    update();  // تحديث الواجهة
      print(selectedWilaya);
  }


  void loadCommunesForSelectedWilaya() {
    communes.clear(); // تفريغ البلديات السابقة

    // العثور على البلديات الخاصة بالولاية المختارة
    for (var entry in wilayasData) {
      if (entry['wilaya_name'] == selectedWilaya) {
        communes.add(entry['commune_name']);
      }
    }
   print(communes);
    update(); // تحديث الواجهة
  }
  void selectCommune(String commune) {
    selectedCommune = commune; // تحديث البلدية المختارة
    update(); // تحديث الواجهة
  }
}
