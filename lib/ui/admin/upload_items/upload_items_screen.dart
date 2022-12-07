import 'dart:io';

import 'package:ecommerce_php/controller/upload_items_controller.dart';
import 'package:ecommerce_php/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

var gradientDecoration = const BoxDecoration(gradient: LinearGradient(colors: [Colors.black54, Colors.deepPurple]));

class UploadItems extends StatefulWidget {
  const UploadItems({super.key});

  @override
  State<UploadItems> createState() => _UploadItemsState();
}

class _UploadItemsState extends State<UploadItems> {
  final ImagePicker _picker = ImagePicker();
  XFile? pickedImageXFile;

  final _formKey = GlobalKey<FormState>();
  final _isObscure = true.obs;

  captureImageWithPhoneCamera() async {
    pickedImageXFile = await _picker.pickImage(source: ImageSource.camera);
    Get.back();
    setState(() => pickedImageXFile);
  }

  pickImageFromPhoneGallery() async {
    pickedImageXFile = await _picker.pickImage(source: ImageSource.gallery);
    Get.back();
    setState(() => pickedImageXFile);
  }

  showDialogBoxForImagePickingAndCapturing() {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.black87,
          title: const Text(
            'Item Image',
            style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
          ),
          children: [
            SimpleDialogOption(
              onPressed: () {
                captureImageWithPhoneCamera();
              },
              child: const Text("Capture with Phone Camera", style: TextStyle(color: Colors.grey)),
            ),
            SimpleDialogOption(
              onPressed: () {
                pickImageFromPhoneGallery();
              },
              child: const Text("Select Image From Phone Gallery", style: TextStyle(color: Colors.grey)),
            ),
            SimpleDialogOption(
              onPressed: Get.back,
              child: const Text("Cancel", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  Widget uploadItemFormScreen() {
    final UploadItemsController controller = Get.put(UploadItemsController());

    return ListView(
      children: [
        Container(
          height: 240,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: FileImage(File(pickedImageXFile!.path)),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
          decoration: const BoxDecoration(
            color: Colors.white24,
            borderRadius: BorderRadius.all(Radius.circular(60)),
            boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black26, offset: Offset(0, -3))],
          ),
          child: Column(
            children: [
              const Center(child: Text("upload", style: TextStyle(fontSize: 20, color: Colors.white))),
              const SizedBox(height: 36),
              // Email/Password sing In - form
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // name
                    TextFormField(
                      controller: controller.name,
                      validator: (value) => value == "" ? "Please write item name" : null,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.title, color: Colors.black),
                        hintText: "Item name ...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // rating
                    TextFormField(
                      controller: controller.rating,
                      validator: (value) => value == "" ? "Please write rating" : null,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.rate_review_outlined, color: Colors.black),
                        hintText: "item rating ...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // tags
                    TextFormField(
                      controller: controller.tags,
                      validator: (value) => value == "" ? "Please write tags" : null,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.tag, color: Colors.black),
                        hintText: "Item tags ...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // price
                    TextFormField(
                      controller: controller.price,
                      validator: (value) => value == "" ? "Please write price" : null,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.price_change_outlined, color: Colors.black),
                        hintText: "Item price ...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // sizes
                    TextFormField(
                      controller: controller.sizes,
                      validator: (value) => value == "" ? "Please enter sizes" : null,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.picture_in_picture, color: Colors.black),
                        hintText: "Item sizes ...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // colors
                    TextFormField(
                      controller: controller.colors,
                      validator: (value) => value == "" ? "Please enter colors" : null,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.format_color_fill_outlined, color: Colors.black),
                        hintText: "Item color ...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // description
                    TextFormField(
                      controller: controller.description,
                      minLines: 2,
                      maxLines: 6,
                      validator: (value) => value == "" ? "Please enter description" : null,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.description_outlined, color: Colors.black),
                        hintText: "Item description ...",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(color: Colors.white60),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                        fillColor: Colors.white,
                        filled: true,
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Button
                    Button(
                      text: "Upload Now",
                      onTap: () async {
                        if (_formKey.currentState!.validate()) await controller.saveItem();
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ],
    );
  }

  Widget defaultScreen() {
    return Container(
      decoration: gradientDecoration,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.add_photo_alternate, color: Colors.white54, size: 200),
            Button(
                text: 'Add New Item',
                color: Colors.black38,
                onTap: () {
                  showDialogBoxForImagePickingAndCapturing();
                }),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          flexibleSpace: Container(decoration: gradientDecoration),
          automaticallyImplyLeading: false,
          title: const Text("Upload Items"),
          centerTitle: true,
        ),
        body: pickedImageXFile == null ? defaultScreen() : uploadItemFormScreen(),
      ),
    );
  }
}
