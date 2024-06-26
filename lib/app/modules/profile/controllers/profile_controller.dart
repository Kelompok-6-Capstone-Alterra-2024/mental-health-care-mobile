import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mindease/app/modules/profile/mixins/change_password_mixin.dart';

import '../data/models/profile_model.dart';
import '../data/services/profile_service.dart';

class ProfileController extends GetxController with ChangePasswordMixin {
  var profile = Profile(
      status: false,
      message: '',
      data: Data(
        id: 0,
        email: '',
        name: '',
        username: '',
        address: '',
        bio: '',
        phoneNumber: '',
        gender: '',
        age: 0,
        profilePicture: '',
      )).obs;

  var isLoading = true.obs;

  Rx<File?> filepath = Rx<File?>(null);
  RxString fileName = 'Tambahkan Foto'.obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final ProfileService _profileService = ProfileService();

  @override
  void onInit() {
    super.onInit();
    fetchProfile();
  }

  void fetchProfile() async {
    try {
      isLoading(true);
      var result = await _profileService.getProfile();
      if (result != null) {
        profile.value = result;
      }
    } finally {
      isLoading(false);
    }
  }

  void pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );
    if (result != null) {
      filepath.value = File(result.files.single.path!);
      fileName.value = result.files.first.name;
    }
  }

  Future<void> updateProfile() async {
    print(usernameController.text);
    print(phoneNumberController.text);
    print(genderController.text);
    print(addressController.text);
    print(filepath.value);
    await _profileService.postProfile(
        username: usernameController.text,
        phoneNumber: phoneNumberController.text,
        gender: genderController.text,
        address: addressController.text,
        file: filepath.value);
  }

  // void updateProfile(
  //     String name,
  //     String username,
  //     String age,
  //     String phoneNumber,
  //     String gender,
  //     String address,
  //     String bio,
  //     String profilePicture) async {
  //   try {
  //     print(name);
  //     print(username);
  //     print(age);
  //     print(phoneNumber);
  //     print(gender);
  //     print(address);
  //     print(bio);
  //     print(profilePicture);
  //     isLoading(true);
  //     profile.update(
  //       (val) {
  //         if (val != null) {
  //           val.data.username = username;
  //           val.data.age = int.parse(age);
  //           val.data.phoneNumber = phoneNumber;
  //           val.data.gender = gender;
  //           val.data.address = address;
  //           val.data.name = name;
  //           val.data.bio = bio;
  //           val.data.profilePicture = profilePicture;
  //         }
  //       },
  //     );
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  final count = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
