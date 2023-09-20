//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:openapi/src/date_serializer.dart';
import 'package:openapi/src/model/date.dart';

import 'package:openapi/src/model/add_operation_request.dart';
import 'package:openapi/src/model/check_spot_by_beacon_request.dart';
import 'package:openapi/src/model/check_visitor_image200_response.dart';
import 'package:openapi/src/model/check_visitor_image_request.dart';
import 'package:openapi/src/model/contact.dart';
import 'package:openapi/src/model/controll_traffic_request.dart';
import 'package:openapi/src/model/create_event.dart';
import 'package:openapi/src/model/create_event_request.dart';
import 'package:openapi/src/model/drop_palette_request.dart';
import 'package:openapi/src/model/event.dart';
import 'package:openapi/src/model/get_current_image200_response.dart';
import 'package:openapi/src/model/i_beacon.dart';
import 'package:openapi/src/model/initialize_visitor200_response.dart';
import 'package:openapi/src/model/join_event200_response.dart';
import 'package:openapi/src/model/join_event_request.dart';
import 'package:openapi/src/model/register_default_image_request.dart';
import 'package:openapi/src/model/register_request.dart';
import 'package:openapi/src/model/register_spot_request.dart';
import 'package:openapi/src/model/register_visitor.dart';
import 'package:openapi/src/model/send_email_request.dart';
import 'package:openapi/src/model/spot.dart';
import 'package:openapi/src/model/traffic_status.dart';
import 'package:openapi/src/model/update_event.dart';
import 'package:openapi/src/model/update_spot_request.dart';
import 'package:openapi/src/model/visitor.dart';
import 'package:openapi/src/model/visitor_identification.dart';

part 'serializers.g.dart';

@SerializersFor([
  AddOperationRequest,
  CheckSpotByBeaconRequest,
  CheckVisitorImage200Response,
  CheckVisitorImageRequest,
  Contact,
  ControllTrafficRequest,
  CreateEvent,
  CreateEventRequest,
  DropPaletteRequest,
  Event,
  GetCurrentImage200Response,
  IBeacon,
  InitializeVisitor200Response,
  JoinEvent200Response,
  JoinEventRequest,
  RegisterDefaultImageRequest,
  RegisterRequest,
  RegisterSpotRequest,
  RegisterVisitor,
  SendEmailRequest,
  Spot,
  TrafficStatus,
  UpdateEvent,
  UpdateSpotRequest,
  Visitor,
  VisitorIdentification,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Event)]),
        () => ListBuilder<Event>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(TrafficStatus)]),
        () => ListBuilder<TrafficStatus>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(String)]),
        () => ListBuilder<String>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(Spot)]),
        () => ListBuilder<Spot>(),
      )
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
