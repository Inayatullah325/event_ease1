import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  bool isselected = false;
  bool isselected1 = false;
  bool isselected2 = false;
  bool isOpen = false;
  String Eventtypes = 'Event Types';
  List<String> typesofevents = ['Marriage', 'Engagement', 'Birthday', 'Anniversary', 'Get-Togethers',
    'Graduation Parties', 'Other'];
  final TextEditingController guestsController = TextEditingController();
  final TextEditingController budgetController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

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
        dateController.text =
        "${pickedDate.toLocal()}".split(' ')[0]; // Formatting the date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5FCFC),
      appBar: AppBar(
        title: Text(
          'Events Booking',
          style: GoogleFonts.kalam(
              fontWeight: FontWeight.bold, fontSize: 35, color: Colors.white),
        ),
        backgroundColor: Color(0XFF2f9494),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 50,),
              InkWell(
                onTap: () {
                  isOpen = !isOpen;
                  setState(() {});
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20),
                   color: Colors.grey,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Eventtypes),
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
                  children: typesofevents.map((e) => Container(
                    decoration: BoxDecoration(
                     // color: Colors.grey,
                    ),
                    child: InkWell(
                      onTap: () {
                        isOpen = false;
                        Eventtypes = e;
                        setState(() {});
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
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  // borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  //borderRadius: BorderRadius.circular(11),
                  borderSide:
                  BorderSide(width: 2, color: Colors.black),
                ),
                border: UnderlineInputBorder(
                  // borderRadius: BorderRadius.circular(11),
                ),
                suffixIcon: Icon(Icons.edit),
                prefixIcon: Icon(
                  Icons.drive_file_rename_outline,
                  color: Colors.black,
                ),
                hintText: 'Ali Khan',
                hintStyle: TextStyle(color: Colors.grey),
                labelText: 'Name',
                labelStyle: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                 // borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                 // borderRadius: BorderRadius.circular(11),
                  borderSide:
                  BorderSide(width: 2, color: Colors.black),
                ),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                suffixIcon: Icon(Icons.edit),
                prefixIcon: Icon(
                  Icons.location_on,
                  color: Colors.black,
                ),
                hintText: 'Anywhere North St 123',
                hintStyle: TextStyle(color: Colors.grey),
                labelText: 'Address',
                labelStyle: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  //borderRadius: BorderRadius.circular(11),
                  borderSide: BorderSide(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  //borderRadius: BorderRadius.circular(11),
                  borderSide:
                  BorderSide(width: 2, color: Colors.black),
                ),
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(11),
                ),
                suffixIcon: Icon(Icons.edit),
                prefixIcon: Icon(
                  Icons.phone_android,
                  color: Colors.black,
                ),
                hintText: '0321-1234567',
                hintStyle: TextStyle(color: Colors.grey),
                labelText: 'Contact Number',
                labelStyle: TextStyle(fontWeight: FontWeight.bold)),
          ),

        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: guestsController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Number of Guests',
              hintText: 'Enter the estimated number of guests',
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              border: UnderlineInputBorder(
                borderSide:
                BorderSide(width: 2, color: Colors.black),
              ),
              suffixIcon: Icon(Icons.edit),
              prefixIcon: Icon(Icons.person)
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: budgetController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Budget',
              hintText: 'Enter your budget for the event',
              labelStyle: TextStyle(fontWeight: FontWeight.bold),
              border: UnderlineInputBorder(
                borderSide:
                BorderSide(width: 2, color: Colors.black),
              ),
                suffixIcon: Icon(Icons.edit),
                prefixIcon: Icon(Icons.money)
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: dateController,
            readOnly: true,
            decoration: InputDecoration(
              labelText: 'Event Date',
              hintText: 'Select the event date',
                labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              border: UnderlineInputBorder(
                borderSide:
                BorderSide(width: 2, color: Colors.black),
              ),
                suffixIcon: Icon(Icons.edit),
                prefixIcon: Icon(Icons.calendar_month)
            ),
            onTap: () => _selectDate(context),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Event Time", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
            Row(
              children: [
                Radio<String>(
                  value: 'Day',
                  groupValue: eventTime,
                  onChanged: (String? value) {
                    setState(() {
                      eventTime = value!;
                    });
                  },
                ),
                Text('Day', style: TextStyle(fontSize: 16)),
                Radio<String>(
                  value: 'Evening',
                  groupValue: eventTime,
                  onChanged: (String? value) {
                    setState(() {
                      eventTime = value!;
                    });
                  },
                ),
                Text('Evening', style: TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),


        Text("Services:", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
        Row(
          children: [
            Checkbox(

                activeColor: Colors.black,
                checkColor: Colors.white,
                value:isselected, onChanged: (value){
              setState(() {
                isselected=value!;
              });
            }),
            Text('Decorations'),
          ],

        ),
        Row(
          children: [
            Checkbox(

                activeColor: Colors.black,
                checkColor: Colors.white,
                value:isselected1, onChanged: (value){
              setState(() {
                isselected1=value!;
              });
            }),
            Text('Entertainment'),
          ],

        ),
        Row(
          children: [
            Checkbox(

                activeColor: Colors.black,
                checkColor: Colors.white,
                value:isselected2, onChanged: (value){
              setState(() {
                isselected2=value!;
              });
            }),
            Text('Photogrphy'),
          ],

        ),
        Column(
          children: [
            Center(
              child: Container(
                height: MediaQuery.of(context).size.height*0.07,
                width: MediaQuery.of(context).size.width*0.4,
                decoration: BoxDecoration(
                  color: Color(0XFF2f9494),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Center(child: Text('Book Now',style: GoogleFonts.kalam(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.white),)),
              ),
            )
          ],
        )


      ],
          ),
        ),
     ]
          ),
    )
      )
    );
  }
}


