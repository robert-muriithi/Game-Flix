import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/routes/routes.dart';
import '../../../../config/theme/colors.dart';
import '../../../../injector.dart';
import '../../domain/model/onboarding_content.dart';
import '../blocs/on_boarding_screens_bloc.dart';

class OnBoardingScreensContainer extends StatefulWidget {
  OnBoardingScreensContainer({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreensContainer> createState() =>
      _OnBoardingScreensContainerState();
}

class _OnBoardingScreensContainerState
    extends State<OnBoardingScreensContainer> {
  PageController? pageController;
  int currentIndex = 0;
  BuildContext? blocContext;

  @override
  initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  dispose() {
    pageController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        controller: pageController,
        itemCount: onBoardingContent.length,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.darkGrey,
                  AppColors.dark,
                  AppColors.dark,
                ],
              ),
            ),
            child: _buildOnBoardingContent(index),
          );
        },
      ),
    );
  }

  Widget buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.only(top: 5),
      height: currentIndex == index ? 20 : 10,
      width: 10,
      decoration: BoxDecoration(
        color: currentIndex == index ? AppColors.orange : AppColors.darkGrey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  BlocProvider<OnBoardingScreensBloc> _buildNavigationButon(
      BuildContext context) {
    return BlocProvider(
      create: (_) => sl<OnBoardingScreensBloc>(),
      child: BlocBuilder<OnBoardingScreensBloc, OnBoardingScreensState>(
          builder: (context, state) {
        blocContext = context;
        if (state is OnBoardingScreensErrorState) {
          return const Center(
            child: Text('An error occurred'),
          );
        } else {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.orange,
                foregroundColor: AppColors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: () {
                if (currentIndex == onBoardingContent.length - 1) {
                  dispatchCompleteOnBoardingEvent(context);
                  //Navigator.pushNamed(context, '/login');
                } else {
                  pageController?.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                }
              },
              child: Text(
                currentIndex == onBoardingContent.length - 1
                    ? 'Get Started'
                    : 'Next',
              ),
            ),
          );
        }
      }),
    );
  }

  void dispatchCompleteOnBoardingEvent(BuildContext context) {
    BlocProvider.of<OnBoardingScreensBloc>(context)
        .add(const CompleteOnBoardingEvent(true));
    Navigator.pushReplacementNamed(context, Routes.homeContainer);
  }

  Widget _buildOnBoardingContent(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.45,
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              onBoardingContent[index].image,
              fit: BoxFit.contain,
              scale: 1.0,
              height: double.maxFinite,
              width: double.maxFinite,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width * 0.85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      onBoardingContent[index].title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.orange,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: Text(
                        onBoardingContent[index].description,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                        textAlign: TextAlign.justify,
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                height: 60,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(onBoardingContent.length,
                      (index) => buildDot(index: index)),
                ),
              ),
            ],
          ),
          Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: 50,
              width: double.maxFinite,
              child: _buildNavigationButon(context))
        ],
      ),
    );
  }
}
