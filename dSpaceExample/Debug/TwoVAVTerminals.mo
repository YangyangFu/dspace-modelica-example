within dSpaceExample.Debug;
model TwoVAVTerminals
  replaceable package MediumA = Buildings.Media.Air;
  replaceable package MediumW = Buildings.Media.Water;
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=0.75
    "Mass flow rate of this thermal zone";
  parameter Modelica.SIunits.Volume VRoo=48*2.7 "Room volume";

  Modelica.Blocks.Sources.Constant zer(k=0)
    annotation (Placement(transformation(extent={{-94,30},{-74,50}})));

  Modelica.Blocks.Interfaces.RealInput yVAV1 "Signal for VAV damper"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Fluid.Sources.Boundary_pT rooSin(redeclare package Medium = MediumA,
      nPorts=3) "Room sink" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={148,-88})));
  Modelica.Blocks.Interfaces.RealInput yVAV2 "Signal for VAV damper"
    annotation (Placement(transformation(extent={{-140,50},{-100,90}})));
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
        origin={-50,-90})));
  Buildings.Fluid.FixedResistances.PressureDrop byp(
    redeclare package Medium = MediumA,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=220 + 20)
                    "Bypass"
    annotation (Placement(transformation(extent={{32,-120},{52,-100}})));
  Modelica.Blocks.Interfaces.RealOutput V2_flow
    "Volume flow rate from port_a to port_b" annotation (Placement(
        transformation(extent={{160,74},{180,94}}), iconTransformation(extent={{
            160,74},{180,94}})));
  Modelica.Blocks.Interfaces.RealOutput V1_flow
    "Volume flow rate from port_a to port_b" annotation (Placement(
        transformation(extent={{160,-26},{180,-6}}), iconTransformation(extent={
            {160,-26},{180,-6}})));
  Modelica.Blocks.Interfaces.RealOutput TDis2
    "Temperature of the passing fluid"
    annotation (Placement(transformation(extent={{160,90},{180,110}})));
  Modelica.Blocks.Interfaces.RealOutput TDis1
    "Temperature of the passing fluid"
    annotation (Placement(transformation(extent={{160,-10},{180,10}})));
  Buildings.Examples.VAVReheat.ThermalZones.VAVBranch vav1(
    redeclare package MediumA = MediumA,
    redeclare package MediumW = MediumW,
    m_flow_nominal=m_flow_nominal,
    VRoo=VRoo) "Zone for core of buildings (azimuth will be neglected)"
    annotation (Placement(transformation(extent={{0,-60},{40,-20}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TDisVAV1(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Buildings.Fluid.Sensors.VolumeFlowRate VSup1(
    redeclare package Medium = MediumA,
    initType=Modelica.Blocks.Types.Init.InitialState,
    m_flow_nominal=m_flow_nominal) "Discharge air flow rate" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={54,0})));
  Buildings.Examples.VAVReheat.ThermalZones.VAVBranch vav2(
    redeclare package MediumA = MediumA,
    redeclare package MediumW = MediumW,
    m_flow_nominal=m_flow_nominal,
    VRoo=VRoo) "Zone for core of buildings (azimuth will be neglected)"
    annotation (Placement(transformation(extent={{-2,30},{38,70}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TDisVAV2(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{18,80},{38,100}})));
  Buildings.Fluid.Sensors.VolumeFlowRate VSup2(
    redeclare package Medium = MediumA,
    initType=Modelica.Blocks.Types.Init.InitialState,
    m_flow_nominal=m_flow_nominal) "Discharge air flow rate" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={52,90})));

equation
  connect(coiSou.ports[1], byp.port_a) annotation (Line(points={{-40,-87.3333},
          {-20,-87.3333},{-20,-110},{32,-110}},color={0,127,255}));
  connect(byp.port_b, rooSin.ports[1]) annotation (Line(points={{52,-110},{92,
          -110},{92,-58},{145.333,-58},{145.333,-78}},
                                 color={0,127,255}));
  connect(vav1.port_b,TDisVAV1. port_a)
    annotation (Line(points={{10,-20},{10,0},{20,0}}, color={0,127,255}));
  connect(VSup1.V_flow, V1_flow) annotation (Line(points={{54,11},{54,18},{118,18},
          {118,-16},{170,-16}},     color={0,0,127}));
  connect(TDisVAV1.T, TDis1) annotation (Line(points={{30,11},{30,22},{122,22},{
          122,0},{170,0}},  color={0,0,127}));
  connect(VSup1.port_b, rooSin.ports[2]) annotation (Line(points={{64,0},{104,0},
          {104,-70},{148,-70},{148,-78}}, color={0,127,255}));
  connect(vav1.port_a, coiSou.ports[2]) annotation (Line(points={{10,-60},{-16,-60},
          {-16,-90},{-40,-90}}, color={0,127,255}));
  connect(yVAV1, vav1.yVAV) annotation (Line(points={{-120,0},{-64,0},{-64,-32},
          {-4,-32}}, color={0,0,127}));
  connect(zer.y, vav1.yVal) annotation (Line(points={{-73,40},{-38,40},{-38,-48},
          {-4,-48}}, color={0,0,127}));
  connect(vav2.port_b, TDisVAV2.port_a)
    annotation (Line(points={{8,70},{8,90},{18,90}}, color={0,127,255}));
  connect(TDisVAV2.port_b, VSup2.port_a)
    annotation (Line(points={{38,90},{42,90}}, color={0,127,255}));
  connect(VSup2.port_b, rooSin.ports[3]) annotation (Line(points={{62,90},{108,
          90},{108,-64},{150.667,-64},{150.667,-78}},
                                                  color={0,127,255}));
  connect(vav2.port_a, coiSou.ports[3]) annotation (Line(points={{8,30},{8,14},
          {-22,14},{-22,-92.6667},{-40,-92.6667}},color={0,127,255}));
  connect(zer.y, vav2.yVal) annotation (Line(points={{-73,40},{-38,40},{-38,42},
          {-6,42}}, color={0,0,127}));
  connect(yVAV2, vav2.yVAV) annotation (Line(points={{-120,70},{-64,70},{-64,58},
          {-6,58}}, color={0,0,127}));
  connect(TDisVAV2.T, TDis2) annotation (Line(points={{28,101},{28,106},{138,106},
          {138,100},{170,100}}, color={0,0,127}));
  connect(VSup2.V_flow, V2_flow) annotation (Line(points={{52,101},{52,116},{146,
          116},{146,84},{170,84}}, color={0,0,127}));
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
      StopTime=3600,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Euler"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=4,
        InlineOrder=2,
        InlineFixedStep=0.001)));
end TwoVAVTerminals;
