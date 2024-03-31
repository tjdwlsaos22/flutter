import 'package:flutter/material.dart';
import 'package:snackbar_app/snackbar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SnackBar'),
        ),
        body: const MySnackBar()
        // Center(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       ElevatedButton(
        //         onPressed: () => SnackBarFuction(context, Colors.red),
        //         style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
        //         child: const Text('SnackBar button 1'),
        //       ),
        //       SizedBox(height: 20), // Add some spacing between the buttons
        //       ElevatedButton(
        //         onPressed: () => SnackBarFuction(context, Colors.blue),
        //         style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        //         child: const Text('SnackBar button 2'),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }

  //function
//   SnackBarFuction(BuildContext context, Color backgroundColor) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: const Text('Elevated Button is Clicked'),
//         backgroundColor: backgroundColor,
//         duration: const Duration(seconds: 1),
//       ),
//     );
//   }
// }
}
