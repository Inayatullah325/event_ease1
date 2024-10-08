import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OrderDetailScreen extends StatefulWidget {
  final String documentId;

  const OrderDetailScreen({super.key, required this.documentId, required name, required address});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order details',
          style: GoogleFonts.kalam(
              fontWeight: FontWeight.bold, fontSize: 22.sp, color: Colors.white),
        ),
        backgroundColor: Color(0XFF2f9494),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection('orders') // Assuming 'orders' is the collection
              .doc(widget.documentId)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }

            if (!snapshot.hasData || !snapshot.data!.exists) {
              return Center(child: Text('No order details found.'));
            }

            var orderData = snapshot.data!.data() as Map<String, dynamic>;

            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xFFCCF2F2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    _buildDetailRow('Event type:', orderData['eventType'] ?? ''),
                    _buildDetailRow('Name:', orderData['name'] ?? ''),
                    _buildDetailRow('Address:', orderData['address'] ?? ''),
                    _buildDetailRow(
                        'Phone number:', orderData['phoneNumber'] ?? ''),
                    _buildDetailRow(
                        'Number of guests:', orderData['guestCount']?.toString() ?? ''),
                    _buildDetailRow('Budget:', orderData['budget']?.toString() ?? ''),
                    _buildDetailRow('Event time:', orderData['eventTime'] ?? ''),
                    _buildDetailRow(
                        'Selected services:', orderData['services'] ?? ''),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
                  label,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
                  value,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                )),
          ),
        ],
      ),
    );
  }
}
