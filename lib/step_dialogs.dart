// lib/step_dialogs.dart
import 'package:flutter/material.dart';

class StepDialogs {
  static Future<void> showStepDialogs(BuildContext context) async {
    await _showDialog(context, 1);
  }

  static Future<void> _showDialog(BuildContext context, int step) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Step $step'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (step < 3) {
                      _showDialog(context, step + 1);
                    }
                  },
                  child: Text(step < 3 ? 'Next' : 'Finish'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
