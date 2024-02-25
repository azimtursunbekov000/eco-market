import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // импорт для доступа к ресурсам приложения

class CommonElevatedBtn extends StatelessWidget {
  CommonElevatedBtn({
    Key? key,
    required this.onPressed,
    required this.imagePath, // измененный параметр
    required this.text, 
  }) : super(key: key);

  final VoidCallback onPressed;
  final String imagePath; // измененный параметр
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xffF8F8F8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            minimumSize: Size(
              343,
              54,
            ),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 24,
              ),
              SizedBox(width: 8),
              Text(
                text,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
