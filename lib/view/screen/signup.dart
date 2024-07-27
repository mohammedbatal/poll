// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:poll_app/model/lists.dart';
import 'package:poll_app/view/screen/HomePage.dart';
import 'package:poll_app/view/widget/custom_dropdown.dart';
import 'package:poll_app/view/widget/custom_button.dart';
import 'package:poll_app/view/widget/custom_TextForm.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

String car = 'Yes I Have Car';
String city = 'Damascus';
String gender = 'male';
String study = 'primary';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController numberController = TextEditingController();
    TextEditingController addresController = TextEditingController();
    late int DateOfBirth = 2024 - int.parse(ageController.text);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup Final Screen"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextForm(
                  controller: userNameController, hintText: 'User Name'),
              CustomTextForm(controller: passController, hintText: 'Password'),
              CustomTextForm(
                controller: ageController,
                hintText: 'Date of birth',
                keyboardType: TextInputType.number,
              ),
              CustomTextForm(
                  controller: emailController,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress),
              CustomTextForm(
                  controller: numberController,
                  hintText: 'number',
                  keyboardType: TextInputType.number),
              CustomTextForm(controller: addresController, hintText: 'addres'),
              const SizedBox(height: 40),
              StatefulBuilder(
                builder: (BuildContext context, setState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //!
                      CustomDropdownButton(
                        titleText: 'What\'s your gender',
                        value: gender,
                        onChanged: (newValue) {
                          setState(() {
                            gender = newValue!;
                            print(gender);
                          });
                        },
                        theList: Lists()
                            .listSex
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      CustomDropdownButton(
                        titleText: 'In any city living',
                        value: city,
                        onChanged: (newValue) {
                          setState(() {
                            city = newValue!;
                            print(city);
                          });
                        },
                        theList: Lists()
                            .listcity
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      CustomDropdownButton(
                        titleText: 'Do you use public transportation?',
                        value: car,
                        onChanged: (newValue) {
                          setState(() {
                            car = newValue!;
                            print(car);
                          });
                        },
                        theList: Lists()
                            .listcar
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                      CustomDropdownButton(
                        titleText: 'What do you study?',
                        value: study,
                        onChanged: (newValue) {
                          setState(() {
                            study = newValue!;
                            print(study);
                          });
                        },
                        theList: Lists()
                            .liststudy
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  );
                },
              ),
              CustomButton(
                  text: 'Send',
                  onTap: () async {
                    print('=========First');
                    await Supabase.instance.client.from('users').insert({
                      'username': userNameController.text.trim(),
                      'password': passController.text.trim(),
                      'email': emailController.text.trim(),
                      'number': numberController.text.trim(),
                      'addres': addresController.text.trim(),
                      'age': DateOfBirth,
                      'sex': gender,
                      'city': city,
                      'car': car,
                      'study': study,
                    });
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Done')));
                    print(' ==========END');
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                    //!
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
