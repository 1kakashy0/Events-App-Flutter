/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:event_project/core/constant/routesnames.dart';
import 'package:event_project/core/middleware/mymiddleware.dart';
import 'package:event_project/view/screen/address/add.dart';
import 'package:event_project/view/screen/address/adddetails.dart';
import 'package:event_project/view/screen/address/view.dart';
import 'package:event_project/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:event_project/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:event_project/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:event_project/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:event_project/view/screen/auth/signup.dart';
import 'package:event_project/view/screen/auth/success_signup.dart';
import 'package:event_project/view/screen/auth/verifycodesignup.dart';
import 'package:event_project/view/screen/cart.dart';
import 'package:event_project/view/screen/checkout.dart';
import 'package:event_project/view/screen/events/addevents.dart';
import 'package:event_project/view/screen/events/editevents.dart';
import 'package:event_project/view/screen/events/events.dart';
import 'package:event_project/view/screen/events/eventsview.dart';
import 'package:event_project/view/screen/feedback.dart';
import 'package:event_project/view/screen/homescreen.dart';
import 'package:event_project/view/screen/myfavorite.dart';
import 'package:event_project/view/screen/onboarding.dart';
import 'package:event_project/view/screen/orders/archive.dart';
import 'package:event_project/view/screen/orders/details.dart';
import 'package:event_project/view/screen/productdetails.dart';
import 'package:event_project/view/screen/splashscreen.dart';
import 'package:event_project/view/screen/usersview.dart';
import 'package:get/get.dart';

import 'view/screen/auth/login.dart';
import 'view/screen/language.dart';

List<GetPage<dynamic>>? routes = [
  //init
  GetPage(name: "/", page: () => const SplashScreen()),
  // GetPage(name: "/", page: () => const ProductDetails()),
  // GetPage(name: "/", page: () =>   QRCodeScreen()),
  
  //onboarding
  GetPage(
      name: AppRoute.language,
      page: () => const Language(),
      middlewares: [MyMiddleWare()]
      ),
  //Auth
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetpassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.resetpassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.verifycode, page: () => const VerifyCode()),
  GetPage(
      name: AppRoute.successresetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successsignup, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onboarding, page: () => const Onboarding()),
  GetPage(
      name: AppRoute.verifycodesignup, page: () => const VerifyCodeSignUp()),

  //Home
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.eventspage, page: () => const EventsPage()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavorite, page: () => const Myfavorite()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.addressadddetails, page: () => const AddressAddDetails()), 
  //orders
  GetPage(name: AppRoute.ordersArchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersDetails, page: () => const OrdersDetails()),
  //offers
  // GetPage(name: AppRoute.offersView, page: () => const OffersView()),
  //usersevents
  GetPage(name: AppRoute.addevents, page: () => const AddEvents()),
  GetPage(name: AppRoute.eventsView, page: () => const UsersEventView()),
  GetPage(name: AppRoute.editevents, page: () => const EditEvents ()),
  ///FeedBack
  GetPage(name: AppRoute.addFeedback, page: () => const AddFeedBack()),
  //
  GetPage(name: AppRoute.usersView, page: () => const UsersView()),
  // GetPage(name: AppRoute.paymentPage, page: () => const PaymentPage()),

  // GetPage(name: AppRoute.usersView, page: () => const S()),
  

];
