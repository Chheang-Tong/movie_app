import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text('Subtitle:'),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  'English, Spanish, Germany, Russian',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text('Audio Track:'),
              ),
              Expanded(
                flex: 6,
                child: Text(
                  'English, Spanish',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Cash and Crew',
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(5, (index) {
                return Row(
                  children: [
                    SizedBox(
                      height: 70,
                      width: 70,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/spider_man.png'),
                      ),
                    ),
                    SizedBox(
                      width: 98,
                      child: ListTile(
                        title: RichText(
                          text: TextSpan(
                              text: "Sam ",
                              style: TextStyle(
                                  fontSize: 12, color: Color(0xFF8591B0)),
                              children: [
                                TextSpan(
                                  text: "Wasington",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ]),
                        ),
                        subtitle: Text('Jake'),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Gallery',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text('See all'),
              ),
            ],
          ),
          Row(
            children: List.generate(
              2,
              (index) => Container(
                margin: EdgeInsets.symmetric(horizontal: 4),
                height: size.height * 0.15,
                width: size.width * 0.43,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
