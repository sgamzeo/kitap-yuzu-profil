// class ImportedPdfsTab extends StatelessWidget {
//   const ImportedPdfsTab({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.find<MyLibraryController>();

//     return Obx(() {
//       if (controller.importedPdfs.isEmpty) {
//         return const Center(child: Text('Henüz içe aktarılmış PDF yok'));
//       }

//       return ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: controller.importedPdfs.length,
//         itemBuilder: (_, index) {
//           final pdf = controller.importedPdfs[index];

//           return ListTile(
//             leading: const Icon(Icons.picture_as_pdf),
//             title: Text(pdf.name),
//             subtitle: Text(
//               '${pdf.importedAt.day}.${pdf.importedAt.month}.${pdf.importedAt.year}',
//             ),
//             onTap: () {
//               Get.toNamed(
//                 AppRoutes.reader,
//                 arguments: {'pdfPath': pdf.path, 'isAsset': pdf.isAsset},
//               );
//             },
//           );
//         },
//       );
//     });
//   }
// }
