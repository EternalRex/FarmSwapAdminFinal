import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class RetrieveFarmerAddress extends StatelessWidget {
  RetrieveFarmerAddress({
    super.key,
  });

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: firestore.collection('FarmerUsers').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No data found'));
        }

        // Process and display GeoPoint data
        return SizedBox(
          width: 440,
          child: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              var document = snapshot.data!.docs[index];
              final geoPoint = document['address'] as GeoPoint;
        
              // Convert GeoPoint to a human-readable address
              return FutureBuilder<List<Placemark>>(
                future: placemarkFromCoordinates(
                  geoPoint.latitude,
                  geoPoint.longitude,
                ),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const ListTile(
                      title: Text('Loading address...'),
                    );
                  }
                  if (snapshot.hasError) {
                    return ListTile(
                      title: Text('Error: ${snapshot.error}'),
                    );
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const ListTile(
                      title: Text('Address not found'),
                    );
                  }
        
                  // Display the human-readable address
                  var placemark = snapshot.data![0];
                  return ListTile(
                    title: Text(
                        'Address: ${placemark.street}, ${placemark.locality}'),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
