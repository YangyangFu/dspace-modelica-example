within dSpaceExample;
model OneZoneVAVUnitConvertedFullRange
  "One zone VAV system with full range conversion"
  replaceable package MediumA = Buildings.Media.Air;
  replaceable package MediumW = Buildings.Media.Water;
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=0.75
    "Mass flow rate of this thermal zone";
  parameter Modelica.SIunits.Volume VRoo=48*2.7 "Room volume";

  Buildings.BoundaryConditions.WeatherData.Bus weaBus annotation (Placement(
        transformation(extent={{-70,110},{-30,150}}),iconTransformation(extent={{-76,80},
            {-56,100}})));
  Buildings.Fluid.Sources.MassFlowSource_T coiSou(
    redeclare package Medium = MediumA,
    m_flow=3*m_flow_nominal,
    use_T_in=false,
    T=285.15,
    use_m_flow_in=true,
    nPorts=2) "Source as cooling coil"            annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-36,-54})));
  Buildings.Fluid.FixedResistances.PressureDrop res(
    redeclare package Medium = MediumA,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=220 + 20 + 91)
    annotation (Placement(transformation(extent={{-10,-130},{10,-110}})));
  WeatherTable.Chicago weaDat "Chicago"
    annotation (Placement(transformation(extent={{-100,98},{-80,120}})));
  Buildings.Fluid.Sources.Boundary_pT sin(
    redeclare package Medium = MediumA,
    use_T_in=false,
    T=285.15,
    nPorts=2) "sink" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={170,-120})));
  Modelica.Blocks.Interfaces.RealInput yVAV2 "Voltage signal for VAV damper"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealOutput TDis2_V
    "Temperature of the passing fluid" annotation (Placement(transformation(
          extent={{180,-60},{200,-40}}), iconTransformation(extent={{180,-60},{
            200,-40}})));
  Modelica.Blocks.Interfaces.RealOutput TRooAir2_V "Room air temperature"
    annotation (Placement(transformation(extent={{180,-100},{200,-80}}),
        iconTransformation(extent={{180,-100},{200,-80}})));
  Modelica.Blocks.Interfaces.RealOutput V2_flow_V
    "Volume flow rate from port_a to port_b" annotation (Placement(
        transformation(extent={{180,-80},{200,-60}}), iconTransformation(extent=
           {{180,-80},{200,-60}})));
  Buildings.Examples.VAVReheat.ThermalZones.VAVBranch vav2(
    redeclare package MediumA = MediumA,
    redeclare package MediumW = MediumW,
    m_flow_nominal=m_flow_nominal,
    VRoo=VRoo) "Zone for core of buildings (azimuth will be neglected)"
    annotation (Placement(transformation(extent={{-40,40},{0,80}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TDisVAV2(redeclare package Medium
      = MediumA, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-16,90},{4,110}})));
  Buildings.Fluid.Sensors.VolumeFlowRate VSup2(
    redeclare package Medium = MediumA,
    initType=Modelica.Blocks.Types.Init.InitialState,
    m_flow_nominal=m_flow_nominal) "Discharge air flow rate" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,100})));
  Buildings.Air.Systems.SingleZone.VAV.Examples.BaseClasses.Room zon2(
    redeclare package MediumA = MediumA,
    mAir_flow_nominal=m_flow_nominal,
    lat=weaDat.lat) "Thermal envelope of single zone"
    annotation (Placement(transformation(extent={{116,64},{156,104}})));
  UnitConversion.FromAnalog volToUni_yvav2(
    v_min=0,
    v_max=10,
    y_min=0,
    y_max=1) annotation (Placement(transformation(extent={{-88,50},{-68,70}})));
  UnitConversion.VToCFM vToCFM_vav2
    annotation (Placement(transformation(extent={{100,164},{120,184}})));
  UnitConversion.ToAnolog toV(
    x_min=0,
    x_max=1400,
    v_min=0,
    v_max=5)
    annotation (Placement(transformation(extent={{130,164},{150,184}})));
  UnitConversion.KToF kToF
    annotation (Placement(transformation(extent={{100,194},{120,214}})));
  UnitConversion.ToAnolog toV1(
    x_min=45,
    x_max=95,
    v_min=0,
    v_max=5) "0C-50C mapping to 0 - 5V"
    annotation (Placement(transformation(extent={{130,194},{150,214}})));
  UnitConversion.KToF kToF1
    annotation (Placement(transformation(extent={{100,134},{120,154}})));
  UnitConversion.ToAnolog toV2(
    x_min=25,
    x_max=125,
    v_min=0,
    v_max=5) "10c-40c mapping to 0-5v"
    annotation (Placement(transformation(extent={{130,134},{150,154}})));
  Modelica.Blocks.Interfaces.RealOutput TOut_V "Outdoor air temp" annotation (
      Placement(transformation(extent={{180,130},{200,150}}),
        iconTransformation(extent={{180,140},{200,160}})));
  Modelica.Blocks.Interfaces.RealOutput RHOut_V "Outdoor air rh" annotation (
      Placement(transformation(extent={{180,110},{200,130}}),
        iconTransformation(extent={{180,120},{200,140}})));
  UnitConversion.ToAnolog toV_TOut(
    x_min=-20,
    x_max=120,
    v_min=0,
    v_max=10) "-20F-120F  mapping to 0 - 5V"
    annotation (Placement(transformation(extent={{130,260},{150,280}})));
  UnitConversion.ToAnolog toV_RHOut(
    x_min=0,
    x_max=100,
    v_min=0,
    v_max=10) "1-100 mapping to 0 - 10V"
    annotation (Placement(transformation(extent={{130,230},{150,250}})));
  UnitConversion.KToF kToF_TOut
    annotation (Placement(transformation(extent={{90,260},{110,280}})));
  Modelica.Blocks.Math.Gain gain(k=100)
    annotation (Placement(transformation(extent={{92,230},{112,250}})));
  Modelica.Blocks.Interfaces.RealOutput TOut "Outdoor air temp" annotation (
      Placement(transformation(extent={{192,-112},{212,-92}}),
        iconTransformation(extent={{180,-20},{200,0}})));
  Modelica.Blocks.Interfaces.RealOutput RHOut "Outdoor air rh" annotation (
      Placement(transformation(extent={{192,-132},{212,-112}}),
        iconTransformation(extent={{180,-40},{200,-20}})));
  Modelica.Blocks.Interfaces.RealOutput TDis2
    "Temperature of the passing fluid" annotation (Placement(transformation(
          extent={{192,-150},{212,-130}}), iconTransformation(extent={{180,100},
            {200,120}})));
  Modelica.Blocks.Interfaces.RealOutput V2_flow
    "Volume flow rate from port_a to port_b" annotation (Placement(
        transformation(extent={{192,-174},{212,-154}}), iconTransformation(
          extent={{180,80},{200,100}})));
  Modelica.Blocks.Interfaces.RealOutput TRooAir2 "Room air temperature"
    annotation (Placement(transformation(extent={{192,-206},{212,-186}}),
        iconTransformation(extent={{180,60},{200,80}})));
  Modelica.Blocks.Sources.RealExpression modTim(y=time) "Modelica time"
    annotation (Placement(transformation(extent={{130,290},{150,310}})));
  Modelica.Blocks.Interfaces.RealOutput t "Value of Real output" annotation (
      Placement(transformation(extent={{180,160},{200,180}}),
        iconTransformation(extent={{180,160},{200,180}})));
  Modelica.Blocks.Interfaces.RealInput yHea2 "Voltage signal for heating coil"
    annotation (Placement(transformation(extent={{-140,0},{-100,40}})));
  UnitConversion.FromAnalog volToUni_yhea(
    v_min=0,
    v_max=10,
    y_min=0,
    y_max=1) annotation (Placement(transformation(extent={{-90,12},{-70,32}})));
  Modelica.Blocks.Sources.Constant mSou(k=2*m_flow_nominal)
    annotation (Placement(transformation(extent={{-100,-84},{-80,-64}})));
  Modelica.Blocks.Logical.Switch swi
    annotation (Placement(transformation(extent={{-84,-48},{-64,-28}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean(threshold=0.05)
    annotation (Placement(transformation(extent={{-126,-40},{-106,-20}})));
  Modelica.Blocks.Sources.Constant zer(k=0)
    annotation (Placement(transformation(extent={{-100,-122},{-80,-102}})));
equation
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{-82.2,109.22},{-68.1,109.22},{-68.1,130},{-50,130}},
      color={255,204,51},
      thickness=0.5));
  connect(coiSou.ports[1], res.port_a) annotation (Line(points={{-26,-52},{-26,
          -122},{-16,-122},{-16,-120},{-10,-120}},
                                       color={0,127,255}));
  connect(res.port_b, sin.ports[1]) annotation (Line(points={{10,-120},{82,-120},
          {82,-118},{160,-118}}, color={0,127,255}));
  connect(vav2.port_b,TDisVAV2. port_a)
    annotation (Line(points={{-30,80},{-30,100},{-16,100}},
                                                      color={0,127,255}));
  connect(TDisVAV2.port_b, VSup2.port_a)
    annotation (Line(points={{4,100},{60,100}}, color={0,127,255}));
  connect(VSup2.port_b, zon2.supplyAir) annotation (Line(points={{80,100},{100,
          100},{100,86},{116,86}}, color={0,127,255}));
  connect(weaBus, zon2.weaBus) annotation (Line(
      points={{-50,130},{122,130},{122,102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(yVAV2, volToUni_yvav2.v)
    annotation (Line(points={{-120,60},{-90,60}}, color={0,0,127}));
  connect(volToUni_yvav2.y, vav2.yVAV) annotation (Line(points={{-67,60},{-60,
          60},{-60,68},{-44,68}},
                              color={0,0,127}));
  connect(VSup2.V_flow, vToCFM_vav2.V_flow)
    annotation (Line(points={{70,111},{70,174},{98,174}}, color={0,0,127}));
  connect(vav2.port_a, coiSou.ports[2]) annotation (Line(points={{-30,40},{-30,
          -56},{-26,-56}}, color={0,127,255}));
  connect(vToCFM_vav2.CFM, toV.x)
    annotation (Line(points={{121,174},{128,174}}, color={0,0,127}));
  connect(toV.v, V2_flow_V) annotation (Line(points={{151,174},{170,174},{170,
          -70},{190,-70}}, color={0,0,127}));
  connect(TDisVAV2.T, kToF.K)
    annotation (Line(points={{-6,111},{-6,204},{98,204}}, color={0,0,127}));
  connect(kToF.F, toV1.x)
    annotation (Line(points={{121,204},{128,204}}, color={0,0,127}));
  connect(toV1.v, TDis2_V) annotation (Line(points={{151,204},{174,204},{174,
          -50},{190,-50}}, color={0,0,127}));
  connect(zon2.TRooAir, kToF1.K) annotation (Line(points={{157,84},{156,84},{156,
          120},{86,120},{86,144},{98,144}}, color={0,0,127}));
  connect(kToF1.F, toV2.x)
    annotation (Line(points={{121,144},{128,144}}, color={0,0,127}));
  connect(toV2.v, TRooAir2_V) annotation (Line(points={{151,144},{166,144},{166,
          -90},{190,-90}}, color={0,0,127}));
  connect(kToF_TOut.F, toV_TOut.x) annotation (Line(points={{111,270},{120.5,
          270},{120.5,270},{128,270}}, color={0,0,127}));
  connect(weaBus.TDryBul, kToF_TOut.K) annotation (Line(
      points={{-50,130},{-50,270},{88,270}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(toV_TOut.v, TOut_V) annotation (Line(points={{151,270},{168,270},{168,
          140},{190,140}}, color={0,0,127}));
  connect(toV_RHOut.v, RHOut_V) annotation (Line(points={{151,240},{164,240},{
          164,120},{190,120}}, color={0,0,127}));
  connect(gain.y, toV_RHOut.x)
    annotation (Line(points={{113,240},{128,240}}, color={0,0,127}));
  connect(weaBus.relHum, gain.u) annotation (Line(
      points={{-50,130},{-50,240},{90,240}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(kToF_TOut.F, TOut) annotation (Line(points={{111,270},{120,270},{120,
          290},{26,290},{26,-102},{202,-102}}, color={0,0,127}));
  connect(gain.y, RHOut) annotation (Line(points={{113,240},{118,240},{118,254},
          {26,254},{26,-122},{202,-122}}, color={0,0,127}));
  connect(kToF.F, TDis2) annotation (Line(points={{121,204},{124,204},{124,226},
          {14,226},{14,-140},{202,-140}}, color={0,0,127}));
  connect(vToCFM_vav2.CFM, V2_flow) annotation (Line(points={{121,174},{124,174},
          {124,190},{26,190},{26,-164},{202,-164}}, color={0,0,127}));
  connect(kToF1.F, TRooAir2) annotation (Line(points={{121,144},{124,144},{124,
          158},{26,158},{26,-196},{202,-196}}, color={0,0,127}));
  connect(modTim.y, t) annotation (Line(points={{151,300},{162,300},{162,170},{
          190,170}}, color={0,0,127}));
  connect(zon2.returnAir, sin.ports[2]) annotation (Line(points={{116,82},{102,
          82},{102,-128},{160,-128},{160,-122}}, color={0,127,255}));
  connect(yHea2, volToUni_yhea.v) annotation (Line(points={{-120,20},{-108,20},
          {-108,22},{-92,22}}, color={0,0,127}));
  connect(volToUni_yhea.y, vav2.yVal) annotation (Line(points={{-69,22},{-58,22},
          {-58,52},{-44,52}}, color={0,0,127}));
  connect(volToUni_yvav2.y, realToBoolean.u) annotation (Line(points={{-67,60},
          {-62,60},{-62,-4},{-152,-4},{-152,-30},{-128,-30}}, color={0,0,127}));
  connect(realToBoolean.y, swi.u2) annotation (Line(points={{-105,-30},{-96,-30},
          {-96,-38},{-86,-38}}, color={255,0,255}));
  connect(mSou.y, swi.u1) annotation (Line(points={{-79,-74},{-70,-74},{-70,-18},
          {-94,-18},{-94,-30},{-86,-30}}, color={0,0,127}));
  connect(zer.y, swi.u3) annotation (Line(points={{-79,-112},{-74,-112},{-74,
          -54},{-96,-54},{-96,-46},{-86,-46}}, color={0,0,127}));
  connect(swi.y, coiSou.m_flow_in) annotation (Line(points={{-63,-38},{-56,-38},
          {-56,-46},{-48,-46}}, color={0,0,127}));
  annotation (Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-240},{180,300}})), Icon(
        coordinateSystem(extent={{-100,-240},{180,300}}),
        graphics={Rectangle(
          extent={{-102,300},{102,-240}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-157,344},{143,304}},
          lineColor={0,0,255},
          textString="%name")}),
    experiment(
      StopTime=86400,
      __Dymola_fixedstepsize=0.01,
      __Dymola_Algorithm="Euler"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=0,
        InlineOrder=2,
        InlineFixedStep=0.001)));
end OneZoneVAVUnitConvertedFullRange;
