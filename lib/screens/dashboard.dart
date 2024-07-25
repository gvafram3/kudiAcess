// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:kudiaccess/screens/dashboard_tabs/budget.dart';
// import 'package:kudiaccess/screens/dashboard_tabs/history.dart';
// import 'package:kudiaccess/screens/dashboard_tabs/payment.dart';
// import 'package:kudiaccess/screens/dashboard_tabs/resources.dart';

// import '../providers/color_providers.dart';
// import 'dashboard_tabs/home.dart';

// // StateNotifier to manage the saving goal state
// class SavingGoalNotifier extends StateNotifier<SavingGoalState> {
//   SavingGoalNotifier() : super(SavingGoalState(goalAmount: 0, isActive: false));

//   void toggleGoal(bool isActive, BuildContext context) {
//     if (isActive) {
//       _showGoalDialog(context);
//     } else {
//       _confirmToggleOff(context);
//     }
//   }

//   void setGoal(double amount) {
//     state = state.copyWith(goalAmount: amount, isActive: true);
//   }

//   void deactivateGoal() {
//     state = state.copyWith(goalAmount: 0, isActive: false);
//   }

//   void _showGoalDialog(BuildContext context) {
//     final TextEditingController goalController = TextEditingController();

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Set Saving Goal'),
//           content: TextField(
//             controller: goalController,
//             keyboardType: TextInputType.number,
//             decoration: const InputDecoration(hintText: 'Enter goal amount'),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('Set'),
//               onPressed: () {
//                 final goalAmount = double.tryParse(goalController.text);
//                 if (goalAmount != null && goalAmount > 0) {
//                   setGoal(goalAmount);
//                   Navigator.of(context).pop();
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(
//                         content: Text('Please enter a valid amount')),
//                   );
//                 }
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void _confirmToggleOff(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Confirm'),
//           content:
//               const Text('Are you sure you want to remove your saving goal?'),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Cancel'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: const Text('Yes'),
//               onPressed: () {
//                 deactivateGoal();
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

// // Model to hold the saving goal state
// class SavingGoalState {
//   final double goalAmount;
//   final bool isActive;

//   SavingGoalState({required this.goalAmount, required this.isActive});

//   SavingGoalState copyWith({double? goalAmount, bool? isActive}) {
//     return SavingGoalState(
//       goalAmount: goalAmount ?? this.goalAmount,
//       isActive: isActive ?? this.isActive,
//     );
//   }
// }

// final savingGoalProvider =
//     StateNotifierProvider<SavingGoalNotifier, SavingGoalState>((ref) {
//   return SavingGoalNotifier();
// });

// class DashboardPage extends ConsumerStatefulWidget {
//   const DashboardPage({super.key});

//   @override
//   DashboardPageState createState() => DashboardPageState();
// }

// class DashboardPageState extends ConsumerState<DashboardPage> {
//   int currentIndex = 0;
//   final List<Widget> _screens = [
//     const HomeScreen(),
//     const HistoryScreen(),
//     const PaymentsScreen(),
//     const BudgetScreen(),
//     const ResourcesScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final colorState = ref.watch(colorProvider);
//     final savingGoalState = ref.watch(savingGoalProvider);
//     final savingGoalNotifier = ref.read(savingGoalProvider.notifier);

//     return Scaffold(
//       backgroundColor: colorState.baseColor,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: _screens[currentIndex],
//             ),
//             // Saving Goal Section beneath the budget for the month
//             if (currentIndex == 3) // Only show on the Budget screen
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Budget for the Month',
//                       style: Theme.of(context).textTheme.headline6,
//                     ),
//                     const SizedBox(height: 16),
//                     if (savingGoalState.isActive) ...[
//                       Text(
//                         'Saving Goal: GH¢${savingGoalState.goalAmount.toStringAsFixed(2)}',
//                         style: const TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8.0),
//                         child: LinearProgressIndicator(
//                           value:
//                               _calculateSavingProgress(), // Replace with actual logic
//                           backgroundColor: Colors.red[100],
//                           color: Colors.green[400],
//                         ),
//                       ),
//                     ],
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const Text('Enable Saving Goal'),
//                         Switch(
//                           value: savingGoalState.isActive,
//                           onChanged: (value) {
//                             savingGoalNotifier.toggleGoal(value, context);
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.blueGrey[900],
//         selectedItemColor: const Color.fromRGBO(243, 156, 18, 3),
//         unselectedItemColor: Colors.black,
//         currentIndex: currentIndex,
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.history),
//             label: 'History',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.payment),
//             label: 'Payment',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.mobile_friendly),
//             label: 'Budget',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'Resources',
//           ),
//         ],
//       ),
//     );
//   }

//   double _calculateSavingProgress() {
//     // Dummy calculation of spending vs goal (Replace with actual logic)
//     double spending = 2000; // Example spending value
//     final savingGoalState = ref.watch(savingGoalProvider);
//     return (spending / savingGoalState.goalAmount).clamp(0, 1);
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kudiaccess/screens/dashboard_tabs/budget.dart';
import 'package:kudiaccess/screens/dashboard_tabs/history.dart';
import 'package:kudiaccess/screens/dashboard_tabs/payment.dart';
import 'package:kudiaccess/screens/dashboard_tabs/resources.dart';


import '../providers/color_providers.dart';

import 'package:kudiaccess/screens/profile.dart';
import 'package:kudiaccess/screens/settings.dart';
import 'package:kudiaccess/utils/commons/flutter_tts.dart';
import 'package:kudiaccess/utils/commons/speech_to_txt.dart';
import 'dart:math' as math;

import 'dashboard_tabs/home.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({super.key});

  @override
  DashboardPageState createState() => DashboardPageState();
}


