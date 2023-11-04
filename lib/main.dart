// // import 'package:flutter/material.dart';
// // import 'package:flutter_application_2/list.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';

// // void main() {
// //   runApp(const MainApp());
// // }

// // class MainApp extends StatelessWidget {
// //   const MainApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final List<ListItem> items = [
// //       ListItem(
// //         1,
// //         'Conan ',
// //         'conan ohhh conan conan al mou7a99 conan la lallala la lalala ',
// //         Image.asset('assets/image/conan.jpg'),
// //       ),
// //       ListItem(2, 'Simba ', 'Description pour l\'élément 2',
// //           Image.asset('assets/image/simba.jpg')),
// //       ListItem(3, 'Sonic', 'Description pour l\'élément 3',
// //           Image.asset('assets/image/sonic.jpg')),
// //     ];

// //     return MaterialApp(
// //       home: Scaffold(
// //         // resizeToAvoidBottomInset: false,
// //         body: SingleChildScrollView(
// //           padding: const EdgeInsets.all(20),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               // Image.asset("assets/image/conan.jpg"),
// //               // const SizedBox(height: 15),
// //               // const Text(
// //               //   "Conan",
// //               //   style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
// //               // ),
// //               // const SizedBox(height: 15),
// //               // const Text(
// //               //     "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Venenatis tellus in metus vulputate eu scelerisque felis. Duis ut diam quam nulla porttitor massa. Vulputate enim nulla aliquet porttitor lacus luctus. Quam nulla porttitor massa id neque aliquam vestibulum morbi. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Id venenatis a condimentum vitae sapien pellentesque. Dui id ornare arcu odio. Tincidunt id aliquet risus feugiat in ante. Quam id leo in vitae turpis massa sed elementum. Dis parturient montes nascetur ridiculus mus mauris vitae. Interdum consectetur libero id faucibus nisl tincidunt eget. Quam nulla porttitor massa id neque aliquam."),
// //               ListView.builder(
// //                 shrinkWrap: true,
// //                 physics: NeverScrollableScrollPhysics(),
// //                 itemCount: items.length,
// //                 itemBuilder: (BuildContext context, int index) {
// //                   return ListTile(
// //                     // title: Text(items[index].title),
// //                     title: Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         Text(items[index].title), // Display the title
// //                         const SizedBox(
// //                             width:
// //                                 16), // Add some spacing between image and title
// //                         Container(
// //                           width:
// //                               50, // Set the width of the container to control the image size
// //                           height:
// //                               50, // Set the height of the container to control the image size
// //                           child: items[index].image, // Display the image
// //                         ),
// //                         const SizedBox(width: 16),
// //                       ],
// //                     ),
// //                     onTap: () {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => DetailPage(items[index]),
// //                         ),
// //                       );
// //                     },
// //                   );
// //                 },
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class DetailPage extends StatelessWidget {
// //   final ListItem item;

// //   DetailPage(this.item);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(' ${item.title}'),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(20),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             item.image,
// //             const SizedBox(height: 15),
// //             Text(
// //               ' ${item.title}',
// //               style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
// //             ),
// //             const SizedBox(height: 15),
// //             Text(
// //               ' ${item.description}',
// //               style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:flutter_application_2/film.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   Future<List<Film>> fetchFilms() async {
//     final response = await http.get(Uri.parse('https://swapi.dev/api/films/'));
//     if (response.statusCode == 200) {
//       List<dynamic> filmDataList = json.decode(response.body)['results'];
//       List<Film> films =
//           filmDataList.map((data) => Film.fromJson(data)).toList();
//       return films;
//     } else {
//       throw Exception('Failed to load films');
//     }
//   }

//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         // resizeToAvoidBottomInset: false,
//         body: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: FutureBuilder<List<Film>>(
//             future: fetchFilms(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return SizedBox(
//                   height: 400, // Set a fixed height for the ListView
//                   child: ListView.builder(
//                     itemCount: snapshot.data!.length,
//                     itemBuilder: (context, index) {
//                       Film film = snapshot.data![index];
//                       return ListTile(
//                         title: Text(film.title),
//                         subtitle: Text(
//                             "${film.description.replaceAll('\r\n', '').substring(0, 30)}..."),
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => DetailPage(film),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 );
//               } else if (snapshot.hasError) {
//                 return Text('Error: ${snapshot.error}');
//               }
//               return const Center(child: CircularProgressIndicator());
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// // class DetailPage extends StatelessWidget {
// //   final Film item;

// //   DetailPage(this.item);

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(' ${item.title}'),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(20),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // item.image,
// //             // const SizedBox(height: 15),
// //             Text(
// //               ' ${item.title}',
// //               style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
// //             ),

