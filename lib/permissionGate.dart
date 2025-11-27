import 'package:flutter/material.dart';
import 'package:walkoftoday/routerPage.dart';
import 'Permission/permission.dart';

class PermissionGate extends StatelessWidget {
  const PermissionGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("앱 사용을 위해 위치 권한이 필요합니다."),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool granted = await PermissionService().init();
                if (granted && context.mounted) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const RouterPage()),
                  );
                }
              },
              child: const Text("권한 허용하기"),
            ),
          ],
        ),
      ),
    );
  }
}
