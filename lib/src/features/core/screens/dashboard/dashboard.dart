import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:restaurent/src/features/core/screens/dashboard/widgets/appbar.dart';

import '../../../../constants/image_strings.dart';
// Other imports...

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String url = ''; // Define the URL for image generation API
  Image? fetchedImage; // Store the fetched image

  Future<void> fetchImage() async {
    var response = await http.get(Uri.parse('http://127.0.0.1:5000/?query=a'));

    if (response.statusCode == 200) {
      setState(() {
        fetchedImage = Image.memory(
          response.bodyBytes,
          fit: BoxFit.contain, // Adjust the image fit as needed
        );
      });
    } else {
      print('Failed to fetch the image');
    }
  }

  @override
  Widget build(BuildContext context) {
    //Variables
    final txtTheme = Theme.of(context).textTheme;
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(isDark: isDark),
        drawer: Drawer(
          child: ListView(
            children: const [
              UserAccountsDrawerHeader(
                currentAccountPicture: Image(image: AssetImage(tLogoImage)),
                currentAccountPictureSize: Size(100, 100),
                accountName: Text('Coding with T'),
                accountEmail: Text('support@codingwithT.com'),
              ),
              ListTile(leading: Icon(Icons.home), title: Text('Home')),
              ListTile(leading: Icon(Icons.verified_user), title: Text('Profile')),
              ListTile(leading: Icon(Icons.shopping_bag), title: Text('Shop')),
              ListTile(leading: Icon(Icons.favorite), title: Text('Wishlist')),
              // Add other list items as needed...
            ],
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (fetchedImage != null) fetchedImage!,
              ElevatedButton(
                onPressed: fetchImage,
                child: Text('Fetch Image'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


//
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
//
