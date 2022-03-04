import 'package:anand_yogalaya/screens/contentScreen/contentScreen.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Future showUploadForm(BuildContext context) async {
  bool isPremium = false;

  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isDismissible: true,
    isScrollControlled: true,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.75,
        maxChildSize: 0.75,
        minChildSize: 0.2,
        builder: (context, scrollController) {
          return Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: StatefulBuilder(
              builder: (sheetContext, setStateInsideSheet) {
                return Container(
                  color: Colors.transparent,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      color: SubcategoryColor,
                    ),
                    padding: const EdgeInsets.only(
                        top: 15, left: 15, right: 15, bottom: 20),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(
                                  Icons.close,
                                  size: 24,
                                ),
                              ),
                              Text(
                                'Upload Content',
                                style: GoogleFonts.lato(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Donebutton,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  isPremium = !isPremium;
                                  setStateInsideSheet(() {});
                                },
                                child: Icon(
                                  isPremium
                                      ? Icons.star_rate_rounded
                                      : Icons.star_border_outlined,
                                  color: kPrimaryYellow,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),
                          buildUploadFormTitle('Title *'),
                          buildUploadFormTextField(
                            hint: 'Enter a name of Video/Post',
                          ),
                          buildUploadFormTitle('Description'),
                          buildUploadFormTextField(
                            hint: 'Details about the content',
                            isMultiline: true,
                          ),
                          buildUploadFormTitle('Video URL'),
                          buildUploadFormTextField(
                            onChanged: (value) {
                              //TODO: Adding a link validation.
                            },
                            hint: 'Enter a YouTube URL',
                          ),
                          buildUploadFormTitle('Image URL'),
                          buildUploadFormTextField(
                            onChanged: (value) {
                              //TODO: Adding a link validation.
                            },
                            hint: 'Enter a Image URL',
                          ),
                          buildUploadFormTitle('Duration (seconds)'),
                          buildUploadFormTextField(
                            hint: 'Reading/Video time',
                            isInt: true,
                          ),
                          buildUploadFormTitle('Categories'),
                          buildUploadFormTextField(
                            hint: 'Enter categories',
                          ),
                          const SizedBox(height: M_MEDIUM_PAD),
                          buttonWithText(text: 'Save'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      );
    },
  );
}

Widget buildUploadFormTitle(String text) {
  return Container(
    margin: const EdgeInsets.fromLTRB(0, 12, 0, 8),
    child: Text(
      text,
      style: GoogleFonts.lato(
        color: Colors.black87,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget buildUploadFormTextField({
  String hint = '',
  TextEditingController? textController,
  bool isInt = false,
  bool isMultiline = false,
  Function(String)? onChanged,
  isEnabled = true,
}) {
  return Container(
    margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      border: Border.all(
        color: kGreyShade1,
      ),
      color: isEnabled ? Colors.white : kGreyShade6,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 15),
    child: TextField(
      enabled: isEnabled,
      onChanged: onChanged,
      style: GoogleFonts.lato(
        color: Donebutton,
        fontSize: 17,
      ),
      maxLines: isMultiline ? 3 : 1,
      minLines: isMultiline ? 3 : 1,
      controller: textController,
      textCapitalization: TextCapitalization.words,
      keyboardType: isInt
          ? TextInputType.number
          : isMultiline
              ? TextInputType.multiline
              : TextInputType.text,
      inputFormatters: isInt
          ? [
              FilteringTextInputFormatter.digitsOnly,
              //Below is to allow only 2 digits after decimal
              // FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
            ]
          : [],
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.lato(
          color: Colors.grey,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        filled: !isEnabled,
        fillColor: kGreyShade6,
      ),
    ),
  );
}
