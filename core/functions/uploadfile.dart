/// ***********************************
/// * Copyright © 2025 Aziz Athimni. *
/// * All rights reserved.             *
/// ***********************************

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async{

  final XFile? file = await ImagePicker().pickImage(source : ImageSource.camera , imageQuality: 90 ) ;
  if (file!= null) {
      return File(file.path);
    }else {
      return null;
    }
}

fileUploadGallery([isSvg = false]) async{

  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions:isSvg ? [
      "svg" ,
      "SVG"
  ] : [
    "jpg",
    "jpeg",
    "png",
    "gif",
    "JPG",
    "JPEG",
    "PNG",
    "GIF",

  ]
  );
    if (result!= null) {
      return File(result.files.single.path!);
    }else {
      return null;
    }
}