import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:restaurent/src/repository/authentication_repository/authentication_repository.dart';

import 'app.dart';
import 'firebase_options.dart';


/// ------ For Docs & Updates Check ------
/// ------------- README.md --------------

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// -- README(Update[]) -- GetX Local Storage
  // Todo: Add Local Storage

  /// -- README(Docs[1]) -- Await Splash until other items Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// -- README(Docs[2]) -- Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((_) => Get.put(AuthenticationRepository()));

  /// -- Main App Starts here (app.dart) ...
  runApp( App());
}


//second
// import 'package:flutter/material.dart';
//
// import 'home.dart';
//
// void main() => runApp(new MyApp());
//
//
//
// class MyApp extends StatelessWidget {
//   const MyApp({ Key? key }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Home(),
//
//     );
//   }
// }

//third
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DisplayGeneratedImage(),
//     );
//   }
// }
//
// class DisplayGeneratedImage extends StatefulWidget {
//   @override
//   _DisplayGeneratedImageState createState() => _DisplayGeneratedImageState();
// }
//
// class _DisplayGeneratedImageState extends State<DisplayGeneratedImage> {
//   Image? fetchedImage; // Store the fetched image
//
//   Future<void> fetchImage() async {
//     var response = await http.get(Uri.parse('http://127.0.0.1:5000/?query=a'));
//
//     if (response.statusCode == 200) {
//       setState(() {
//         fetchedImage = Image.memory(
//           response.bodyBytes,
//           fit: BoxFit.contain, // Adjust the image fit as needed
//         );
//       });
//     } else {
//       print('Failed to fetch the image');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Display Generated Image'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (fetchedImage != null) fetchedImage!,
//             ElevatedButton(
//               onPressed: fetchImage,
//               child: Text('Fetch Image'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

