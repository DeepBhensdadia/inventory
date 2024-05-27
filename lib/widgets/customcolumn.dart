import 'package:inventory/inventory.dart';

class CustomColumnRow extends StatelessWidget {
  final String name;
  final String sname;
  final String tag;
  final String tag2;

  const CustomColumnRow(
      {Key? key,
      required this.name,
      required this.sname,
      required this.tag,
      required this.tag2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomColumn(name: tag, sname: name),
        CustomColumn(name: tag2, sname: sname),
      ],
    );
  }
}

class CustomColumn extends StatelessWidget {
  final String name;
  final String sname;

  const CustomColumn({Key? key, required this.name, required this.sname})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 8, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(color: Colors.purple),
            ),
            Text(
              sname,
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}

class customrownew extends StatelessWidget {
 final String name;

final  String value;

  const customrownew({super.key, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
           name,
            style: const TextStyle(
                color: Colors.purple,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
           value,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
