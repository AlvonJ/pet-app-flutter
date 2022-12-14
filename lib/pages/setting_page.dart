import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pet_app/models/app_colors.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool selected = false;
  bool checked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColors.mainColor;
    }
    return AppColors.secondaryColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage("./assets/template.png"),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.secondaryColor),
          title: const Text("Setting"),
          titleTextStyle: const TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
              fontSize: 26,
              letterSpacing: .5),
          centerTitle: true,
        ),
        body: ListView(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(height: 45),
                InkWell(
                  onTap: () {
                    context.pushNamed('profile');
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.secondaryColor,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Profile',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    setState(() {
                      selected ? selected = false : selected = true;
                    });
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.mainColor,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 17, vertical: 10),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Donation Notification',
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 15),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.check,
                          color:
                              selected ? AppColors.secondaryColor : Colors.grey,
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                DropdownSearch<String>(
                  popupProps: const PopupProps.menu(
                    showSelectedItems: true,
                  ),
                  items: const [
                    "New Dog Available",
                    "New Cat Available",
                    "Adoption Approved",
                    "Adoption Declined",
                  ],
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.mainColor),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(8)),
                        border: const OutlineInputBorder(),
                        hintText: "Adoption Nontification",
                        hintStyle:
                            const TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),
                DropdownSearch<String>(
                  popupProps: const PopupProps.menu(
                    showSelectedItems: true,
                  ),
                  items: const [
                    "Genre isi apa woi ?",
                    "Horror ?",
                    "Komedi ?",
                    "Hidup aing udh horror...",
                  ],
                  dropdownDecoratorProps: DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: AppColors.mainColor),
                            borderRadius: BorderRadius.circular(8)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.blue, width: 2),
                            borderRadius: BorderRadius.circular(8)),
                        border: const OutlineInputBorder(),
                        hintText: "Genre",
                        hintStyle:
                            const TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                  onChanged: (value) {},
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          checkColor: Colors.white,
                          fillColor:
                              MaterialStateProperty.resolveWith(getColor),
                          value: checked,
                          onChanged: (bool? value) {
                            setState(() {
                              checked = value!;
                            });
                          }),
                    ),
                    const Text(
                      "Turn On Notification",
                      style:
                          TextStyle(color: AppColors.mainColor, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
