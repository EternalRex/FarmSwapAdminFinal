import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class ReadFarmerImage extends StatelessWidget {
  const ReadFarmerImage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(

      //Represents a query to the Firestore database to fetch all documents from the 'FarmerUsers' collection.
      future: FirebaseFirestore.instance.collection('FarmerUsers').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          //Data is still loading
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          //Error occurred
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          //No data
          return const Center(
            child: Text('No photos found'),
          );
        } else {

          //Displays a gallery of photos from Firestore
          final documents = snapshot.data!.docs;
          final photoUrls = documents
              .map((doc) => (doc.data()
                  as Map<String, dynamic>)['docRequirements'] as List)
              .expand((element) => element)
              .map((item) => item as String)
              .toList();
          
          //Uses photo_view to allow users to interact with and enlarge the photos.
          return PhotoViewGallery.builder(
              itemCount: photoUrls.length,
              builder: (context, index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(photoUrls[index]),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.covered * 2,
                );
              });
        }
      },
    );
  }
}