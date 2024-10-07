import 'package:cloud_firestore/cloud_firestore.dart';

class Command {
  final String clientName;
  final String wilaya;
  final String commune;
  final int quantity;
  final String product;

  Command({
    required this.clientName,
    required this.wilaya,
    required this.commune,
    required this.quantity,
    required this.product,
  });

  // Method to convert Command to Map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'clientName': clientName,
      'wilaya': wilaya,
      'commune': commune,
      'quantity': quantity,
      'product': product,
      'timestamp': FieldValue.serverTimestamp(), // Optional timestamp
    };
  }
}