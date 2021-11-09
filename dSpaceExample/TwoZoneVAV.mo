within dSpaceExample;
model TwoZoneVAV
  replaceable package MediumA = Buildings.Media.Air;
  replaceable package MediumW = Buildings.Media.Water;
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=0.75
    "Mass flow rate of this thermal zone";
  parameter Modelica.SIunits.Volume VRoo=48*2.7 "Room volume";

  Buildings.Air.Systems.SingleZone.VAV.Examples.BaseClasses.Room zon1(
    redeclare package MediumA = MediumA,
    mAir_flow_nominal=m_flow_nominal,
    lat=weaDat.lat) "Thermal envelope of single zone"
    annotation (Placement(transformation(extent={{116,-76},{156,-36}})));
  Buildings.BoundaryConditions.WeatherData.Bus
                                     weaBus annotation (Placement(
        transformation(extent={{-70,110},{-30,150}}),iconTransformation(extent={{-76,80},
            {-56,100}})));
  Buildings.Fluid.Sources.MassFlowSource_T coiSou(
    redeclare package Medium = MediumA,
    m_flow=3*m_flow_nominal,
    use_T_in=false,
    T=285.15,
    use_m_flow_in=false,
    nPorts=3) "Source as cooling coil"            annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,-20})));
  Buildings.Fluid.FixedResistances.PressureDrop res(
    redeclare package Medium = MediumA,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=220 + 20)
    annotation (Placement(transformation(extent={{-18,-130},{2,-110}})));
  Modelica.Blocks.Interfaces.RealOutput TRooAir1 "Room air temperature"
    annotation (Placement(transformation(extent={{180,-66},{200,-46}}),
        iconTransformation(extent={{180,-66},{200,-46}})));
  WeatherTable.Chicago weaDat "Chicago"
    annotation (Placement(transformation(extent={{-100,98},{-80,120}})));
  Buildings.Fluid.Sources.Boundary_pT sin(
    redeclare package Medium = MediumA,
    use_T_in=false,
    T=285.15,
    nPorts=3) "sink" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={170,-120})));
  Buildings.Examples.VAVReheat.ThermalZones.VAVBranch vav1(
    redeclare package MediumA = MediumA,
    redeclare package MediumW = MediumW,
    m_flow_nominal=m_flow_nominal,
    VRoo=VRoo) "Zone for core of buildings (azimuth will be neglected)"
    annotation (Placement(transformation(extent={{-40,-100},{0,-60}})));
  Buildings.Fluid.Sensors.VolumeFlowRate VSup1(
    redeclare package Medium = MediumA,
    initType=Modelica.Blocks.Types.Init.InitialState,
    m_flow_nominal=m_flow_nominal) "Discharge air flow rate" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={70,-40})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TDisVAV1(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-16,-50},{4,-30}})));
  Modelica.Blocks.Interfaces.RealOutput TDis1
    "Temperature of the passing fluid"
    annotation (Placement(transformation(extent={{180,-10},{200,10}})));
  Modelica.Blocks.Interfaces.RealOutput V1_flow
    "Volume flow rate from port_a to port_b" annotation (Placement(
        transformation(extent={{180,-34},{200,-14}}),iconTransformation(extent={
            {160,-26},{180,-6}})));
  Modelica.Blocks.Sources.Constant zer(k=0)
    annotation (Placement(transformation(extent={{-100,10},{-80,30}})));
  Modelica.Blocks.Interfaces.RealInput yVAV1 "Signal for VAV damper"
    annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
  Modelica.Blocks.Interfaces.RealInput yVAV2 "Signal for VAV damper"
    annotation (Placement(transformation(extent={{-140,40},{-100,80}})));
  Modelica.Blocks.Interfaces.RealOutput TDis2
    "Temperature of the passing fluid"
    annotation (Placement(transformation(extent={{180,90},{200,110}})));
  Modelica.Blocks.Interfaces.RealOutput TRooAir2 "Room air temperature"
    annotation (Placement(transformation(extent={{180,34},{200,54}}),
        iconTransformation(extent={{180,-66},{200,-46}})));
  Modelica.Blocks.Interfaces.RealOutput V2_flow
    "Volume flow rate from port_a to port_b" annotation (Placement(
        transformation(extent={{180,66},{200,86}}), iconTransformation(extent={
            {160,-26},{180,-6}})));
  Buildings.Examples.VAVReheat.ThermalZones.VAVBranch vav2(
    redeclare package MediumA = MediumA,
    redeclare package MediumW = MediumW,
    m_flow_nominal=m_flow_nominal,
    VRoo=VRoo) "Zone for core of buildings (azimuth will be neglected)"
    annotation (Placement(transformation(extent={{-40,40},{0,80}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TDisVAV2(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
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
equation
  connect(weaBus, zon1.weaBus) annotation (Line(
      points={{-50,130},{108,130},{108,-38},{122,-38}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(zon1.TRooAir, TRooAir1)
    annotation (Line(points={{157,-56},{190,-56}}, color={0,0,127}));
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{-82.2,109.22},{-68.1,109.22},{-68.1,130},{-50,130}},
      color={255,204,51},
      thickness=0.5));
  connect(sin.ports[1], zon1.returnAir) annotation (Line(points={{160,-117.333},
          {100,-117.333},{100,-58},{116,-58}}, color={0,127,255}));
  connect(vav1.port_b,TDisVAV1. port_a)
    annotation (Line(points={{-30,-60},{-30,-40},{-16,-40}},
                                                      color={0,127,255}));
  connect(coiSou.ports[1], vav1.port_a) annotation (Line(points={{-80,-17.3333},
          {-52,-17.3333},{-52,-116},{-30,-116},{-30,-100}},
                                                  color={0,127,255}));
  connect(TDisVAV1.port_b, VSup1.port_a)
    annotation (Line(points={{4,-40},{60,-40}}, color={0,127,255}));
  connect(VSup1.port_b, zon1.supplyAir) annotation (Line(points={{80,-40},{100,
          -40},{100,-54},{116,-54}}, color={0,127,255}));
  connect(coiSou.ports[2], res.port_a) annotation (Line(points={{-80,-20},{-62,
          -20},{-62,-120},{-18,-120}}, color={0,127,255}));
  connect(res.port_b, sin.ports[2]) annotation (Line(points={{2,-120},{82,-120},
          {82,-120},{160,-120}}, color={0,127,255}));
  connect(TDisVAV1.T, TDis1)
    annotation (Line(points={{-6,-29},{-6,0},{190,0}}, color={0,0,127}));
  connect(VSup1.V_flow, V1_flow) annotation (Line(points={{70,-29},{70,-20},{
          140,-20},{140,-24},{190,-24}}, color={0,0,127}));
  connect(yVAV1, vav1.yVAV) annotation (Line(points={{-120,-60},{-80,-60},{-80,
          -72},{-44,-72}}, color={0,0,127}));
  connect(zer.y, vav1.yVal) annotation (Line(points={{-79,20},{-60,20},{-60,-88},
          {-44,-88}}, color={0,0,127}));
  connect(vav2.port_b,TDisVAV2. port_a)
    annotation (Line(points={{-30,80},{-30,100},{-16,100}},
                                                      color={0,127,255}));
  connect(TDisVAV2.port_b, VSup2.port_a)
    annotation (Line(points={{4,100},{60,100}}, color={0,127,255}));
  connect(VSup2.port_b, zon2.supplyAir) annotation (Line(points={{80,100},{100,
          100},{100,86},{116,86}}, color={0,127,255}));
  connect(yVAV2, vav2.yVAV) annotation (Line(points={{-120,60},{-84,60},{-84,68},
          {-44,68}}, color={0,0,127}));
  connect(zer.y, vav2.yVal) annotation (Line(points={{-79,20},{-60,20},{-60,52},
          {-44,52}}, color={0,0,127}));
  connect(zon2.TRooAir, TRooAir2) annotation (Line(points={{157,84},{166,84},{
          166,44},{190,44}}, color={0,0,127}));
  connect(TDisVAV2.T, TDis2) annotation (Line(points={{-6,111},{-6,124},{170,
          124},{170,100},{190,100}}, color={0,0,127}));
  connect(VSup2.V_flow, V2_flow) annotation (Line(points={{70,111},{70,120},{
          168,120},{168,76},{190,76}}, color={0,0,127}));
  connect(weaBus, zon2.weaBus) annotation (Line(
      points={{-50,130},{122,130},{122,102}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(zon2.returnAir, sin.ports[3]) annotation (Line(points={{116,82},{94,
          82},{94,-122.667},{160,-122.667}}, color={0,127,255}));
  connect(coiSou.ports[3], vav2.port_a) annotation (Line(points={{-80,-22.6667},
          {-30,-22.6667},{-30,40}}, color={0,127,255}));
  annotation (Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-140},{180,140}})), Icon(
        graphics={Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-159,152},{141,112}},
          lineColor={0,0,255},
          textString="%name")}),
    experiment(
      StopTime=60,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Euler"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=4,
        InlineOrder=2,
        InlineFixedStep=0.001)));
end TwoZoneVAV;
