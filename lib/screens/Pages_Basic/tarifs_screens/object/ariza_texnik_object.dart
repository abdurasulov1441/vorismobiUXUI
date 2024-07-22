import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/mini_red_app_bar.dart';
import 'package:flutter_svg/svg.dart';

class ArizaTexnikObyekt extends StatelessWidget {
  const ArizaTexnikObyekt({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      child: const Column(
        children: [
          MiniRedAppBar(),
          MiniRedTitle(title: 'Arizani Rasmiylashtirish'),
          Expanded(child: aaaadawdsASdawd())
        ],
      ),
    ));
  }
}

class aaaadawdsASdawd extends StatelessWidget {
  const aaaadawdsASdawd({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiStepForm();
  }
}

class MultiStepForm extends StatefulWidget {
  @override
  _MultiStepFormState createState() => _MultiStepFormState();
}

class _MultiStepFormState extends State<MultiStepForm> {
  final PageController _pageController = PageController();
  int _currentStep = 0;

  void _nextStep() {
    if (_currentStep < 3) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        _currentStep++;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        _currentStep--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _buildStepPage1(),
                _buildStepPage2(),
                _buildStepPage3(),
                _buildStepPage4(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _currentStep > 0 ? _previousStep : null,
                child: Text('Oldingisi'),
              ),
              ElevatedButton(
                onPressed: _currentStep < 3 ? _nextStep : null,
                child: Text('Keyingisi'),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget _buildStepPage1() {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(
              'assets/images/step1.svg',
              width: 50,
              height: 50,
            )),
      ],
    );
  }

  Widget _buildStepPage2() {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(
              'assets/images/step2.svg',
              width: 50,
              height: 50,
            )),
      ],
    );
  }

  Widget _buildStepPage3() {
    return Column(
      children: [
        Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: SvgPicture.asset(
              'assets/images/step3.svg',
              width: 50,
              height: 50,
            )),
      ],
    );
  }

  Widget _buildStepPage4() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'test',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class InnerPage extends StatelessWidget {
  final String stepTitle;

  InnerPage(this.stepTitle);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$stepTitle - Внутренняя страница'),
      ),
      body: Center(
        child: Text(
          'Это внутренняя страница для $stepTitle',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
