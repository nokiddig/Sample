import 'package:flutter/material.dart';
import 'package:sample_widget_test/ui/animated_container.dart';


class SlideAnimation extends StatefulWidget {
  const SlideAnimation({super.key});

  @override
  State<SlideAnimation> createState() => _SlideAnimationState();
}

class _SlideAnimationState extends State<SlideAnimation> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 3000)
    );

    //them hieu ung
    final CurvedAnimation curved = CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut
    );


    // Khởi tạo Animation bằng Tween
    animation = Tween<double>(
      begin: 0,
      end: 250,
    ).animate(curved);

    // Bắt đầu animation
    animationController.forward();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('sample animation'),
      ),
      body: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget? child) {
          return Stack(
            children: [
              Center(child: AnimatedContainerSample()),
              Positioned(
                left: animation.value,
                top: 300,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.amber,
                ),
              )
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }
}
