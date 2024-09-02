import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'input_nilai_g_izi_model.dart';
export 'input_nilai_g_izi_model.dart';

class InputNilaiGIziWidget extends StatefulWidget {
  const InputNilaiGIziWidget({super.key});

  @override
  State<InputNilaiGIziWidget> createState() => _InputNilaiGIziWidgetState();
}

class _InputNilaiGIziWidgetState extends State<InputNilaiGIziWidget> {
  late InputNilaiGIziModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => InputNilaiGIziModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'InputNilai_GIzi'});
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            logFirebaseEvent('INPUT_NILAI_G_IZI_arrow_back_rounded_ICN');
            logFirebaseEvent('IconButton_navigate_to');

            context.pushNamed('HomePage');
          },
        ),
        title: Text(
          'Informasi Gizi',
          style: FlutterFlowTheme.of(context).bodyLarge.override(
                fontFamily: 'Inter',
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
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/Penting!!_Makanan_yang_Baik_dan_Buruk_Untuk_Gizi_Ibu_Hamil!!_Check_more_at_http___bayimami_com_penting-makanan-yang-baik-dan-buruk-untuk-gizi-ibu-hamil_.jpg',
                          width: 450.0,
                          height: 200.0,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                        child: FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(null),
                          options: List<String>.from([
                            '0 - 6 Bulan',
                            '6 - 8 Bulan',
                            '9 - 11 Bulan',
                            '12 - 23 Bulan'
                          ]),
                          optionLabels: [
                            '0 - 6 Bulan',
                            '6 - 8 Bulan',
                            '9 - 11 Bulan',
                            '12 - 23 Bulan'
                          ],
                          onChanged: (val) =>
                              setState(() => _model.dropDownValue = val),
                          width: 361.0,
                          height: 50.0,
                          textStyle:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                  ),
                          hintText: 'Pilih Usia Anak',
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 24.0,
                          ),
                          fillColor: FlutterFlowTheme.of(context).tertiary,
                          elevation: 2.0,
                          borderColor: FlutterFlowTheme.of(context).alternate,
                          borderWidth: 2.0,
                          borderRadius: 15.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              16.0, 4.0, 16.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(1.0, 1.0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 20.0, 30.0, 0.0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            logFirebaseEvent(
                                'INPUT_NILAI_G_IZI_LIHAT_HASIL_BTN_ON_TAP');
                            logFirebaseEvent('Button_navigate_to');

                            context.pushNamed(
                              'Hasil_InputNilai',
                              queryParameters: {
                                'hasilinput': serializeParam(
                                  _model.dropDownValue,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          },
                          text: 'Lihat Hasil',
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
