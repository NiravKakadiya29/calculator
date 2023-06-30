import '/const/const.dart';

const Color colorDark = Color(0xFF374352);
const Color colorLight = Color(0xFFe6eeff);

class HomePage extends StatelessWidget {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode ? colorDark : colorLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                color: Colors.red,
                child: Text('Result'),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buttonRounded(title: '0'),
                        _buttonRounded(title: ','),
                        _buttonRounded(
                            icon: Icons.backspace_outlined,
                            iconColor:
                                darkMode ? Colors.green : Colors.redAccent),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonRounded(
      {String? title, double padding = 20, IconData? icon, Color? iconColor}) {
    return NeuContainer(
      darkMode: darkMode,
      borderRadius: BorderRadius.circular(40),
      padding: EdgeInsets.all(padding),
      child: Container(
        width: padding * 2,
        height: padding * 2,
        child: Center(
            child: title != null
                ? Text(
                    '$title',
                    style: TextStyle(
                        color: darkMode ? Colors.white : Colors.black,
                        fontSize: 30),
                  )
                : Icon(
                    icon,
                    color: iconColor,
                    size: 30,
                  )),
      ),
    );
  }
}

class NeuContainer extends StatefulWidget {
  final bool darkMode;
  final Widget? child;
  final BorderRadius? borderRadius;
  final EdgeInsetsGeometry? padding;

  NeuContainer({
    this.darkMode = false,
    this.child,
    this.borderRadius,
    this.padding,
  });

  @override
  State<NeuContainer> createState() => _NeuContainerState();
}

class _NeuContainerState extends State<NeuContainer> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = widget.darkMode;
    return Listener(
      onPointerUp: _onPointerUp,
      onPointerDown: _onPointerDown,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
            color: darkMode ? colorDark : colorLight,
            borderRadius: widget.borderRadius,
            boxShadow: _isPressed
                ? null
                : [
                    BoxShadow(
                        color: darkMode
                            ? Colors.black54
                            : Colors.blueGrey.shade200,
                        offset: Offset(4, 4),
                        blurRadius: 15,
                        spreadRadius: 1),
                    BoxShadow(
                        color:
                            darkMode ? Colors.blueGrey.shade700 : Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 15,
                        spreadRadius: 1),
                  ]),
        child: widget.child,
      ),
    );
  }
}
