import 'package:inventory/inventory.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({Key? key, required this.onPressed}) : super(key: key);

  final void Function(bool) onPressed;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() => isButtonPressed = !isButtonPressed);
        widget.onPressed(isButtonPressed);
      },
      splashRadius: 20.0,
      icon: Icon(
        isButtonPressed ? Icons.visibility : Icons.visibility_off,
        color: Colors.purple,
      ),
    );
  }
}
