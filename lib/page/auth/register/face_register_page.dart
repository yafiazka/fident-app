// import 'dart:io';
//
// import 'package:fident_app/core/controller/face_register_controller.dart';
// import 'package:fident_app/theme/template.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class FaceRegisterPage extends GetView<FaceRegisterController> {
//   const FaceRegisterPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final String uid = Get.arguments;
//
//     return Scaffold(
//       backgroundColor: ChessColor.navy,
//       appBar: AppBar(
//         backgroundColor: ChessColor.navy,
//         elevation: 0,
//         title: const Text(
//           "Face Registration",
//           style: TextStyle(color: Colors.white),
//         ),
//         iconTheme: const IconThemeData(color: Colors.white),
//       ),
//       body: Obx(() {
//         File? photo = controller.faceFile.value;
//
//         return Center(
//           child: controller.isLoading.value
//               ? const CircularProgressIndicator(color: Colors.white)
//               : Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Ambil Foto Wajah Kamu",
//                       style: ChessTextStyle.rook.copyWith(color: Colors.white),
//                     ),
//                     const SizedBox(height: 30),
//
//                     /// PREVIEW FOTO
//                     photo == null
//                         ? Container(
//                             width: 200,
//                             height: 200,
//                             decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               border: Border.all(
//                                 color: Colors.white54,
//                                 width: 3,
//                               ),
//                             ),
//                             child: const Icon(
//                               Icons.face,
//                               size: 80,
//                               color: Colors.white54,
//                             ),
//                           )
//                         : ClipOval(
//                             child: Image.file(
//                               photo,
//                               width: 200,
//                               height: 200,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//
//                     const SizedBox(height: 30),
//
//                     /// BUTTON PILIH FOTO
//                     ElevatedButton(
//                       onPressed: () => _openImagePicker(context),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: ChessColor.highlight,
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 38,
//                           vertical: 14,
//                         ),
//                       ),
//                       child: const Text(
//                         "Pilih Foto",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//
//                     const SizedBox(height: 30),
//
//                     if (photo != null)
//                       SizedBox(
//                         width: 200,
//                         child: ElevatedButton(
//                           onPressed: () => controller.saveFace(uid),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.green,
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                           ),
//                           child: const Text(
//                             "Simpan & Lanjut",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//         );
//       }),
//     );
//   }
//
//   /// Bottom sheet gallery / camera
//   void _openImagePicker(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
//       ),
//       builder: (_) {
//         return SafeArea(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 leading: const Icon(Icons.camera_alt),
//                 title: const Text("Ambil dari Kamera"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   controller.pickFromCamera();
//                 },
//               ),
//               ListTile(
//                 leading: const Icon(Icons.photo_library),
//                 title: const Text("Pilih dari Galeri"),
//                 onTap: () {
//                   Navigator.pop(context);
//                   controller.pickFromGallery();
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
