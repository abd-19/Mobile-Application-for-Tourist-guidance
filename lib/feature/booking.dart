// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print, unnecessary_null_comparison, unused_import, deprecated_member_use, use_key_in_widget_constructors, library_private_types_in_public_api, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';

class Reservation {
  DateTime startDay;
  DateTime endDay;
  double totalPrice;
  String userName;

  Reservation(this.startDay, this.endDay, this.totalPrice, this.userName);
}

class HotelListScreen extends StatefulWidget {
  @override
  _HotelListScreenState createState() => _HotelListScreenState();
}

class _HotelListScreenState extends State<HotelListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Booking',
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
      body: FutureBuilder(
        future: retrieveHotelData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index) {
                var hotelData = snapshot.data?[index];
                return HotelTile(hotelData: hotelData);
              },
            );
          }
        },
      ),
    );
  }
}

class HotelTile extends StatelessWidget {
  final QueryDocumentSnapshot? hotelData;

  const HotelTile({Key? key, this.hotelData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(hotelData?['image'] ?? ''),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hotelData?['name'] ?? '',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Rooms: ${hotelData?['numofroom']} | Price: ${hotelData?['price']} / night',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showReservationDialog(context);
            },
            child: Text('Book now',
                style: TextStyle(fontSize: 18, color: Color(0xff008fa0))),
          ),
        ],
      ),
    );
  }

  void showReservationDialog(BuildContext context) async {
    DateTimeRange? selectedDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (selectedDateRange != null) {
      int numberOfDays =
          selectedDateRange.end.difference(selectedDateRange.start).inDays;
      num totalPrice = numberOfDays * (hotelData?['price'] ?? 0);

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return EmergeAlertDialog(
            emergeAlertDialogOptions: EmergeAlertDialogOptions(
              title: Text(
                'Reservation Details',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              content: Container(
                width: double.maxFinite,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Start Day: ${selectedDateRange.start.toLocal()}',
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      'End Day: ${selectedDateRange.end.toLocal()}',
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      'Number of Days: $numberOfDays',
                      style: TextStyle(fontSize: 22),
                    ),
                    Text(
                      'Total Price: $totalPrice',
                      style: TextStyle(fontSize: 22),
                    ),
                  ],
                ),
              ),
              actionsPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Map<String, dynamic> reservationDetails = {
                      'startDay': selectedDateRange.start,
                      'endDay': selectedDateRange.end,
                      'totalPrice': totalPrice,
                    };
                    FirebaseFirestore.instance
                        .collection('reservations')
                        .add(reservationDetails);

                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff008fa0),
                    onPrimary: Colors.white,
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text('Confirm'),
                ),
                SizedBox(width: 95),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.red, // Text color
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text('Cancel'),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}

Future<List<QueryDocumentSnapshot>> retrieveHotelData() async {
  try {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('hotels').get();
    return querySnapshot.docs;
  } catch (e) {
    print('Error retrieving hotel data: $e');
    return [];
  }
}
