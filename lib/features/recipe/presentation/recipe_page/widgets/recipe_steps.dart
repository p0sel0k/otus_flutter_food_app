import 'package:flutter/material.dart';
import 'package:hw2/utils/record.dart';

class CookingSteps extends StatelessWidget {
  final List<CustomRecord> steps;

  const CookingSteps({super.key, required this.steps});

  @override
  Widget build(BuildContext context) {
    const color = Color.fromRGBO(22, 89, 50, 1);
    return Padding(
      padding: const EdgeInsets.only(left: 17.0, top: 18, right: 17.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Шаги приготовления',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ...showSteps(steps),
          Center(
            child: InkWell(
              onTap: () {},
              child: Container(
                width: 232,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: color,
                ),
                child: const Center(
                  child: Text('Начать готовить',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Step extends StatefulWidget {
  final int stepNumber;
  final CustomRecord description;
  const _Step({Key? key, required this.description, required this.stepNumber})
      : super(key: key);

  @override
  _StepState createState() => _StepState();
}

class _StepState extends State<_Step> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool isChecked = false;
  double scale = 1.0;

  @override
  initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      value: 1.0,
      lowerBound: 1.0,
      upperBound: 1.25,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTapDown: (_) {
        isChecked = !isChecked;
        isChecked ? scale = 0.95 : scale = 1.0;
        controller.forward().then((value) => controller.reverse());
        setState(() {});
      },
      child: AnimatedContainer(
        height: 120 * scale,
        padding: const EdgeInsets.only(left: 24, right: 22),
        margin: const EdgeInsets.only(bottom: 14),
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: !isChecked
              ? const Color.fromRGBO(236, 236, 236, 1)
              : const Color.fromRGBO(46, 204, 113, 0.15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.stepNumber.toString(),
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: !isChecked
                    ? Colors.grey
                    : const Color.fromRGBO(46, 204, 113, 1),
              ),
            ),
            const SizedBox(width: 29),
            Expanded(
              child: Text(
                widget.description.first,
                overflow: TextOverflow.ellipsis,
                maxLines: 6,
                style: TextStyle(
                  fontSize: 12,
                  color: !isChecked
                      ? Colors.grey
                      : const Color.fromRGBO(22, 89, 50, 1),
                ),
              ),
            ),
            const SizedBox(width: 24),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTransition(
                  scale: controller,
                  child: Checkbox(
                    value: isChecked,
                    onChanged: (_) {},
                    activeColor: const Color.fromRGBO(22, 89, 50, 1),
                  ),
                ),
                Text(
                  widget.description.second,
                  style: TextStyle(
                    fontSize: 12,
                    color: !isChecked
                        ? Colors.grey
                        : const Color.fromRGBO(22, 89, 50, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> showSteps(List<CustomRecord> steps) {
  int index = 0;
  return steps.map((e) {
    index++;
    return _Step(
      description: e,
      stepNumber: index,
      key: Key(index.toString()),
    );
  }).toList();
}

// class _TransitionCheckBox extends StatefulWidget {
//   final bool isChecked;
//   const _TransitionCheckBox({required this.isChecked});

//   @override
//   State<_TransitionCheckBox> createState() => _TransitionCheckBoxState();
// }

// class _TransitionCheckBoxState extends State<_TransitionCheckBox>
//     with TickerProviderStateMixin {
//   late AnimationController controller;
//   late Animation<double> animation;

//   @override
//   initState() {
//     super.initState();
//     // animation = Tween<double>(begin: 1.0, end: 1.2).animate(controller);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }

// Animation<double> _animationController(TickerProviderStateMixin tmp) {
  // animationController.repeat();
  // return CurvedAnimation(
  //   parent: animationController,
  //   curve: Curves.easeInOut,
  // )..addStatusListener((status) => status == AnimationStatus.completed
  //     ? animationController.reverse()
  //     : animationController.forward());
  // return Tween<double>(begin: 1.0, end: 1.2).animate(animationController);
// }
