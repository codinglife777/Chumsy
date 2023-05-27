import 'package:flutter/services.dart';

class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String unformattedText = newValue.text.replaceAll('0,', '');
    unformattedText = unformattedText.replaceAll(RegExp(r'\D'), '');
    unformattedText = unformattedText.replaceAll('000', '');
    if (unformattedText.length == 1) {
      unformattedText = "00$unformattedText";
    } else if (unformattedText.length == 2) {
      unformattedText = "0$unformattedText";
    }

    String formattedText = '';
    // Format the text as "### ###,##"
    if (unformattedText.isNotEmpty) {
      int valueLength = unformattedText.length;
      int separatorIndex = valueLength - 2;
      formattedText = '';

      for (int i = 0; i < valueLength; i++) {
        if (i == separatorIndex) {
          formattedText += ',';
        }
        formattedText += unformattedText[i];
      }
    } else {
      formattedText = '0,00'; // Set the default value
    }

    String strLeft = formattedText.split(',')[0];
    String strRight = formattedText.split(',')[1];
    int sep = 0;
    String newLeft = '';
    for (int i = strLeft.length - 1; i >= 0; i--) {
      if (sep == 3) {
        newLeft += ' ';
        sep = 0;
      }
      sep++;
      newLeft += strLeft[i];
    }

    String lstLeft = '';
    for (int i = newLeft.length - 1; i >= 0; i--) {
      lstLeft += newLeft[i];
    }

    formattedText = "$lstLeft,$strRight";

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
