import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/models/commande.dart';

class CommandController extends GetxController {
  // Firestore reference
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Function to save command to Firestore
  Future<void> saveCommand(Command command) async {
    try {
      // Add the command to Firestore
      await firestore.collection('commands').add(command.toMap());
      print('Command saved to Firestore successfully!');
    } catch (e) {
      print('Error saving command: $e');
    }
  }
}