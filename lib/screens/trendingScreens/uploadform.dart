import 'package:anand_yogalaya/controllers/category_controller.dart';
import 'package:anand_yogalaya/controllers/upload_form_controller.dart';
import 'package:anand_yogalaya/models/category_model.dart';
import 'package:anand_yogalaya/models/content_model.dart';
import 'package:anand_yogalaya/services/database.dart';
import 'package:anand_yogalaya/services/network_service.dart';
import 'package:anand_yogalaya/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

Future showUpdateForm(BuildContext context, ContentModel contentModel) async {
  bool isPremium = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController videoURLController = TextEditingController();
  TextEditingController photoURLController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  durationController.text = '0';

  UploadFormController uploadFormController = Get.put(UploadFormController());

  // for Dropdown category
  CategoryController categoryController = Get.find();
  List<String> _selectedCategoryIdList = [];

  isPremium = contentModel.isPremium;
  titleController.text = contentModel.name;
  descriptionController.text =
      contentModel.description != null ? contentModel.description! : '';
  videoURLController.text =
      contentModel.videoUrl != null ? contentModel.videoUrl! : '';
  photoURLController.text = contentModel.photoUrl;
  durationController.text = contentModel.duration.toString();
  contentModel.categories ??= [];
  for (int i = 0; i < contentModel.categories!.length; i++) {
    _selectedCategoryIdList.add(contentModel.categories![i]);
  }

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
                            textController: titleController,
                          ),
                          buildUploadFormTitle('Description *'),
                          buildUploadFormTextField(
                            hint: 'Details about the content',
                            isMultiline: true,
                            textController: descriptionController,
                          ),
                          buildUploadFormTitle('Video URL'),
                          buildUploadFormTextField(
                            hint: 'Enter a YouTube URL',
                            textController: videoURLController,
                          ),
                          buildUploadFormTitle('Image URL'),
                          buildUploadFormTextField(
                            hint: 'Enter a Image URL',
                            textController: photoURLController,
                          ),
                          buildUploadFormTitle('Duration (mins)'),
                          buildUploadFormTextField(
                            hint: 'Reading/Video time',
                            isInt: true,
                            textController: durationController,
                          ),
                          buildUploadFormTitle('Categories'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: MultiSelectDialogField(
                                  searchHint: 'Search category',
                                  searchable: true,
                                  items: categoryController.getAllCategoryList
                                      .map<MultiSelectItem<CategoryModel?>>(
                                          (e) => MultiSelectItem(e, e.name))
                                      .toList(),
                                  title: const Text("Categories"),
                                  selectedColor: kindigo,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    border: Border.all(
                                      color: kGreyShade1,
                                    ),
                                    color: Colors.white,
                                  ),
                                  buttonIcon: Icon(
                                    Icons.category,
                                    color: kindigo,
                                  ),
                                  buttonText: const Text(
                                    "Choose category",
                                  ),
                                  onConfirm: (results) {
                                    //_selectedCategoryList = results.cast<CategoryModel>();
                                    for (var result
                                    in results.cast<CategoryModel>()) {
                                      _selectedCategoryIdList.add(result.id);
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.add_box_rounded,
                                    color: Donebutton,
                                  ),
                                  onPressed: () async {
                                    await showCategoryUploadForm(context);
                                    setStateInsideSheet(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: M_MEDIUM_PAD),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: buttonWithText(
                                    text: 'Save',
                                    onPressed: () async {
                                      if (titleController.text.trim().isEmpty ||
                                          descriptionController.text
                                              .trim()
                                              .isEmpty) {
                                        Get.snackbar(
                                          'Form Incomplete!',
                                          'Title and Description is compulsory.',
                                          snackPosition: SnackPosition.BOTTOM,
                                        );
                                        return;
                                      } else if (videoURLController
                                              .text.isEmpty &&
                                          photoURLController.text.isEmpty) {
                                        Get.snackbar(
                                          'Form Incomplete!',
                                          'Fill Video URL or Image URL',
                                          snackPosition: SnackPosition.BOTTOM,
                                        );
                                        return;
                                      }

                                      if (durationController.text.isEmpty) {
                                        durationController.text = '0';
                                      }

                                      bool isNetworkConnectionAvailable =
                                          await NetworkService
                                              .checkInternetConnection();
                                      if (!isNetworkConnectionAvailable) {
                                        Get.snackbar(
                                          'Network Error!',
                                          'Please check your Internet Connection!',
                                          snackPosition: SnackPosition.BOTTOM,
                                        );
                                        return;
                                      }

                                      contentModel.categories =
                                          _selectedCategoryIdList;
                                      contentModel.description =
                                          descriptionController.text;
                                      contentModel.duration =
                                          int.parse(durationController.text);
                                      contentModel.isPremium = isPremium;
                                      contentModel.name = titleController.text;
                                      contentModel.photoUrl =
                                          photoURLController.text;
                                      contentModel.videoUrl =
                                          videoURLController.text;
                                      contentModel.createSearchKeywords();

                                      bool isSuccess =
                                          await uploadFormController
                                              .updateForm(contentModel);
                                      if (isSuccess) {
                                        Get.snackbar("Updated",
                                            "Congratulations! Content updated successfully",
                                            snackPosition: SnackPosition.BOTTOM,
                                            colorText: Donebutton,
                                            isDismissible: true);
                                        Navigator.pop(context);
                                      } else {
                                        Get.snackbar("Failed",
                                            "Updating content Failed, Try Again!",
                                            snackPosition: SnackPosition.BOTTOM,
                                            colorText: Donebutton,
                                            isDismissible: true);
                                      }
                                    }),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: buttonWithText(
                                  text: 'Delete',
                                  color: Colors.red,
                                  onPressed: () async {
                                    bool isNetworkConnectionAvailable =
                                        await NetworkService
                                            .checkInternetConnection();
                                    if (!isNetworkConnectionAvailable) {
                                      Get.snackbar(
                                        'Network Error!',
                                        'Please check your Internet Connection!',
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                      return;
                                    }

                                    bool isSuccess = await uploadFormController
                                        .markContentDeleted(contentModel);

                                    if (isSuccess) {
                                      Get.snackbar("Deleted",
                                          "Content deleted successfully",
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: Donebutton,
                                          isDismissible: true);
                                      Navigator.pop(context);
                                    } else {
                                      Get.snackbar(
                                          "Error", "Error deleting content!",
                                          snackPosition: SnackPosition.BOTTOM,
                                          colorText: Donebutton,
                                          isDismissible: true);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
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

Future showUploadForm(BuildContext context) async {
  bool isPremium = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController videoURLController = TextEditingController();
  TextEditingController photoURLController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  durationController.text = '0';

  UploadFormController uploadFormController = Get.put(UploadFormController());

  // for Dropdown category
  CategoryController categoryController = Get.find();
  List<CategoryModel>? _selectedCategoryList;
  List<String> _selectedCategoryIdList = [];

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
                  color: UploadBackgroundcolor,
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
                            textController: titleController,
                          ),
                          buildUploadFormTitle('Description *'),
                          buildUploadFormTextField(
                            hint: 'Details about the content',
                            isMultiline: true,
                            textController: descriptionController,
                          ),
                          buildUploadFormTitle('Video URL'),
                          buildUploadFormTextField(
                            hint: 'Enter a YouTube URL',
                            textController: videoURLController,
                          ),
                          buildUploadFormTitle('Image URL'),
                          buildUploadFormTextField(
                            hint: 'Enter a Image URL',
                            textController: photoURLController,
                          ),
                          buildUploadFormTitle('Duration (mins)'),
                          buildUploadFormTextField(
                            hint: 'Reading/Video time',
                            isInt: true,
                            textController: durationController,
                          ),
                          buildUploadFormTitle('Categories'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: MultiSelectDialogField(
                                  searchHint: 'Search category',
                                  searchable: true,
                                  items: categoryController.getAllCategoryList
                                      .map<MultiSelectItem<CategoryModel?>>(
                                          (e) => MultiSelectItem(e, e.name))
                                      .toList(),
                                  title: const Text("Categories"),
                                  selectedColor: kindigo,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                    border: Border.all(
                                      color: kGreyShade1,
                                    ),
                                    color: Colors.white,
                                  ),
                                  buttonIcon: Icon(
                                    Icons.category,
                                    color: kindigo,
                                  ),
                                  buttonText: const Text(
                                    "Choose category",
                                  ),
                                  onConfirm: (results) {
                                    //_selectedCategoryList = results.cast<CategoryModel>();
                                    for (var result
                                        in results.cast<CategoryModel>()) {
                                      _selectedCategoryIdList.add(result.id);
                                    }
                                  },
                                ),
                              ),
                              Expanded(
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.add_box_rounded,
                                    color: Donebutton,
                                  ),
                                  onPressed: () async {
                                    await showCategoryUploadForm(context);
                                    setStateInsideSheet(() {});
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: M_MEDIUM_PAD),
                          buttonWithText(
                              text: 'Save',
                              onPressed: () async {
                                if (titleController.text.trim().isEmpty ||
                                    descriptionController.text.trim().isEmpty) {
                                  Get.snackbar(
                                    'Form Incomplete!',
                                    'Title and Description is compulsory.',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                  return;
                                } else if (videoURLController.text.isEmpty &&
                                    photoURLController.text.isEmpty) {
                                  Get.snackbar(
                                    'Form Incomplete!',
                                    'Fill Video URL or Image URL',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                  return;
                                }

                                if (durationController.text.isEmpty) {
                                  durationController.text = '0';
                                }

                                bool isNetworkConnectionAvailable =
                                    await NetworkService
                                        .checkInternetConnection();
                                if (!isNetworkConnectionAvailable) {
                                  Get.snackbar(
                                    'Network Error!',
                                    'Please check your Internet Connection!',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                  return;
                                }

                                ContentModel contentModel = ContentModel(
                                    name: titleController.text,
                                    description: descriptionController.text,
                                    photoUrl: photoURLController.text,
                                    videoUrl: videoURLController.text,
                                    duration:
                                        int.parse(durationController.text),
                                    isPremium: isPremium,
                                    categories: _selectedCategoryIdList);

                                bool isSuccess = await uploadFormController
                                    .uploadForm(contentModel);
                                if (isSuccess) {
                                  Get.snackbar("Uploaded",
                                      "Congratulations! Content uploaded successfully",
                                      snackPosition: SnackPosition.BOTTOM,
                                      colorText: Donebutton,
                                      isDismissible: true);
                                  Navigator.pop(context);
                                } else {
                                  Get.snackbar("Failed",
                                      "Uploading content Failed, Try Again!",
                                      snackPosition: SnackPosition.BOTTOM,
                                      colorText: Donebutton,
                                      isDismissible: true);
                                }
                              }),
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

Future showCategoryUploadForm(BuildContext context) async {
  bool isPremium = false;
  bool isPlaylist = true;
  TextEditingController titleController = TextEditingController();
  TextEditingController photoURLController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  durationController.text = '0';

  UploadFormController uploadFormController = Get.put(UploadFormController());

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
                                'Add Category',
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
                            hint: 'Enter a name of Playlist/Category',
                            textController: titleController,
                          ),
                          buildUploadFormTitle('Image URL'),
                          buildUploadFormTextField(
                            hint: 'Enter a Image URL',
                            textController: photoURLController,
                          ),
                          buildUploadFormTitle('Duration (mins)'),
                          buildUploadFormTextField(
                            hint: '',
                            isInt: true,
                            textController: durationController,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              buildUploadFormTitle('Is Playlist'),
                              Switch(
                                  value: isPlaylist,
                                  onChanged: (value) {
                                    setStateInsideSheet(() {
                                      isPlaylist = value;
                                    });
                                  }),
                            ],
                          ),
                          const SizedBox(height: M_MEDIUM_PAD),
                          buttonWithText(
                              text: 'Save',
                              onPressed: () async {
                                if (titleController.text.trim().isEmpty) {
                                  Get.snackbar(
                                    'Form Incomplete!',
                                    'Title is compulsory.',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                  return;
                                }

                                if (durationController.text.isEmpty) {
                                  durationController.text = '0';
                                }

                                bool isNetworkConnectionAvailable =
                                    await NetworkService
                                        .checkInternetConnection();
                                if (!isNetworkConnectionAvailable) {
                                  Get.snackbar(
                                    'Network Error!',
                                    'Please check your Internet Connection!',
                                    snackPosition: SnackPosition.BOTTOM,
                                  );
                                  return;
                                }

                                CategoryModel categoryModel = CategoryModel(
                                  name: titleController.text,
                                  id: titleController.text.toUpperCase().trimLeft().trimRight(),
                                  imageUrl: photoURLController.text,
                                  totalDuration:
                                      int.parse(durationController.text),
                                  isPremium: isPremium,
                                  isPlayList: isPlaylist,
                                );

                                bool isSuccess = await uploadFormController
                                    .addCategoryForm(categoryModel);
                                if (isSuccess) {
                                  Get.snackbar(
                                      "Added",
                                      isPlaylist
                                          ? 'Playlist added successfully!'
                                          : 'Category added successfully',
                                      snackPosition: SnackPosition.BOTTOM,
                                      colorText: Donebutton,
                                      isDismissible: true);
                                  Navigator.pop(context);
                                } else {
                                  Get.snackbar(
                                      "Failed",
                                      isPlaylist
                                          ? 'Failed adding Playlist'
                                          : 'Failed adding Category',
                                      snackPosition: SnackPosition.BOTTOM,
                                      colorText: Donebutton,
                                      isDismissible: true);
                                }
                              }),
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
