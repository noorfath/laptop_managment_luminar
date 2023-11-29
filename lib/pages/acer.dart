import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class acerform extends StatefulWidget {
  @override
  _acerformState createState() => _acerformState();
}

class _acerformState extends State<acerform> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TimeOfDay? selectedIssueTime;
  TimeOfDay? selectedReturnTime;

  String _computerName = '';
  String _lapnumber = '';
  String _Name = '';
  String selectedValue = 'Workers'; // Initialize the selected value
  List<String> options = ['Workers', 'Students', 'Others'];

  Future<void> _selectIssueTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedIssueTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedIssueTime = picked;

      });
    }
  }

  Future<void> _selectReturnTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedReturnTime ?? TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedReturnTime = picked;
      });
    }
  }
  late ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _imagePicker = ImagePicker();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Hp'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _Name = value!;
                  },
                ),

                TextFormField(
                  decoration: InputDecoration(labelText: 'Computer Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a computer name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _computerName = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Lap Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a  Lap number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _lapnumber = value!;
                  },
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text("Select Your Category"),
                    SizedBox(width: 30,),
                    DropdownButton<String>(
                      value: selectedValue, // Set the selected value
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedValue = newValue!; // Update the selected value
                        });
                      },
                      items: [
                        // Non-selectable option (hint or label)
                        DropdownMenuItem<String>(
                          value: null,
                          child: Text("Select an option"),
                        ),
                        // Other selectable options
                        ...options.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ],
                    )

                  ],
                ),
                Row(
                  children: [
                    Text("Upload your picture of a computer"),
                    IconButton(onPressed: (){
                      _openCamera();
                    }, icon: Icon(Icons.camera_alt)),
                  ],
                ),

                SizedBox(height: 20),
                Row(
                  children: [
                    Text('Issue Time: ${selectedIssueTime?.format(context) ?? "Select Time"}'),
                    IconButton(
                      icon: Icon(Icons.access_time),
                      onPressed: _selectIssueTime,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Return Time: ${selectedReturnTime?.format(context) ?? "Select Time"}'),
                    IconButton(
                      icon: Icon(Icons.access_time),
                      onPressed: _selectReturnTime,
                    ),

                  ],
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent
                  ),
                  onPressed: () {
                    // Show a SnackBar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Saved Successfull'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


final ImagePicker _imagePicker = ImagePicker();

// Your other methods and code...

void _openCamera() async {
  final XFile? image = await _imagePicker.pickImage(source: ImageSource.camera);
  // Handle the captured image as needed
  if (image != null) {
    // Perform operations with the image
    print("Image path: ${image.path}");
    // You can use the 'image.path' to do further processing, such as displaying the image or uploading it.
  }
}