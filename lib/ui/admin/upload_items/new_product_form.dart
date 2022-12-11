import 'package:ecommerce_php/controller/upload_items_controller.dart';
import 'package:ecommerce_php/core/functions/input_style.dart';
import 'package:ecommerce_php/ui/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadItemForm extends StatelessWidget {
  UploadItemForm({super.key});
  final _formKey = GlobalKey<FormState>();
  final UploadItemsController _controller = Get.put(UploadItemsController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.fromLTRB(30, 30, 30, 8),
      decoration: const BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.all(Radius.circular(60)),
        boxShadow: [BoxShadow(blurRadius: 8, color: Colors.black26, offset: Offset(0, -3))],
      ),
      child: Column(
        children: [
          const Center(child: Text("New Product", style: TextStyle(fontSize: 20, color: Colors.white))),
          const SizedBox(height: 36),
          // Email/Password sing In - form
          Form(
            key: _formKey,
            child: Column(
              children: [
                // name
                TextFormField(
                  controller: _controller.name,
                  validator: (value) => value == "" ? "Please write item name" : null,
                  decoration: inputStyle(hintText: "Item name ...", prefixIconData: Icons.title),
                ),

                const SizedBox(height: 15),

                // rating
                TextFormField(
                  controller: _controller.rating,
                  validator: (value) => value == "" ? "Please write rating" : null,
                  decoration: inputStyle(hintText: "Item rating ...", prefixIconData: Icons.rate_review_outlined),
                ),

                const SizedBox(height: 15),

                // tags
                TextFormField(
                  controller: _controller.tags,
                  validator: (value) => value == "" ? "Please write tags" : null,
                  decoration: inputStyle(hintText: "Item tags ...", prefixIconData: Icons.tag),
                ),

                const SizedBox(height: 15),

                // price
                TextFormField(
                  controller: _controller.price,
                  validator: (value) => value == "" ? "Please write price" : null,
                  decoration: inputStyle(hintText: "Item price ...", prefixIconData: Icons.price_change_outlined),
                ),

                const SizedBox(height: 15),

                // sizes
                TextFormField(
                  controller: _controller.sizes,
                  validator: (value) => value == "" ? "Please enter sizes" : null,
                  decoration: inputStyle(hintText: "Item sizes ...", prefixIconData: Icons.picture_in_picture),
                ),

                const SizedBox(height: 15),

                // colors
                TextFormField(
                  controller: _controller.colors,
                  validator: (value) => value == "" ? "Please enter colors" : null,
                  decoration: inputStyle(hintText: "Item color ...", prefixIconData: Icons.format_color_fill_outlined),
                ),

                const SizedBox(height: 15),

                // description
                TextFormField(
                  controller: _controller.description,
                  minLines: 2,
                  maxLines: 6,
                  validator: (value) => value == "" ? "Please enter description" : null,
                  decoration: inputStyle(hintText: "Item description ...", prefixIconData: Icons.description_outlined),
                ),

                const SizedBox(height: 18),

                // Button
                Button(
                  text: "Save",
                  onTap: () async => (_formKey.currentState!.validate()) ? await _controller.saveItem() : null,
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
