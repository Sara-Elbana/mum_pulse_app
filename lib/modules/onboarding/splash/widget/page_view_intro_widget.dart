import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mom_pulse_app/core/routes/app_routes_name.dart';
import 'package:mom_pulse_app/core/them/app_colors.dart';
import 'package:mom_pulse_app/modules/onboarding/splash/widget/data_intro.dart';


class PageViewIntroWidget extends StatefulWidget {
  final Function(int) onPageChanged;
  const PageViewIntroWidget({super.key, required this.onPageChanged});

  @override
  State<PageViewIntroWidget> createState() => _PageViewIntroWidgetState();
}

class _PageViewIntroWidgetState extends State<PageViewIntroWidget> with TickerProviderStateMixin {
  final PageController _pageController = PageController();
  late TabController _tabController;
  int currentIndex = 0;
  
  void _changePage(int index){
    _pageController.animateToPage(
        index, 
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOut);
    setState(() {
      currentIndex = index;
    });
  }
  
  void nextPage(){
    if(currentIndex < DataIntro.getDataList(context).length-1){
      _pageController.nextPage( 
          duration: const Duration(milliseconds: 280),
          curve: Curves.easeInOut);
    }else{
      Navigator.pushNamed(context, AppRoutesName.loginScreen);
    }
  }

  void previousPage() {
    if (currentIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOut,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: (index){
                setState(() {
                  currentIndex = index;
                });
                },
                itemCount: DataIntro.getDataList(context).length,
                itemBuilder: (context, index){
                  final data = DataIntro.getDataList(context)[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          data.image,
                          height: 350,
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          data.text,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            currentIndex > 0
                            ?IconButton(
                                onPressed: previousPage,
                                icon: const Icon(Icons.arrow_back_ios,color: AppColors.black,),
                            ):const SizedBox(width: 48),
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                DataIntro.getDataList(context).length,
                                    (index) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 280),
                                  margin: const EdgeInsets.symmetric(horizontal: 4),
                                  width: currentIndex == index ? 20.0 : 10.0,
                                  height: 10,
                                  decoration: BoxDecoration(
                                    color: currentIndex == index
                                        ? AppColors.black
                                        : Colors.grey.shade400,
                                    borderRadius: BorderRadius.circular(5.0),
                                    //shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                                onPressed: nextPage,
                                icon: const Icon(Icons.arrow_forward_ios,color: AppColors.black,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
            ),
        ),
      ],
    );
  }
}

