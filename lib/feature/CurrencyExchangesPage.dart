// ignore_for_file: prefer_final_fields, use_key_in_widget_constructors, avoid_print, prefer_const_constructors, depend_on_referenced_packages, library_private_types_in_public_api, file_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CurrencyExchangesPage extends StatefulWidget {
  @override
  _CurrencyExchangesPageState createState() => _CurrencyExchangesPageState();
}

class _CurrencyExchangesPageState extends State<CurrencyExchangesPage> {
  TextEditingController _amountController = TextEditingController();
  String _fromCurrency = 'USD';
  String _toCurrency = 'IQD';
  double _convertedAmount = 0.0;
  double _totalSum = 0.0; // To store the sum of selected Iraqi currencies

  Map<String, String> currencyNames = {
    'USD': 'US Dollar',
    'EUR': 'Euro',
    'GBP': 'British Pound',
    'JPY': 'Japanese Yen',
    'AUD': 'Australian Dollar',
    'CAD': 'Canadian Dollar',
    'CHF': 'Swiss Franc',
    'CNY': 'Chinese Yuan',
    'SEK': 'Swedish Krona',
    'NZD': 'New Zealand Dollar',
    'KRW': 'South Korean Won',
    'SGD': 'Singapore Dollar',
    'NOK': 'Norwegian Krone',
    'MXN': 'Mexican Peso',
    'INR': 'Indian Rupee',
    'RUB': 'Russian Ruble',
    'BRL': 'Brazilian Real',
    'ZAR': 'South African Rand',
    'TRY': 'Turkish Lira',
    'AED': 'UAE Dirham',
    'SAR': 'Saudi Riyal',
    'IQD': 'Iraqi Dinar',
  };

  // List of Iraqi currencies with their images and values
  List<CurrencyInfo> _iraqiCurrencies = [
    CurrencyInfo(
        image: 'images/_iraqiCurrencies/250.jpg', value: 250, dollor: 0.17),
    CurrencyInfo(
        image: 'images/_iraqiCurrencies/500.jpg', value: 500, dollor: 0.34),
    CurrencyInfo(
        image: 'images/_iraqiCurrencies/1000.jpg', value: 1000, dollor: 0.68),
    CurrencyInfo(
        image: 'images/_iraqiCurrencies/5000.jpg', value: 5000, dollor: 3.40),
    CurrencyInfo(
        image: 'images/_iraqiCurrencies/10000.jpg', value: 10000, dollor: 6.80),
    CurrencyInfo(
        image: 'images/_iraqiCurrencies/25000.jpg',
        value: 25000,
        dollor: 17.00),
    CurrencyInfo(
        image: 'images/_iraqiCurrencies/50000.jpg',
        value: 50000,
        dollor: 34.00),
  ];

  void convertCurrency() async {
    String apiKey = 'b81372d7df61619659b00183';
    String apiUrl =
        'https://open.er-api.com/v6/latest/$_fromCurrency?apikey=$apiKey';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        double exchangeRate = data['rates'][_toCurrency];
        double amount = double.parse(_amountController.text);
        double convertedAmount = amount * exchangeRate;

        setState(() {
          _convertedAmount = convertedAmount;
        });
      } else {
        throw Exception('Failed to load exchange rates');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Function to handle the selection of Iraqi currencies
  void selectCurrency(int index) {
    setState(() {
      _totalSum += _iraqiCurrencies[index].value;
    });
  }

  void resetValues() {
    setState(() {
      _amountController.text = '';
      _convertedAmount = 0.0;
      _totalSum = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Currency Converter',
            style: TextStyle(
              fontSize: 30,
              color: const Color.fromARGB(255, 241, 240, 240),
              fontWeight: FontWeight.bold,
              fontFamily: 'PT Sans',
            ),
          ),
        ),
        backgroundColor: Color(0xff008fa0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: double.infinity,
          width: 500,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 0, 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd8d8d8),
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                    color: Color(0xffd8d8d8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            DropdownButton<String>(
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff3b3b3b),
                                fontWeight: FontWeight.bold,
                              ),
                              value: _fromCurrency,
                              items: currencyNames.keys
                                  .map<DropdownMenuItem<String>>((String code) {
                                return DropdownMenuItem<String>(
                                  value: code,
                                  child: Text(
                                    currencyNames[code]!,
                                    textDirection: TextDirection.ltr,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _fromCurrency = value!;
                                });
                              },
                              underline: Container(),
                              iconSize: 0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 16.0),
                      InkWell(
                        onTap: () {
                          setState(() {
                            String temp = _fromCurrency;
                            _fromCurrency = _toCurrency;
                            _toCurrency = temp;
                          });
                        },
                        child: Icon(
                          Icons.compare_arrows,
                        ),
                      ),
                      SizedBox(width: 50.0),
                      Expanded(
                        child: Row(
                          children: [
                            DropdownButton<String>(
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff3b3b3b),
                                fontWeight: FontWeight.bold,
                              ),
                              value: _toCurrency,
                              items: currencyNames.keys
                                  .map<DropdownMenuItem<String>>((String code) {
                                return DropdownMenuItem<String>(
                                  value: code,
                                  child: Text(
                                    currencyNames[code]!,
                                    textDirection: TextDirection.ltr,
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  _toCurrency = value!;
                                });
                              },
                              underline: Container(),
                              iconSize: 0,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.0),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xffd8d8d8),
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0xffd8d8d8),
                  ),
                  child: TextField(
                    controller: _amountController,
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xff3b3b3b),
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 5,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: 'Enter amount',
                      contentPadding: EdgeInsets.all(8.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Stack(
                  children: [
                    Positioned(
                      child: Container(
                        child: ElevatedButton(
                          onPressed: convertCurrency,
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color(0xff008fa0),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          child: Text(
                            'Convert',
                            style: TextStyle(
                              fontSize: 25,
                              color: Color.fromARGB(255, 245, 240, 240),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 16.0),
                Text(
                  'Converted Amount: $_convertedAmount $_toCurrency',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff3b3b3b),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                // Iraqi currencies section
                Text(
                  'Iraqi Currencies',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff3b3b3b),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                // Display images and information about Iraqi currencies
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: _iraqiCurrencies.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        selectCurrency(index);
                      },
                      leading: Image.asset(
                        _iraqiCurrencies[index].image,
                        height: 200,
                        width: 200,
                      ),
                      title: Text('IQD ${_iraqiCurrencies[index].value}'),
                      subtitle: Text(
                          'Value in dollor: ${_iraqiCurrencies[index].dollor}'),
                    );
                  },
                ),
                SizedBox(height: 16.0),
                // Display the total sum of selected Iraqi currencies
                Text(
                  'Total Sum: $_totalSum',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff3b3b3b),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    resetValues();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color(0xff008fa0), // Customize the button color as needed
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: Text(
                    'Reset',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white, // Customize the text color as needed
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CurrencyInfo {
  final String image;
  final double value;
  final double dollor;

  CurrencyInfo({
    required this.dollor,
    required this.image,
    required this.value,
  });
}
