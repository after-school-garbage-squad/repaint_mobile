import 'package:flutter/material.dart';
import 'package:repaint_mobile/features/common/domain/entities/beacon_entity.dart';

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
    required String name,
    required BeaconProximity proximity,
    required String hwid,
  }) {
    return _OperatorElevatedBeaconTile(
      name: name,
      proximity: proximity,
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
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OperatorElevatedBeaconTile extends OperatorElevatedTile {
  const _OperatorElevatedBeaconTile({
    required this.name,
    required this.proximity,
    required this.hwid,
    super.onTap,
  });

  final String name;
  final BeaconProximity proximity;
  final String hwid;

  @override
  Widget build(BuildContext context) {
    final valueTextStyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: const Color(0xff9e9e9e));

    return OperatorElevatedTile(
      onTap: onTap,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: Theme.of(context).textTheme.bodyLarge),
              const Divider(),
              Row(
                children: [
                  const Text("近接性"),
                  const Spacer(),
                  Text(proximity.name, style: valueTextStyle),
                ],
              ),
              Row(
                children: [
                  const Text("HWID"),
                  const Spacer(),
                  Text(hwid, style: valueTextStyle),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
