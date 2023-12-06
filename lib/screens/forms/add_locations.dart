import 'dart:typed_data';

import 'package:exploreden_admin/services/database.dart';
import 'package:exploreden_admin/utils/buttons.dart';
import 'package:exploreden_admin/utils/colors.dart';
import 'package:exploreden_admin/utils/controllers.dart';
import 'package:exploreden_admin/utils/pick_image.dart';
import 'package:exploreden_admin/widgets/input_text_form.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddLocations extends StatefulWidget {
  AddLocations({super.key});

  @override
  State<AddLocations> createState() => _AddLocationsState();
}

class _AddLocationsState extends State<AddLocations> {
  bool _isLoading = false;
  Uint8List? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          "Go Back",
          textAlign: TextAlign.center,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          width: 448,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 59, backgroundImage: MemoryImage(_image!))
                      : CircleAvatar(
                          radius: 59,
                          backgroundImage: NetworkImage(
                              'https://static.remove.bg/remove-bg-web/a6eefcd21dff1bbc2448264c32f7b48d7380cb17/assets/start_remove-c851bdf8d3127a24e2d137a55b1b427378cd17385b01aec6e59d5d4b5f39d2ec.png'),
                        ),
                  Positioned(
                      bottom: -10,
                      left: 70,
                      child: IconButton(
                          onPressed: () => selectImage(),
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.black,
                          )))
                ],
              ),
              SizedBox(
                height: 20,
              ),
              //Users

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Location Name",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              const SizedBox(height: 9),
              InputText(
                controller: nameController,
                labelText: "Enter Location Name",
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {},
                onSaved: (val) {},
                textInputAction: TextInputAction.done,
                isPassword: false,
                enabled: true,
              ),
              const SizedBox(height: 9),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Location Address",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              const SizedBox(height: 9),
              InputText(
                controller: addressController,
                labelText: "Enter Location Address",
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {},
                onSaved: (val) {},
                textInputAction: TextInputAction.done,
                isPassword: false,
                enabled: true,
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Location Detail",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
              ),
              const SizedBox(height: 9),
              InputText(
                controller: locationController,
                labelText: "Enter Location Detail",
                keyboardType: TextInputType.visiblePassword,
                onChanged: (value) {},
                onSaved: (val) {},
                textInputAction: TextInputAction.done,
                isPassword: false,
                enabled: true,
              ),

              SizedBox(height: 10),

              const SizedBox(height: 30),
              WonsButton(
                height: 50,
                width: 348,
                verticalPadding: 0,
                color: AppColors.primary,
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Colors.white,
                      ))
                    : Text(
                        "Add",
                        style: TextStyle(
                            color: AppColors.neutral,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                onPressed: onCreate,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _image = ui;
    });
  }

  void onCreate() async {
    //Area

    if (nameController.text.isEmpty &&
        addressController.text.isEmpty &&
        locationController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("All Fields are required")));
    } else if (nameController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("name address is required")));
    } else if (addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("address of the location is required")));
    } else if (locationController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("location is required")));
    } else {
      setState(() {
        _isLoading = true;
      });
      String rse = await Database().addLocation(
        file: _image!,
        address: addressController.text,
        location: locationController.text,
        name: nameController.text,
      );

      print(rse);
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Conguration Location is Added")));
      Navigator.pop(context);
    }
  }
}
