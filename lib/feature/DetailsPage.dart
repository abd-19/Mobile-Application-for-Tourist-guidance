// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ArchaeologicalSite {
  final String name;
  final String imageUrl;

  const ArchaeologicalSite({
    required this.name,
    required this.imageUrl,
  });
}

class Details {
  final String name;
  final int population;
  final String mapUrl;
  final String description;
  final List<ArchaeologicalSite> archaeologicalSitesImages;

  const Details({
    required this.name,
    required this.population,
    required this.mapUrl,
    required this.description,
    required this.archaeologicalSitesImages,
  });
}

class DetailsPage extends StatelessWidget {
  final Details selectedDetails;

  const DetailsPage({Key? key, required this.selectedDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Center(
          child: Text(
            'Details for ${selectedDetails.name}',
            style: TextStyle(
              fontSize: 30,
              color: const Color.fromARGB(255, 241, 240, 240),
              fontWeight: FontWeight.bold,
              fontFamily: 'PT Sans',
            ),
          ),
        ),
        backgroundColor: Color(0xff008fa0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              selectedDetails.mapUrl,
              fit: BoxFit.cover,
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                selectedDetails.name,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                selectedDetails.description,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Population: ${selectedDetails.population}',
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
            ),
            // Display a list of archaeological sites with names and images
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Archaeological Sites Images:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: selectedDetails.archaeologicalSitesImages.length,
              itemBuilder: (context, index) {
                final archaeologicalSite = selectedDetails.archaeologicalSitesImages[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(
                        archaeologicalSite.imageUrl,
                        fit: BoxFit.contain,
                        height: 100,
                      ),
                      Text(
                        archaeologicalSite.name,
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
