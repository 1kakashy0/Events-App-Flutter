/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class PaymentPage extends StatelessWidget {
//   const PaymentPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.deepPurple,
//         title: const Text('Payment'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: ListView(
//           children: [
//             // Payment Method Section
//             const Text(
//               'Select Payment Method',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),

//             // Payment Methods (Buttons/Options)
//             PaymentMethodOption(
//               icon: Icons.credit_card,
//               label: 'Credit Card',
//               onTap: () {
//                 // Logic for selecting Credit Card
//                 Get.snackbar("Payment Method", "Credit Card Selected");
//               },
//             ),
//             const SizedBox(height: 10),
//             PaymentMethodOption(
//               icon: Icons.paypal,
//               label: 'PayPal',
//               onTap: () {
//                 // Logic for selecting PayPal
//                 Get.snackbar("Payment Method", "PayPal Selected");
//               },
//             ),
//             const SizedBox(height: 10),
//             PaymentMethodOption(
//               icon: Icons.account_balance_wallet,
//               label: 'Google Pay',
//               onTap: () {
//                 // Logic for selecting Google Pay
//                 Get.snackbar("Payment Method", "Google Pay Selected");
//               },
//             ),
//             const SizedBox(height: 20),

//             // Card Details Section
//             const Text(
//               'Enter Card Details',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             // Card Number Input
//             PaymentTextField(
//               label: 'Card Number',
//               hintText: '1234 5678 9012 3456',
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 10),
//             // Expiry Date & CVV Input
//             Row(
//               children: [
//                 Expanded(
//                   child: PaymentTextField(
//                     label: 'Expiry Date',
//                     hintText: 'MM/YY',
//                     keyboardType: TextInputType.datetime,
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 Expanded(
//                   child: PaymentTextField(
//                     label: 'CVV',
//                     hintText: '123',
//                     keyboardType: TextInputType.number,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 20),

//             // Payment Button
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepPurple,
//                 padding: const EdgeInsets.symmetric(vertical: 15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               onPressed: () {
//                 // Logic for proceeding with payment
//                 Get.snackbar("Payment", "Processing your payment...");
//               },
//               child: const Text(
//                 'Pay Now',
//                 style: TextStyle(fontSize: 18),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PaymentMethodOption extends StatelessWidget {
//   final IconData icon;
//   final String label;
//   final VoidCallback onTap;

//   const PaymentMethodOption({
//     Key? key,
//     required this.icon,
//     required this.label,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(10),
//           color: Colors.grey.shade200,
//         ),
//         child: Row(
//           children: [
//             Icon(icon, color: Colors.deepPurple, size: 30),
//             const SizedBox(width: 15),
//             Text(
//               label,
//               style: const TextStyle(fontSize: 16),
//             ),
//             const Spacer(),
//             const Icon(Icons.arrow_forward_ios, size: 16),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class PaymentTextField extends StatelessWidget {
//   final String label;
//   final String hintText;
//   final TextInputType keyboardType;

//   const PaymentTextField({
//     Key? key,
//     required this.label,
//     required this.hintText,
//     required this.keyboardType,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
//         ),
//         const SizedBox(height: 5),
//         TextField(
//           keyboardType: keyboardType,
//           decoration: InputDecoration(
//             hintText: hintText,
//             filled: true,
//             fillColor: Colors.white,
//             contentPadding: const EdgeInsets.all(15),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
