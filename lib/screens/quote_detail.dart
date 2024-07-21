import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

import 'notifications.dart';
import 'profile.dart';
import 'settings.dart';

class QuoteDetail extends StatelessWidget {
  final String mainText;
  final String quoteText;
  final String author;
  final String date;

  const QuoteDetail({
    super.key,
    required this.mainText,
    required this.quoteText,
    required this.author,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const BuildHeader(),
            const SizedBox(height: 10),
            Container(
              height: 600,
              margin: const EdgeInsets.all(16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.0,
                    offset: Offset(0, 2),
                  ),
                ],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainText,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                  const SizedBox(height: 16.0),
                  const Spacer(),
                  Positioned(
                    bottom: 16,
                    right: 16,
                    child: Container(
                      height: 300,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quoteText,
                            style: TextStyle(
                                color: Colors.blue[800], fontSize: 14.0),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                author,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                              ),
                              Text(
                                date,
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Text('Mr. Frimpong'),
                  const SizedBox(height: 10),
                  const Text('July 27, 2024'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BuildHeader extends StatelessWidget {
  const BuildHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: Color.fromRGBO(243, 156, 18, 3),
          ),
        ),
        const SizedBox(width: 10),
        const Text(
          'Resources',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromRGBO(243, 156, 18, 3),
          ),
        ),
        const Spacer(),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsScreen(),
                    ));
              },
            ),
            const SizedBox(width: 1),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsScreen(),
                    ));
              },
              icon: const Icon(Icons.notification_add),
            ),
            const SizedBox(width: 1),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => const ProfileScreen()),
                  ),
                );
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white54,
                child: Icon(
                  Icons.person_2_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}






//import 'package:flutter/material.dart';

// class QuoteDetail extends StatelessWidget {
//   final String mainText;
//   final String quoteText;
//   final String author;
//   final String date;

//   const QuoteDetail({
//     super.key,
//     required this.mainText,
//     required this.quoteText,
//     required this.author,
//     required this.date,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(16.0),
//       padding: const EdgeInsets.all(16.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 8.0,
//             offset: Offset(0, 2),
//           ),
//         ],
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             mainText,
//             style: const TextStyle(fontSize: 14.0),
//           ),
//           const SizedBox(height: 16.0),
//           Container(
//             padding: const EdgeInsets.all(16.0),
//             decoration: BoxDecoration(
//               color: Colors.blue[50],
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   quoteText,
//                   style: TextStyle(color: Colors.blue[800], fontSize: 14.0),
//                 ),
//                 const SizedBox(height: 8.0),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       author,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold, fontSize: 14.0),
//                     ),
//                     Text(
//                       date,
//                       style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
