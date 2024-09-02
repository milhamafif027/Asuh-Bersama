import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'visualisasi_data_model.dart';
export 'visualisasi_data_model.dart';

class VisualisasiDataWidget extends StatefulWidget {
  const VisualisasiDataWidget({super.key});

  @override
  State<VisualisasiDataWidget> createState() => _VisualisasiDataWidgetState();
}

class _VisualisasiDataWidgetState extends State<VisualisasiDataWidget> {
  late VisualisasiDataModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VisualisasiDataModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'VisualisasiData'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chartPieChartColorsList = [Color(0xFFFD7C7C), Color(0xFF00B3FF)];
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            logFirebaseEvent('VISUALISASI_DATA_FloatingActionButton_n9');
            logFirebaseEvent('FloatingActionButton_navigate_to');

            context.pushNamed('Input_Jadwal');
          },
          backgroundColor: Color(0xFF48C1FF),
          elevation: 8.0,
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 24.0,
          ),
        ),
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
              logFirebaseEvent('VISUALISASI_DATA_arrow_back_rounded_ICN_');
              logFirebaseEvent('IconButton_navigate_to');

              context.pushNamed('HomePage');
            },
          ),
          title: Text(
            'Mengasuh Bersama',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Open Sans',
                  color: Colors.black,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(35.0, 20.0, 0.0, 0.0),
                  child: Text(
                    'Diagram Pembagian Jam Asuh',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Open Sans',
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(-1.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(35.0, 20.0, 0.0, 0.0),
                  child: Text(
                    getCurrentTimestamp.toString(),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Inter',
                          letterSpacing: 0.0,
                        ),
                  ),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, -1.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                  child: StreamBuilder<List<JadwalAsuhRecord>>(
                    stream: queryJadwalAsuhRecord(
                      queryBuilder: (jadwalAsuhRecord) => jadwalAsuhRecord
                          .where(
                            'Username',
                            isEqualTo: currentUserReference,
                          )
                          .where(
                            'Tanggal',
                            isEqualTo: functions.getCurrentDate(),
                          ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 25.0,
                            height: 25.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<JadwalAsuhRecord> chartJadwalAsuhRecordList =
                          snapshot.data!;

                      return Container(
                        width: 370.0,
                        height: 230.0,
                        child: FlutterFlowPieChart(
                          data: FFPieChartData(
                            values: chartJadwalAsuhRecordList
                                .map((d) => d.jam)
                                .toList(),
                            colors: chartPieChartColorsList,
                            radius: [130.0],
                            borderColor: [Color(0x00000000)],
                          ),
                          donutHoleRadius: 0.0,
                          donutHoleColor: Colors.transparent,
                          sectionLabelType: PieChartSectionLabelType.value,
                          sectionLabelStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Inter',
                                letterSpacing: 0.0,
                              ),
                          labelFormatter: LabelFormatter(
                            numberFormat: (val) => formatNumber(
                              val,
                              formatType: FormatType.custom,
                              format: '# jam',
                              locale: '',
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AuthUserStreamWidget(
                      builder: (context) =>
                          StreamBuilder<List<JadwalAsuhRecord>>(
                        stream: queryJadwalAsuhRecord(
                          queryBuilder: (jadwalAsuhRecord) => jadwalAsuhRecord
                              .where(
                                'Username',
                                isEqualTo: currentUserReference,
                              )
                              .where(
                                'Wali',
                                isEqualTo: valueOrDefault(
                                    currentUserDocument?.wali, ''),
                              ),
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 25.0,
                                height: 25.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    FlutterFlowTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<JadwalAsuhRecord> buttonJadwalAsuhRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final buttonJadwalAsuhRecord =
                              buttonJadwalAsuhRecordList.isNotEmpty
                                  ? buttonJadwalAsuhRecordList.first
                                  : null;

                          return FFButtonWidget(
                            onPressed: (buttonJadwalAsuhRecord!.waktu! >
                                    getCurrentTimestamp)
                                ? null
                                : () async {
                                    logFirebaseEvent(
                                        'VISUALISASI_DATA_PAGE_MULAI_BTN_ON_TAP');
                                    logFirebaseEvent('Button_navigate_to');

                                    context.pushNamed(
                                      'Timer',
                                      queryParameters: {
                                        'setTIme': serializeParam(
                                          buttonJadwalAsuhRecord?.waktu,
                                          ParamType.DateTime,
                                        ),
                                        'setDurasi': serializeParam(
                                          buttonJadwalAsuhRecord?.durasi,
                                          ParamType.int,
                                        ),
                                      }.withoutNulls,
                                    );
                                  },
                            text: 'Mulai',
                            options: FFButtonOptions(
                              width: 150.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color(0xFFFFA737),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                  ),
                              elevation: 3.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              disabledColor: Color(0xFF616161),
                              disabledTextColor: Colors.white,
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                50.0, 40.0, 0.0, 0.0),
                            child: Text(
                              'Daftar Kegiatan',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Open Sans',
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                60.0, 20.0, 0.0, 0.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                'assets/images/family_(2).png',
                                width: 75.0,
                                height: 75.0,
                                fit: BoxFit.contain,
                                alignment: Alignment(0.0, 0.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 50.0),
                      child: Container(
                        width: 330.0,
                        height: 357.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFF4C891),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(
                                0.0,
                                2.0,
                              ),
                              spreadRadius: 4.0,
                            )
                          ],
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(15.0),
                            bottomRight: Radius.circular(15.0),
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0),
                          ),
                        ),
                        child: StreamBuilder<List<JadwalAsuhRecord>>(
                          stream: queryJadwalAsuhRecord(
                            queryBuilder: (jadwalAsuhRecord) => jadwalAsuhRecord
                                .where(
                                  'Username',
                                  isEqualTo: currentUserReference,
                                )
                                .where(
                                  'Tanggal',
                                  isEqualTo: functions.getCurrentDate(),
                                ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 25.0,
                                  height: 25.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<JadwalAsuhRecord> columnJadwalAsuhRecordList =
                                snapshot.data!;

                            return Column(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  columnJadwalAsuhRecordList.length,
                                  (columnIndex) {
                                final columnJadwalAsuhRecord =
                                    columnJadwalAsuhRecordList[columnIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 20.0, 0.0, 0.0),
                                            child: Text(
                                              columnJadwalAsuhRecord.wali,
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Inter',
                                                        color: Colors.black,
                                                        fontSize: 20.0,
                                                        letterSpacing: 0.0,
                                                      ),
                                            ),
                                          ),
                                          StreamBuilder<List<InputTugasRecord>>(
                                            stream: queryInputTugasRecord(
                                              queryBuilder:
                                                  (inputTugasRecord) =>
                                                      inputTugasRecord.where(
                                                'Jadwal_ref',
                                                isEqualTo:
                                                    columnJadwalAsuhRecord
                                                        .reference,
                                              ),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 25.0,
                                                    height: 25.0,
                                                    child:
                                                        CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                              Color>(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .primary,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<InputTugasRecord>
                                                  columnInputTugasRecordList =
                                                  snapshot.data!;

                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    columnInputTugasRecordList
                                                        .length, (columnIndex) {
                                                  final columnInputTugasRecord =
                                                      columnInputTugasRecordList[
                                                          columnIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 0.0),
                                                    child: Text(
                                                      columnInputTugasRecord
                                                          .value,
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            color: Colors.black,
                                                            letterSpacing: 0.0,
                                                          ),
                                                    ),
                                                  );
                                                }),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
