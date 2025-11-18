import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress Screen')),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text('Circular Progress Indicator'),
            SizedBox(height: 20),
            CircularProgressIndicator(
              strokeAlign: 2,
              backgroundColor: Colors.black12,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
            SizedBox(height: 30),
            Text('Linear Progress Indicator'),
            SizedBox(height: 20),
            _ControllerProgressIndicator(),
            SizedBox(height: 30),
            ProgressBarSimulation2(),
          ],
        ),
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        return (value % 101) / 100; // Valor entre 0.0 y 1.0
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        double progress = snapshot.data as double ?? 0.0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              CircularProgressIndicator(
                value: progress,
                strokeAlign: 2,
                backgroundColor: Colors.black12,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              SizedBox(width: 20),
              Expanded(
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.black12,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              SizedBox(width: 10),
              Text('${(progress * 100).toInt()}%'),
            ],
          ),
        );
      },
    );
  }
}

class ProgressBarSimulation2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          CircularProgressIndicator(
            strokeAlign: 2,
            backgroundColor: Colors.black12,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
          SizedBox(width: 20),
          Expanded(
            child: LinearProgressIndicator(
              backgroundColor: Colors.black12,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ),
        ],
      ),
    );
  }
}

class ProgressBarSimulation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      // Stream que emite un número incremental cada 200 ms
      stream: Stream.periodic(
        const Duration(milliseconds: 200),
        (count) => count,
      ),
      builder: (context, snapshot) {
        int value = snapshot.data ?? 0;

        // Limitar el valor máximo a 100
        double progress = (value % 101) / 100;

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LinearProgressIndicator(
              value: progress, // valor entre 0 y 1
              backgroundColor: Colors.grey[300],
              color: Colors.green,
            ),
            SizedBox(height: 20),
            Text('${(progress * 100).toInt()}%'),
          ],
        );
      },
    );
  }
}
