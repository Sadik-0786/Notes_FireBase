import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _tittleController = TextEditingController();
  final TextEditingController _desController = TextEditingController();
  late FirebaseFirestore fireStore = FirebaseFirestore.instance;
  List<Map<String,Color>> arrColor = [
    {'colorName':Colors.purple.shade50,'headingColor':Colors.purple},
    {'colorName':Colors.red.shade50,'headingColor':Colors.red},
    {'colorName':Colors.yellow.shade50,'headingColor':Colors.yellow},
    {'colorName':Colors.blue.shade50,'headingColor':Colors.blue},
  ];
  int selectedIndex = 0;
  num colorName = Colors.purple.shade50.value;
  num headingColorVal = Colors.purple.value;
  late bool isEdited;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'Notes',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
            Icon(
              Icons.search,
              size: 25,
            ),
          ],
        ),
      ),
      body: Container(
        color: Colors.black87,
        height: double.infinity,
        width: double.infinity,
        child: StreamBuilder(
          stream: fireStore.collection('notes').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasData) {
              return notesBuilder(snapshot);
            }
            return Container();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(

        onPressed: () {
          showMyBottomSheet();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future showMyBottomSheet({String?tittle,String?des,String?noteId}) {
    return
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => StatefulBuilder(builder: (
            context,
            StateSetter setState,
            ) {
          tittle!=null?_tittleController.text=tittle:null;
          des!=null?_desController.text=des:null;
          var mNoteID;
          noteId!=null?mNoteID=noteId:null;
          noteId!=null?isEdited=true:isEdited=false;
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.black87),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.2,
                            child: const Divider(
                              color: Colors.white,
                              thickness: 2,
                            ))),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Pick Your Color',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.purple),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 30,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: arrColor.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(horizontal: 2),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    colorName = arrColor[index]['colorName']!.value;
                                    headingColorVal = arrColor[index]['headingColor']!.value;
                                    selectedIndex = index;
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: arrColor[index]['colorName'],
                                  ),
                                  child: selectedIndex == index
                                      ? const Icon(
                                    Icons.done,
                                    color: Colors.black,
                                    size: 16,
                                  )
                                      : const SizedBox(),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    const Text(
                      'Add Your Notes',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.purple),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Tittle',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        controller: _tittleController,
                        decoration: InputDecoration(
                            hintText: 'Enter Tittle',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Colors.purpleAccent.shade100,
                                    width: 1)
                            ),
                            filled: true,
                            fillColor: Colors.white
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Description',
                      style:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      child: TextField(
                        controller: _desController,
                        decoration: InputDecoration(
                            hintText: 'Enter Description',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Colors.purpleAccent.shade100,
                                    width: 1)
                            ),
                            fillColor: Colors.white,
                            filled: true
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                        height: 55,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                            onPressed: () {
                              mNoteID==null?fireStore.collection('notes').add({
                                'tittle': _tittleController.text.toString(),
                                'description': _desController.text.toString(),
                                'date': DateFormat.yMd()
                                    .format(DateTime.now())
                                    .toString(),
                                'time': DateFormat.jm()
                                    .format(DateTime.now())
                                    .toString(),
                                'color': colorName,
                                'headingColor':headingColorVal,
                                'edite':isEdited
                              }).then((value) {
                                _tittleController.clear();
                                _desController.clear();
                                Navigator.pop(context);
                              }):fireStore.collection('notes').doc(mNoteID) .update({
                                'tittle':_tittleController.text,
                                'description':_desController.text,
                                'headingColor':headingColorVal,
                                'color':colorName,
                                'edite':isEdited
                              }).then((value) {
                                _tittleController.clear();
                                _desController.clear();
                                Navigator.pop(context);
                              });                        },
                            child:  Text(
                              mNoteID!=null?'Update Note':'Add Notes',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white),
                            ))),
                    const Spacer()
                  ],
                ),
              ),
            ),
          );
        }),
      ).whenComplete((){_tittleController.clear();_desController.clear();});
  }

  Widget notesBuilder(
      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
    return ListView.builder(
      //reverse:true,
      //shrinkWrap: true,
        itemCount: snapshot.data!.docs.length,
        itemBuilder: (context, index) {
          Color myColor = Color(snapshot.data!.docs[index].data()['color']);
          var noteId=snapshot.data!.docs[index].id;
          print(snapshot.data!.docs[index].data()['edite']);
          Color myHeadingColor = Color(snapshot.data!.docs[index].data()['headingColor']);
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: myColor,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow:  [
                    BoxShadow(
                        color: myHeadingColor,
                        offset: const Offset(2, 2),
                        blurRadius: 12)
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  onLongPress: () {
                    showMyBottomSheet(
                      tittle:snapshot.data!.docs[index].data()['tittle'],
                      des: snapshot.data!.docs[index].data()['description'],
                      noteId: noteId,
                    );
                  },
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        snapshot.data!.docs[index].data()['edite']?Text('Edited',style: TextStyle( color: myHeadingColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),):Container(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot.data!.docs[index].data()['time'],
                              style:  TextStyle(
                                  color: myHeadingColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            Text(
                              snapshot.data!.docs[index].data()['date'],
                              style:  TextStyle(
                                  color: myHeadingColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                        Divider(
                          color: myHeadingColor,
                          thickness: 1,
                        ),
                        Text(
                          snapshot.data!.docs[index].data()['tittle'],
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: Text(
                                  snapshot.data!.docs[index].data()['description'],
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                )),
                            InkWell(
                              onTap: (){
                                fireStore.collection('notes').doc(noteId).delete();
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Note Deleted',)));
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    // subtitle: Text(snapshot.data!.docs[index].data()['description']),
                  ),
                ),
              ),
            ),
          );
        });
  }
}