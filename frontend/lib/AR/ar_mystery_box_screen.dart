// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:flutter/material.dart';
// import 'package:vector_math/vector_math_64.dart' as vector64;
//
// class ArMysteryBoxScreen extends StatefulWidget {
//   const ArMysteryBoxScreen({super.key});
//
//   @override
//   State<ArMysteryBoxScreen> createState() => _ArMysteryBoxScreenState();
// }
//
// class _ArMysteryBoxScreenState extends State<ArMysteryBoxScreen> {
//   ArCoreController? coreController;
//
//   augmentedRealityViewCreated(ArCoreController controller){
//     coreController = controller;
//
//     displayCube(coreController!);
//   }
//
//   displayCube(ArCoreController controller){
//     final materials = ArCoreMaterial(
//       color: Colors.teal,
//       metallic: 2,
//     );
//
//     final cube = ArCoreCube(
//         size: vector64.Vector3(0.75,0.75,0.75),
//         materials: [materials],
//     );
//
//     final node = ArCoreNode(
//       shape: cube,
//       position: vector64.Vector3(-0.5,0.5,-3.5),
//     );
//
//     coreController!.addArCoreNode(node);
//   }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: const Text(
//   //         "Mystery Box"
//   //       ),
//   //     ),
//   //     body: ArCoreView(
//   //       onArCoreViewCreated: augmentedRealityViewCreated,
//   //     ),
//   //   );
//   // }
//   //
//   void claimReward() {
//     // Implement your function to claim the reward
//     print("Claim reward");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Mystery Box"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ArCoreView(
//               onArCoreViewCreated: augmentedRealityViewCreated,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: claimReward,
//               child: const Text('Claim'),
//               style: ElevatedButton.styleFrom(
//                 minimumSize: const Size(double.infinity, 50), // makes the button wide
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
