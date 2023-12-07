import 'package:cloud_firestore/cloud_firestore.dart';

class LocationModel {
  String locationName;
  String locationAddress;
  String locationDescription;
  String locationOpeningHrs;
  String locationRating;
  String locationPhoto;

  LocationModel(
      {required this.locationName,
      required this.locationAddress,
      required this.locationDescription,
      required this.locationOpeningHrs,
      required this.locationRating,
      required this.locationPhoto});

  ///Converting OBject into Json Object
  Map<String, dynamic> toJson() => {
        "locationName": locationName,
        "locationAddress": locationAddress,
        "locationDescription": locationDescription,
        "locationOpeningHrs": locationOpeningHrs,
        "locationRating": locationRating,
        "locationPhoto": locationPhoto,
      };

  ///
  static LocationModel fromSnap(DocumentSnapshot snaps) {
    var snapshot = snaps.data() as Map<String, dynamic>;

    return LocationModel(
      locationName: snapshot['locationName'],
      locationAddress: snapshot['locationAddress'],
      locationDescription: snapshot['locationDescription'],
      locationOpeningHrs: snapshot['locationOpeningHrs'],
      locationRating: snapshot['locationRating'],
      locationPhoto: snapshot['locationPhoto'],
    );
  }
}
