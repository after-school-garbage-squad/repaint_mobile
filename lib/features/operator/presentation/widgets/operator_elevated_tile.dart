import 'package:flutter/material.dart';

class OperatorElevatedTile extends StatelessWidget {
  const OperatorElevatedTile({
    super.key,
    this.children,
    this.width,
    this.height,
    this.padding = const EdgeInsets.all(8.0),
    this.direction = Axis.horizontal,
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.automaticallyImplyTail = true,
    this.onTap,
  });

  final List<Widget>? children;
  final double? width;
  final double? height;
  final EdgeInsets padding;
  final Axis direction;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final bool automaticallyImplyTail;
  final VoidCallback? onTap;

  factory OperatorElevatedTile.action({
    required VoidCallback onTap,
    required String title,
    required IconData icon,
  }) {
    return OperatorElevatedTile(
      height: 96,
      onTap: onTap,
      children: [
        Icon(icon, size: 60),
        Text(title),
      ],
    );
  }

  factory OperatorElevatedTile.beacon({
    required VoidCallback onTap,
    required String title,
    required double distance,
    required int hwid,
  }) {
    return _OperatorElevatedBeaconTile(
      title: title,
      distance: distance,
      hwid: hwid,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      color: Colors.white,
      elevation: 4.0,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          width: width,
          height: height,
          padding: padding,
          child: Flex(
            direction: direction,
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: [
              ...?children,
              if (automaticallyImplyTail)
                Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.primary,
                )
            ],
          ),
        ),
      ),
    );
  }
}

class _OperatorElevatedBeaconTile extends OperatorElevatedTile {
  const _OperatorElevatedBeaconTile({
    required this.title,
    required this.distance,
    required this.hwid,
    super.onTap,
  });

  final String title;
  final double distance;
  final int hwid;

  @override
  Widget build(BuildContext context) {
    final formattedHwid = hwid.toRadixString(16).padLeft(10, "0").toUpperCase();
    const valueTextStyle = TextStyle(color: Color(0xff9e9e9e));

    return OperatorElevatedTile(
      onTap: onTap,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: Theme.of(context).textTheme.titleMedium),
              const Divider(),
              // TODO: 表示する項目を変更する必要がある
              Row(
                children: [
                  const Text("距離"),
                  const Spacer(),
                  Text("${distance}m", style: valueTextStyle),
                ],
              ),
              Row(
                children: [
                  const Text("HWID"),
                  const Spacer(),
                  Text(formattedHwid, style: valueTextStyle),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
