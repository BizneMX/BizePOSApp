import 'dart:io';

import 'package:bizne_fonda_app/app/components/my_text.dart';
import 'package:bizne_fonda_app/app/models/profile/schedule.dart';
import 'package:bizne_fonda_app/app/services/camera_service.dart';
import 'package:bizne_fonda_app/app/themes/app_themes.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../utils/formatters.dart';

class CountrySelector extends StatelessWidget {
  final Function(String) onSelected;
  final String? initial;
  const CountrySelector({super.key, required this.onSelected, this.initial});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.5.h,
      decoration: BoxDecoration(
          borderRadius: AppThemes().borderRadius,
          color: AppThemes().whiteInputs),
      child: CountryCodePicker(
        padding: EdgeInsets.zero,
        onChanged: (value) {
          onSelected(value.toString());
        },
        initialSelection: initial ?? '+52',
        favorite: const ['+52', 'MX'],
        showCountryOnly: false,
        showOnlyCountryWhenClosed: false,
        alignLeft: false,
      ),
    );
  }
}

class DayOfWeekSelector extends StatefulWidget {
  final Function(DayOfWeeks) onChange;
  final DayOfWeeks initialDay;
  const DayOfWeekSelector(
      {super.key, required this.onChange, required this.initialDay});

  @override
  State<DayOfWeekSelector> createState() => _DayOfWeekSelectorState();
}

class _DayOfWeekSelectorState extends State<DayOfWeekSelector> {
  DayOfWeeks selectedDay = DayOfWeeks.monday;

  @override
  void initState() {
    super.initState();

    setState(() {
      selectedDay = widget.initialDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppThemes().whiteInputs,
          borderRadius: AppThemes().borderRadius),
      child: DropdownButton2(
          buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                  color: AppThemes().whiteInputs,
                  borderRadius: AppThemes().borderRadius)),
          underline: const SizedBox(),
          customButton: Stack(children: [
            Center(child: DayOfWeekDropdownMenuItem(day: selectedDay)),
            const Positioned(
              top: 5,
              right: 2,
              child: Icon(Icons.arrow_drop_down_sharp),
            )
          ]),
          items: DayOfWeeks.values
              .map((e) => DropdownMenuItem<String>(
                    value: e.toString(),
                    child: DayOfWeekDropdownMenuItem(day: e),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              final day = DayOfWeeks.values
                  .where((v) => v.toString() == value)
                  .firstOrNull;
              widget.onChange(day!);
              selectedDay = day;
            });
          }),
    );
  }
}

class DayOfWeekDropdownMenuItem extends StatelessWidget {
  final DayOfWeeks day;

  const DayOfWeekDropdownMenuItem({super.key, required this.day});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      MyText(
        text: dayOfWeekToStr(day),
        fontSize: 12.sp,
      )
    ]);
  }
}

class FileSelector extends StatelessWidget {
  final Widget child;
  final bool isFile;
  final Function(MyFile file) onChange;
  const FileSelector(
      {super.key,
      required this.child,
      required this.onChange,
      this.isFile = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          final String? fileLocation = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                    title: MyText(
                        text: isFile
                            ? 'selectAFileAPhotoOrTakeAPhoto'.tr
                            : 'selectOrTakeAPhoto'.tr,
                        align: TextAlign.center,
                        fontSize: 18,
                        color: AppThemes().primary,
                        type: FontType.semibold),
                    titlePadding: const EdgeInsets.all(5),
                    backgroundColor: AppThemes().background,
                    shape: RoundedRectangleBorder(
                        borderRadius: AppThemes().borderRadius10),
                    alignment: Alignment.center,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () => Get.back(result: 'camera'),
                                icon: Icon(Icons.camera_alt_outlined,
                                    size: 20.sp, color: AppThemes().primary)),
                            IconButton(
                                onPressed: () => Get.back(result: 'gallery'),
                                icon: Icon(Icons.photo_library_outlined,
                                    size: 20.sp, color: AppThemes().primary)),
                            if (isFile)
                              IconButton(
                                  onPressed: () => Get.back(result: 'file'),
                                  icon: Image.asset(
                                    'assets/icons/file.png',
                                    color: AppThemes().primary,
                                    height: 18.sp,
                                  ),
                                  color: AppThemes().primary)
                          ])
                    ]);
              });

          if (fileLocation == 'camera') await _pickCameraImage();
          if (fileLocation == 'gallery') await _pickGalleryImage();
          if (fileLocation == 'file') await _pickFile();
        },
        child: child);
  }

  Future<void> _pickCameraImage() async {
    final XFile? image = await CameraService.service.openImageFromCamera(30);

    if (image != null) {
      await _croppedImage(image);
    }
  }

  Future<void> _pickGalleryImage() async {
    final XFile? image = await CameraService.service.openImageFromGallery(30);

    if (image != null) {
      await _croppedImage(image);
    }
  }

  Future<void> _pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles();

    if (pickedFile != null &&
        pickedFile.files.isNotEmpty &&
        pickedFile.files.first.path != null) {
      onChange(MyFile(
          file: File(pickedFile.files.first.path!),
          name: pickedFile.names.first!));
    }
  }

  Future<void> _croppedImage(XFile image) async {
    CroppedFile? croppedFile =
        await ImageCropper().cropImage(sourcePath: image.path, uiSettings: [
      AndroidUiSettings(
          toolbarColor: AppThemes().primary,
          toolbarWidgetColor: AppThemes().white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(),
    ]);

    if (croppedFile != null) {
      onChange(MyFile(file: File(croppedFile.path), name: image.name));
    }
  }
}

class MyFile {
  final File file;
  final String name;

  MyFile({required this.file, required this.name});
}

class BizneDatePicker extends StatefulWidget {
  final Function(DateTime? value) onChange;
  final DateTime? initialDate;
  final String text;
  const BizneDatePicker(
      {super.key,
      required this.onChange,
      this.initialDate,
      required this.text});

  @override
  State<BizneDatePicker> createState() => _BizneDatePickerState();
}

class _BizneDatePickerState extends State<BizneDatePicker> {
  DateTime? selectDate;
  String text = '';

  @override
  void initState() {
    super.initState();
    text = widget.text;

    setState(() {
      selectDate = widget.initialDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final date = await showDatePickerDialog(
          height: 50.h,
          leadingDateTextStyle: TextStyle(
              fontSize: 14.sp,
              color: AppThemes().primary,
              fontWeight: FontTypeWeight.getFontType(FontType.semibold),
              fontFamily: 'Inter'),
          currentDateTextStyle: TextStyle(fontSize: 14.sp, fontFamily: 'Inter'),
          enabledCellsTextStyle: TextStyle(fontSize: 14.sp),
          disabledCellsTextStyle: TextStyle(
              fontSize: 14.sp,
              fontFamily: 'Inter',
              color: AppThemes().notSelected),
          context: context,
          minDate: DateTime(2000, 1, 1),
          maxDate: DateTime.now(),
        );

        setState(() {
          selectDate = date;
        });

        widget.onChange(date);
      },
      child: Container(
          width: 37.w,
          height: 5.h,
          padding: EdgeInsets.only(right: 2.w),
          decoration: BoxDecoration(
              color: AppThemes().whiteInputs,
              border: Border.all(color: AppThemes().primary),
              borderRadius: AppThemes().borderRadius10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: 1.w,
            ),
            MyText(
              text: selectDate == null ? text : formatDateTime1(selectDate!),
              fontSize: 12.sp,
              type: FontType.medium,
              color: AppThemes().primary,
            ),
            Icon(Icons.calendar_month, color: AppThemes().primary)
          ])),
    );
  }
}
