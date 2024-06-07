import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:flutter_application_1/style/app_style.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> signOut() async {
    final navigator = Navigator.of(context);

    await FirebaseAuth.instance.signOut();

    navigator.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sizning Email: ${user?.email}',
                style: AppStyle.fontStyle.copyWith(color: AppColors.textColor),
              ),
              TextButton(
                onPressed: () => signOut(),
                child: Text(
                  'Chiqish',
                  style:
                      AppStyle.fontStyle.copyWith(color: AppColors.textColor),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  width: double.infinity,
                  height: 200,
                  child: Expanded(child: _buildList())),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildList() {
  final user = FirebaseAuth.instance.currentUser;
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('${user?.email}')
        .orderBy('timestamp')
        .snapshots(),
    builder: (context, snapshot) {
      if (!snapshot.hasData) return CircularProgressIndicator();
      final documents = snapshot.data!.docs;
      return ListView(
        children: documents.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return ListTile(
            title: Text('${data['name']} ${data['surname']}'),
            subtitle: Text(data['phone'] ?? ''),
          );
        }).toList(),
      );
    },
  );
}
