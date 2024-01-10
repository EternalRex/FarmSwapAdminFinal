import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../admin_account_logs/database/admin_logs_insert.dart';

//Object for the admin logs model used to save admin logs to db
AdminLogsInsertDataDb adminLogs = AdminLogsInsertDataDb();

class RetrieveDeactivateDocId {
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

  Future<void> updateFieldDeactivate() async {
    // Call the getDocsId method to retrieve the document ID
    String docId = await getDocsId();

    //this will create a log of the user which is deactivate account
    adminLogs.createAdminLogs(
        userEmail, userId, "Deactivate_Account", DateTime.now());

    // Update a field in the Firestore document using the retrieved document ID
    await db.collection('AdminUsers').doc(docId).update({
      'Account Status': 'Deactivated',
      // Add more fields to update as needed
    });
  }
}

class RetrieveReactivateDocId {
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

  Future<void> updateFieldReactivate() async {
    // Call the getDocsId method to retrieve the document ID
    String docId = await getDocsId();

    //this will create a log of the user which is request reactivate account
    adminLogs.createAdminLogs(
        userEmail, userId, "Request_Reactivation", DateTime.now());

    // Update a field in the Firestore document using the retrieved document ID
    await db.collection('AdminUsers').doc(docId).update({
      'Account Status': 'Requesting',
    });
  }
}

class RetrieveArchiveDocId {
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

  Future<void> updateFieldArchive() async {
    // Call the getDocsId method to retrieve the document ID
    String docId = await getDocsId();

    //this will create a log of the user which is archived own account
    adminLogs.createAdminLogs(
        userEmail, userId, "Archived_Account", DateTime.now());

    // Update a field in the Firestore document using the retrieved document ID
    await db.collection('AdminUsers').doc(docId).update({
      'Account Status': 'Archived',
    });
  }
}
