import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/changeColorProvider.dart';
import 'package:provider/provider.dart';

class TexnikObject extends StatelessWidget {
  const TexnikObject({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            DropdownButtonExample()
          ],
        ),
      ),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  @override
  _DropdownButtonExampleState createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String? _selectedItem1;
  String? _selectedItem2;

  void _showModal(
      BuildContext context, List<String> items, Function(String) onSelect) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Obyekt turini tanlang', style: TextStyle(fontSize: 16)),
          content: Container(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index], style: TextStyle(fontSize: 14)),
                  leading: Radio(
                    value: items[index],
                    groupValue: _selectedItem1,
                    onChanged: (String? value) {
                      setState(() {
                        onSelect(value!);
                      });
                      Navigator.pop(context);
                    },
                  ),
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Tanlash', style: TextStyle(fontSize: 14)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showTimePicker(
      BuildContext context, String label, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      final timeModel = Provider.of<ThemeProvider>(context, listen: false);
      if (isStartTime) {
        timeModel.updateStartTime(label, picked);
      } else {
        timeModel.updateEndTime(label, picked);
      }
    }
  }

  void _showTimeModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Qo\'riqlash vaqt oralig\'ini kiriting',
              style: TextStyle(fontSize: 16)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _buildTimePickerSection(
                    'Harakat sezgi sensorlar orqali', context),
                SizedBox(height: 20),
                _buildTimePickerSection('Tashvish tugmasi orqali', context),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Tanlash', style: TextStyle(fontSize: 14)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTimePickerSection(String title, BuildContext context) {
    return Column(
      children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        _buildTimePickerRow('Ish kunlari', context),
        _buildTimePickerRow('Shanba Yakshanba kunlari', context),
        _buildTimePickerRow('Bayram kunlari', context),
      ],
    );
  }

  Widget _buildTimePickerRow(String label, BuildContext context) {
    final timeModel = Provider.of<ThemeProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Text(label, style: TextStyle(fontSize: 12)),
          ),
          Flexible(
            child: IconButton(
              icon: Icon(Icons.access_time, size: 20),
              onPressed: () {
                _showTimePicker(context, '${label}_start', true);
              },
            ),
          ),
          Flexible(
            child: Text(
              timeModel.startTimes['${label}_start'] != null
                  ? timeModel.startTimes['${label}_start']!.format(context)
                  : '--:--',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Text(' - ', style: TextStyle(fontSize: 12)),
          Flexible(
            child: IconButton(
              icon: Icon(Icons.access_time, size: 20),
              onPressed: () {
                _showTimePicker(context, '${label}_end', false);
              },
            ),
          ),
          Flexible(
            child: Text(
              timeModel.endTimes['${label}_end'] != null
                  ? timeModel.endTimes['${label}_end']!.format(context)
                  : '--:--',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            _showModal(
              context,
              [
                'Bank',
                'Ishlab chiqarish',
                'Zargarlik do\'kon',
                'Spirtli ichimlik do\'kon',
                'Go\'zallik saloni',
                'Avto salon',
                'Xususiy klinika'
              ],
              (selectedItem) {
                _selectedItem1 = selectedItem;
              },
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_selectedItem1 ?? 'Tanlang', style: TextStyle(fontSize: 14)),
              Icon(Icons.arrow_drop_down, size: 20),
            ],
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _showModal(
              context,
              [
                'Harakat sezgi sensorlar bilan',
                'Tashvish tugmasi bilan',
                'Harakat sezgi sensorlar va tashvish tugmasi bilan'
              ],
              (selectedItem) {
                _selectedItem2 = selectedItem;
              },
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(_selectedItem2 ?? 'Tanlang', style: TextStyle(fontSize: 14)),
              Icon(Icons.arrow_drop_down, size: 20),
            ],
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _showTimeModal(context);
          },
          child:
              Text('Vaqt oralig\'ini kiriting', style: TextStyle(fontSize: 14)),
        ),
        SizedBox(height: 20),
        Text(_selectedItem1 ?? 'No item selected',
            style: TextStyle(fontSize: 14)),
        Text(_selectedItem2 ?? 'No item selected',
            style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
