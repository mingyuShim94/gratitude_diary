import 'package:flutter/material.dart';

class EnergyStatusSection extends StatelessWidget {
  const EnergyStatusSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      color: Colors.orange,
      child: const Row(
        children: [
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),
                Icon(
                  Icons.favorite,
                  size: 300,
                  color: Colors.pink,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
