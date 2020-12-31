// import 'package:antidotelanguagearabic/GUI/Signup.dart';
// import 'package:antidotelanguagearabic/GUI/Subjectpage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
//
// class FirebaseController extends GetxController{
//
//   FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Rx<User> _firebaseUser = Rx<User>();
//
//   String get user => _firebaseUser.value?.email;
//
//   @override
//   void onInit() {
//     _firebaseUser.bindStream(_auth.authStateChanges());
//   }
//
//
//   // function to createuser, login and sign out user
//  //
//  // void createUser(String firstname,String lastname,String email,String password) async
//  // {
//  //   CollectionReference reference = FirebaseFirestore.instance.collection("Users");
//  //
//  //   Map<String,String> userdata ={
//  //     "First Name": firstname,
//  //      "Last Name": lastname,
//  //      "Email":email
//  //   };
//  //
//  //   await _auth.createUserWithEmailAndPassword(email: email, password: password).
//  //   then((value) {
//  //
//  //     reference.add(userdata).then((value) =>  Get.offAll(Signup()));
//  //   }).catchError((onError)=>
//  //       Get.snackbar("Error while creating account ", onError.message),
//  //   );
//  // }
//
//  // void login(String email,String password) async
//  // {
//  //   await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) => Get.offAll(Subjectpage())).
//  //       catchError((onError)=>
//  //   Get.snackbar("Error while sign in ", onError.message));
//  // }
//  //
//  // void signout() async{
//  // await _auth.signOut().then((value) => Get.offAll(Signup()));
//  //
//  // }
//
//
//  void sendpasswordresetemail(String email) async{
//     await _auth.sendPasswordResetEmail(email: email).then((value) {
//       Get.offAll(Signup());
//       Get.snackbar("Password Reset email link is been sent", "Success");
//     }).catchError((onError)=> Get.snackbar("Error In Email Reset", onError.message) );
//  }
//
//  // void deleteuseraccount(String email,String pass) async{
//  //    User user = await _auth.currentUser;
//  //
//  //    AuthCredential credential = EmailAuthProvider.credential(email: email, password: pass);
//  //
//  //
//  //    await user.reauthenticateWithCredential(credential).then((value) {
//  //      value.user.delete().then((res) {
//  //        Get.offAll(Signup());
//  //        Get.snackbar("User Account Deleted ", "Success");
//  //      });
//  //    }
//  //
//  //    ).catchError((onError)=> Get.snackbar("Credential Error", "Failed"));
//  //  }
//
// }