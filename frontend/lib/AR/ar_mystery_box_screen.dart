import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vector_math/vector_math_64.dart' as vector64;

class ArMysteryBoxScreen extends StatefulWidget {
  const ArMysteryBoxScreen({super.key});

  @override
  State<ArMysteryBoxScreen> createState() => _ArMysteryBoxScreenState();
}

class _ArMysteryBoxScreenState extends State<ArMysteryBoxScreen> {
  ArCoreController? coreController;

  augmentedRealityViewCreated(ArCoreController controller){
    coreController = controller;

    displayCube(coreController!);
  }

  displayCube(ArCoreController controller)async{
    final ByteData questionMtextureBytes = await rootBundle.load("assets/QM.png");

    final materials = ArCoreMaterial(
      color: Colors.purple,
      textureBytes: questionMtextureBytes.buffer.asUint8List(),
    );

    final cube = ArCoreCube(
        size: vector64.Vector3(0.75,0.75,0.75),
        materials: [materials],
    );

    final node = ArCoreNode(
      shape: cube,
      position: vector64.Vector3(-0.5,0.5,-3.5),
    );

    coreController!.addArCoreNode(node);
  }

  void claimReward() {
    // Implement your function to claim the reward
    print("Claim reward");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mystery Box"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ArCoreView(
              onArCoreViewCreated: augmentedRealityViewCreated,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: claimReward,
              child: const Text('Claim'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50), // makes the button wide
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:flutter/material.dart';
// import 'package:vector_math/vector_math_64.dart';
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
//   augmentedRealityViewCreated(ArCoreController controller) {
//     coreController = controller;
//     displayModel(coreController!);
//       debugPrint("Mystery box loaded");
//
//   }
//
//   displayModel(ArCoreController controller) async {
//     // Ensure your .obj file is correctly referenced in your pubspec.yamlw
//     String modelPath = "assets/untitled.glb";  // Update with your actual model path
//
//     // Use ArCoreNode with ArCoreReferenceNode to load the .obj model
//     final node = ArCoreReferenceNode(
//       name: '3DModel',
//       objectUrl: modelPath,
//       position: Vector3(0, 0, 0),
//       scale: Vector3.all(2.0),
//       rotation: Vector4(0,0,0,0),
//     );
//
//     controller.addArCoreNode(node);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Mystery Box"),
//       ),
//       body: ArCoreView(
//         onArCoreViewCreated: augmentedRealityViewCreated,
//       ),
//     );
//   }
// }

