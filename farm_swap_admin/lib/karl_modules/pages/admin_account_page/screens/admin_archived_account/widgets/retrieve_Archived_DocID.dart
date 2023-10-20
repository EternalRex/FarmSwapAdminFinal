import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../admin_account_logs/database/admin_logs_insert.dart';

//Object for the admin logs model used to save admin logs to db
AdminLogsInsertDataDb adminLogs = AdminLogsInsertDataDb();

class RetrieveArchivedDocId {
  String documentID = "";
  FirebaseFirestore db = FirebaseFirestore.instance;
  String userId = FirebaseAuth.instance.currentUser!.uid;
  String? userEmail = FirebaseAuth.instance.currentUser!.email;

  Future<String> getDocsId() async {
    // Query to retrieve the document ID
    await db
        .collection('AdminUsers')
        .where('User Id', isEqualTo: userId)
        .get()
        .then((value) => value.docs.forEach((element) {
              documentID = element.reference.id;
            }));
    return documentID;
  }

  Future<void> updateFieldAndNavigate() async {
    // Call the getDocsId method to retrieve the document ID
    String docId = await getDocsId();

    //this will create a log of the user which is archive account
    adminLogs.createAdminLogs(
        userEmail, userId, "Account_Archived", DateTime.now());

    // Update a field in the Firestore document using the retrieved document ID
    await db.collection('AdminUsers').doc(docId).update({
      'Account Status': 'Archived',
      // Add more fields to update as needed
    });
  }
}

class RetrieveUnArchiveDocId {
  String documentID = "";
  FirebaseFirestore db = FirebaseFirestore.instance;
  String userId = FirebaseAuth.instance.currentUser!.uid;
  String? userEmail = FirebaseAuth.instance.currentUser!.email;

  Future<String> getDocsId() async {
    // Query to retrieve the document ID
    await db
        .collection('AdminUsers')
        .where('User Id', isEqualTo: userId)
        .get()
        .then((value) => value.docs.forEach((element) {
              documentID = element.reference.id;
            }));
    return documentID;
  }

  Future<void> updateFieldAndNavigate() async {
    // Call the getDocsId method to retrieve the document ID
    String docId = await getDocsId();

    //this will create a log of the user which is unarchive account
    adminLogs.createAdminLogs(
        userEmail, userId, "Account_Unarchived", DateTime.now());

    // Update a field in the Firestore document using the retrieved document ID
    await db.collection('AdminUsers').doc(docId).update({
      'Account Status': 'Active',
    });
  }
}