class DashboardPageState extends ConsumerState<DashboardPage> {

class DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  final SpeechService _speechService = SpeechService();
  final TextToSpeechService _ttsService = TextToSpeechService();
  late AnimationController _animationController;
  bool isListening = false;
  @override
  void initState() {
    super.initState();
    _initializeSpeech();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
  }

  Future<void> _initializeSpeech() async {
    bool available = await _speechService.initialize();
    if (available) {
      setState(() {});
    }
  }

  void _startListening() {
    setState(() {
      isListening = true;
      _animationController.forward();
    });
    _speechService.startListening((result) {
      print(result);
      if (result.contains('go to profile page')) {
        _ttsService.speak('Navigating to Profile page');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProfileScreen()));
      } else if (result.contains('go to settings')) {
        _ttsService.speak('Navigating to settings page');
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SettingsScreen()));
      } else if (result.contains('go to homepage')) {
        if (currentIndex == 0) {
          _ttsService.speak("You are already on the home page");
          print(currentIndex);
        } else {
          _ttsService.speak("Navigating to home page");
          setState(() {
            currentIndex = 0;
          });
        }
      } else if (result.contains('go to history page')) {
        if (currentIndex == 1) {
          _ttsService.speak("You are already on the history page");
        } else {
          _ttsService.speak("Navigating to history page");
          setState(() {
            currentIndex = 1;
          });
        }
      } else if (result.contains('go to payment page')) {
        if (currentIndex == 2) {
          _ttsService.speak("You are already on the payments to page");
        } else {
          _ttsService.speak("Navigating to payments page");
          setState(() {
            currentIndex = 2;
          });
        }
      } else if (result.contains('go to budget page')) {
        if (currentIndex == 3) {
          _ttsService.speak("You are already on the budget and goals to page");
        } else {
          _ttsService.speak("Navigating to budget and goals page");
          setState(() {
            currentIndex = 3;
          });
        }
      } else if (result.contains('go to resources page')) {
        if (currentIndex == 4) {
          _ttsService.speak("You are already on the resources to page");
        } else {
          _ttsService.speak("Navigating to resources and goals page");
          setState(() {
            currentIndex = 4;
          });
        }
      }
    });
  }

  void _stopListening() {
    setState(() {
      isListening = false;
      _animationController.stop();
      _animationController.reset();
    });
    _speechService.stopListening();
  }


  int currentIndex = 0;
  final List<Widget> _screens = [
    const HomeScreen(),
    const HistoryScreen(),
    const PaymentsScreen(),
    const BudgetScreen(),
    const ResourcesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final colorState = ref.watch(colorProvider);

    return Scaffold(
      backgroundColor: colorState.baseColor,
      body: SafeArea(
        child: _screens[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[900],
        selectedItemColor: const Color.fromRGBO(243, 156, 18, 3),
        unselectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
          print(currentIndex);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Payment',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mobile_friendly),
            label: 'Budget',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Resources',
          ),
        ],
      ),
      floatingActionButton: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => FloatingActionButton(
          onPressed:
              _speechService.isListening ? _stopListening : _startListening,
          child: Transform.rotate(
              angle: _animationController.value * 2 * math.pi,
              child:
                  Icon(_speechService.isListening ? Icons.mic : Icons.mic_off)),
        ),
      ),
    );
  }
}
