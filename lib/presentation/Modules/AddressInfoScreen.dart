import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/constant/Screens.dart';
import 'package:untitled1/presentation/widget/TextButton.dart';

class AddressDetailsScreen extends StatefulWidget {
  const AddressDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AddressDetailsScreen> createState() => _AddressDetailsScreenState();
}

class _AddressDetailsScreenState extends State<AddressDetailsScreen> {
  bool showcountry = true;
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: SafeArea(
          child: InkWell(
            onTap: (){
              FocusScope.of(context).unfocus();
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 2),
                  child: Container(
                    height: 53,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.west,
                              color: Colors.black,
                              size: 20,
                            )),
                        label: const Center(
                          child: Text(
                            'Address Info',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
//start textForm
                Form(
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Name',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.grey[400]!)),
                                  child: TextFormField(
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                      label: Text(
                                        'Full Name',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.grey,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Phone',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.grey[400]!)),
                                  child: TextFormField(
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      label: const Text(
                                        'Phone Number',
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      prefixIcon: InkWell(
                                        onTap: () {
                                          showCountryPicker(
                                            context: context,
                                            showPhoneCode: true,
                                            // optional. Shows phone code before the country name.
                                            onSelect: (Country country) {
                                              controller2.text =
                                                  country.displayName;
                                              print(
                                                  'Select country: ${country.displayName}');
                                            },
                                          );
                                        },
                                        child: const Icon(Icons.flag),
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Location',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.grey[400]!)),
                                  child: InkWell(
                                    onTap: (){
                                      Navigator.pushNamed(context, MapScreenPath );
                                    },
                                    child: TextFormField(
                                      obscureText: false,
                                      decoration:  InputDecoration(
                                        label:const Text(
                                          'Search For Location',
                                          style: TextStyle(
                                              fontSize: 20, color: Colors.grey),
                                        ),
                                        prefixIcon: InkWell(
                                          onTap: (){
                                            Navigator.pushNamed(context, MapScreenPath );
                                          },
                                          child:const Icon(
                                            Icons.send_time_extension,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Street',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.grey[400]!)),
                                  child: TextFormField(
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                      label: Text(
                                        'Street Name ',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.streetview,
                                        color: Colors.grey,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Special Mark',
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.grey[400]!)),
                                  child: TextFormField(
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                      label: Text(
                                        'Something Close To You',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.grey),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.store_mall_directory_sharp,
                                        color: Colors.grey,
                                      ),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                TextButton1(
                  name: 'Save',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
