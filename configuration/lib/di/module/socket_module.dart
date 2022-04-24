import 'package:configuration/di/di.dart';
import 'package:configuration/environment/build_config.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart';

@module
abstract class SocketModule {
  @singleton
  Socket get socketIO {
    return io(getIt<BuildConfig>().hostSocketIO,
        OptionBuilder().setTransports(['websocket']).build());
  }
}
