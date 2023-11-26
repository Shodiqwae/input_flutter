import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blueGrey),
      home: const MyhomePage(title: 'Flutter Home Page'),
    );
  }
}

class MyhomePage extends StatefulWidget {
  const MyhomePage({super.key, required this.title});
  final String title;

  @override
  State<MyhomePage> createState() => _MyhomePageState();
}

class _MyhomePageState extends State<MyhomePage> {
  final TextEditingController genderController = TextEditingController();
  gender? selectedgender;
  String nama = '';
  String alamat = '';
  bool darma = false;
  String? bahasa;
  bool setuju = false;

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<gender>> yourgender =
        <DropdownMenuEntry<gender>>[];
    for (final gender color in gender.values) {
      yourgender.add(
        DropdownMenuEntry<gender>(
            value: color,
            label: color.label,
            enabled: color.label != 'Transgender'),
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Uji COba Input Data"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Siapa Nama mu?...',
                  labelText: 'Nama koe',
                ),
                onChanged: (String value) {
                  setState(() {
                    nama = value;
                  });
                },
              ),

              TextField(
                decoration: const InputDecoration(
                  hintText: 'Alamat: ',
                  labelText: 'Alamat:',
                ),
                onChanged: (String value) {
                  setState(() {
                    alamat = value;
                  });
                },
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 9, horizontal: 10),
              ),
              Row(
                children: [
                  DropdownMenu<gender>(
                    initialSelection: gender.hm,
                    controller: genderController,
                    label: const Text('Your Gender:'),
                    dropdownMenuEntries: yourgender,
                    onSelected: (gender? gender) {
                      setState(() {
                        selectedgender = gender;
                      });
                    },
                  ),
                ],
              ),
              if (selectedgender != null)
                Row(
                  children: <Widget>[
                    Text('You selected a ${selectedgender?.label} '),
                    Padding(
                      padding: EdgeInsets.all(10),
                    )
                  ],
                ),
              Switch(
                  value: darma,
                  onChanged: (bool value) {
                    setState(() {
                      darma = value;
                    });
                  }),

              // Input Radio
              ListTile(
                leading: Radio<String>(
                    value: 'Dart',
                    groupValue: bahasa,
                    onChanged: (String? value) {
                      setState(() {
                        bahasa = value;
                      });
                    }),
                title: Text('Dart'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'Java',
                  groupValue: bahasa,
                  onChanged: (String? value) {
                    setState(() {
                      bahasa = value;
                    });
                  },
                ),
                title: Text('Java'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'PHP',
                  groupValue: bahasa,
                  onChanged: (String? value) {
                    setState(() {
                      bahasa = value;
                    });
                  },
                ),
                title: Text('PHP'),
              ),
              ListTile(
                leading: Radio<String>(
                  value: 'C#',
                  groupValue: bahasa,
                  onChanged: (String? value) {
                    setState(() {
                      bahasa = value;
                    });
                  },
                ),
                title: Text('C#'),
              ),
              ListTile(
                leading: Checkbox(
                  value: setuju,
                  onChanged: (bool? value) {
                    setState(() {
                      setuju = value!;
                    });
                  },
                ),
                title: Text('SETUJU / TIDAK'),
              ),
              ElevatedButton(
                  child: const Text('Submit'),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Hallo, $nama'),
                                  Text('alamat kamu, $alamat'),
                                  Text('Kamu Punya Gender , $selectedgender'),
                                  Text(darma ? 'IYA' : 'TIDAK'),
                                  Text('$bahasa dipilih'),
                                  Text('$setuju'),
                                ]),
                          );
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

enum gender {
  hm('---', Colors.blue),
  laki_laki('Laki-Laki', Colors.blue),
  perempuan('Perempuan', Colors.pink),
  trn('Transgender', Colors.grey);

  const gender(this.label, this.color);
  final String label;
  final Color color;
}
