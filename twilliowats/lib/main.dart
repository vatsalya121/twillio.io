import 'package:flutter/material.dart';
import 'services/whatsapp_service.dart'; // Import the WhatsApp service

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Order Sender',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Send Order via WhatsApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _orderController = TextEditingController();
  final WhatsAppService _whatsappService = WhatsAppService();
  String _statusMessage = "";

  void _sendOrder() async {
    String recipient = _phoneController.text;
    String message = _orderController.text;

    bool success = await _whatsappService.sendMessage(recipient, message);

    setState(() {
      _statusMessage = success ? 'Order sent successfully!' : 'Failed to send order.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: "Recipient's WhatsApp Number",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            TextField(
              controller: _orderController,
              decoration: InputDecoration(
                labelText: "Order Details",
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _sendOrder,
              child: Text('Send Order'),
            ),
            SizedBox(height: 16),
            Text(_statusMessage),
          ],
        ),
      ),
    );
  }
}
