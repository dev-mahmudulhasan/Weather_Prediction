import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'bloc/weather_bloc.dart';
import 'bloc/weather_event.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (context) => WeatherBloc(), // Providing the WeatherBloc
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: WeatherScreen(), // WeatherScreen can now access WeatherBloc
          ),
        );
      },
    );
  }
}
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
       context.read<WeatherBloc>().add(const FetchWeather(lat: 23.7475031, lon:90.3061629));
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF97ABFF),
                Color(0xFF123597),
              ],
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 2.h), // 2% of screen height
                Text(
                  'Dhaka',
                  style: GoogleFonts.inter(
                    color: Colors.white,
                    fontSize: 30.sp, // 5% of screen height
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 1.0.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // SvgPicture.asset(
                    //   'assets/images/location.svg',
                    //   height: 2.5.h,
                    //   width: 2.5.h,
                    //   // color: Colors.white70,
                    // ),
                    SizedBox(width: 0.5.w),
                    Text(
                      'Current Location',
                      style: GoogleFonts.inter(
                        color: Colors.white70,
                        fontSize: 2.h, // 2% of screen height
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),

                // Weather icon and temperature
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/1.png',
                      height: 15.5.h,
                      width: 15.5.h,
                    ),
                    SizedBox(width: 3.5.w),
                    Text(
                      '13°',
                      style: GoogleFonts.rubik(
                        color: Colors.white,
                        fontSize: 13.5.h,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Partly Cloud  -  H:17o  L:4o',
                  style: GoogleFonts.rubik(
                    color: Colors.white,
                    fontSize: 14.5.sp,
                  ),
                ),
                SizedBox(height: 2.h),

                // Buttons for Today and Next Days
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Today Button
                    Container(
                      height: 5.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF8FADEB),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Handle 'Today' button press
                        },
                        child: Text(
                          'Today',
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 3.w), // Space between buttons
                    // Next Days Button
                    Container(
                      height: 5.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFF3d57ab),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Handle 'Next Days' button press
                        },
                        child: Text(
                          'Next Days',
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3.h),

                // Weather forecast cards
                SizedBox(
                  height: 18.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      weatherCard(
                        'Now',
                        'assets/images/1.png',
                        '13°',
                      ),
                      weatherCard('4PM', 'assets/images/2.png', '14°'),
                      weatherCard('5PM', 'assets/images/3.png', '12°'),
                      weatherCard('6PM', 'assets/images/4.png', '8°'),
                      weatherCard('7PM', 'assets/images/5.png', '9°'),
                    ],
                  ),
                ),

                Expanded(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/6.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10.h,
                        left: 5.w,
                        right: 5.w,
                        child: Column(
                          children: [
                            Container(
                              padding: EdgeInsets.all(2.h),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF97ABFF),
                                    Color(0xFF123597)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'assets/images/7.png',
                                    height: 7.h,
                                    width: 7.h,
                                    fit: BoxFit.cover,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Sunset',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      Text(
                                        '5:51 PM',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Sunrise',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      Text(
                                        '7:00 AM',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // Second card (UV Index)
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 1.h),
                              padding: EdgeInsets.all(2.h),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(20), // Same roundness
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF97ABFF),
                                    Color(0xFF123597)
                                  ], // Same gradient
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/8.png',
                                    height: 7.h,
                                    width: 7.h,
                                    fit: BoxFit.cover,
                                  ),
                                  SizedBox(
                                    width: 20.0.w,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'UV Index',
                                        style: TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      Text(
                                        '1 Low',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 68.h, left: 5.w, right: 5.w, child: const StackedImages())
      ]),
    );
  }

  Widget weatherCard(
    String time,
    String iconPath,
    String temp,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      padding: EdgeInsets.symmetric(vertical: 2.h),
      width: 18.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
          colors: [Color(0xFF97ABFF), Color(0xFF123597)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 10.sp,
            ),
          ),
          SizedBox(height: 1.h),
          Image.asset(
            iconPath,
            height: 4.h,
          ),
          SizedBox(height: 1.h),
          Text(
            temp,
            style: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 12.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class StackedImages extends StatelessWidget {
  const StackedImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/9.png',
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: 0,
          child: Image.asset(
            'assets/images/10.png',
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
