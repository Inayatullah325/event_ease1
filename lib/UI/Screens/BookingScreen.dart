import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Firestore import

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  bool isSelected = false;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isOpen = false;
  String eventType = 'Event Types';
  List<String> typesOfEvents = [
    'Marriage', 'Engagement', 'Birthday', 'Anniversary', 'Get-Togethers',
    'Graduation Parties', 'Other'
  ];

  final TextEditingController guestsController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  DateTime? selectedDate;
  String eventTime = 'Day';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
        dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
      });
    }
  }

  Future<void> _bookEvent() async {
    // Get all the form values
    String name = nameController.text.trim();
    String address = addressController.text.trim();
    String phone = phoneController.text.trim();
    String guests = guestsController.text.trim();
    String budget = budgetController.text.trim();
    String eventDate = dateController.text.trim();
    String services = _getSelectedServices();

    // Check if all the necessary fields are filled
    if (name.isEmpty || address.isEmpty || phone.isEmpty || guests.isEmpty
        || budget.isEmpty || eventDate.isEmpty || eventType == 'Event Types') {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill all required fields'))
      );
      return;
    }

    // Save the booking details in Firestore
    try {
      await FirebaseFirestore.instance.collection('bookings').add({
        'name': name,
        'address': address,
        'phone': phone,
        'guests': guests,
        'budget': budget,
        'event_date': eventDate,
        'event_type': eventType,
        'event_time': eventTime,
        'services': services,
        'timestamp': FieldValue.serverTimestamp(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Booking Successful'))
      );

      // Clear form after successful booking
      _clearForm();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to book the event: $e'))
      );
    }
  }

  // Function to get selected services
  String _getSelectedServices() {
    List<String> services = [];
    if (isSelected) services.add('Decorations');
    if (isSelected1) services.add('Cake');
    if (isSelected2) services.add('Entertainment');
    if (isSelected3) services.add('Photography');
    return services.join(', ');
  }

  // Function to clear the form
  void _clearForm() {
    nameController.clear();
    addressController.clear();
    phoneController.clear();
    guestsController.clear();
    budgetController.clear();
    dateController.clear();
    eventType = 'Event Types';
    eventTime = 'Day';
    isSelected = false;
    isSelected1 = false;
    isSelected2 = false;
    isSelected3 = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5FCFC),
      appBar: AppBar(
        title: Text(
          'Events Booking',
          style: GoogleFonts.kalam(
              fontWeight: FontWeight.bold, fontSize: 22.sp, color: Colors.white),
        ),
        backgroundColor: Color(0XFF2f9494),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 7.h),
              InkWell(
                onTap: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                child: Container(
                  height: 8.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(eventType),
                        Icon(isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down)
                      ],
                    ),
                  ),
                ),
              ),
              if (isOpen)
                ListView(
                  primary: true,
                  shrinkWrap: true,
                  children: typesOfEvents.map((e) => Container(
                    decoration: BoxDecoration(),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isOpen = false;
                          eventType = e;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(e),
                      ),
                    ),
                  )).toList(),
                ),
              Container(
                child: Column(
                  children: [
                    _buildTextField(
                      controller: nameController,
                      labelText: 'Name',
                      hintText: 'Ali Khan',
                      prefixIcon: Icons.drive_file_rename_outline,
                    ),
                    _buildTextField(
                      controller: addressController,
                      labelText: 'Address',
                      hintText: 'Anywhere North St 123',
                      prefixIcon: Icons.location_on,
                    ),
                    _buildTextField(
                      controller: phoneController,
                      labelText: 'Contact Number',
                      hintText: '0321-1234567',
                      prefixIcon: Icons.phone_android,
                      keyboardType: TextInputType.number,
                    ),
                    _buildTextField(
                      controller: guestsController,
                      labelText: 'Number of Guests',
                      hintText: 'Enter the estimated number of guests',
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.number,
                    ),
                    _buildTextField(
                      controller: budgetController,
                      labelText: 'Budget',
                      hintText: 'Enter your budget for the event',
                      prefixIcon: Icons.money,
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 20),
                    _buildDateField(),
                    _buildEventTimeSelection(),
                    _buildServicesSelection(),
                    _buildSubmitButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required TextEditingController controller, required String labelText, required String hintText, required IconData prefixIcon, TextInputType? keyboardType}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 0.3.w, color: Colors.black),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.black),
          ),
          suffixIcon: Icon(Icons.edit),
          prefixIcon: Icon(prefixIcon, color: Colors.black),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          labelText: labelText,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildDateField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: dateController,
        readOnly: true,
        decoration: InputDecoration(
          labelText: 'Event Date',
          hintText: 'Select the event date',
          labelStyle: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
          border: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.black),
          ),
          suffixIcon: Icon(Icons.edit),
          prefixIcon: Icon(Icons.calendar_month),
        ),
        onTap: () => _selectDate(context),
      ),
    );
  }

  Widget _buildEventTimeSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Event Time", style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold)),
        Row(
          children: [
            Radio<String>(
              value: 'Day',
              groupValue: eventTime,
              onChanged: (value) {
                setState(() {
                  eventTime = value!;
                });
              },
            ),
            Text('Day'),
            Radio<String>(
              value: 'Evening',
              groupValue: eventTime,
              onChanged: (value) {
                setState(() {
                  eventTime = value!;
                });
              },
            ),
            Text('Evening'),
          ],
        ),
      ],
    );
  }

  Widget _buildServicesSelection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select Services", style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold)),
        Row(
          children: [
            Checkbox(
              value: isSelected,
              onChanged: (bool? value) {
                setState(() {
                  isSelected = value!;
                });
              },
            ),
            Text("Decorations"),
            Checkbox(
              value: isSelected1,
              onChanged: (bool? value) {
                setState(() {
                  isSelected1 = value!;
                });
              },
            ),
            Text("Cake"),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: isSelected2,
              onChanged: (bool? value) {
                setState(() {
                  isSelected2 = value!;
                });
              },
            ),
            Text("Entertainment"),
            Checkbox(
              value: isSelected3,
              onChanged: (bool? value) {
                setState(() {
                  isSelected3 = value!;
                });
              },
            ),
            Text("Photography"),
          ],
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return Center(
      child: InkWell(
        onTap: _bookEvent,  // Call the function to save data in Firestore
        child: Container(
          height: MediaQuery.of(context).size.height * 0.07,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: BoxDecoration(
            color: Color(0XFF2f9494),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              'Book Now',
              style: GoogleFonts.kalam(fontSize: 20.sp, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
