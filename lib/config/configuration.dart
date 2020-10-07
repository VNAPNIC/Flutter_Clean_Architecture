library configuration;

import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_architecture/data/user/source/local/sessions_pref.dart';
import 'package:flutter_architecture/di/injection/injection.dart';
import 'package:flutter_architecture/presentation/home/home_route.dart';
import 'package:flutter_architecture/presentation/login/login_route.dart';
import 'package:flutter_architecture/utility/logging.dart';
import 'package:flutter_architecture/utility/style/style.dart';
import 'package:flutter_architecture/utility/utils/string_utils.dart';
import 'package:logging/logging.dart';

part 'src/env.dart';
part 'src/http_overrides.dart';
part 'src/route/manifest.dart';
part 'src/build_config.dart';
part 'src/di_module.dart';
part 'src/route/route_define.dart';
part 'src/interceptor/auth_interceptor.dart';
part 'src/interceptor/token_interceptor.dart';