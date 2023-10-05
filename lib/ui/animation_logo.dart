import 'package:flutter/material.dart';
import 'package:sample_widget_test/ui/animation_slide.dart';
import 'package:sample_widget_test/ui/animation_hero.dart';

class AnimatedLogo extends StatefulWidget {
  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    // Khởi tạo AnimationController
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Khởi tạo Tween (biến đổi giá trị từ 0 đến 1)
    final curvedAnimation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOut, // sơ đồ biến đổi theo thời gian
    );

    // Khởi tạo Animation bằng Tween
    animation = Tween<double>(
      begin: 0,
      end: 300,
    ).animate(curvedAnimation);

    // Bắt đầu animation
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Logo'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (context) => SlideAnimation());
                  Navigator.push(context, route);
                },
                child: Text("Next animation")),
            ElevatedButton(
                onPressed: () {
                  MaterialPageRoute route =
                      MaterialPageRoute(builder: (context) => HeroAnimationSample());
                  Navigator.push(context, route);
                },
                child: Text("Hero animation")),
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return Container(
                  width: animation.value,
                  height: animation.value,
                  child: FlutterLogo(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Đảm bảo giải phóng tài nguyên khi widget bị hủy
    controller.dispose();
    super.dispose();
  }
}
