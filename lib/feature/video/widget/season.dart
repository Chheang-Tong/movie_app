import 'package:flutter/material.dart';

import '../../../core/core.dart';

class Season extends StatelessWidget {
  const Season({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(children: [
        SizedBox(height: 10),
        ...List.generate(
          2,
          (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 8),
                    width: size.width * 0.45,
                    height: size.height * 0.15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Avatar: The War of Water',
                          style: semiBoldDefault,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Avatar: The War of Water',
                          style: semiBoldDefault,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 15),
                        Text(
                          '1 mn  15 sec',
                          style: semiBoldSmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        TextButton(onPressed: () {}, child: Text('See More'))
      ]),
    );
  }
}