// //             const SizedBox(height: 15),
// //             Text(
// //               ' ${item.director}',
// //               style:
// //                   const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
// //             ),
// //             const SizedBox(height: 15),
// //             Text(
// //               ' ${item.producer}',
// //               style:
// //                   const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
// //             ),
// //             const SizedBox(height: 15),
// //             Text(
// //               ' ${item.releasedate}',
// //               style:
// //                   const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
// //             ),
// //             const SizedBox(height: 15),
// //             Text(
// //               ' ${item.created}',
// //               style:
// //                   const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
// //             ),
// //             const SizedBox(height: 15),
// //             Text(
// //               ' ${item.edited}',
// //               style:
// //                   const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
// //             ),
// //             const SizedBox(height: 15),
// //             Text(
// //               ' ${item.description}',
// //               style:
// //                   const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
// //             ),
// //             // Text(
// //             //   ' ${item.description}',
// //             //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
// //             // ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// class DetailPage extends StatelessWidget {
//   final Film item;

//   const DetailPage(this.item, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(' ${item.title}'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // const SizedBox(
//             // width: double.infinity, // Make the container take up full width

//             // child: Image.asset(
//             //   "assets/image/logo.png",
//             // ),
//             // ),

//             // item.image,
//             // const SizedBox(height: 15),
//             SizedBox(
//               width: double.infinity, // Make the container take up full width
//               child: Text(
//                 ' ${item.title}',
//                 style:
//                     const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
//               ),
//             ),

//             const SizedBox(height: 15),
//             SizedBox(
//               width: double.infinity,
//               child: Text(
//                 ' ${item.director}',
//                 style: const TextStyle(
//                     fontSize: 15, fontWeight: FontWeight.normal),
//               ),
//             ),
//             const SizedBox(height: 15),
//             SizedBox(
//               width: double.infinity,
//               child: Text(
//                 ' ${item.producer}',
//                 style: const TextStyle(
//                     fontSize: 15, fontWeight: FontWeight.normal),
//               ),
//             ),
//             const SizedBox(height: 15),
//             SizedBox(
//               width: double.infinity,
//               child: Text(
//                 ' ${item.releasedate}',
//                 style: const TextStyle(
//                     fontSize: 15, fontWeight: FontWeight.normal),
//               ),
//             ),
//             const SizedBox(height: 15),
//             SizedBox(
//               width: double.infinity,
//               child: Text(
//                 ' ${item.created}',
//                 style: const TextStyle(
//                     fontSize: 15, fontWeight: FontWeight.normal),
//               ),
//             ),
//             const SizedBox(height: 15),
//             SizedBox(
//               width: double.infinity,
//               child: Text(
//                 ' ${item.edited}',
//                 style: const TextStyle(
//                     fontSize: 15, fontWeight: FontWeight.normal),
//               ),
//             ),
//             const SizedBox(height: 15),
//             SizedBox(
//               width: double.infinity,
//               child: Text(
//                 ' ${item.description}'.replaceAll('\r\n', ''),
//                 style: const TextStyle(
//                     fontSize: 15, fontWeight: FontWeight.normal),
//               ),
//             ),
//             // Text(
//             //   ' ${item.description}',
//             //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

////provider
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_2/FilmsProvider.dart';
import 'package:flutter_application_2/details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_application_2/film.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  Future<List<Film>> fetchFilms() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/films/'));
    if (response.statusCode == 200) {
      List<dynamic> filmDataList = json.decode(response.body)['results'];
      List<Film> films =
          filmDataList.map((data) => Film.fromJson(data)).toList();
      return films;
    } else {
      throw Exception('Failed to load films');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FilmsProvider(),
      child: MaterialApp(
          home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding here
          child: FutureBuilder<List<Film>>(
            future: fetchFilms(),
            builder: (context, snapshot) {
              var filmsProvider = Provider.of<FilmsProvider>(context);
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (snapshot.hasData) {
                filmsProvider.setFilms(snapshot.data!);
                return const FilmsList();
              } else {
                return const Text('No data available');
              }
            },
          ),
        ),
      )),
    );
  }
}

class FilmsList extends StatelessWidget {
  const FilmsList({Key? key});

  @override
  Widget build(BuildContext context) {
    var filmsProvider = Provider.of<FilmsProvider>(context);
    var films = filmsProvider.films;
    var leng = films != null
        ? films.length.toString()
        : 'Loading...'; // Vérifier si films est null

    return Container(
      color: Colors.black,
      height: 800,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              'assets/image/logo.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.only(left: 16), // Set left margin here
            child: Text(
              "Total " + leng + " Movies",
              style: const TextStyle(
                  color: Colors.white,
                  // fontSize: 25,
                  fontWeight: FontWeight.normal),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: films.length,
              itemBuilder: (context, index) {
                Film film = films[index];
                return ListTile(
                  title: Text(
                    film.title,
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    "${film.description.replaceAll('\r\n', '').substring(0, 30)}...",
                    style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(film),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  color: Colors.white,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => FilmsProvider(),
      child: MainApp(),
    ),
  );
}
