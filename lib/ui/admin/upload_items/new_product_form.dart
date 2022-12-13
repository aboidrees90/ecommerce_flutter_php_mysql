import 'package:ecommerce_php/controller/upload_product_controller.dart';
import 'package:ecommerce_php/core/functions/input_style.dart';
import 'package:ecommerce_php/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadItemForm extends StatelessWidget {
  UploadItemForm({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    UploadProductsController uploadProductController = Get.put(UploadProductsController());

    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
      decoration: const BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black38, offset: Offset(0, 3))],
      ),
      child: Column(
        children: [
          // const Center(child: Text("Add New Product", style: TextStyle(fontSize: 20, color: Colors.white))),
          // const SizedBox(height: 24),
          // Email/Password sing In - form
          Form(
            key: _formKey,
            child: Column(
              children: [
                // name
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: uploadProductController.name,
                  validator: (value) => value == "" ? "Please write item name" : null,
                  decoration: inputStyle(hintText: "name ...", prefixIconData: Icons.title),
                ),

                const SizedBox(height: 15),

                // rating
                TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(color: Colors.black),
                  controller: uploadProductController.rating,
                  validator: (value) => value == "" ? "Please write rating" : null,
                  decoration: inputStyle(hintText: "rating ...", prefixIconData: Icons.rate_review_outlined),
                ),

                const SizedBox(height: 15),

                // tags
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: uploadProductController.tags,
                  validator: (value) => value == "" ? "Please write tags" : null,
                  decoration: inputStyle(hintText: "tags .. separate with comma", prefixIconData: Icons.tag),
                ),

                const SizedBox(height: 15),

                // price
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: uploadProductController.price,
                  validator: (value) => value == "" ? "Please write price" : null,
                  decoration: inputStyle(hintText: "price ...", prefixIconData: Icons.price_change_outlined),
                ),

                const SizedBox(height: 15),

                // sizes
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: uploadProductController.sizes,
                  validator: (value) => value == "" ? "Please enter sizes" : null,
                  decoration: inputStyle(hintText: "sizes .. separate with comma", prefixIconData: Icons.picture_in_picture),
                ),

                const SizedBox(height: 15),

                // colors
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: uploadProductController.colors,
                  validator: (value) => value == "" ? "Please enter colors" : null,
                  decoration: inputStyle(hintText: "colors .. separate with comma", prefixIconData: Icons.format_color_fill_outlined),
                ),

                const SizedBox(height: 15),

                // description
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: uploadProductController.description,
                  keyboardType: TextInputType.multiline,
                  minLines: 3,
                  maxLines: 6,
                  validator: (value) => value == "" ? "Please enter description" : null,
                  decoration: inputStyle(hintText: "description ..."),
                ),

                const SizedBox(height: 18),

                // Button
                Button(
                  text: "Save",
                  onTap: () async => (_formKey.currentState!.validate()) ? await uploadProductController.save() : null,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
