within dSpaceExample;
model SimpleTwoZone
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
  Buildings.Air.Systems.SingleZone.VAV.Examples.BaseClasses.Room zon1(
    redeclare package MediumA = MediumA,
    mAir_flow_nominal=m_flow_nominal,
    lat=weaDat.lat) "Thermal envelope of single zone"
    annotation (Placement(transformation(extent={{116,-98},{156,-58}})));
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
      computeWetBulbTemperature=false, filNam=
        Modelica.Utilities.Files.loadResource("modelica://Buildings/Resources/weatherdata/DRYCOLD.mos"))
    annotation (Placement(transformation(extent={{-100,120},{-80,140}})));
  Buildings.BoundaryConditions.WeatherData.Bus
                                     weaBus annotation (Placement(
        transformation(extent={{-70,110},{-30,150}}),iconTransformation(extent={{-76,80},
            {-56,100}})));
  Modelica.Fluid.Sources.Boundary_pT rooSin(redeclare package Medium = MediumA,
      nPorts=3) "Room sink" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={100,-130})));
  Buildings.Air.Systems.SingleZone.VAV.Examples.BaseClasses.Room zon2(
    redeclare package MediumA = MediumA,
    mAir_flow_nominal=m_flow_nominal,
    lat=weaDat.lat) "Thermal envelope of single zone"
    annotation (Placement(transformation(extent={{114,44},{154,84}})));
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
        origin={66,0})));
  Modelica.Blocks.Interfaces.RealOutput V2_flow
    "Volume flow rate from port_a to port_b" annotation (Placement(
        transformation(extent={{160,74},{180,94}}), iconTransformation(extent={{
            160,74},{180,94}})));
  Modelica.Blocks.Interfaces.RealOutput V1_flow
    "Volume flow rate from port_a to port_b" annotation (Placement(
        transformation(extent={{160,-26},{180,-6}}), iconTransformation(extent={
            {160,-26},{180,-6}})));
  Modelica.Blocks.Interfaces.RealOutput TRooAir2
                                                "Room air temperature"
    annotation (Placement(transformation(extent={{160,54},{180,74}}),
        iconTransformation(extent={{160,54},{180,74}})));
  Modelica.Blocks.Interfaces.RealOutput TRooAir1
                                                "Room air temperature"
    annotation (Placement(transformation(extent={{160,-46},{180,-26}}),
        iconTransformation(extent={{160,-46},{180,-26}})));
equation
  connect(zer.y, vav1.yVal) annotation (Line(points={{-73,40},{-4,40},{-4,-48},{
          16,-48}}, color={0,0,127}));
  connect(vav1.yVAV, yVAV1) annotation (Line(points={{16,-32},{0,-32},{0,0},{-120,
          0}}, color={0,0,127}));
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{-80,130},{-50,130}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
  connect(weaBus, zon1.weaBus) annotation (Line(
      points={{-50,130},{116,130},{116,-6},{122,-6},{122,-60}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(zon1.returnAir, rooSin.ports[1]) annotation (Line(points={{116,-80},{
          97.3333,-80},{97.3333,-120}},
                                color={0,127,255}));
  connect(zon2.weaBus, weaBus) annotation (Line(
      points={{120,82},{120,130},{-50,130}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(yVAV2, vav2.yVAV)
    annotation (Line(points={{-120,70},{16,70}}, color={0,0,127}));
  connect(zon2.returnAir, rooSin.ports[2]) annotation (Line(points={{114,62},{92,
          62},{92,-112},{100,-112},{100,-120}}, color={0,127,255}));
  connect(zer.y, vav2.yVal) annotation (Line(points={{-73,40},{-4,40},{-4,54},{16,
          54}}, color={0,0,127}));
  connect(coiSou.ports[1], vav1.port_a) annotation (Line(points={{-40,-87.3333},
          {30,-87.3333},{30,-60}}, color={0,127,255}));
  connect(coiSou.ports[2], vav2.port_a) annotation (Line(points={{-40,-90},{-20,
          -90},{-20,20},{30,20},{30,42}}, color={0,127,255}));
  connect(coiSou.ports[3], byp.port_a) annotation (Line(points={{-40,-92.6667},
          {-20,-92.6667},{-20,-110},{32,-110}},color={0,127,255}));
  connect(byp.port_b, rooSin.ports[3]) annotation (Line(points={{52,-110},{
          102.667,-110},{102.667,-120}},
                                 color={0,127,255}));
  connect(vav2.port_b, VSup2.port_a)
    annotation (Line(points={{30,82},{30,100},{56,100}}, color={0,127,255}));
  connect(VSup2.port_b, zon2.supplyAir) annotation (Line(points={{76,100},{92,100},
          {92,66},{114,66}}, color={0,127,255}));
  connect(vav1.port_b, VSup1.port_a)
    annotation (Line(points={{30,-20},{30,0},{56,0}}, color={0,127,255}));
  connect(VSup1.port_b, zon1.supplyAir) annotation (Line(points={{76,0},{100,0},
          {100,-76},{116,-76}}, color={0,127,255}));
  connect(VSup2.V_flow, V2_flow) annotation (Line(points={{66,111},{66,120},{154,
          120},{154,84},{170,84}}, color={0,0,127}));
  connect(VSup1.V_flow, V1_flow) annotation (Line(points={{66,11},{66,20},{140,20},
          {140,-16},{170,-16}}, color={0,0,127}));
  connect(zon2.TRooAir, TRooAir2)
    annotation (Line(points={{155,64},{170,64}}, color={0,0,127}));
  connect(zon1.TRooAir, TRooAir1) annotation (Line(points={{157,-78},{168,-78},{
          168,-36},{170,-36}}, color={0,0,127}));
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
      Tolerance=1e-06,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Euler"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=2,
        InlineOrder=2,
        InlineFixedStep=0.001)));
end SimpleTwoZone;
