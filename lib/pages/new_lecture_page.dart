import 'package:flutter/material.dart';
import '../components/custom_textfield.dart';
import '../components/gradient_button.dart'; // Import the GradientButton

class NewLecturePage extends StatelessWidget {
  const NewLecturePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus(); // Dismiss the keyboard
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('New Lecture'),
          backgroundColor: Colors.deepPurple.shade400,
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple.shade200, Colors.deepPurple.shade400],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GradientButton(
                text: 'Upload a Video',
                onPressed: () {
                  // Handle video upload
                },
                gradientColors: [
                  Colors.deepPurple.shade600,
                  Colors.deepPurple.shade800
                ],
              ),
              const SizedBox(height: 100.0),
              const CustomTextField(
                hintText: 'Title',
                icon: Icons.title,
              ),
              const SizedBox(height: 32.0),
              const CustomTextField(
                hintText: 'Description',
                icon: Icons.description,
                textLines: 2, // Adjusting text lines for description
              ),
              const SizedBox(height: 64.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64.0),
                child: GradientButton(
                  text: 'Save Lecture',
                  onPressed: () {
                    // Handle form submission
                  },
                  gradientColors: [
                    Colors.green.shade400,
                    Colors.green.shade700
                  ], // A different gradient color
                ),
              ),
              const SizedBox(height: 128.0),
            ],
          ),
        ),
      ),
    );
  }
}
