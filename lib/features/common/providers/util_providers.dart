import 'package:logger/logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'util_providers.g.dart';

@Riverpod(keepAlive: true)
Logger logger(LoggerRef ref) => Logger(printer: SimplePrinter());
