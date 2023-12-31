part of 'widgets.dart';

class AnimatedBounceWidget extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget? child;
  final Duration? duration;

  AnimatedBounceWidget({
    @required this.child,
    @required this.duration,
    @required this.onPressed,
  }) : assert(child != null);

  @override
  AnimatedBounceWidgetState createState() => AnimatedBounceWidgetState();
}

class AnimatedBounceWidgetState extends State<AnimatedBounceWidget>
    with SingleTickerProviderStateMixin {
  late double _scale;

  // This controller is responsible for the animation
  late AnimationController _animate;

  VoidCallback? get onPressed => widget.onPressed;

  Duration? get userDuration => widget.duration;

  @override
  void initState() {
    //defining the controller
    _animate = AnimationController(
        vsync: this,
        duration: const Duration(
            milliseconds: 200), //This is an inital controller duration
        lowerBound: 0.0,
        upperBound: 0.1)
      ..addListener(() {
        setState(() {});
      }); // Can do something in the listener, but not required
    super.initState();
  }

  @override
  void dispose() {
    // To dispose the contorller when not required
    _animate.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _animate.value;
    return GestureDetector(
        onTap: _onTap,
        onTapUp: _tapUp,
        onTapDown: _tapDown,
        onTapCancel: _tapCancel,
        child: Transform.scale(
          scale: _scale,
          child: widget.child,
        ));
  }

  //This is where the animation works out for us
  // Both the animation happens in the same method,
  // but in a duration of time, and our callback is called here as well
  void _onTap() {
    //Firing the animation right away
    _animate.forward();

    //Now reversing the animation after the user defined duration
    Future.delayed(
        userDuration != null ? userDuration! : Duration(milliseconds: 500), () {
      _animate.reverse();
      if (onPressed != null) onPressed!();
    });
  }

  void _tapDown(TapDownDetails details) {
    _animate.forward();
  }

  void _tapUp(TapUpDetails details) {
    _animate.reverse();
  }

  void _tapCancel() {
    _animate.reverse();
  }
}
