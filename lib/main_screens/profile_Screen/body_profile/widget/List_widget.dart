
import 'package:flutter/material.dart';
class List_view extends StatelessWidget {
  const List_view({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.dark,
    required this.subtitle, this.ontap,
  });

  final Icon leadingIcon;
  final String title;
  final bool dark;
  final String subtitle;
  final ontap;


  @override
  Widget build(BuildContext context) {
    return Card(
      color: dark?Colors.grey:Colors.blueAccent.withOpacity(0.5),
      child: ListTile(
        leading: leadingIcon,
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: dark ? Colors.white : Colors.black,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: dark ? Colors.white70 : Colors.black54,
          ),
        ),
        trailing:GestureDetector(
            onTap: (){},
            child: Icon(Icons.arrow_forward_ios)),
      ),
    );
  }
}