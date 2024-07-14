// import 'package:flutter/material.dart';
// import 'package:kudiaccess/screens/sign_up.dart';
// import 'package:kudiaccess/utils/commons/custom_button.dart';
// import 'package:kudiaccess/widgets/custom_textfield.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController usernameController = TextEditingController();
//   final TextEditingController phoneNumberController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Center(
//                 child: Image(
//                     height: 200,
//                     width: 300,
//                     image: AssetImage(
//                       "assets/images/logo.png",
//                     )),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const Center(
//                 child: Text(
//                   "Your Financial Assistant",
//                   style: TextStyle(color: Colors.lightGreen, fontSize: 25),
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CustomTextField(
//                         controller: emailController,
//                         prefix: const Icon(Icons.email),
//                         hint: "Email"),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     CustomTextField(
//                         isPass: true,
//                         controller: passwordController,
//                         prefix: const Icon(Icons.lock),
//                         hint: "Password"),
//                     const SizedBox(
//                       height: 25,
//                     ),
//                     CustomButton(
//                         onPressed: () {},
//                         txt: "Login",
//                         width: double.infinity,
//                         color: Colors.lightGreen),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         const Text(
//                           'Don\'t Have An Account?',
//                           style: TextStyle(
//                             fontSize: 15,
//                           ),
//                         ),
//                         TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const SignUpPage()));
//                             },
//                             child: const Text(
//                               "SignUp",
//                               style: TextStyle(
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ))
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
