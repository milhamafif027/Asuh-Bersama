import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'input_jadwal_model.dart';
export 'input_jadwal_model.dart';

class InputJadwalWidget extends StatefulWidget {
  const InputJadwalWidget({super.key});

  @override
  State<InputJadwalWidget> createState() => _InputJadwalWidgetState();
}

class _InputJadwalWidgetState extends State<InputJadwalWidget> {
  late InputJadwalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputJadwalModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'Input_Jadwal'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xFF61ACE7),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
              size: 30.0,
            ),
            onPressed: () async {
              logFirebaseEvent('INPUT_JADWAL_arrow_back_rounded_ICN_ON_T');
              logFirebaseEvent('IconButton_navigate_back');
              context.pop();
            },
          ),
          title: Text(
            'Mengasuh Bersama',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1475503572774-15a45e5d60b9?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwyM3x8ZmFtaWx5fGVufDB8fHx8MTcxNzMyMjIxMHww&ixlib=rb-4.0.3&q=80&w=1080',
                    width: 433.0,
                    height: 242.0,
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.0, 1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
                    child: FlutterFlowDropDown<String>(
                      controller: _model.dropDownValueController1 ??=
                          FormFieldController<String>(null),
                      options: List<String>.from(['Ayah', 'Ibu']),
                      optionLabels: ['Ayah', 'Ibu'],
                      onChanged: (val) =>
                          setState(() => _model.dropDownValue1 = val),
                      width: 335.0,
                      height: 50.0,
                      textStyle:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                                fontFamily: 'Inter',
                                color: Colors.black,
                                letterSpacing: 0.0,
                              ),
                      hintText: 'Wali',
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: FlutterFlowTheme.of(context).secondaryText,
                        size: 24.0,
                      ),
                      fillColor: Color(0xFFF4C891),
                      elevation: 2.0,
                      borderColor: FlutterFlowTheme.of(context).alternate,
                      borderWidth: 2.0,
                      borderRadius: 15.0,
                      margin:
                          EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                      hidesUnderline: true,
                      isOverButton: false,
                      isSearchable: false,
                      isMultiSelect: false,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(35.0, 15.0, 30.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 20.0, 0.0),
                            child: Text(
                              'Tanggal    :',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Text(
                            dateTimeFormat(
                              "d/M/y",
                              _model.datePicked1,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'INPUT_JADWAL_PAGE_KLIK_BTN_ON_TAP');
                              logFirebaseEvent('Button_date_time_picker');
                              final _datePicked1Date = await showDatePicker(
                                context: context,
                                initialDate: getCurrentTimestamp,
                                firstDate: getCurrentTimestamp,
                                lastDate: DateTime(2050),
                                builder: (context, child) {
                                  return wrapInMaterialDatePickerTheme(
                                    context,
                                    child!,
                                    headerBackgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    headerForegroundColor:
                                        FlutterFlowTheme.of(context).info,
                                    headerTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 32.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                    pickerBackgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    pickerForegroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    selectedDateTimeBackgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    selectedDateTimeForegroundColor:
                                        FlutterFlowTheme.of(context).info,
                                    actionButtonForegroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    iconSize: 24.0,
                                  );
                                },
                              );

                              if (_datePicked1Date != null) {
                                safeSetState(() {
                                  _model.datePicked1 = DateTime(
                                    _datePicked1Date.year,
                                    _datePicked1Date.month,
                                    _datePicked1Date.day,
                                  );
                                });
                              }
                            },
                            text: 'Klik',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFFFA737),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 20.0, 0.0),
                              child: Text(
                                'Waktu       :',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            Text(
                              dateTimeFormat(
                                "Hm",
                                _model.datePicked2,
                                locale:
                                    FFLocalizations.of(context).languageCode,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'INPUT_JADWAL_PAGE_KLIK_BTN_ON_TAP');
                              logFirebaseEvent('Button_date_time_picker');

                              final _datePicked2Time = await showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(getCurrentTimestamp),
                                builder: (context, child) {
                                  return wrapInMaterialTimePickerTheme(
                                    context,
                                    child!,
                                    headerBackgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    headerForegroundColor:
                                        FlutterFlowTheme.of(context).info,
                                    headerTextStyle:
                                        FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 32.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w600,
                                            ),
                                    pickerBackgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    pickerForegroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    selectedDateTimeBackgroundColor:
                                        FlutterFlowTheme.of(context).primary,
                                    selectedDateTimeForegroundColor:
                                        FlutterFlowTheme.of(context).info,
                                    actionButtonForegroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryText,
                                    iconSize: 24.0,
                                  );
                                },
                              );
                              if (_datePicked2Time != null) {
                                safeSetState(() {
                                  _model.datePicked2 = DateTime(
                                    getCurrentTimestamp.year,
                                    getCurrentTimestamp.month,
                                    getCurrentTimestamp.day,
                                    _datePicked2Time.hour,
                                    _datePicked2Time.minute,
                                  );
                                });
                              }
                            },
                            text: 'Klik',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFFFA737),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 20.0, 0.0, 0.0),
                              child: Text(
                                'Durasi       :  ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: Colors.black,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(10.0, 35.0, 10.0, 35.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController2 ??=
                              FormFieldController<String>(
                            _model.dropDownValue2 ??= '0 jam',
                          ),
                          options: [
                            '1 jam',
                            '2 Jam ',
                            '3 Jam ',
                            '4 Jam ',
                            '5 Jam ',
                            '6 Jam ',
                            '7 Jam ',
                            '8 Jam ',
                            '9 Jam ',
                            '10 Jam ',
                            '11 Jam ',
                            '12 Jam ',
                            '0 jam'
                          ],
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue2 = val),
                          width: 120.0,
                          height: 50.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Jam',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor: Color(0xFFF4C891),
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 8.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: true,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.dropDownValueController3 ??=
                                FormFieldController<String>(
                              _model.dropDownValue3 ??= '0 Menit',
                            ),
                            options: [
                              '10 Menit',
                              '20 Menit',
                              '30 Menit',
                              '40 Menit',
                              '50 Menit',
                              '0 Menit'
                            ],
                            onChanged: (val) =>
                                setState(() => _model.dropDownValue3 = val),
                            width: 120.0,
                            height: 50.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.black,
                                  letterSpacing: 0.0,
                                ),
                            hintText: 'Menit',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.black,
                              size: 24.0,
                            ),
                            fillColor: Color(0xFFF4C891),
                            elevation: 2.0,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isOverButton: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(1.0, 0.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 30.0, 20.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'INPUT_JADWAL_PAGE_BERIKUTNYA_BTN_ON_TAP');
                            logFirebaseEvent('Button_firestore_query');
                            _model.panggilJadwal =
                                await queryJadwalAsuhRecordOnce(
                              queryBuilder: (jadwalAsuhRecord) =>
                                  jadwalAsuhRecord
                                      .where(
                                        'Tanggal',
                                        isEqualTo: _model.datePicked1,
                                      )
                                      .where(
                                        'Username',
                                        isEqualTo: currentUserReference,
                                      ),
                              singleRecord: true,
                            ).then((s) => s.firstOrNull);
                            if (_model.panggilJadwal?.wali ==
                                _model.dropDownValue1) {
                              logFirebaseEvent('Button_firestore_query');
                              _model.ambilWali =
                                  await queryJadwalAsuhRecordOnce(
                                queryBuilder: (jadwalAsuhRecord) =>
                                    jadwalAsuhRecord
                                        .where(
                                          'Wali',
                                          isEqualTo: _model.dropDownValue1,
                                        )
                                        .where(
                                          'Tanggal',
                                          isEqualTo: _model.datePicked1,
                                        )
                                        .where(
                                          'Username',
                                          isEqualTo: currentUserReference,
                                        ),
                                singleRecord: true,
                              ).then((s) => s.firstOrNull);
                              logFirebaseEvent('Button_backend_call');

                              await _model.ambilWali!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'Durasi': FieldValue.increment(
                                        functions.timeToMilisekon(
                                            _model.dropDownValue2!,
                                            _model.dropDownValue3!)),
                                  },
                                ),
                              });
                              logFirebaseEvent('Button_backend_call');

                              await _model.ambilWali!.reference.update({
                                ...mapToFirestore(
                                  {
                                    'Jam': FieldValue.increment(
                                        functions.secondToHour(
                                            _model.ambilWali!.durasi)),
                                  },
                                ),
                              });
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'Tugas',
                                queryParameters: {
                                  'jadwawlID': serializeParam(
                                    _model.ambilWali?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            } else {
                              logFirebaseEvent('Button_backend_call');

                              var jadwalAsuhRecordReference =
                                  JadwalAsuhRecord.collection.doc();
                              await jadwalAsuhRecordReference
                                  .set(createJadwalAsuhRecordData(
                                tanggal: _model.datePicked1,
                                waktu: _model.datePicked2,
                                durasi: functions.timeToMilisekon(
                                    _model.dropDownValue2!,
                                    _model.dropDownValue3!),
                                wali: _model.dropDownValue1,
                                username: currentUserReference,
                              ));
                              _model.createDocument =
                                  JadwalAsuhRecord.getDocumentFromData(
                                      createJadwalAsuhRecordData(
                                        tanggal: _model.datePicked1,
                                        waktu: _model.datePicked2,
                                        durasi: functions.timeToMilisekon(
                                            _model.dropDownValue2!,
                                            _model.dropDownValue3!),
                                        wali: _model.dropDownValue1,
                                        username: currentUserReference,
                                      ),
                                      jadwalAsuhRecordReference);
                              logFirebaseEvent('Button_backend_call');

                              await _model.createDocument!.reference
                                  .update(createJadwalAsuhRecordData(
                                jam: functions.secondToHour(
                                    _model.createDocument!.durasi),
                              ));
                              logFirebaseEvent('Button_navigate_to');

                              context.pushNamed(
                                'Tugas',
                                queryParameters: {
                                  'jadwawlID': serializeParam(
                                    _model.createDocument?.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            }

                            setState(() {});
                          },
                          text: 'Berikutnya',
                          options: FFButtonOptions(
                            height: 36.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFFFFA737),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Inter',
                                  color: Colors.black,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                ),
                            elevation: 3.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
