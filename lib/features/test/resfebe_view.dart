import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:test_module/features/test/test_model.dart';
import 'package:test_module/features/test/test_view_model.dart';

class ResfebeView extends StatefulWidget {
  const ResfebeView({Key? key, required this.testList, required this.currentIndex, required this.isTextFormsPassive}) : super(key: key);
  final List<TestModel> testList;
  final int currentIndex;
  final bool isTextFormsPassive;

  @override
  State<ResfebeView> createState() => _ResfebeViewState();
}

class _ResfebeViewState extends State<ResfebeView> {
  late List<String> _textFormValues;
  late List<TextEditingController> _controllerList;

  @override
  void initState() {
    super.initState();
    _textFormValues = List.generate(widget.testList[widget.currentIndex].quessAnsw.length, (index) => '');
    _controllerList = List.generate(widget.testList[widget.currentIndex].quessAnsw.length, (index) => TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: ScrollPhysics(),
        shrinkWrap: true,
        itemCount: _controllerList.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              letterTextForm(context, index),
              context.sized.emptySizedWidthBoxLow
            ],
          );
        },
      ),
    );
  }

  SizedBox letterTextForm(BuildContext context, int index) {
    return SizedBox(
      width: 40,
      height: 60,
      child: TextFormField(
        controller: _controllerList[index],
        readOnly: widget.isTextFormsPassive,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            setState(() {
              _textFormValues[index] = value;
            });
            FocusScope.of(context).nextFocus(); // İstediğiniz işlemi yapın
            if (_isAllLettersEntered()) {
              checkAnswer(context);
            }
          }
        },
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
      ),
    );
  }

  bool _isAllLettersEntered() {
    return _textFormValues.every((element) => element.isNotEmpty);
  }

  void checkAnswer(BuildContext context) {
    String typedWord = _textFormValues.join('');

    if (typedWord == widget.testList[widget.currentIndex].quessAnsw) {
      Provider.of<TestViewModel>(context, listen: false).resfebeScoreCounter(true);
    } else {
      Provider.of<TestViewModel>(context, listen: false).resfebeScoreCounter(false);
    }

    // Kontrol tamamlandıktan sonra geçici değerleri sıfırla
    setState(() {
      _textFormValues = List.generate(widget.testList[widget.currentIndex].quessAnsw.length, (index) => '');
    });
  }
}
