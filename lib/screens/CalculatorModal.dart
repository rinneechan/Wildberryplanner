import 'package:flutter/material.dart';

class CalculatorModal extends StatefulWidget {
  @override
  _CalculatorModalState createState() => _CalculatorModalState();
}

class _CalculatorModalState extends State<CalculatorModal> {
  final TextEditingController _inputController = TextEditingController();
  String _result = "";
  String _currentInput = ""; // Menyimpan input saat ini

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _inputController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Enter value',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              _currentInput = value;
            },
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: _convertToCelsius,
                child: Text('To Celsius'),
              ),
              ElevatedButton(
                onPressed: _convertToFahrenheit,
                child: Text('To Fahrenheit'),
              ),
              ElevatedButton(
                onPressed: _convertToUSD,
                child: Text('To USD'),
              ),
              ElevatedButton(
                onPressed: _convertToIDR,
                child: Text('To IDR'),
              ),
            ],
          ),
          SizedBox(height: 20),
          _buildNumberPad(), // Membuat keypad angka
          SizedBox(height: 20),
          Text(
            'Result: $_result',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Membuat tombol angka kalkulator
  Widget _buildNumberPad() {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: 12,
      itemBuilder: (context, index) {
        String buttonText;
        if (index < 9) {
          buttonText = (index + 1).toString();
        } else if (index == 9) {
          buttonText = '0';
        } else if (index == 10) {
          buttonText = 'Clear';
        } else {
          buttonText = 'OK';
        }

        return ElevatedButton(
          onPressed: () {
            if (buttonText == 'Clear') {
              setState(() {
                _currentInput = '';
                _inputController.clear();
                _result = '';
              });
            } else if (buttonText == 'OK') {
              _calculate();
            } else {
              setState(() {
                _currentInput += buttonText;
                _inputController.text = _currentInput;
              });
            }
          },
          child: Text(buttonText, style: TextStyle(fontSize: 20)),
        );
      },
    );
  }

  void _convertToCelsius() {
    setState(() {
      double fahrenheit = double.tryParse(_currentInput) ?? 0;
      double celsius = (fahrenheit - 32) * 5 / 9;
      _result = '$celsius °C';
    });
  }

  void _convertToFahrenheit() {
    setState(() {
      double celsius = double.tryParse(_currentInput) ?? 0;
      double fahrenheit = (celsius * 9 / 5) + 32;
      _result = '$fahrenheit °F';
    });
  }

  void _convertToUSD() {
    setState(() {
      double idr = double.tryParse(_currentInput) ?? 0;
      double usd = idr / 14500; // Misalnya nilai tukar 1 USD = 14500 IDR
      _result = '\$${usd.toStringAsFixed(2)}';
    });
  }

  void _convertToIDR() {
    setState(() {
      double usd = double.tryParse(_currentInput) ?? 0;
      double idr = usd * 14500; // Misalnya nilai tukar 1 USD = 14500 IDR
      _result = 'Rp ${idr.toStringAsFixed(0)}';
    });
  }

  void _calculate() {
    setState(() {
      double value = double.tryParse(_currentInput) ?? 0;
      _result = (value * 2).toString(); // Perhitungan sederhana
    });
  }
}
