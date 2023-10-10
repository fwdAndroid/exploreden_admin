import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exploreden_admin/modals/location_models.dart';
import 'package:uuid/uuid.dart';

class Database {
  Future<String> addLocation({
    required String name,
    required String location,
    required String address,
  }) async {
    String res = 'Some error occured';
    var uuid = Uuid().v4();

    try {
      if (name.isNotEmpty || location.isNotEmpty) {
        //Add User to the database with modal

        LocationModel userModel = LocationModel(
            location: location, address: address, name: name, uuid: uuid);
        await FirebaseFirestore.instance
            .collection('location')
            .doc(uuid)
            .set(userModel.toJson());

        res = 'success';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
