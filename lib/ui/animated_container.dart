import 'package:flutter/material.dart';

class AnimatedContainerSample extends StatefulWidget {
  const AnimatedContainerSample({super.key});

  @override
  State<AnimatedContainerSample> createState() => _AnimatedContainerSampleState();
}

class _AnimatedContainerSampleState extends State<AnimatedContainerSample> {
  double _width = 50;
  @override
  Widget build(BuildContext context)  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        ElevatedButton(
            onPressed: (){
              setState((){
                _width = (_width)%150 + 50;
              });
            },
            child: Text("Change size")),
        AnimatedContainer(
            duration: const Duration(
                milliseconds: 3000,
            ),
          curve: Curves.easeInOut,
          height: 100,
          width: _width,
          color: Colors.lightGreen,
        ),
      ],
    );
  }
}
