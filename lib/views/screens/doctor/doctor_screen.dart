import 'package:calmnest/helper/navigate.dart';
import 'package:calmnest/utils/custom/app_custom_widgets.dart';
import 'package:calmnest/views/screens/doctor/doctor_details_screen.dart';
import 'package:flutter/material.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Text(
          'Therapist',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF212121),
            fontSize: 36,
            fontFamily: 'Georgia',
            fontWeight: FontWeight.w700,
            height: 0,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
            width: 342,
            height: 40,
            decoration: ShapeDecoration(
              color: const Color(0x3000B761),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          width: 93,
          height: 22,
          decoration: ShapeDecoration(
            color: const Color(0xFF00B761),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3)),
          ),
          child: const Center(
            child: Text(
              'Recomended',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Arial',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
          ),
        ),
    
     DcotorWidget()
      ]),
    );
  }
}

class DcotorWidget extends StatelessWidget {
  const DcotorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        width: 342,
        height: 142,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 10,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              left: 150,
              top: -12,
              child: Container(
                width: 281,
                height: 191,
                decoration: const ShapeDecoration(
                  color: Color(0xFF00924D),
                  shape: OvalBorder(),
                ),
              ),
            ),
            const Positioned(
              left: 4,
              top: 13,
              child: SizedBox(
                width: 176,
                height: 17,
                child: Text(
                  'Shanelle De Almeida',
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontSize: 14,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.w700,
                    height: 0,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 34,
              child: SizedBox(
                width: 116,
                height: 9,
                child: Text(
                  'PHD In Psychology  ',
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.6000000238418579),
                    fontSize: 8,
                    fontFamily: 'Arial',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 22,
              top: 75,
              child: Text(
                'Available For Appointments',
                style: TextStyle(
                  color: Color(0xFF212121),
                  fontSize: 7,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 76,
              child: Container(
                width: 6,
                height: 6,
                decoration: const ShapeDecoration(
                  color: Color(0xFF00B761),
                  shape: OvalBorder(),
                ),
              ),
            ),
            const Positioned(
              left: 33,
              top: 103,
              child: Text(
                'Book Appointments',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 7,
                  fontFamily: 'Arial',
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 50,
              child: Container(
                width: 76,
                height: 13,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 13,
                        height: 13,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFFFC600),
                          shape: StarBorder(
                            points: 5,
                            innerRadiusRatio: 0.38,
                            pointRounding: 0,
                            valleyRounding: 0,
                            rotation: 0,
                            squash: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 16,
                      top: 0,
                      child: Container(
                        width: 13,
                        height: 13,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFFFC600),
                          shape: StarBorder(
                            points: 5,
                            innerRadiusRatio: 0.38,
                            pointRounding: 0,
                            valleyRounding: 0,
                            rotation: 0,
                            squash: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 32,
                      top: 0,
                      child: Container(
                        width: 12,
                        height: 13,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFFFC600),
                          shape: StarBorder(
                            points: 5,
                            innerRadiusRatio: 0.38,
                            pointRounding: 0,
                            valleyRounding: 0,
                            rotation: 0,
                            squash: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 48,
                      top: 0,
                      child: Container(
                        width: 12,
                        height: 13,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFFFC600),
                          shape: StarBorder(
                            points: 5,
                            innerRadiusRatio: 0.38,
                            pointRounding: 0,
                            valleyRounding: 0,
                            rotation: 0,
                            squash: 0,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 63,
                      top: 0,
                      child: Container(
                        width: 13,
                        height: 13,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFD9D9D9),
                          shape: StarBorder(
                            points: 5,
                            innerRadiusRatio: 0.38,
                            pointRounding: 0,
                            valleyRounding: 0,
                            rotation: 0,
                            squash: 0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 9,
              top: 96,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  color: const Color(0xFF00B761),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Book Appointments',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                        fontFamily: 'Georgia',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
