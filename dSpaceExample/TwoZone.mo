within dSpaceExample;
model TwoZone
  replaceable package MediumA = Buildings.Media.Air;
  replaceable package MediumW = Buildings.Media.Water;
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=0.75
    "Mass flow rate of this thermal zone";
  parameter Modelica.SIunits.Volume VRoo=48*2.7 "Room volume";

  Buildings.Air.Systems.SingleZone.VAV.Examples.BaseClasses.Room zon1(
    redeclare package MediumA = MediumA,
    mAir_flow_nominal=m_flow_nominal,
    lat=weaDat.lat) "Thermal envelope of single zone"
    annotation (Placement(transformation(extent={{52,44},{92,84}})));
  Buildings.BoundaryConditions.WeatherData.Bus
                                     weaBus annotation (Placement(
        transformation(extent={{-70,110},{-30,150}}),iconTransformation(extent={{-76,80},
            {-56,100}})));
  Buildings.Fluid.Sources.MassFlowSource_T coiSou1(
    redeclare package Medium = MediumA,
    m_flow=m_flow_nominal,
    use_T_in=false,
    T=285.15,
    use_m_flow_in=false,
    nPorts=1) "Source as cooling coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,30})));
  Modelica.Blocks.Interfaces.RealOutput TRooAir1 "Room air temperature"
    annotation (Placement(transformation(extent={{180,54},{200,74}}),
        iconTransformation(extent={{180,54},{200,74}})));
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
  Modelica.Blocks.Interfaces.RealOutput TRooAir2 "Room air temperature"
    annotation (Placement(transformation(extent={{180,-86},{200,-66}}),
        iconTransformation(extent={{180,54},{200,74}})));
  Buildings.Air.Systems.SingleZone.VAV.Examples.BaseClasses.Room zon2(
    redeclare package MediumA = MediumA,
    mAir_flow_nominal=m_flow_nominal,
    lat=weaDat.lat) "Thermal envelope of single zone"
    annotation (Placement(transformation(extent={{56,-76},{96,-36}})));
  Buildings.Fluid.Sources.MassFlowSource_T coiSou2(
    redeclare package Medium = MediumA,
    m_flow=m_flow_nominal,
    use_T_in=false,
    T=285.15,
    use_m_flow_in=false,
    nPorts=1) "Source as cooling coil" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,-30})));
equation
  connect(weaBus, zon1.weaBus) annotation (Line(
      points={{-50,130},{128,130},{128,120},{58,120},{58,82}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(zon1.TRooAir, TRooAir1)
    annotation (Line(points={{93,64},{190,64}}, color={0,0,127}));
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{-82.2,109.22},{-68.1,109.22},{-68.1,130},{-50,130}},
      color={255,204,51},
      thickness=0.5));
  connect(sin.ports[1], zon1.returnAir) annotation (Line(points={{-80,-130},{34,
          -130},{34,62},{52,62}}, color={0,127,255}));
  connect(zon2.returnAir, sin.ports[2]) annotation (Line(points={{56,-58},{-40,
          -58},{-40,-134},{-80,-134}}, color={0,127,255}));
  connect(weaBus, zon2.weaBus) annotation (Line(
      points={{-50,130},{46,130},{46,-20},{62,-20},{62,-38}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(zon1.supplyAir, coiSou1.ports[1]) annotation (Line(points={{52,66},{
          -60,66},{-60,30},{-80,30}}, color={0,127,255}));
  connect(coiSou2.ports[1], zon2.supplyAir) annotation (Line(points={{-80,-30},
          {-40,-30},{-40,-54},{56,-54}}, color={0,127,255}));
  connect(TRooAir2, zon2.TRooAir) annotation (Line(points={{190,-76},{144,-76},
          {144,-56},{97,-56}}, color={0,0,127}));
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
end TwoZone;
