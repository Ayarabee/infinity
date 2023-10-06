import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nasa_comp_app/core/resources_manager/colors_manager.dart';
import 'package:nasa_comp_app/core/resources_manager/style_manager.dart';
import 'package:uuid/uuid.dart';

import 'widgets/media_picker.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var mediaPicker = MediaPicker();

  List<Map<String, dynamic>> _mediaFiles = [];
  final _desController = TextEditingController();
  var imageUrlList = [];
  var isLoader = false;

  void pickImgaes() async {
    Navigator.pop(context);
    var pickFiles = await mediaPicker.pickImage();
    if (pickFiles.isNotEmpty) {
      setState(() {
        _mediaFiles.addAll(pickFiles);
      });
    }
  }

  Future<void> takePicture() async {
    Navigator.pop(context);

    var pickFile = await mediaPicker.takePicture();
    if (pickFile.isNotEmpty) {
      setState(() {
        _mediaFiles.add(pickFile);
      });
    }
  }

  // Future<void> pickVideo() async {
  //   Navigator.pop(context);
  //   var pickFile = await mediaPicker.videoPick();
  //   if (pickFile.isNotEmpty) {
  //     setState(() {
  //       _mediaFiles.add(pickFile);
  //     });
  //   }
  // }

  var uuid = Uuid();

  // uploadFile() async {
  //   for (var i in _mediaFiles) {
  //     var imageUrl =
  //     await firestoreService.uploadFile(File(i['thumbnailFile']));
  //
  //     setState(() {
  //       imageUrlList.add(imageUrl);
  //     });
  //   }
  // }


  removeMedia(index) {
    setState(() {
      _mediaFiles.removeAt(index - 1);
    });
    Navigator.pop(context);
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text("Write Something"),
              SizedBox(
                height: 20,
              ),
              TextField(
                maxLines: null,
                controller: _desController,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: ColorsManager.blue,width: .5),
                    ),
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    hintText: 'Description',
                    ),
              ),
              SizedBox(
                height: 20,
              ),
              GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _mediaFiles.length + 1,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0)),
                        child: IconButton(
                            onPressed: () {
                              // MediaBottomSheet.show(context, pickImgaes,
                              //     takePicture, pickVideo);
                            },
                            icon: Icon(Icons.add_a_photo)),
                      );
                    }
                    var mediaFile = _mediaFiles[index - 1];
                    var thumbnailFile = File(mediaFile['thumbnailFile']);
                    var isVideo = mediaFile['mediaType'] == 'video';
                    return InkWell(
                      onLongPress: () {
                        // RemoveMediaBottomSheet.show(context, () {
                        //   removeMedia(index);
                        // });
                      },
                      child: Stack(
                        children: [
                          Image.file(thumbnailFile,
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover),
                          if (isVideo)
                            const Align(
                                alignment: Alignment.center,
                                child: Icon(Icons.play_circle_filled,
                                    size: 40, color: Colors.white))
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
