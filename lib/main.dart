import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pdfLib;
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Map<String, String?> dados = {};
  var maskFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  var phoneMaskFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  @override
  void initState() {
    super.initState();
    loadSavedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "INFORMATIVOS",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
        toolbarHeight: 50,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(60)),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          onChanged: () {
            Form.of(primaryFocus!.context!).save();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Culto",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['culto'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        maskFormatter,
                      ],
                      decoration: const InputDecoration(
                        labelText: "Data",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['data'] = value,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Louvor:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        labelText: "Tempo de louvor:",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['tempo de louvor'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Ministro de louvor:",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['ministro de louvor'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Musica 1",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['Musica 1'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Musica 2",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['Musica 2'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Musica 3",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['Musica 3'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Musica 4",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['Musica 4'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Musica 5",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['Musica 5'] = value,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Direção:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        labelText: "Tempo de direção:",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['tempodedirecao'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Dirigente:",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['dirigente'] = value,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Avisos:,',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "-",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['1'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "-",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['2'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "-",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['3'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "-",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['4'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "-",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['5'] = value,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Ministração',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(
                        labelText: "Tempo:",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['tempo'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "Nome do Ministro:",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['nome do ministro'] = value,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Avisos Finais:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "-",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['7'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "-",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['8'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "-",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['9'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "-",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['10'] = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: "-",
                        floatingLabelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        border: OutlineInputBorder(),
                      ),
                      onSaved: (value) => dados['11'] = value,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 170,
                    height: 35,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextButton(
                      onPressed: () {
                        saveData();
                        generatePdf();
                      },
                      child: const Text(
                        "ENVIAR",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void generatePdf() async {
    final pdf = pdfLib.Document();

    final ByteData data = await rootBundle.load('assets/images/logo.png');
    final List<int> bytes = data.buffer.asUint8List();

    pdf.addPage(pdfLib.Page(
      build: (context) => pdfLib.Center(
        child: pdfLib.Column(
          crossAxisAlignment: pdfLib.CrossAxisAlignment.start,
          children: [
            pdfLib.Center(
              child: pdfLib.Column(
                children: [
                  pdfLib.Image(
                    pdfLib.MemoryImage(Uint8List.fromList(bytes)),
                    alignment: pdfLib.Alignment.center,
                    width: 100,
                    height: 100,
                  ),
                  pdfLib.SizedBox(height: 5),
                  pdfLib.Text("INFORMATIVOS DO CULTO",
                      style:
                          pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
                ],
              ),
            ),
            pdfLib.SizedBox(height: 10),
            pdfLib.Text("Culto: ${dados['culto'] ?? ''}",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 5),
            pdfLib.Text("Data: ${dados['data'] ?? ''}",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 3),
            pdfLib.Text("___________________________________________________",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 3),
            pdfLib.Text("LOUVOR ",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 3),
            pdfLib.Text(
                "Tempo de louvor: ${dados['tempo de louvor'] ?? ''} minutos",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 8),
            pdfLib.Text(
                "Ministro de louvor: ${dados['ministro de louvor'] ?? ''}",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 8),
            pdfLib.Text("MUSICAS: ",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 3),
            pdfLib.Text("- ${dados['Musica 1'] ?? ''}"),
            pdfLib.SizedBox(height: 5),
            pdfLib.Text("- ${dados['Musica 2'] ?? ''}"),
            pdfLib.SizedBox(height: 5),
            pdfLib.Text("- ${dados['Musica 3'] ?? ''}"),
            pdfLib.SizedBox(height: 5),
            pdfLib.Text("- ${dados['Musica 4'] ?? ''}"),
            pdfLib.SizedBox(height: 5),
            pdfLib.Text("- ${dados['Musica 5'] ?? ''}"),
            pdfLib.SizedBox(height: 3),
            pdfLib.Text("___________________________________________________",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 3),
            pdfLib.Text("DIREÇÃO ",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 3),
            pdfLib.Text("Tempo de direção: ${dados['tempodedirecao'] ?? ''} minutos",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 8),
            pdfLib.Text("Dirigente: ${dados['dirigente'] ?? ''}",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 8),
            pdfLib.Text("AVISOS ",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 8),
            pdfLib.Text("- ${dados['1'] ?? ''}"),
            pdfLib.SizedBox(height: 5),
            pdfLib.Text("- ${dados['2'] ?? ''}"),
            pdfLib.SizedBox(height: 5),
            pdfLib.Text("- ${dados['3'] ?? ''}"),
            pdfLib.SizedBox(height: 5),
            pdfLib.Text("- ${dados['4'] ?? ''}"),
            pdfLib.SizedBox(height: 5),
            pdfLib.Text("- ${dados['5'] ?? ''}"),
            pdfLib.SizedBox(height: 3),
            pdfLib.Text("___________________________________________________",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 3),
            pdfLib.Text("MINISTRAÇÃO",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 3),
            pdfLib.Text("Tempo: ${dados['tempo'] ?? ''} minutos",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 5),
            pdfLib.Text("Nome do ministro: ${dados['nome do ministro'] ?? ''}",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 3),
            pdfLib.Text("___________________________________________________",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 3),
            pdfLib.Text("AVISOS FINAIS: ",
                style: pdfLib.TextStyle(fontWeight: pdfLib.FontWeight.bold)),
            pdfLib.SizedBox(height: 3),
            pdfLib.Text("- ${dados['7'] ?? ''}"),
            pdfLib.SizedBox(height: 5),
            pdfLib.Text("- ${dados['8'] ?? ''}"),
            pdfLib.SizedBox(height: 5),
            pdfLib.Text("- ${dados['9'] ?? ''}"),
            pdfLib.SizedBox(height: 5),
            pdfLib.Text("- ${dados['10'] ?? ''}"),
            pdfLib.SizedBox(height: 3),
          ],
        ),
      ),
    ));

    final dir = await getApplicationDocumentsDirectory();
    final file = File("${dir.path}/Avisos.pdf");
    await file.writeAsBytes(await pdf.save());

    share();
    Share.shareFiles([file.path], text: "AVISOS");
  }

  void saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('culto', dados['culto'] ?? '');

    prefs.setString('data', dados['data'] ?? '');
    prefs.setString('tempo de louvor', dados['tempo de louvor'] ?? '');
    prefs.setString('ministro de louvor', dados['ministro de louvor'] ?? '');
    prefs.setString('Musica 1', dados['Musica 1'] ?? '');
    prefs.setString('Musica 2', dados['Musica 2'] ?? '');
    prefs.setString('Musica 3', dados['Musica 3'] ?? '');
    prefs.setString('Musica 4', dados['Musica 4'] ?? '');
    prefs.setString('Musica 5', dados['Musica 5'] ?? '');
    prefs.setString('Tempo de direção', dados['tempodedirecao'] ?? '');
    prefs.setString('dirigente', dados['dirigente'] ?? '');
    prefs.setString('-', dados['1'] ?? '');
    prefs.setString('-', dados['2'] ?? '');
    prefs.setString('-', dados['3'] ?? '');
    prefs.setString('-', dados['4'] ?? '');
    prefs.setString('-', dados['5'] ?? '');

    prefs.setString('tempo', dados['tempo'] ?? '');
    prefs.setString('nome do ministro', dados['nome do ministro'] ?? '');
    prefs.setString('-', dados['7'] ?? '');
    prefs.setString('-', dados['8'] ?? '');
    prefs.setString('-', dados['9'] ?? '');
    prefs.setString('-', dados['10'] ?? '');
  }

  void loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      dados['culto'] = prefs.getString('culto') ?? '';

      dados['data'] = prefs.getString('data') ?? '';
      dados['tempo de louvor'] = prefs.getString('tempo de louvor') ?? '';
      dados['ministro de louvor'] = prefs.getString('ministro de louvor') ?? '';
      dados['Musica 1'] = prefs.getString('Musica 1') ?? '';
      dados['Musica 2'] = prefs.getString('Musica 2') ?? '';
      dados['Musica 3'] = prefs.getString('Musica 3') ?? '';
      dados['Musica 4'] = prefs.getString('Musica 4') ?? '';
      dados['Musica 5'] = prefs.getString('Musica 5') ?? '';
      dados['Tempo de direção'] = prefs.getString('tempodedirecao') ?? '';
      dados['dirigente'] = prefs.getString('dirigente') ?? '';
      dados['1'] = prefs.getString('-') ?? '';
      dados['2'] = prefs.getString('-') ?? '';
      dados['3'] = prefs.getString('-') ?? '';
      dados['4'] = prefs.getString('-') ?? '';
      dados['5'] = prefs.getString('-') ?? '';

      dados['tempo'] = prefs.getString('tempo') ?? '';
      dados['nome do ministro'] = prefs.getString('nome do ministro') ?? '';
      dados['7'] = prefs.getString('-') ?? '';
      dados['8'] = prefs.getString('-') ?? '';
      dados['9'] = prefs.getString('-') ?? '';
      dados['10'] = prefs.getString('-') ?? '';
    });
  }

  void share() {
    var msg = '''
Culto: ${dados['culto']}



Data: ${dados['data']}

Tempo de louvor: ${dados['tempo de louvor']}

Ministro de louvor: ${dados['ministro de louvor']}

Musica 1 ${dados['Musica 1']}
Musica 2 ${dados['Musica 2']}
Musica 3 ${dados['Musica 3']}
Musica 4 ${dados['Musica 4']}
Musica 5 ${dados['Musica 5']}


Tempo de direção: ${dados['tempodedirecao']}

Dirigente: ${dados['dirigente']}

- ${dados['1']}

- ${dados['2']}

- ${dados['3']}

- ${dados['4']}

- ${dados['5']}


Tempo: ${dados['tempo']}

Nome do Ministro: ${dados['nomeDoministro']}

- ${dados['7']}

- ${dados['8']}

- ${dados['9']}

- ${dados['10']}




''';

    Share.share(msg);
  }
}
