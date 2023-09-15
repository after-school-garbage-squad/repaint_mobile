import 'package:logger/logger.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'util_providers.g.dart';

@Riverpod(keepAlive: true)
Logger logger(LoggerRef ref) => Logger(printer: SimplePrinter());

@Riverpod(keepAlive: true)
Future<PackageInfo> packageInfo(PackageInfoRef ref) =>
    PackageInfo.fromPlatform();
