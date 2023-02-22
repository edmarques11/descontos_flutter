import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Desconto',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController initValueController = TextEditingController();
  final TextEditingController discountController = TextEditingController();
  final TextEditingController percentualController = TextEditingController();
  double result = 0;

  Widget buildTextField(String label, TextEditingController controller) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.blue),
        border: const OutlineInputBorder(),
      ),
      style: const TextStyle(
        color: Colors.blue,
        fontSize: 25,
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Desconto'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Divider(),
            Text(
              result.toString(),
              textAlign: TextAlign.center,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            const Divider(),
            buildTextField('Valor inicial', initValueController),
            const Divider(),
            buildTextField('Desconto', discountController),
            const Divider(),
            buildTextField('Inteiro/Decimal', percentualController),
            const Divider(),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  result = calcularDesconto(
                      double.parse(initValueController.text),
                      double.parse(discountController.text),
                      int.parse(percentualController.text));
                });
              },
              child: const Text(
                'Calcular',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}

double calcularDesconto(double initValue, double discount, int percentual) {
  if (discount <= 0) {
    throw ArgumentError("O desconto deve ser maior que zero!");
  }

  if (initValue <= 0) {
    throw ArgumentError("O valor inicial deve ser maior que zero!");
  }

  if (percentual != 0) return initValue - (initValue * discount / 100);

  return initValue - discount;
}
