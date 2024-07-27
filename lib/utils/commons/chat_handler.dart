import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> initializeFirebase() async {
  await Firebase.initializeApp();
}

Future<List<Map<String, dynamic>>> getChatHistory(String userId) async {
  List<Map<String, dynamic>> chatHistory = [];

  try {
    final chatDocs = await FirebaseFirestore.instance
        .collection('chats')
        .doc(userId)
        .collection('messages')
        .orderBy('timestamp')
        .get();

    chatHistory = chatDocs.docs.map((doc) => doc.data()).toList();
  } catch (e) {
    print('Error getting chat history: $e');
  }

  return chatHistory;
}

Future<void> saveMessage(String userId, Map<String, dynamic> message) async {
  try {
    await FirebaseFirestore.instance
        .collection('chats')
        .doc(userId)
        .collection('messages')
        .add(message);
  } catch (e) {
    print('Error saving message: $e');
  }
}

Future<void> getPostResultFromApi({
  required String userId,
  required String message,
}) async {
  var url = 'https://chatgpt-api8.p.rapidapi.com/';
  var headers = {
    'content-type': 'application/json',
    'X-RapidAPI-Key': '1b7ce6c3b7mshc55c336c0b688b2p198075jsnefa532851b2a',
    'X-RapidAPI-Host': 'chatgpt-api8.p.rapidapi.com',
  };

  // Initialize Firebase
  await initializeFirebase();

  // Get previous chat history
  List<Map<String, dynamic>> chatHistory = await getChatHistory(userId);

  // Add the new user message
  chatHistory.add({'content': message, 'role': 'user'});

  String responsed = '';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(chatHistory),
    );

    Map jsonResponse = json.decode(utf8.decode(response.bodyBytes));
    if (jsonResponse['error'] != null) {
      throw HttpException(jsonResponse['error']["message"]);
    }
    if (jsonResponse.isNotEmpty) {
      responsed = jsonResponse['text'];

      // Save the AI's response
      await saveMessage(userId, {'content': responsed, 'role': 'ai'});
    }
  } catch (e) {
    print(e);
  }

  // Save the user's message
  await saveMessage(userId, {'content': message, 'role': 'user'});
}
