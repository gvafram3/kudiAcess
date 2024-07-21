import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.prefix,
    this.isPass = false,
    required this.hint,
  });
  final TextEditingController controller;
  final bool isPass;
  final String hint;
  final Icon prefix;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isHidden = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        filled: true,
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen)),
        hintText: widget.hint,
        prefixIcon: widget.prefix,
        prefixIconColor: Colors.lightGreen,
        suffixIcon: widget.isPass
            ? IconButton(
                icon: Icon(
                  color: Colors.lightGreen,
                  isHidden ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },
              )
            : null,
        border: const OutlineInputBorder(),
      ),
      obscureText: widget.isPass ? isHidden : false,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter ${widget.hint}';
        }

        return null;
      },
    );
  }
}






// Form(
//                     key: _formKey,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Stack(
//                           clipBehavior: Clip.none,
//                           children: [
//                             image == null
//                                 ? const CircleAvatar(
//                                     radius: 60,
//                                     backgroundImage:
//                                         AssetImage("assets/images/tf.jpeg"),
//                                   )
//                                 : CircleAvatar(
//                                     radius: 60,
//                                     backgroundColor: Colors.lightGreen,
//                                     backgroundImage: MemoryImage(image!),
//                                   ),
//                             Positioned(
//                               bottom: -90,
//                               top: 0,
//                               right: -5,
//                               child: GestureDetector(
//                                 onTap: pickeProfilePic,
//                                 child: CircleAvatar(
//                                   backgroundColor: Colors.blue,
//                                   radius: 20,
//                                   child: IconButton(
//                                       color: Colors.white,
//                                       onPressed: pickeProfilePic,
//                                       icon: const Icon(Icons.add_a_photo)),
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         SlideTransition(
//                           position: _nameSlideAnimation,
//                           child: TextFormField(
//                             controller: _nameController,
//                             decoration: const InputDecoration(
//                               filled: true,
//                               hintText: 'Name',
//                               prefixIcon: Icon(Icons.person),
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your name';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(height: 16.0),
//                         SlideTransition(
//                           position: _emailSlideAnimation,
//                           child: TextFormField(
//                             controller: _emailController,
//                             decoration: const InputDecoration(
//                               filled: true,
//                               hintText: "Email",
//                               prefixIcon: Icon(Icons.email),
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your email';
//                               }
//                               if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
//                                   .hasMatch(value)) {
//                                 return 'Please enter a valid email';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(height: 16.0),
//                         SlideTransition(
//                           position: _passwordSlideAnimation,
//                           child: TextFormField(
//                             controller: _passwordController,
//                             decoration: InputDecoration(
//                               filled: true,
//                               hintText: 'Password',
//                               prefixIcon: const Icon(Icons.lock),
//                               suffixIcon: IconButton(
//                                 icon: Icon(
//                                   _obscurePassword
//                                       ? Icons.visibility
//                                       : Icons.visibility_off,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     _obscurePassword = !_obscurePassword;
//                                   });
//                                 },
//                               ),
//                               border: const OutlineInputBorder(),
//                             ),
//                             obscureText: _obscurePassword,
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your password';
//                               }
//                               if (value.length < 6) {
//                                 return 'Password must be at least 6 characters long';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                         const SizedBox(height: 16.0),
//                         SlideTransition(
//                           position: _confirmPasswordSlideAnimation,
                          // child: 
//                         ),
//                         const SizedBox(height: 16.0),
//                         SlideTransition(
//                           position: _buttonSlideAnimation,
//                           child: SizedBox(
//                             height: 50,
//                             width: double.infinity,
//                             child: ElevatedButton(
//                               onPressed: _signUp,
//                               style: ElevatedButton.styleFrom(
//                                 foregroundColor: Colors.white,
//                                 backgroundColor: Colors.blueAccent,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(12.0),
//                                 ),
//                                 padding: const EdgeInsets.symmetric(
//                                     vertical: 12.0, horizontal: 24.0),
//                                 textStyle: const TextStyle(fontSize: 18.0),
//                               ),
//                               child: const Text('Sign Up'),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 16.0),
//                         FadeTransition(
//                           opacity: _fadeAnimation,
//                           child: SlideTransition(
//                             position: _textSlideAnimation,
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 const Text("Already have an account?"),
//                                 TextButton(
//                                   onPressed: () {
//                                     // Navigate to login screen
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) =>
//                                                 const LoginScreen()));
//                                   },
//                                   style: TextButton.styleFrom(
//                                     foregroundColor: Colors.blueAccent,
//                                     textStyle: const TextStyle(fontSize: 16.0),
//                                   ),
//                                   child: const Text('Login'),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),