import 'package:flutter/material.dart';
import 'package:flutter_application_2/film.dart';

class DetailPage extends StatelessWidget {
  final Film film;

  const DetailPage(this.film, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film.title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Director: ${film.director}',
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 15),
            Text(
              'Producer: ${film.producer}',
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 15),
            Text(
              'Release Date: ${film.releasedate}',
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 15),
            Text(
              'Created: ${film.created}',
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 15),
            Text(
              'Edited: ${film.edited}',
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 15),
            Text(
              'Description: ${film.description.replaceAll('\r\n', '')}',
              style:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
