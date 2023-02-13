import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pdf_reader/constants/constants.dart';
import 'package:pdf_reader/screens/pdf_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FilePickerResult? filePickerResult;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      //appbar
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PdfScreen(
                              index: 0,
                            )));
              },
              icon: const Icon(
                Icons.help,
                color: Colors.black,
              ))
        ],
        leading: const Icon(Icons.sort_rounded, color: Colors.black),
        title: const Center(
          child: Text(
            "PDF READER",
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),

      //body
      body: Column(children: [
        Expanded(
            child: Container(
          alignment: Alignment.center,
          child: Lottie.network(
              "https://assets2.lottiefiles.com/packages/lf20_7fmryqpe.json"),
        )),
        Expanded(
          flex: 3,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
            child: Column(children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    //2nd Container
                    // color: Colors.lightBlue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Center(
                          child: Text("Recent files",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        ),
                        const SizedBox(height: 12),
                        Container(
                            height: size.height * 0.33,
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 4),
                            decoration: BoxDecoration(
                              color: bgDarkColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 3,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        leading: Image.asset(
                                          "assets/images/pdf-file.png",
                                          color: Colors.white,
                                        ),
                                        title: const Text(
                                          "Filename",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        subtitle: const Text(
                                          "File path",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                        trailing: const Icon(
                                          Icons.cancel,
                                          color: Colors.white,
                                        ),
                                      ));
                                }),
                                separatorBuilder: (context, index) =>
                                    const Divider(
                                      color: Colors.white,
                                    ))),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
        Expanded(
          flex: 2,
          child:
              //3rd Container
              Container(
            padding: const EdgeInsets.all(12),
            // color: Colors.yellow,
            child: Column(children: [
              SizedBox(
                height: size.height * 0.1,
                child: Row(
                  children: [
                    buttonWidget(
                        color: blueColor,
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PdfScreen(
                                        index: 1,
                                      )));
                        },
                        path: "assets/images/url.png",
                        title: "Open URL"),
                    const SizedBox(width: 12),
                    buttonWidget(
                        color: blueColor,
                        ontap: () async {
                          filePickerResult = await FilePicker.platform
                              .pickFiles(
                                  allowedExtensions: ["pdf"],
                                  type: FileType.custom);
                          if (filePickerResult != null) {
                            var path = filePickerResult!.files.single.path;
                            // ignore: use_build_context_synchronously
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => PdfScreen(
                                          index: 2,
                                          path: path,
                                        )));
                          }
                        },
                        path: "assets/images/select.png",
                        title: "Select File")
                  ],
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              buttonWidget(
                  color: blueColor,
                  ontap: () {},
                  path: "assets/images/create.png",
                  title: "Create PDF"),
            ]),
          ),
        ),
        const Text(
          "Developed by Suraj Mandal",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal),
        )
      ]),
    );
  }
//load urls

  Widget buttonWidget({color, path, title, ontap}) {
    return Expanded(
        child: GestureDetector(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
        ),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Image.asset(
            "$path",
            width: 45,
            color: Colors.white,
          ),
          Text(
            "$title",
            style: const TextStyle(
                fontWeight: FontWeight.w200, color: Colors.white),
          ),
        ]),
      ),
    ));
  }
}
