import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'dart:io';

class ExploreScreen extends StatefulWidget {

  const ExploreScreen({super.key,});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}
class _ExploreScreenState extends State<ExploreScreen> {
  void _clearForm() {
    Discriptioncoltroller.clear();
    MemberControler.clear();
    SpaceControler.clear();
    BudgetController.clear();
    setState(() {});
  }

  String? Eventdata;

  String? docId;

  bool isOpen = false;
  String Eventtypes = 'Event Types';
  List<String> typesofevents = ['Marriage', 'Engagement', 'Birthday', 'Anniversary', 'Get-Togethers',
    'Graduation Parties'];

  TextEditingController Discriptioncoltroller = TextEditingController();
  TextEditingController MemberControler= TextEditingController();
  TextEditingController SpaceControler = TextEditingController();
  TextEditingController BudgetController = TextEditingController();



  String? imageUrl;
  XFile? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore',
          style: GoogleFonts.kalam(
            fontSize: 22.sp,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color(0XFF2f9494),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 1.h),
              InkWell(
                onTap: () {
                  isOpen = !isOpen;
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 8.h,
                    width: double.infinity,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                    child: Padding(
                      padding:   EdgeInsets.symmetric(horizontal: 3.h),
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



              GestureDetector(
                onTap: () async {
                  // image picker
                  ImagePicker imagePicker = ImagePicker();
                  XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);

                  if (pickedFile == null) return; // Check if file is null to avoid null errors

                  setState(() {
                    file = pickedFile; // Set the picked file
                  });

                  print(file!.path);

                  // Unique name for image
                  String uniqueFilename = DateTime.now().millisecondsSinceEpoch.toString();

                  // Firebase storage instance
                  Reference referenceRoot = FirebaseStorage.instance.ref();

                  // Create folder for images
                  Reference referenceDirImages = referenceRoot.child('images');

                  // Give pic a unique name
                  Reference imagetoUpload = referenceDirImages.child(uniqueFilename);

                  // Upload image to Firebase
                  try {
                    await imagetoUpload.putFile(File(file!.path));
                    imageUrl = await imagetoUpload.getDownloadURL();
                    print(imageUrl);
                  } catch (e) {
                    print(e);
                  }

                  // Add link to the specific user doc
                  FirebaseFirestore.instance
                      .collection('Eventdata')
                      .doc(docId.toString())
                      .update({
                    'image': imageUrl,
                  }).then((value) => Navigator.of(context).pop());
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 1.0,
                  decoration: BoxDecoration(
                    // Only show the image if file is not null
                    image: file != null
                        ? DecorationImage(
                      image: FileImage(File(file!.path)),
                      fit: BoxFit.cover,
                    )
                        : null,
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: file == null
                      ? Center(
                    child: Text(
                      'Tap to select image',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                      : null, // If no image is selected, show this text
                ),
              ),

              // Existing widgets...
              Text(
                'Description',
                style: GoogleFonts.kalam(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),


              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: Discriptioncoltroller,
                  maxLines: 5,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                            width: 2, color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      suffixIcon: Icon(Icons.edit),
                      prefixIcon: Icon(
                        Icons.description,
                        color: Colors.black,
                      ),
                      hintText: 'Enter a brief description about your services...',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'Description',
                      labelStyle:
                      TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: MemberControler,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide:
                        BorderSide(width: 2, color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      suffixIcon: Icon(Icons.edit),
                      prefixIcon: Icon(
                        Icons.group,
                        color: Colors.black,
                      ),
                      hintText: 'Enter the number of team members...',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'Number of Members',
                      labelStyle:
                      TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: SpaceControler,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide:
                        BorderSide(width: 2, color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      suffixIcon: Icon(Icons.edit),
                      prefixIcon: Icon(
                        Icons.space_bar,
                        color: Colors.black,
                      ),
                      hintText: '100-200',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'Available space for gusts',
                      labelStyle:
                      TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: BudgetController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                        borderSide:
                        BorderSide(width: 2, color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      suffixIcon: Icon(Icons.edit),
                      prefixIcon: Icon(
                        Icons.money,
                        color: Colors.black,
                      ),
                      hintText: '50000-100000',
                      hintStyle: TextStyle(color: Colors.grey),
                      labelText: 'Minimum and maximum budget',
                      labelStyle:
                      TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 120),
                child: GestureDetector(
                  onTap: () async {
                    try {
                      FirebaseFirestore.instance.collection('Eventdata').doc().set({
                        'image': imageUrl,
                        'eventType': Eventtypes,
                        'description': Discriptioncoltroller.text,
                        'members': MemberControler.text,
                        'space': SpaceControler.text,
                        'budget': BudgetController.text,
                        'timestamp': Timestamp.now(),
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Add vevt Successful'))
                      );

                      // Clear form after successful booking
                      _clearForm();

                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Failed to add the  event: $e'))
                      );
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.45,
                    decoration: BoxDecoration(
                      color: Color(0XFF2f9494),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Upload',
                        style: GoogleFonts.kalam(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
