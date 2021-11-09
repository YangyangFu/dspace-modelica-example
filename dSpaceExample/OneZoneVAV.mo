within dSpaceExample;
model OneZoneVAV
  replaceable package MediumA = Buildings.Media.Air;
  replaceable package MediumW = Buildings.Media.Water;
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=0.75
    "Mass flow rate of this thermal zone";
  parameter Modelica.SIunits.Volume VRoo=48*2.7 "Room volume";

  Buildings.Air.Systems.SingleZone.VAV.Examples.BaseClasses.Room zon1(
    redeclare package MediumA = MediumA,
    mAir_flow_nominal=m_flow_nominal,
    lat=weaDat.lat) "Thermal envelope of single zone"
    annotation (Placement(transformation(extent={{50,-20},{90,20}})));
  Buildings.BoundaryConditions.WeatherData.Bus
                                     weaBus annotation (Placement(
        transformation(extent={{-70,110},{-30,150}}),iconTransformation(extent={{-76,80},
            {-56,100}})));
  Buildings.Fluid.Sources.MassFlowSource_T coiSou(
    redeclare package Medium = MediumA,
    m_flow=2*m_flow_nominal,
    use_T_in=false,
    T=285.15,
    use_m_flow_in=false,
    nPorts=2) "Source as cooling coil"            annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,-20})));
  Buildings.Fluid.FixedResistances.PressureDrop res(
    redeclare package Medium = MediumA,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=220 + 20)
    annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));
  Modelica.Blocks.Interfaces.RealOutput TRooAir "Room air temperature"
    annotation (Placement(transformation(extent={{180,-10},{200,10}}),
        iconTransformation(extent={{180,-10},{200,10}})));
  WeatherTable.Chicago weaDat "Chicago"
    annotation (Placement(transformation(extent={{-100,98},{-80,120}})));
  Buildings.Fluid.Sources.Boundary_pT sin(
    redeclare package Medium = MediumA,
    use_T_in=false,
    T=285.15,
    nPorts=2) "sink" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,-132})));
  Buildings.Examples.VAVReheat.ThermalZones.VAVBranch vav1(
    redeclare package MediumA = MediumA,
    redeclare package MediumW = MediumW,
    m_flow_nominal=m_flow_nominal,
    VRoo=VRoo) "Zone for core of buildings (azimuth will be neglected)"
    annotation (Placement(transformation(extent={{-40,0},{0,40}})));
  Buildings.Fluid.Sensors.VolumeFlowRate VSup1(
    redeclare package Medium = MediumA,
    initType=Modelica.Blocks.Types.Init.InitialState,
    m_flow_nominal=m_flow_nominal) "Discharge air flow rate" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={14,60})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TDisVAV1(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{-20,50},{0,70}})));
  Modelica.Blocks.Interfaces.RealOutput TDis "Temperature of the passing fluid"
    annotation (Placement(transformation(extent={{180,70},{200,90}})));
  Modelica.Blocks.Interfaces.RealOutput V1_flow
    "Volume flow rate from port_a to port_b" annotation (Placement(
        transformation(extent={{180,30},{200,50}}),  iconTransformation(extent={
            {160,-26},{180,-6}})));
  Modelica.Blocks.Sources.Constant zer(k=0)
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
  Modelica.Blocks.Interfaces.RealInput yVAV "Signal for VAV damper"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
equation
  connect(weaBus, zon1.weaBus) annotation (Line(
      points={{-50,130},{116,130},{116,40},{56,40},{56,18}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(zon1.TRooAir, TRooAir)
    annotation (Line(points={{91,0},{190,0}}, color={0,0,127}));
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{-82.2,109.22},{-68.1,109.22},{-68.1,130},{-50,130}},
      color={255,204,51},
      thickness=0.5));
  connect(sin.ports[1], zon1.returnAir) annotation (Line(points={{-80,-130},{28,
          -130},{28,-2},{50,-2}}, color={0,127,255}));
  connect(vav1.port_b,TDisVAV1. port_a)
    annotation (Line(points={{-30,40},{-30,60},{-20,60}},
                                                      color={0,127,255}));
  connect(coiSou.ports[1], vav1.port_a)
    annotation (Line(points={{-80,-18},{-30,-18},{-30,0}}, color={0,127,255}));
  connect(TDisVAV1.port_b, VSup1.port_a)
    annotation (Line(points={{0,60},{4,60},{4,60},{4,60}}, color={0,127,255}));
  connect(VSup1.port_b, zon1.supplyAir) annotation (Line(points={{24,60},{30,60},
          {30,2},{50,2}}, color={0,127,255}));
  connect(coiSou.ports[2], res.port_a) annotation (Line(points={{-80,-22},{-62,
          -22},{-62,-70},{-40,-70}}, color={0,127,255}));
  connect(res.port_b, sin.ports[2]) annotation (Line(points={{-20,-70},{20,-70},
          {20,-134},{-80,-134}}, color={0,127,255}));
  connect(TDisVAV1.T, TDis) annotation (Line(points={{-10,71},{-10,100},{160,
          100},{160,80},{190,80}}, color={0,0,127}));
  connect(VSup1.V_flow, V1_flow) annotation (Line(points={{14,71},{14,80},{140,
          80},{140,40},{190,40}}, color={0,0,127}));
  connect(yVAV, vav1.yVAV) annotation (Line(points={{-120,0},{-80,0},{-80,28},{
          -44,28}}, color={0,0,127}));
  connect(zer.y, vav1.yVal) annotation (Line(points={{-79,50},{-60,50},{-60,12},
          {-44,12}}, color={0,0,127}));
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
end OneZoneVAV;
