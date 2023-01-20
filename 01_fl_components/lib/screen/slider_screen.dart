import 'package:fl_components/util/app_color.dart';
import 'package:flutter/material.dart';
class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);
  static const routeName = 'slider';

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slider'),
      ),
      body: Column(
      
        children:[
          Slider(
            min: 50,
            max: 400,
            value: _sliderValue, 
            onChanged: _sliderEnabled
                  ? (value) {
                      _sliderValue = value;
                      setState(() {});
                    }
                  : null
          ),
          Checkbox(value: _sliderEnabled, onChanged: (value) {
            _sliderEnabled = value ?? true;
            setState(() {});
          }),
          Switch(value: _sliderEnabled, onChanged: (value) {
            _sliderEnabled = value;
            setState(() {});
          }),
          CheckboxListTile(
            activeColor: AppColor.shared.primary,
            title: const Text('Habilitar Slider'),  
            value: _sliderEnabled,
            onChanged: (value) {
              _sliderEnabled = value ?? true;
              setState(() {});
            }
          ),
          SwitchListTile(
            activeColor: AppColor.shared.primary,
            title: const Text('Habilitar Slider'),  
            value: _sliderEnabled,
            onChanged: (value) {
              _sliderEnabled = value ;
              setState(() {});
            }
          ),
          const AboutListTile(),
          Expanded(
            child: SingleChildScrollView(
              child: Image(
                image: const NetworkImage("https://i.pinimg.com/474x/31/e8/8e/31e88ed62291512dfb40240ce103f33b.jpg"),
                fit: BoxFit.contain,
                width: _sliderValue,
              ),
            ),
          ),
          const SizedBox(height: 50)
        ]
      )
    );
  }
}