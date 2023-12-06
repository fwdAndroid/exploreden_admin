import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
  String uuid;
  String location;
  String address;
  String photoURL;
  String name;

  LocationModel({
    required this.uuid,
    required this.location,
    required this.address,
    required this.name,
    required this.photoURL,
  });

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        'name': name,
        'uuid': uuid,
        'address': address,
        'location': location,
        'photoURL': photoURL,
      };

  ///
  static LocationModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return LocationModel(
      name: snapshot['name'],
      uuid: snapshot['uuid'],
      photoURL: snapshot['photoURL'],
      address: snapshot['address'],
      location: snapshot['location'],
    );
  }
}
