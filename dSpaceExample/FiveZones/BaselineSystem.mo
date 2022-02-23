within dSpaceExample.FiveZones;
model BaselineSystem "System example for fault injection"
  extends Modelica.Icons.Example;
  extends dSpaceExample.FiveZones.BaseClasses.PartialHotWaterside(
    final Q_flow_boi_nominal=designHeatLoad,
    minFloBypHW(k=0.1),
    pumSpeHW(reset=Buildings.Types.Reset.Parameter, y_reset=0),
    boiTSup(
      y_start=0,
      reset=Buildings.Types.Reset.Parameter,
      y_reset=0),
    boi(show_T=false),
    triResHW(TMin=313.15, TMax=321.15));
  extends dSpaceExample.FiveZones.BaseClasses.PartialAirside(
    fanSup(show_T=false),
    conAHU(
      pNumIgnReq=1,
      TSupSetMin=284.95,
      numIgnReqSupTem=1,
      kTSup=0.5,
      TiTSup=120),
    conVAVWes(
      VDisSetMin_flow=0.05*conVAVWes.V_flow_nominal,
      VDisConMin_flow=0.05*conVAVWes.V_flow_nominal,
      errTZonCoo_1=0.8,
      errTZonCoo_2=0.4,
      sysReq(gai1(k=0.7), gai2(k=0.9))),
    conVAVCor(
      VDisSetMin_flow=0.05*conVAVCor.V_flow_nominal,
      VDisConMin_flow=0.05*conVAVCor.V_flow_nominal,
      errTZonCoo_1=0.8,
      errTZonCoo_2=0.4,
      sysReq(gai1(k=0.7), gai2(k=0.9))),
    conVAVSou(
      VDisSetMin_flow=0.05*conVAVSou.V_flow_nominal,
      VDisConMin_flow=0.05*conVAVSou.V_flow_nominal,
      errTZonCoo_1=0.8,
      errTZonCoo_2=0.4,
      sysReq(gai1(k=0.7), gai2(k=0.9))),
    conVAVEas(
      VDisSetMin_flow=0.05*conVAVEas.V_flow_nominal,
      VDisConMin_flow=0.05*conVAVEas.V_flow_nominal,
      errTZonCoo_1=0.8,
      errTZonCoo_2=0.4,
      sysReq(gai1(k=0.7), gai2(k=0.9))),
    conVAVNor(
      VDisSetMin_flow=0.05*conVAVNor.V_flow_nominal,
      VDisConMin_flow=0.05*conVAVNor.V_flow_nominal,
      errTZonCoo_1=0.8,
      errTZonCoo_2=0.4,
      sysReq(gai1(k=0.7), gai2(k=0.9))),
    flo(
      cor(T_start=273.15 + 24),
      sou(T_start=273.15 + 24),
      eas(T_start=273.15 + 24),
      wes(T_start=273.15 + 24),
      nor(T_start=273.15 + 24)));
  extends dSpaceExample.FiveZones.BaseClasses.PartialWaterside(
    redeclare
      FaultInjection.Experimental.SystemLevelFaults.BaseClasses.IntegratedPrimaryLoadSide
      chiWSE(
      use_inputFilter=true,
      T2_start=283.15,
      addPowerToMedium=false,
      perPum=perPumPri),
    watVal(
      redeclare package Medium = MediumW,
      m_flow_nominal=m2_flow_chi_nominal,
      dpValve_nominal=6000,
      riseTime=60),
    final QEva_nominal=designCoolLoad,
    pumCW(use_inputFilter=true),
    resCHW(dp_nominal=139700),
    temDifPreRes(
      samplePeriod(displayUnit="s"),
      uTri=0.9,
      dpMin=0.5*dpSetPoi,
      dpMax=dpSetPoi,
      TMin(displayUnit="degC") = 278.15,
      TMax(displayUnit="degC") = 283.15),
    pumSpe(yMin=0.2),
    TCHWSup(T_start=283.15),
    CHWSTDelAtt(delayTime=600));

  extends dSpaceExample.FiveZones.BaseClasses.EnergyMeter(
    eleCoiVAV(y=cor.terHea.Q1_flow + nor.terHea.Q1_flow + wes.terHea.Q1_flow +
          eas.terHea.Q1_flow + sou.terHea.Q1_flow),
    eleSupFan(y=fanSup.P),
    eleChi(y=chiWSE.powChi[1]),
    eleCHWP(y=chiWSE.powPum[1]),
    eleCWP(y=pumCW.P),
    eleHWP(y=pumHW.P),
    eleCT(y=cooTow.PFan),
    gasBoi(y=boi.QFue_flow));

 extends dSpaceExample.FiveZones.BaseClasses.RunTime;

  parameter Buildings.Fluid.Movers.Data.Generic[numChi] perPumPri(
    each pressure=Buildings.Fluid.Movers.BaseClasses.Characteristics.flowParameters(
          V_flow=m2_flow_chi_nominal/1000*{0.2,0.6,1.0,1.2},
          dp=(dp2_chi_nominal+dp2_wse_nominal+139700+36000)*{1.5,1.3,1.0,0.6}))
    "Performance data for primary pumps";

  FaultInjection.Experimental.SystemLevelFaults.Controls.CoolingMode cooModCon(
    tWai=1200,
    deaBan1=1.1,
    deaBan2=0.5,
    deaBan3=1.1,
    deaBan4=0.5) "Cooling mode controller"
    annotation (Placement(transformation(extent={{1028,-266},{1048,-246}})));
  Modelica.Blocks.Sources.RealExpression towTApp(y=cooTow.TWatOut_nominal -
        cooTow.TAirInWB_nominal)
    "Cooling tower approach temperature"
    annotation (Placement(transformation(extent={{988,-300},{1008,-280}})));
  Modelica.Blocks.Sources.RealExpression yVal5(y=if cooModCon.y == Integer(
        FaultInjection.Experimental.SystemLevelFaults.Types.CoolingModes.FullMechanical)
         then 1 else 0)
    "On/off signal for valve 5"
    annotation (Placement(transformation(extent={{1060,-192},{1040,-172}})));
  Modelica.Blocks.Sources.RealExpression yVal6(y=if cooModCon.y == Integer(
        FaultInjection.Experimental.SystemLevelFaults.Types.CoolingModes.FreeCooling)
         then 1 else 0)
    "On/off signal for valve 6"
    annotation (Placement(transformation(extent={{1060,-208},{1040,-188}})));
  Buildings.Controls.OBC.CDL.Continuous.Product proCHWP
    annotation (Placement(transformation(extent={{1376,-260},{1396,-240}})));

  FaultInjection.Experimental.SystemLevelFaults.Controls.PlantRequest plaReqChi
    annotation (Placement(transformation(extent={{1044,-120},{1064,-100}})));
  FaultInjection.Experimental.SystemLevelFaults.Controls.ChillerPlantEnableDisable
    chiPlaEnaDis(yFanSpeMin=0.15,
                 plaReqTim=30*60)
    annotation (Placement(transformation(extent={{1100,-120},{1120,-100}})));
  Modelica.Blocks.Math.BooleanToReal booToRea
    annotation (Placement(transformation(extent={{1168,-126},{1188,-106}})));
  FaultInjection.Experimental.SystemLevelFaults.Controls.BoilerPlantEnableDisable
    boiPlaEnaDis(
    yFanSpeMin=0.15,
    plaReqTim=30*60,
    TOutPla=291.15)
    annotation (Placement(transformation(extent={{-278,-170},{-258,-150}})));
  Modelica.Blocks.Math.BooleanToReal booToReaHW
    annotation (Placement(transformation(extent={{-218,-170},{-198,-150}})));
  FaultInjection.Experimental.SystemLevelFaults.Controls.PlantRequest plaReqBoi
    annotation (Placement(transformation(extent={{-320,-170},{-300,-150}})));
  Buildings.Controls.OBC.CDL.Continuous.Product proHWVal
    annotation (Placement(transformation(extent={{40,-190},{60,-170}})));
  Buildings.Controls.OBC.CDL.Continuous.Product proCHWVal
    annotation (Placement(transformation(extent={{468,-118},{488,-98}})));

  FaultInjection.Experimental.SystemLevelFaults.Controls.MinimumFlowBypassValve
    minFloBypCHW(m_flow_minimum=0.5, k=0.1)
    "Chilled water loop minimum bypass valve control"
    annotation (Placement(transformation(extent={{1040,-160},{1060,-140}})));
  Modelica.Blocks.Sources.RealExpression yVal7(y=if cooModCon.y == Integer(
        FaultInjection.Experimental.SystemLevelFaults.Types.CoolingModes.FreeCooling)
         then 0 else minFloBypCHW.y) "On/off signal for valve 7"
    annotation (Placement(transformation(extent={{1060,-230},{1040,-210}})));

  Modelica.Blocks.Math.BooleanToReal booToReaSupFan
    annotation (Placement(transformation(extent={{1220,642},{1240,662}})));
  Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqualThreshold(threshold=
       0.01)
    annotation (Placement(transformation(extent={{1220,688},{1240,708}})));
  Modelica.Blocks.Math.BooleanToReal booToReaCT
    annotation (Placement(transformation(extent={{1254,688},{1274,708}})));

