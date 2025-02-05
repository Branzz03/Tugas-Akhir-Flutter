import 'package:flutter/material.dart';

class EatAndStayPage extends StatefulWidget {
  const EatAndStayPage({super.key});

  @override
  _EatAndStayPageState createState() => _EatAndStayPageState();
}

class _EatAndStayPageState extends State<EatAndStayPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 20).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                backgroundColor: const Color(0xFF1565C0), // Warna biru navbar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Eat And Stay',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _animation.value),
                  child: child,
                );
              },
              child: const Text(
                'COMING SOON',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
    );
  }
}
