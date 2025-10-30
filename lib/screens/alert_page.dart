import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alert Page')),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Alert!!'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            shape: StadiumBorder(),
          ),
          onPressed: () => _showAlert(context),
        ),
        
      ),
    );
    
  }
  
  void _showAlert(BuildContext context) {
    showDialog(
      context: context, 
      barrierDismissible: true,
      builder: (context) {
      return AlertDialog(
        title: Text('Alert Title'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('This is a personalized alert message.'),
            FlutterLogo(size: 50.0),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("Cancel")),
          TextButton(onPressed: () => Navigator.of(context).pop(), child: Text("OK"))
        ],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      );
    });

    
  }
}




