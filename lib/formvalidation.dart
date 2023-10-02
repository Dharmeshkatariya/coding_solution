import 'package:get/get.dart';


mixin FormValidationMixin {









  String  validateRequired(String?  value ){
    String  valid = "" ;
    if (value!.isEmpty) {
      valid = "this filed require" ;
      return valid;
    }

    return valid;

  }




//
//

//
// // Using regex for email validation
// final password = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
// // final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
// if (!password.hasMatch(value)) {
//   valid =   AppString.plaseentewwrValidPassword.tr;
//   return valid;
// }
// return valid;


// if (controller.emailController.text.isEmpty) {
//   return AppString.thisFieldRequired.tr;
// }

// if (!RegExp(r'\S+@\S+\.\S+')
//     .hasMatch(controller.emailController.text)) {
//   return AppString.plaseentewwrValidEmail.tr;
// }

// if (controller.passwordController.text.isEmpty) {
//   return AppString.thisFieldRequired.tr;
// }

// String validateEmail(String? value) {
//   String  valid = "" ;
//
//   if (value == null || !value.contains('@')) {
//     valid = AppString.plaseentewwrValidEmail.tr;
//     return valid ;
//   }
//   // Using regex for email validation
//   final email = RegExp(r'\S+@\S+\.\S+');
//   // final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
//   if (!email.hasMatch(value)) {
//     valid  = AppString.plaseentewwrValidEmail.tr;
//     return valid;
//   }
//   return valid;
// }

}
