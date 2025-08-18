/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'package:get/get.dart';

class MyTranslation extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {
    'ar': {
      //langues page
      '1': "إختر اللغة",
      //boarding page
      '2': "ابحث عن أحداث \n المفضلة لديك هنا",
      '3': "استعدوا لتجربة لا تنسى",
      '4': "ابحث عن الأحداث \n القريبة هنا",
      '5': "دعونا نصنع الذكريات معًا!",
      '6': "قم بتحديث الحدث \n القادم هنا",
      '7' : "الوصول إلى كافة تحديثات الأحداث هنا",
      '8' : "التالي",
      //login page
      '9' : "مرحبا",
      '10': "يرجى تسجيل الدخول للحساب",
      '11': "أدخل البريد الالكتروني",
      '12': "البريد الالكتروني",
      '13': "أدخل كلمة المرور",
      '14': "كلمة المرور",
      '15': "هل نسيت كلمة المرور؟",
      '16': "تسجيل الدخول",
      '17': "ليس لديك حساب؟",
      '18': "إنشاء حساب",
      //signup page
      '19': "إنشاء حساب",
      '20': "الرجاء ملء هذه التفاصيل لإنشاء حساب جديد",
      '21': "أدخل اسم المستخدم الخاص بك",
      '22': "اسم المستخدم",
      '23': "أدخل رقم هاتفك",
      '24': "رقم الهاتف",
      '25': "البريد الإلكتروني",
      '26': "لدي حساب بالفعل!",
      '27': "تسجيل الدخول",
      // SignUp_controller
      '38': "نجاح",
      '39': "الحساب اقيم بنجاح",
      '40': "تحذير",
      '41': "'اسم المستخدم' أو 'رقم الهاتف' أو \n 'البريد الإلكتروني' موجود بالفعل",
      // Success SignUp
      '36': "التحقق من البريد الإلكتروني صالح",
      '37': "التحقق من النجاح",
      //forget password page
      '28': "أدخل البريد الإلكتروني لإعادة تعيين كلمة المرور",
      '29': "تأكيد",
      //verify code page
      '30': "أدخل رمز التحقق",
      '31':"تم إرسال رمز التحقق إلى عنوان بريدك الإلكتروني ",
      //reset password page
      '32': "أدخل كلمة المرور الجديدة",
      '33': "الرجاء إدخال كلمة المرور الجديدة",
      '34': "أعد إدخال كلمة المرور",
      '35': "حفظ",
      //success reset password page
      '42' : "نجحت إعادة تعيين كلمة المرور",
      '43' : "ناجحة",
      //Login controller page
      '44' : "البريد الإلكتروني أو كلمة المرور غير صحيحة" ,
      //verifycodesignup controller page
      '45' : "Verify Code Not Correct" ,
      //forgetpassword controller page
      '46' : "رمز التحقق غير صحيح" ,
      //resetpassword controller page
      '47' : "لا تستخدم كلمة المرور القديمة",
      //network controller page
      '48' : "يُرجى الاتصال بالإنترنت",

    },

