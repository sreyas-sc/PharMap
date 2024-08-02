import 'package:flutter/material.dart';

class GenericMedicineSearchScreen extends StatelessWidget {
  const GenericMedicineSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueAccent,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Search with the brand name or the generic name of the medicine',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle generic names button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 62, 143, 243),
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/genericmed1.jpg',
                          width: 290,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 0),
                        const Text(
                          'Generic Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle brand names button press
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 62, 143, 243),
                      padding: const EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/genericmed.jpg',
                          width: 290,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 0),
                        const Text(
                          'Brand Name',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(0, 0, 0, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
