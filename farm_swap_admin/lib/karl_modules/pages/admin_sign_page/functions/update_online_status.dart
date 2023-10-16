/*This class will pass a userid to the qurry and gets a document id from the querry class and 
updates the database*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farm_swap_admin/karl_modules/pages/admin_sign_page/data/update_online_status_querry.dart';

class UpdateOnlineStatus {
  UpdateOnlineStatusQuerry statusQuerry = UpdateOnlineStatusQuerry();

/*A function that will accept a userid and a boolean as parameter and update the database*/
  Future<void> updateOnlineStatus(String userid, bool active) async {
    await statusQuerry.getDocumentId(userid);
    final document =
        FirebaseFirestore.instance.collection('AdminUsers').doc(statusQuerry.documentId);
    final updateStatus = {'Online': active};
    await document.update(updateStatus);
  }
}
