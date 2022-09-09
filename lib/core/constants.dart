import 'package:flutter/material.dart';

const String ERROR_MESSAGE = 'Oops, something went wrong!';
const String INTERNET_ERROR_MESSAGE =
    'Please check your internet connection then try again.';
const String IMAGE_ERROR_MESSAGE = 'Couldn\'t load image';
const String File_ERROR_MESSAGE =
    'Couldn\'t open the File, Incompatibility issue';

const String APP_NAME = 'Users Demo';

const double kCardBorderRadius = 12.0;
const double kSearchFieldBorderRadius = 28.0;
const double kCardElevation = 8.0;

final kEnabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(kSearchFieldBorderRadius),
  borderSide: BorderSide(
    width: 1,
    
    color: Colors.grey,
  ),
);

final kDisabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(kSearchFieldBorderRadius),
  borderSide: BorderSide(
    width: 1,
    color: Colors.grey.shade300,
  ),
);

final kFocusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(kSearchFieldBorderRadius),
  borderSide: BorderSide(
    width: 2,
    color: Colors.blue[900]!,
  ),
);

final kErrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(kSearchFieldBorderRadius),
  borderSide: BorderSide(
    width: 1,
    color: Colors.blue[900]!,
  ),
);
