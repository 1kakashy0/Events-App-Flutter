/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************


import 'package:event_project/controller/checkout_controller.dart';
import 'package:event_project/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController controller = Get.put(CheckoutController());
    return Scaffold(
      backgroundColor: Appcolor.bkcolor,
      appBar:AppBar(
      backgroundColor: Appcolor.bkcolor,
      elevation: 5,
      leading:
                    Expanded(
                        child: Container(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                          onPressed: () {
                            Get.back() ;
                          }, icon: const Icon(Icons.arrow_back , color: Colors.white,)),
                    )),
                    title:  Expanded(
                        child: Container(
                      alignment: Alignment.center,
                      child: Text(
                      'CheckOut',
                        style: const TextStyle(fontSize: 25 , color: Appcolor.pink , fontWeight: FontWeight.bold
                        ),
                      ),
                    )),
                )  ,
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:Appcolor.pink ,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            onPressed: () {
              controller.checkout();
            },
            child: const Text("Checkout",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16 , color: Colors.white)),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // Payment Method Section
            const Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold , color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Payment Methods (Buttons/Options)
            PaymentMethodOption(
              icon: Icons.credit_card,
              label: 'Credit Card',
              onTap: () {
                // Logic for selecting Credit Card
                Get.snackbar("Payment Method", "Credit Card Selected");
              },
            ),
            const SizedBox(height: 50),
            Divider(),
            const SizedBox(height: 20),
            // PaymentMethodOption(
            //   icon: Icons.paypal,
            //   label: 'PayPal',
            //   onTap: () {
            //     // Logic for selecting PayPal
            //     Get.snackbar("Payment Method", "PayPal Selected");
            //   },
            // ),
            // const SizedBox(height: 10),
            // PaymentMethodOption(
            //   icon: Icons.account_balance_wallet,
            //   label: 'Google Pay',
            //   onTap: () {
            //     // Logic for selecting Google Pay
            //     Get.snackbar("Payment Method", "Google Pay Selected");
            //   },
            // ),
            // const SizedBox(height: 20),

            // Card Details Section
            const Text(
              'Enter Card Details',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 20),
            // Card Number Input
            PaymentTextField(
              label: 'Card Number',
              hintText: '1234 5678 9012 3456',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            // Expiry Date & CVV Input
            Row(
              children: [
                Expanded(
                  child: PaymentTextField(
                    label: 'Expiry Date',
                    hintText: 'MM/YY',
                    keyboardType: TextInputType.datetime,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: PaymentTextField(
                    label: 'CVV',
                    hintText: '123',
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Payment Butto
          ],
        ),
      ),
    );
  }
}

class PaymentMethodOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const PaymentMethodOption({
    Key? key,
    required this.icon,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.deepPurple, size: 30),
            const SizedBox(width: 15),
            Text(
              label,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}

class PaymentTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final TextInputType keyboardType;

  const PaymentTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600  , color: Colors.white),
        ),
        const SizedBox(height: 5),
        TextField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class Checkout extends StatelessWidget {
//   const Checkout({super.key});

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
//             const SizedBox(height: 20),
//             // PaymentMethodOption(
//             //   icon: Icons.paypal,
//             //   label: 'PayPal',
//             //   onTap: () {
//             //     // Logic for selecting PayPal
//             //     Get.snackbar("Payment Method", "PayPal Selected");
//             //   },
//             // ),
//             // const SizedBox(height: 10),
//             // PaymentMethodOption(
//             //   icon: Icons.account_balance_wallet,
//             //   label: 'Google Pay',
//             //   onTap: () {
//             //     // Logic for selecting Google Pay
//             //     Get.snackbar("Payment Method", "Google Pay Selected");
//             //   },
//             // ),
//             // const SizedBox(height: 20),

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
