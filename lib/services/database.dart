import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exploreden_admin/modals/location_models.dart';
import 'package:exploreden_admin/services/storage.dart';
import 'package:uuid/uuid.dart';

class FirebaseMethods {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  var uuid = Uuid().v4();

  Future<String> createEvent(
    Uint8List locationPhoto,
    String locationName,
    String locationAddress,
    String locationDescription,
    String locationOpeningHrs,
    String locationRating,
  ) async {
    String res = "Some Information is Missing";
    try {
      String clubPhoto = await StorageMethods()
          .uploadImageToStorage("clubCoverPhoto", locationPhoto, true);

      LocationModel postModel = LocationModel(
        locationDescription: locationDescription,
        locationName: locationName,
        locationRating: locationRating,
        locationOpeningHrs: locationOpeningHrs,
        locationAddress: locationAddress,
        locationPhoto: clubPhoto,
      );

      ///Uploading Post To Firebase
      _firebaseFirestore
          .collection('locations')
          .doc(uuid)
          .set(postModel.toJson());
      res = 'Successfully Event is Created';
    } catch (e) {
      res = e.toString();
    }

    return res;
  }
}
