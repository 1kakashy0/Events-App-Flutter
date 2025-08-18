/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

class QRCodeData {
  final String cartId;
  final String cartUsersId;
  final String cartEventsId;
  final String cartOrders;
  final String qrCodeImage;

  QRCodeData({
    required this.cartId,
    required this.cartUsersId,
    required this.cartEventsId,
    required this.cartOrders,
    required this.qrCodeImage,
  });
}