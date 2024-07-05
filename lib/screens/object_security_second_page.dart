import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/changeColorProvider.dart';
import 'package:flutter_application_1/style/app_colors.dart';
import 'package:flutter_application_1/style/app_style.dart';
import 'package:provider/provider.dart';

class ObjectSecuritySecondPage extends StatelessWidget {
  const ObjectSecuritySecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _surnameController = TextEditingController();
    final TextEditingController _phoneController = TextEditingController();

    // model.resetColors();
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.iconGuardColor,
      //   leading: IconButton(
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //       icon: Icon(
      //         Icons.arrow_back,
      //         size: 50,
      //       )),
      // ),
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back)),
              Text(
                'Saf Bo\'linmalari Orqali Qo\'riqlash',
                style: AppStyle.fontStyle.copyWith(
                    color: AppColors.lightIconGuardColor,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Enter your name'),
          ),
          TextField(
            controller: _surnameController,
            decoration: InputDecoration(labelText: 'Enter your surname'),
          ),
          TextField(
            controller: _phoneController,
            decoration: InputDecoration(labelText: 'Enter your phone number'),
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _saveData(
                _nameController.text,
                _surnameController.text,
                _phoneController.text,
              );
            },
            child: Text('Save to Firestore'),
          ),
          SizedBox(height: 20),
          Expanded(child: _buildList()),
        ],
      ),
    );
  }
}

void _saveData(String name, String surname, String phone) {
  final user = FirebaseAuth.instance.currentUser;
  FirebaseFirestore.instance.collection('${user?.email}').add({
    'name': name,
    'surname': surname,
    'phone': phone,
    'timestamp': FieldValue.serverTimestamp(),
  });
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