equation

  connect(chiWSE.TCHWSupWSE,cooModCon. TCHWSupWSE)
    annotation (Line(
      points={{673,-212},{666,-212},{666,-76},{1016,-76},{1016,-260.444},{1026,
          -260.444}},
      color={0,0,127}));
  connect(towTApp.y,cooModCon. TApp)
    annotation (Line(
      points={{1009,-290},{1018,-290},{1018,-257.111},{1026,-257.111}},
      color={0,0,127}));
  connect(cooModCon.TCHWRetWSE, TCHWRet.T)
    annotation (Line(
      points={{1026,-263.778},{1014,-263.778},{1014,-66},{608,-66},{608,-177}},
    color={0,0,127}));
  connect(cooModCon.y, chiStaCon.cooMod)
    annotation (Line(
      points={{1049,-254.889},{1072,-254.889},{1072,-66},{1270,-66},{1270,-122},
          {1284,-122}},
      color={255,127,0}));
  connect(cooModCon.y,intToBoo.u)
    annotation (Line(
      points={{1049,-254.889},{1072,-254.889},{1072,-66},{1270,-66},{1270,-154},
          {1284,-154}},
      color={255,127,0}));
  connect(cooModCon.y, cooTowSpeCon.cooMod) annotation (Line(points={{1049,
          -254.889},{1072,-254.889},{1072,-66},{1270,-66},{1270,-93.5556},{1284,
          -93.5556}},                                color={255,127,0}));
  connect(cooModCon.y, CWPumCon.cooMod) annotation (Line(points={{1049,-254.889},
          {1072,-254.889},{1072,-66},{1270,-66},{1270,-201},{1282,-201}},
                                          color={255,127,0}));
  connect(yVal5.y, chiWSE.yVal5) annotation (Line(points={{1039,-182},{864,-182},
          {864,-211},{695.6,-211}},
                              color={0,0,127}));
  connect(yVal6.y, chiWSE.yVal6) annotation (Line(points={{1039,-198},{866,-198},
          {866,-207.8},{695.6,-207.8}}, color={0,0,127}));
  connect(watVal.port_a, cooCoi.port_b1) annotation (Line(points={{538,-98},{538,
          -86},{182,-86},{182,-52},{190,-52}},
                           color={0,127,255},
      thickness=0.5));
  connect(cooCoi.port_a1, TCHWSup.port_b) annotation (Line(points={{210,-52},{220,
          -52},{220,-78},{642,-78},{642,-128},{758,-128}},
                                       color={0,127,255},
      thickness=0.5));
  connect(proCHWP.y, chiWSE.yPum[1]) annotation (Line(points={{1398,-250},{1404,
          -250},{1404,-340},{704,-340},{704,-203.6},{695.6,-203.6}},
                                        color={0,0,127}));
  connect(weaBus.TWetBul, cooModCon.TWetBul) annotation (Line(
      points={{-320,180},{-320,22},{436,22},{436,-60},{1008,-60},{1008,-253.778},
          {1026,-253.778}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(TCWSup.T, cooTowSpeCon.TCWSup) annotation (Line(points={{828,-305},{
          828,-64},{1274,-64},{1274,-100.667},{1284,-100.667}},
        color={0,0,127}));
  connect(TCHWSup.T, cooTowSpeCon.TCHWSup) annotation (Line(points={{768,-117},
          {768,-64},{1272,-64},{1272,-104.222},{1284,-104.222}},
                            color={0,0,127}));
  connect(pumSpe.y, proCHWP.u2) annotation (Line(points={{1361,-248},{1366,-248},
          {1366,-256},{1374,-256}},
                                 color={0,0,127}));
  connect(watVal.y_actual, temDifPreRes.u) annotation (Line(points={{531,-113},{
          530,-113},{530,-122},{518,-122},{518,-72},{964,-72},{964,-244},{1194,-244}},
                                                          color={0,0,127}));
  connect(cooModCon.y, temDifPreRes.uOpeMod) annotation (Line(points={{1049,
          -254.889},{1072,-254.889},{1072,-238},{1194,-238}},
        color={255,127,0}));
  connect(temDifPreRes.TSet, cooModCon.TCHWSupSet) annotation (Line(points={{1217,
          -249},{1218,-249},{1218,-250},{1232,-250},{1232,-70},{1018,-70},{1018,
          -250.222},{1026,-250.222}},
                                    color={0,0,127}));
  connect(TOut.y, chiPlaEnaDis.TOut) annotation (Line(points={{-279,180},{1078,
          180},{1078,-105.4},{1098,-105.4}},
                                         color={0,0,127}));
  connect(chiPlaEnaDis.ySupFan, conAHU.ySupFan) annotation (Line(points={{1098,
          -110},{1076,-110},{1076,629.333},{424,629.333}},             color={
          255,0,255}));
  connect(cooModCon.yPla, chiPlaEnaDis.yPla) annotation (Line(points={{1026,
          -247.333},{1022,-247.333},{1022,-70},{1142,-70},{1142,-110},{1121,
          -110}}, color={255,0,255}));
  connect(gai.y, pumCW.y) annotation (Line(points={{1347,-206},{1400,-206},{1400,
          -342},{880,-342},{880,-288},{898,-288}}, color={0,0,127}));
  connect(cooTowSpeCon.y, cooTow.y) annotation (Line(points={{1307,-97.1111},{
          1402,-97.1111},{1402,-344},{722,-344},{722,-308},{736,-308}},
                                                                      color={0,
          0,127}));
  connect(chiOn.y, chiWSE.on[1]) annotation (Line(points={{1347,-128},{1408,-128},
          {1408,-338},{868,-338},{868,-215.6},{695.6,-215.6}},
                                                            color={255,0,255}));
  connect(chiPlaEnaDis.yPla, booToRea.u)
    annotation (Line(points={{1121,-110},{1142,-110},{1142,-116},{1166,-116}},
                                                       color={255,0,255}));
  connect(booToRea.y, proCHWP.u1) annotation (Line(points={{1189,-116},{1246,-116},
          {1246,-64},{1368,-64},{1368,-244},{1374,-244}},
                  color={0,0,127}));
  connect(booToRea.y, val.y) annotation (Line(points={{1189,-116},{1246,-116},{1246,
          -174},{1420,-174},{1420,-342},{620,-342},{620,-296},{646,-296},{646,-304}},
                                                                  color={0,0,
          127}));
  connect(conAHU.ySupFan, andFreSta.u2) annotation (Line(points={{424,629.333},
          {436,629.333},{436,652},{-50,652},{-50,-138},{-22,-138}},
                      color={255,0,255}));
  connect(heaCoi.port_b1, HWVal.port_a)
    annotation (Line(points={{98,-52},{98,-170},{98,-170}},color={238,46,47},
      thickness=0.5));
  connect(boiPlaEnaDis.yPla, booToReaHW.u)
    annotation (Line(points={{-257,-160},{-220,-160}}, color={255,0,255}));
  connect(booToReaHW.y, boiIsoVal.y) annotation (Line(points={{-197,-160},{-182,
          -160},{-182,-360},{242,-360},{242,-300},{292,-300},{292,-308}},
                             color={0,0,127}));
  connect(booToReaHW.y, proPumHW.u1) annotation (Line(points={{-197,-160},{-178,
          -160},{-178,-72},{-98,-72},{-98,-210},{-42,-210},{-42,-308},{-34,-308}},
                                        color={0,0,127}));
  connect(booToReaHW.y, proBoi.u1) annotation (Line(points={{-197,-160},{-184,-160},
          {-184,-82},{-96,-82},{-96,-208},{-40,-208},{-40,-266},{-34,-266}},
                                        color={0,0,127}));
  connect(boiPlaEnaDis.yPla, pumSpeHW.trigger) annotation (Line(points={{-257,-160},
          {-240,-160},{-240,-82},{-92,-82},{-92,-338},{-68,-338},{-68,-332}},
                                                                color={255,0,
          255}));
  connect(boiPlaEnaDis.yPla, minFloBypHW.yPla) annotation (Line(points={{-257,-160},
          {-240,-160},{-240,-80},{-92,-80},{-92,-251},{-76,-251}}, color={255,0,
          255}));
  connect(cooModCon.yPla, pumSpe.trigger) annotation (Line(points={{1026,
          -247.333},{1022,-247.333},{1022,-336},{1342,-336},{1342,-260}}, color=
         {255,0,255}));
  connect(THWSup.port_a, heaCoi.port_a1) annotation (Line(points={{350,-214},{350,
          -140},{142,-140},{142,-52},{118,-52}},     color={238,46,47},
      thickness=0.5));
  connect(wseOn.y, chiWSE.on[2]) annotation (Line(points={{1347,-154},{1408,-154},
          {1408,-338},{866,-338},{866,-215.6},{695.6,-215.6}},
                                                            color={255,0,255}));
  connect(boiPlaEnaDis.yPla, boiTSup.trigger) annotation (Line(points={{-257,-160},
          {-238,-160},{-238,-78},{-92,-78},{-92,-292},{-72,-292},{-72,-290}},
                                                                color={255,0,
          255}));
  connect(plaReqChi.yPlaReq, chiPlaEnaDis.yPlaReq) annotation (Line(points={{1065,
          -110},{1072,-110},{1072,-114},{1098,-114}},      color={255,127,0}));
  connect(swiFreSta.y, plaReqBoi.uPlaVal) annotation (Line(points={{42,-130},{58,
          -130},{58,-70},{-250,-70},{-250,-120},{-340,-120},{-340,-160},{-322,-160}},
                                                                   color={0,0,
          127}));
  connect(minFloBypHW.y, valBypBoi.y) annotation (Line(points={{-53,-248},{-44,-248},
          {-44,-358},{178,-358},{178,-230},{230,-230},{230,-240}},
                                                   color={0,0,127}));
  connect(plaReqBoi.yPlaReq, boiPlaEnaDis.yPlaReq) annotation (Line(points={{-299,
          -160},{-290,-160},{-290,-164},{-280,-164}},      color={255,127,0}));
  connect(boiPlaEnaDis.yPla, triResHW.uDevSta) annotation (Line(points={{-257,-160},
          {-240,-160},{-240,-80},{-182,-80},{-182,-221},{-160,-221}},
                                                      color={255,0,255}));
  connect(TOut.y, boiPlaEnaDis.TOut) annotation (Line(points={{-279,180},{-260,
          180},{-260,-68},{-252,-68},{-252,-118},{-288,-118},{-288,-155.4},{
          -280,-155.4}},
        color={0,0,127}));
  connect(conAHU.ySupFan, boiPlaEnaDis.ySupFan) annotation (Line(points={{424,
          629.333},{436,629.333},{436,652},{-258,652},{-258,-116},{-292,-116},{
          -292,-160},{-280,-160}},
                        color={255,0,255}));
  connect(swiFreSta.y, proHWVal.u1) annotation (Line(points={{42,-130},{48,-130},
          {48,-156},{22,-156},{22,-174},{38,-174}}, color={0,0,127}));
  connect(proHWVal.y, HWVal.y)
    annotation (Line(points={{62,-180},{86,-180}}, color={0,0,127}));
  connect(booToReaHW.y, proHWVal.u2) annotation (Line(points={{-197,-160},{-94,-160},
          {-94,-186},{38,-186}}, color={0,0,127}));
  connect(proCHWVal.y, watVal.y)
    annotation (Line(points={{490,-108},{526,-108}}, color={0,0,127}));
  connect(booToRea.y, proCHWVal.u2) annotation (Line(points={{1189,-116},{1228,-116},
          {1228,-74},{436,-74},{436,-114},{466,-114}}, color={0,0,127}));
  connect(plaReqChi.uPlaVal, conAHU.yCoo) annotation (Line(points={{1042,-110},{
          1016,-110},{1016,-72},{388,-72},{388,44},{448,44},{448,544},{424,544}},
        color={0,0,127}));
  connect(conAHU.yCoo, proCHWVal.u1) annotation (Line(points={{424,544},{450,544},
          {450,-102},{466,-102}}, color={0,0,127}));
  connect(fanSup.y_actual, chiPlaEnaDis.yFanSpe) annotation (Line(points={{321,
          -33},{382,-33},{382,-68},{1080,-68},{1080,-117},{1099,-117}}, color={
          0,0,127}));
  connect(fanSup.y_actual, boiPlaEnaDis.yFanSpe) annotation (Line(points={{321,
          -33},{384,-33},{384,28},{16,28},{16,-66},{-256,-66},{-256,-124},{-294,
          -124},{-294,-167},{-279,-167}}, color={0,0,127}));
  connect(minFloBypCHW.m_flow, chiWSE.mCHW_flow) annotation (Line(points={{1038,
          -147},{1012,-147},{1012,-178},{668,-178},{668,-206},{673,-206}},
        color={0,0,127}));
  connect(chiPlaEnaDis.yPla, minFloBypCHW.yPla) annotation (Line(points={{1121,
          -110},{1142,-110},{1142,-128},{1024,-128},{1024,-153},{1038,-153}},
        color={255,0,255}));
  connect(yVal7.y, chiWSE.yVal7) annotation (Line(points={{1039,-220},{862,-220},
          {862,-200.4},{695.6,-200.4}}, color={0,0,127}));

  connect(CHWSTDelAtt.y, chiWSE.TSet) annotation (Line(points={{1197,-300},{1180,
          -300},{1180,-346},{770,-346},{770,-220},{695.6,-220},{695.6,-218.8}},
        color={235,0,0}));
  connect(CHWSTDelAtt.y, cooTowSpeCon.TCHWSupSet) annotation (Line(points={{1197,
          -300},{1160,-300},{1160,-76},{1268,-76},{1268,-97.1111},{1284,
          -97.1111}},
        color={235,0,0}));
  connect(booToReaHW.y, boiRunTim.u) annotation (Line(points={{-197,-160},{-188,
          -160},{-188,676},{1322,676},{1322,610},{1338,610}}, color={0,0,127}));
  connect(conAHU.ySupFan, booToReaSupFan.u) annotation (Line(points={{424,
          629.333},{1076,629.333},{1076,652},{1218,652}}, color={255,0,255}));
  connect(booToReaSupFan.y, supFanRunTim.u) annotation (Line(points={{1241,652},
          {1318,652},{1318,580},{1338,580}}, color={0,0,127}));
  connect(gai.y, CWPRunTim.u) annotation (Line(points={{1347,-206},{1400,-206},
          {1400,460},{1380,460},{1380,610},{1398,610}}, color={0,0,127}));
  connect(proCHWP.u1, CHWPRunTim.u) annotation (Line(points={{1374,-244},{1368,
          -244},{1368,-64},{1400,-64},{1400,460},{1380,460},{1380,640},{1398,
          640}}, color={0,0,127}));
  connect(proPumHW.u1, HWPRunTim.u) annotation (Line(points={{-34,-308},{-42,
          -308},{-42,-206},{-48,-206},{-48,678},{1382,678},{1382,580},{1398,580}},
        color={0,0,127}));
  connect(greaterEqualThreshold.y, booToReaCT.u)
    annotation (Line(points={{1241,698},{1252,698}}, color={255,0,255}));
  connect(booToReaCT.y, cooTowRunTim.u) annotation (Line(points={{1275,698},{
          1316,698},{1316,550},{1338,550}}, color={0,0,127}));
  connect(cooTowSpeCon.y, greaterEqualThreshold.u) annotation (Line(points={{1307,
          -97.1111},{1400,-97.1111},{1400,460},{1378,460},{1378,680},{1200,680},
          {1200,698},{1218,698}},      color={0,0,127}));
  connect(chiOnAtt.y, chiRunTim.u) annotation (Line(points={{1371,-110},{1378,
          -110},{1378,674},{1324,674},{1324,640},{1338,640}}, color={235,0,0}));
  connect(chiWSE.on[1], sigChaChi.u) annotation (Line(points={{695.6,-215.6},{
          868,-215.6},{868,-338},{1438,-338},{1438,660},{1458,660}}, color={255,
          0,255}));
  connect(boiPlaEnaDis.yPla, sigChaBoi.u) annotation (Line(points={{-257,-160},
          {-240,-160},{-240,-372},{1440,-372},{1440,610},{1458,610}}, color={
          255,0,255}));
  connect(conAHU.ySupFan, sigChaFan.u) annotation (Line(points={{424,629.333},{
          436,629.333},{436,748},{1444,748},{1444,560},{1458,560}}, color={255,
          0,255}));
  connect(sigChaChi.u, sigChaCooTow.u) annotation (Line(points={{1458,660},{
          1442,660},{1442,510},{1458,510}}, color={255,0,255}));
  connect(sigChaCooTow.u, sigChaCHWP.u) annotation (Line(points={{1458,510},{
          1446,510},{1446,460},{1458,460}}, color={255,0,255}));
  connect(sigChaCHWP.u, sigChaCWP.u) annotation (Line(points={{1458,460},{1446,
          460},{1446,400},{1458,400}}, color={255,0,255}));
  connect(sigChaBoi.u, sigChaHWP.u) annotation (Line(points={{1458,610},{1446,
          610},{1446,350},{1458,350}}, color={255,0,255}));
  connect(weaBus.TDryBul, cooTow.TAir) annotation (Line(
      points={{-320,180},{-320,-384},{716,-384},{716,-312},{736,-312}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-400,-400},{1440,
            750}})),
    experiment(
      StopTime=3600,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=0.1,
      __Dymola_Algorithm="Euler"));
end BaselineSystem;
