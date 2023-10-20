import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DashboardRetrieveSpecificID {
/*This class gets the specific document id of a document in firesotre who User Id field
has the equivalent value of the current users id which is specified in the 
FirebaseAuth.instnace.currentUser!.uid */

  /*We create a variable were we will store the id we get from the querry
  bellow */
  String docId = "";

/*So this query simplu say that select the firestore document where the 
user id field is equal to the value of the  variable userID which contains the 
current user uid then get the id of that document and store it in the docId variable*/
  FirebaseFirestore db = FirebaseFirestore.instance;
  String userId = FirebaseAuth.instance.currentUser!.uid;

  /*This function also return a string meaning this will alo contain the document
 id we picked from firestore */
  Future<String> getDocsId() async {
    await db
        .collection('AdminUsers')
        .where('User Id', isEqualTo: userId)
        .get()
        .then((value) => value.docs.forEach((element) {
              docId = element.reference.id;
            }));
    return docId;
  }
}
