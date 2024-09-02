import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_timer.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'timer_model.dart';
export 'timer_model.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({
    super.key,
    this.setTIme,
    this.setDurasi,
  });

  final DateTime? setTIme;
  final int? setDurasi;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  late TimerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TimerModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Timer'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('TIMER_PAGE_Timer_ON_INIT_STATE');
      logFirebaseEvent('Timer_start_periodic_action');
      _model.instantTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          logFirebaseEvent('Timer_timer');
          _model.timerController.onStartTimer();
          logFirebaseEvent('Timer_stop_periodic_action');
          _model.instantTimer?.cancel();
        },
        startImmediately: true,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
          title: Text(
            'Mengasuh Bersama',
            style: FlutterFlowTheme.of(context).bodyLarge.override(
                  fontFamily: 'Inter',
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: StreamBuilder<List<JadwalAsuhRecord>>(
          stream: queryJadwalAsuhRecord(
            queryBuilder: (jadwalAsuhRecord) => jadwalAsuhRecord
                .where(
                  'Tanggal',
                  isEqualTo: functions.getCurrentDate(),
                )
                .where(
                  'Username',
                  isEqualTo: currentUserReference,
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
            List<JadwalAsuhRecord> wrapperJadwalAsuhRecordList = snapshot.data!;
            // Return an empty Container when the item does not exist.
            if (snapshot.data!.isEmpty) {
              return Container();
            }
            final wrapperJadwalAsuhRecord =
                wrapperJadwalAsuhRecordList.isNotEmpty
                    ? wrapperJadwalAsuhRecordList.first
                    : null;

            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 44.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 8.0, 32.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Time Left',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).alternate,
                              borderRadius: 30.0,
                              borderWidth: 2.0,
                              buttonSize: 44.0,
                              fillColor: Color(0xFFF4F3F3),
                              icon: Icon(
                                Icons.refresh_rounded,
                                color: Colors.black,
                                size: 20.0,
                              ),
                              onPressed: () async {
                                logFirebaseEvent(
                                    'TIMER_PAGE_startTimer_ON_TAP');
                                logFirebaseEvent('startTimer_timer');
                                _model.timerController.onResetTimer();
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 32.0, 0.0, 24.0),
                            child: FlutterFlowTimer(
                              initialTime: wrapperJadwalAsuhRecord!.durasi,
                              getDisplayTime: (value) =>
                                  StopWatchTimer.getDisplayTime(value,
                                      milliSecond: false),
                              controller: _model.timerController,
                              updateStateInterval: Duration(milliseconds: 100),
                              onChanged: (value, displayTime, shouldUpdate) {
                                _model.timerMilliseconds = value;
                                _model.timerValue = displayTime;
                                if (shouldUpdate) setState(() {});
                              },
                              onEnded: () async {
                                logFirebaseEvent(
                                    'TIMER_PAGE_Timer_20p3jzzp_ON_TIMER_END');
                                logFirebaseEvent('Timer_alert_dialog');
                                await showDialog(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Perhatian!'),
                                      content: Text(
                                          'Maaf waktu anda telah habis. Silahkan melakukan aktivitas selanjutnya'),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(alertDialogContext),
                                          child: Text('Ok'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                                logFirebaseEvent('Timer_navigate_to');

                                context.pushNamed('VisualisasiData');
                              },
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context)
                                  .displaySmall
                                  .override(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontSize: 70.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xFFEEE4E4),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                color: Color(0x34111417),
                              )
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(0.0),
                              bottomRight: Radius.circular(0.0),
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(16.0),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                15.0, 12.0, 15.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 12.0, 0.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      70.0, 0.0, 20.0, 0.0),
                                              child: Text(
                                                'Apabila Sudah Selesai \nMengerjakan Tugas \nKlik Tombol DIbawah',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              'Open Sans',
                                                          color: Colors.black,
                                                          letterSpacing: 0.0,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            40.0, 10.0, 0.0, 0.0),
                                        child: Text(
                                          'Kerjakan tugas sesuai dengan waktu yang ditentukan',
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.of(context)
                                              .labelMedium
                                              .override(
                                                fontFamily: 'Inter',
                                                color: Color(0xFF797777),
                                                letterSpacing: 0.0,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 24.0, 0.0, 44.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      logFirebaseEvent(
                                          'TIMER_PAGE_TUGAS_SELESAI_BTN_ON_TAP');
                                      logFirebaseEvent('Button_timer');
                                      _model.timerController.onStopTimer();
                                      logFirebaseEvent(
                                          'Button_stop_periodic_action');
                                      _model.instantTimer?.cancel();
                                      logFirebaseEvent('Button_navigate_to');

                                      context.pushNamed('VisualisasiData');
                                    },
                                    text: 'Tugas Selesai',
                                    options: FFButtonOptions(
                                      width: double.infinity,
                                      height: 50.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: Color(0xFFFFA737),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Inter',
                                            color: Colors.black,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
