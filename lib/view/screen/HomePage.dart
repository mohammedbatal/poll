// ignore_for_file: file_names, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:poll_app/main.dart';
import 'package:poll_app/view/screen/signup.dart';
import 'package:poll_app/view/widget/custom_Controller.dart';
import 'package:poll_app/view/widget/custom_button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<List<dynamic>> fetchSupabaseData() async {
  // final supabaseClient = SupabaseClient(MyURL().url, MyURL().anonKey);
  final response = await Supabase.instance.client
      .from('question')
      .select()
      .or('type_question.eq.$study,type_question.eq.$gender,type_question.eq.$car,type_question.eq.$city')
      .execute();
  final data = response.data as List<dynamic>;

  return data;
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Poll With Supabase'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: fetchSupabaseData(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<dynamic>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return const Center(
                      child: Text('There was an error retrieving data'));
                } else {
                  final responseData = snapshot.data!;

                  return ListView.builder(
                      itemCount: responseData.length,
                      itemBuilder: (BuildContext context, int index) {
                        final itemData = responseData[index];
                        return CustomController(
                            questionText: itemData['question_text'],
                            optionOne: itemData['anser_1'],
                            optionTow: itemData['anser_2']);
                      });
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: CustomButton(
                text: 'Send',
                onTap: () {
                  Future<void> showNotification() async {
                    const AndroidNotificationDetails
                        androidPlatformChannelSpecifics =
                        AndroidNotificationDetails(
                            'your_channel_id', 'your_channel_name',
                            channelDescription: 'your_channel_description',
                            importance: Importance.max,
                            priority: Priority.high,
                            ticker: 'ticker');
                    const NotificationDetails platformChannelSpecifics =
                        NotificationDetails(
                            android: androidPlatformChannelSpecifics);
                    await flutterLocalNotificationsPlugin.show(
                      0,
                      'Done',
                      'thank you',
                      platformChannelSpecifics,
                      payload: 'item x',
                    );
                  }

                  print('=====================SEND HOME');
                  //!
                }),
          ),
        ],
      ),
    );
  }
}