    'en': {
      //langue page
      '1': 'Choose Language',
      //boarding pages
      '2': 'Find your favourite \n events here',
      '3': 'Get ready for an unforgettable experience',
      '4': "Find your nearby \n events here",
      '5': "Let's make memories together!",
      '6': "Update your upcoming \n event here",
      '7': "Access all event updates right here",
      '8': "next",
      //login page
      '9': "Welcome",
      '10': "Use Credentials to access your account",
      '11': "Enter your Email",
      '12': "Email",
      '13': "Enter your Password",
      '14': "Password",
      '15': "Forget Password?",
      '16': "Login",
      '17': "Don't have an account?",
      '18': "Sign Up",
      //signup page
      '19': "Create an Account",
      '20': "Please fill this detail to create a new account",
      '21': "Enter your username",
      '22': "Username",
      '23': "Enter your Phone Number",
      '24': "Phone Number",
      '25': "Email",
      '26': "I have already an account!",
      '27': "Login",
      // SignUp_controller
      '38': "Success",
      '39': "Account Created Successfully",
      '40': "Warning",
      '41': " 'Username' Or 'Phone Number' Or \n 'Email' Already Exists",
      // Success SignUp
      '36': "Email verification valid ",
      '37': "Check Successful",
      //forget password page
      '28': "Enter your email address to reset your password",
      '29': "Check",
      //verify code page
      '30': "Enter OTP Code",
      '31': "OTP code has been sent !! check your email address",
      //reset password page
      '32': "Enter New Password",
      '33': "Please Enter New Password",
      '34': "Re-Enter Password",
      '35': "save",
      //success reset password page
      '42' : "Reset Password Succeed",
      '43' : "Successful",
      //Login controller page
      '44' : "Email OR Password Not Correct " ,
      //verifycodesignup controller page
      '45' : "Verify Code Not Correct" ,
      //forgetpassword controller page
      '46' : "Email Not Found" ,
      //resetpassword controller page
      '47' : "Do Not Use An Old Password",
      //network controller page
      '48' : "PLEASE CONNECT TO THE INTERNET",

    },

    'fr': {
      //langue page
      '1': "Choisissez la langue",
      //boarding pages
      '2': "Trouvez ici vos événements \n préférés",
      '3': "Préparez-vous à vivre une expérience inoubliable",
      '4': "Trouvez ici vos événements \n à proximité",
      '5': "Créons des souvenirs ensemble !",
      '6': "Mettez à jour votre prochain événement \n ici",
      '7': "Accédez à tous les événements \n mises à jour ici",
      '8': "suivant",
      //login page
      '9': "Bienvenue ",
      '10': "Utilisez vos identifiants pour accéder à votre compte",
      '11': "Entrez votre email",
      '12': "Email",
      '13': "Entrez votre mot de passe",
      '14': "Mot de passe",
      '15': "Mot de passe oublié?",
      '16': "Se connecter",
      '17': "Vous n'avez pas de compte?",
      '18': "S'inscrire",
      //signup page
      '19': "Créer un compte",
      '20': "Veuillez renseigner ces détails pour créer un nouveau compte",
      '21': "Entrez votre nom d'utilisateur",
      '22': "Nom d'utilisateur",
      '23': "Entrez votre numéro de téléphone",
      '24': "Numéro de téléphone",
      '25': "Email",
      '26': "J'ai déjà un compte!",
      '27': "Se connecter",
      // SignUp_controller
      '38': "Succès",
      '39': "Compte créé avec succès",
      '40': "Avertissement",
      '41': " 'Nom d'utilisateur' ou 'Numéro de téléphone' ou \n 'Email' existe déjà",
      // Success SignUp
      '36': "Vérification de l'email valide",
      '37': "Vérification réussie",
      //forget password page
      '28': "Entrez votre email pour réinitialiser votre mot de passe",
      '29': "Vérifier",
      //verify code page
      '30': "Entrez le code OTP",
      '31': "Code OTP envoyé à votre adresse email ",
      //reset password page
      '32': "Entrez un nouveau mot de passe",
      '33': "Veuillez entrer un nouveau mot de passe",
      '34': "Entrez le nouveau mot de passe",
      '35': "sauvegarder",
      //success reset password page
      '42' : "Mot de passe réinitialisé avec succès",
      '43' : "Succès",
      //Login controller page
      '44' : "Email ou mot de passe incorrect",
      //verifycodesignup controller page
      '45' : "Code OTP incorrect",
      //forgetpassword controller page
      '46' : "Email non trouvé",
      //resetpassword controller page
      '47' : "Ne pas utiliser un mot de passe ancien",
      //network controller page
      '48' : "Veuillez vous connecter à l'internet",
    }
  };

}