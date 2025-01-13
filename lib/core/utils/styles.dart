import 'package:final_project/constants.dart';
import 'package:flutter/cupertino.dart';

/// A class to hold various predefined text styles used throughout the app.
abstract class Styles {
  // Regular text style for font size 18 with semi-bold weight.
  static const textStyle18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  // Regular text style for font size 20 with normal weight.
  static const textStyle20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

  // Large text style for title or headings with font size 30.
  static const textStyle30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.normal,
    fontFamily: kGtSectraFine, // Custom font
  );

  // Smaller text style for more compact content, like labels or captions.
  static const textStyle14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  // Slightly larger text style for subtitles or medium-sized content.
  static const textStyle16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  // Bold style for important headings or buttons.
  static const textStyleBold20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  // Style for larger heading with emphasis (font size 40, bold).
  static const textStyleHeading40 = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    fontFamily: kGtSectraFine, // Custom font
  );

  // Text style for body text or paragraphs, with a balanced weight and size.
  static const textStyleBody = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  // Style for smaller buttons or links.
  static const textStyleLink = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: CupertinoColors.activeBlue, // Typical link color
  );

  // A text style for captions or footnotes with a subtle appearance.
  static const textStyleCaption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: CupertinoColors.inactiveGray, // Lighter gray for captions
  );

  // Text style for error messages, with a red color.
  static const textStyleError = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: CupertinoColors.systemRed, // Error color
  );

  // Style for the app's primary button text, usually bold and larger.
  static const textStyleButtonPrimary = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: CupertinoColors.white,
  );

  // Style for secondary button text with less emphasis.
  static const textStyleButtonSecondary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: CupertinoColors.activeBlue,
  );
}
