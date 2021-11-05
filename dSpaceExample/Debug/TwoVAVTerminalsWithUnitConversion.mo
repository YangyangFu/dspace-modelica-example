within dSpaceExample.Debug;
model TwoVAVTerminalsWithUnitConversion
  replaceable package MediumA = Buildings.Media.Air;
  replaceable package MediumW = Buildings.Media.Water;
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=0.75
    "Mass flow rate of this thermal zone";
  parameter Modelica.SIunits.Volume VRoo=48*2.7 "Room volume";

  Buildings.Examples.VAVReheat.ThermalZones.VAVBranch vav1(
    redeclare package MediumA = MediumA,
    redeclare package MediumW = MediumW,
    m_flow_nominal=m_flow_nominal,
    VRoo=VRoo) "Zone for core of buildings (azimuth will be neglected)"
    annotation (Placement(transformation(extent={{20,-60},{60,-20}})));
  Modelica.Blocks.Sources.Constant zer(k=0)
    annotation (Placement(transformation(extent={{-94,30},{-74,50}})));

  Modelica.Blocks.Interfaces.RealInput yVAV1 "Signal for VAV damper"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Fluid.Sources.Boundary_pT rooSin(redeclare package Medium = MediumA,
      nPorts=3) "Room sink" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={148,-88})));
  Buildings.Examples.VAVReheat.ThermalZones.VAVBranch vav2(
    redeclare package MediumA = MediumA,
    redeclare package MediumW = MediumW,
    m_flow_nominal=m_flow_nominal,
    VRoo=VRoo) "Zone for core of buildings (azimuth will be neglected)"
    annotation (Placement(transformation(extent={{20,42},{60,82}})));
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
  Buildings.Fluid.Sensors.VolumeFlowRate VSup2(
    redeclare package Medium = MediumA,
    initType=Modelica.Blocks.Types.Init.InitialState,
    m_flow_nominal=m_flow_nominal) "Discharge air flow rate" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={66,100})));
  Buildings.Fluid.Sensors.VolumeFlowRate VSup1(
    redeclare package Medium = MediumA,
    initType=Modelica.Blocks.Types.Init.InitialState,
    m_flow_nominal=m_flow_nominal) "Discharge air flow rate" annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={74,0})));
  Modelica.Blocks.Interfaces.RealOutput V2_flow
    "Volume flow rate from port_a to port_b" annotation (Placement(
        transformation(extent={{160,74},{180,94}}), iconTransformation(extent={{
            160,74},{180,94}})));
  Modelica.Blocks.Interfaces.RealOutput V1_flow
    "Volume flow rate from port_a to port_b" annotation (Placement(
        transformation(extent={{160,-26},{180,-6}}), iconTransformation(extent={
            {160,-26},{180,-6}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TDisVAV1(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort TDisVAV2(redeclare package Medium =
        MediumA, m_flow_nominal=m_flow_nominal)
    annotation (Placement(transformation(extent={{32,90},{52,110}})));
  Modelica.Blocks.Interfaces.RealOutput TDis2
    "Temperature of the passing fluid"
    annotation (Placement(transformation(extent={{160,90},{180,110}})));
  Modelica.Blocks.Interfaces.RealOutput TDis1
    "Temperature of the passing fluid"
    annotation (Placement(transformation(extent={{160,-10},{180,10}})));
  UnitConversion.VoltageToUnit volToUni_yvav2(
    vol_min=2,
    vol_max=10,
    y_min=0,
    y_max=1) annotation (Placement(transformation(extent={{-60,60},{-40,80}})));
  UnitConversion.VoltageToUnit volToUni_yvav1(
    vol_min=2,
    vol_max=10,
    y_min=0,
    y_max=1) annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  UnitConversion.VToCFM vToCFM_vav2
    annotation (Placement(transformation(extent={{112,110},{132,130}})));
  UnitConversion.VToCFM vToCFM_vav1
    annotation (Placement(transformation(extent={{100,10},{120,30}})));
equation
  connect(zer.y, vav1.yVal) annotation (Line(points={{-73,40},{-4,40},{-4,-48},{
          16,-48}}, color={0,0,127}));
  connect(zer.y, vav2.yVal) annotation (Line(points={{-73,40},{-4,40},{-4,54},{16,
          54}}, color={0,0,127}));
  connect(coiSou.ports[1], vav1.port_a) annotation (Line(points={{-40,-87.3333},
          {30,-87.3333},{30,-60}}, color={0,127,255}));
  connect(coiSou.ports[2], vav2.port_a) annotation (Line(points={{-40,-90},{-20,
          -90},{-20,20},{30,20},{30,42}}, color={0,127,255}));
  connect(coiSou.ports[3], byp.port_a) annotation (Line(points={{-40,-92.6667},
          {-20,-92.6667},{-20,-110},{32,-110}},color={0,127,255}));
  connect(byp.port_b, rooSin.ports[1]) annotation (Line(points={{52,-110},{92,
          -110},{92,-58},{145.333,-58},{145.333,-78}},
                                 color={0,127,255}));
  connect(vav1.port_b, TDisVAV1.port_a)
    annotation (Line(points={{30,-20},{30,0},{40,0}}, color={0,127,255}));
  connect(TDisVAV1.port_b, VSup1.port_a)
    annotation (Line(points={{60,0},{64,0}}, color={0,127,255}));
  connect(vav2.port_b, TDisVAV2.port_a)
    annotation (Line(points={{30,82},{30,100},{32,100}}, color={0,127,255}));
  connect(TDisVAV2.port_b, VSup2.port_a)
    annotation (Line(points={{52,100},{56,100}}, color={0,127,255}));
  connect(TDisVAV2.T, TDis2) annotation (Line(points={{42,111},{42,122},{158,
          122},{158,100},{170,100}}, color={0,0,127}));
  connect(TDisVAV1.T, TDis1) annotation (Line(points={{50,11},{50,22},{142,22},
          {142,0},{170,0}}, color={0,0,127}));
  connect(VSup2.port_b, rooSin.ports[2]) annotation (Line(points={{76,100},{148,
          100},{148,-78}}, color={0,127,255}));
  connect(VSup1.port_b, rooSin.ports[3]) annotation (Line(points={{84,0},{126,0},
          {126,-46},{150,-46},{150,-78},{150.667,-78}}, color={0,127,255}));
  connect(volToUni_yvav2.y, vav2.yVAV)
    annotation (Line(points={{-39,70},{16,70}}, color={0,0,127}));
  connect(volToUni_yvav2.vol, yVAV2)
    annotation (Line(points={{-62,70},{-120,70}}, color={0,0,127}));
  connect(vav1.yVAV, volToUni_yvav1.y) annotation (Line(points={{16,-32},{0,-32},
          {0,0},{-39,0}}, color={0,0,127}));
  connect(volToUni_yvav1.vol, yVAV1)
    annotation (Line(points={{-62,0},{-120,0}}, color={0,0,127}));
  connect(VSup2.V_flow, vToCFM_vav2.V_flow)
    annotation (Line(points={{66,111},{66,120},{110,120}}, color={0,0,127}));
  connect(vToCFM_vav2.CFM, V2_flow) annotation (Line(points={{133,120},{154,120},
          {154,84},{170,84}}, color={0,0,127}));
  connect(VSup1.V_flow, vToCFM_vav1.V_flow)
    annotation (Line(points={{74,11},{74,20},{98,20}}, color={0,0,127}));
  connect(vToCFM_vav1.CFM, V1_flow) annotation (Line(points={{121,20},{138,20},
          {138,-16},{170,-16}}, color={0,0,127}));
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
      StopTime=86400,
      Tolerance=0.001,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Euler"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=4,
        InlineOrder=4,
        InlineFixedStep=0.001)));
end TwoVAVTerminalsWithUnitConversion;
