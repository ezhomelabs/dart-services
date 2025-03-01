// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:convert';

import 'package:protobuf/protobuf.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'common_server_impl.dart' show BadRequest, CommonServerImpl;
import 'protos/dart_services.pb.dart' as proto;

export 'common_server_impl.dart' show ServerContainer, log;

part 'common_server_api.g.dart'; // generated with 'pub run build_runner build'

const protobufContentType = 'application/x-protobuf';
const jsonContentType = 'application/json; charset=utf-8';
const protoApiUrlPrefix = '/api/dartservices/<apiVersion>';

class CommonServerApi {
  final CommonServerImpl _impl;

  CommonServerApi(this._impl);

  @Route.post('$protoApiUrlPrefix/analyze')
  Future<Response> analyze(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.SourceRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.SourceRequest.fromBuffer,
          transform: _impl.analyze);

  @Route.post('$protoApiUrlPrefix/compile')
  Future<Response> compile(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.CompileRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.CompileRequest.fromBuffer,
          transform: _impl.compile);

  @Route.post('$protoApiUrlPrefix/compileDDC')
  Future<Response> compileDDC(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.CompileDDCRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.CompileDDCRequest.fromBuffer,
          transform: _impl.compileDDC);

  @Route.post('$protoApiUrlPrefix/complete')
  Future<Response> complete(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.SourceRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.SourceRequest.fromBuffer,
          transform: _impl.complete);

  @Route.post('$protoApiUrlPrefix/fixes')
  Future<Response> fixes(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.SourceRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.SourceRequest.fromBuffer,
          transform: _impl.fixes);

  @Route.post('$protoApiUrlPrefix/assists')
  Future<Response> assists(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.SourceRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.SourceRequest.fromBuffer,
          transform: _impl.assists);

  @Route.post('$protoApiUrlPrefix/format')
  Future<Response> format(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.SourceRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.SourceRequest.fromBuffer,
          transform: _impl.format);

  @Route.post('$protoApiUrlPrefix/document')
  Future<Response> document(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.SourceRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.SourceRequest.fromBuffer,
          transform: _impl.document);

  @Route.post('$protoApiUrlPrefix/version')
  Future<Response> versionPost(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.VersionRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.VersionRequest.fromBuffer,
          transform: _impl.version);

  @Route.get('$protoApiUrlPrefix/version')
  Future<Response> versionGet(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.VersionRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.VersionRequest.fromBuffer,
          transform: _impl.version);

  // Beginning of multi file map end points:
  @Route.post('$protoApiUrlPrefix/analyzeFiles')
  Future<Response> analyzeFiles(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.SourceFilesRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.SourceFilesRequest.fromBuffer,
          transform: _impl.analyzeFiles);

  @Route.post('$protoApiUrlPrefix/compileFiles')
  Future<Response> compileFiles(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.CompileFilesRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.CompileFilesRequest.fromBuffer,
          transform: _impl.compileFiles);

  @Route.post('$protoApiUrlPrefix/compileFilesDDC')
  Future<Response> compileFilesDDC(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.CompileFilesDDCRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.CompileFilesDDCRequest.fromBuffer,
          transform: _impl.compileFilesDDC);

  @Route.post('$protoApiUrlPrefix/completeFiles')
  Future<Response> completeFiles(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.SourceFilesRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.SourceFilesRequest.fromBuffer,
          transform: _impl.completeFiles);

  @Route.post('$protoApiUrlPrefix/fixesFiles')
  Future<Response> fixesFiles(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.SourceFilesRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.SourceFilesRequest.fromBuffer,
          transform: _impl.fixesFiles);

  @Route.post('$protoApiUrlPrefix/assistsFiles')
  Future<Response> assistsFiles(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.SourceFilesRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.SourceFilesRequest.fromBuffer,
          transform: _impl.assistsFiles);

  @Route.post('$protoApiUrlPrefix/documentFiles')
  Future<Response> documentFiles(Request request, String apiVersion) =>
      _processRequest(request,
          decodeFromJSON: (json) =>
              proto.SourceFilesRequest.create()..mergeFromProto3Json(json),
          decodeFromProto: proto.SourceFilesRequest.fromBuffer,
          transform: _impl.documentFiles);
  // End of Multi file files={} file map end points.

  /// The (lazily-constructed) router.
  late final Router router = _$CommonServerApiRouter(this);

  // We are serving requests that are arriving in both Protobuf binary encoding,
  // and Protobuf JSON encoding. To handle this we need the ability to decode
  // the requests and encode the responses. We also need to know how to do the
  // work the request is requesting.

  Future<Response> _processRequest<I, O extends GeneratedMessage>(
    Request request, {
    required I Function(List<int> bytes) decodeFromProto,
    required I Function(Object json) decodeFromJSON,
    required Future<O> Function(I input) transform,
  }) async {
    if (request.mimeType == protobufContentType) {
      // Dealing with binary Protobufs
      final body = <int>[];
      await for (final chunk in request.read()) {
        body.addAll(chunk);
      }
      try {
        final response = await transform(decodeFromProto(body));
        return Response.ok(
          response.writeToBuffer(),
          headers: _protobufHeaders,
        );
      } on BadRequest catch (e) {
        return Response(400,
            headers: _protobufHeaders,
            body: (proto.BadRequest.create()
                  ..error = (proto.ErrorMessage.create()..message = e.cause))
                .writeToBuffer());
      }
    } else {
      // Dealing with JSON encoded Protobufs
      final body = await request.readAsString();
      try {
        final response = await transform(
            decodeFromJSON(body.isNotEmpty ? json.decode(body) as Object : {}));
        return Response.ok(
          _jsonEncoder.convert(response.toProto3Json()),
          encoding: utf8,
          headers: _jsonHeaders,
        );
      } on BadRequest catch (e) {
        return Response(400,
            headers: _jsonHeaders,
            encoding: utf8,
            body: _jsonEncoder.convert((proto.BadRequest.create()
                  ..error = (proto.ErrorMessage.create()..message = e.cause))
                .toProto3Json()));
      }
    }
  }

  final JsonEncoder _jsonEncoder = const JsonEncoder.withIndent(' ');

  static const _jsonHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Content-Type': jsonContentType
  };

  static const _protobufHeaders = {
    'Access-Control-Allow-Origin': '*',
    'Content-Type': protobufContentType
  };
}
