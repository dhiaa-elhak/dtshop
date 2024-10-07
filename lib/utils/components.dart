// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../data/models/wilaya.dart';
import 'constants.dart';

Widget Loader() => const CircularProgressIndicator(color: primaryColor);

Widget assetIcon({required String icon, required Color color, double? height}) {
  return Image.asset(
    icon,
    height: height ?? 35,
    color: color,
  );
}

Widget MyTextField({
  required TextEditingController controller,
  bool isObscure = false,
  bool readOnly = false,
  Widget? suffixIcon,
  Widget? prefixIcon,
  String? hintText,
  int? maxLines,
  String? Function(String?)? validator,
  TextInputType? keyboardType,
}) {
  return Container(
    padding: prefixIcon != null
        ? const EdgeInsets.only(left: 0, right: 10)
        : const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: greyColor.withOpacity(.2),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextFormField(
      controller: controller,
      cursorColor: blackColor,
      obscureText: isObscure,
      maxLines: maxLines,
      readOnly: readOnly,
      validator: validator,
      keyboardType: keyboardType,
      autovalidateMode: AutovalidateMode.disabled,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
      ),
    ),
  );
}

Widget SelectWilaya({
  required TextEditingController controller,
  required String hintText,
  required List items,
  bool isLoading = false,
  Function? onSelected,
}) {
  return StatefulBuilder(
    builder: (context, setState) {
      return Container(
        decoration: BoxDecoration(
          color: greyColor.withOpacity(.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: controller,
          readOnly: true,
          enableInteractiveSelection: true,
          keyboardType: TextInputType.none,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(top: 10, left: 10),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            hintText: hintText,
            suffixIcon: PopupMenuButton<Wilaya>(
              icon: isLoading
                  ? SizedBox(height: 14, width: 14, child: Loader())
                  : const Icon(Icons.keyboard_arrow_down, color: blackColor),
              onSelected: (value) {
                controller.text = value.name;
                //setState(() {});
                onSelected!(value);
              },
              itemBuilder: (BuildContext context) {
                return items.map<PopupMenuItem<Wilaya>>(
                  (value) {
                    return PopupMenuItem(value: value, child: Text(value.name));
                  },
                ).toList();
              },
            ),
          ),
        ),
      );
    },
  );
}

Widget filledButton({
  required Widget child,
  required VoidCallback onPressed,
  Color color = primaryColor,
}) {
  return ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(color),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      elevation: MaterialStateProperty.all(0.0),
    ),
    onPressed: onPressed,
    child: child,
  );
}

Widget outlinedButton({
  required Widget child,
  required VoidCallback onPressed,
  Color color = primaryColor,
}) {
  return OutlinedButton(
    style: ButtonStyle(
      side: MaterialStateProperty.all(
        const BorderSide(color: primaryColor),
      ),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    onPressed: onPressed,
    child: child,
  );
}

Widget UserDataWidget({
  required String firstName,
  required String lastName,
  required String email,
}) {
  return Column(
    children: [
      Container(
        padding: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: primaryColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            firstName[0] + lastName[0],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      ),
      mediumVerticalSpace,
      Text(
        "$firstName $lastName",
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      smallVerticalSpace,
      Text(email),
    ],
  );
}


Widget settingsItem({
   String ? icon,
  required String label,
  bool? isActivated,
  Widget? dropWidget,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child:  icon != null
              ? assetIcon(
            icon: icon, // Pass icon directly as it's non-null
            color: Colors.white,
            height: 22,
          )
              : null,
        ),
        smallHorizontalSpace,
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        isActivated != null
            ? Switch.adaptive(
          activeColor: greenColor,
          value: isActivated,
          onChanged: (value) {},
        )
            : dropWidget ?? const Icon(Icons.arrow_forward_ios),
      ],
    ),
  );
}

