/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

class AppLink {

static const String server = "" ;

static const String test = "$server/test.php" ;

// ================Notification============== //

static const String notification = "$server/notification.php";


// ================Auth============== //

static const String signUp = "$server/auth/signup.php" ;
static const String verifycodesignup = "$server/auth/verifycode.php" ;
static const String login = "$server/auth/login.php" ;
static const String resend= "$server/auth/resend.php" ;

//=============ForgetPassword==============//

static const String checkemail = "$server/forgetpassword/checkemail.php" ;
static const String resetPassword = "$server/forgetpassword/resetpassword.php" ;
static const String verifycoderesetpassword = "$server/forgetpassword/verifycoderesetpassword.php" ;

//=============Home==============//

static const String homepage = "$server/home.php" ;


//=============Events==============//

static const String eventpage = "$server/events/events.php" ;
static const String search = "$server/events/search.php" ;


//=============Favorite==============//

static const String favoriteAdd = "$server/favorite/add.php" ;
static const String favoriteRemove = "$server/favorite/remove.php" ;
static const String favoriteView = "$server/favorite/view.php" ;
static const String deleteFromFavorite = "$server/favorite/deletefromfavorite.php" ;

//=============Cart==============//
static const String cartView = "$server/cart/View.php" ;
static const String cartAdd = "$server/cart/add.php" ;
static const String cartRemove = "$server/cart/delete.php" ;
static const String cartgetcountevents = "$server/cart/getcountevents.php";

//=============Address==========//

  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";


//=============orders==============//
static const String checkout = "$server/orders/checkout.php";
static const String archiveOrders = "$server/orders/orders.php";
static const String ordersDetails = "$server/orders/details.php";

//=============offers==============//

static const String offers = "$server/offers.php" ;

//=============Image==============//

static const String imageStatic = "$server/upload" ;
static const String imageCategories = "$imageStatic/categories/" ;
static const String imageEvents = "$imageStatic/events/" ;
static const String imageFeedback = "$imageStatic/feedback/" ;


//=============eventusers==============//

static const String eventUsersAdd = "$server/events/add.php" ;
static const String eventUsersEdit = "$server/events/edit.php" ;
static const String eventUsersView = "$server/events/view.php" ;
static const String eventUsersDelete = "$server/events/delete.php" ;


//=============eventusers==============//

static const String submitfeedback = "$server/feedback/submit_feedback.php" ;
static const String getfeedback = "$server/feedback/get_feedback.php" ;


//=============users==============//

static const String usersView = "$server/users/view.php" ;
static const String usersEdit = "$server/users/edit.php" ;


//=============categories==============//

static const String getCategories =  "$server/categories/view.php" ;


}