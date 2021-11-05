within dSpaceExample;
model OneZone
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
    m_flow=0,
    use_T_in=false,
    T=285.15,
    use_m_flow_in=false,
    nPorts=1) "Source as cooling coil"            annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,30})));
  Buildings.Fluid.FixedResistances.PressureDrop res(
    redeclare package Medium = MediumA,
    m_flow_nominal=m_flow_nominal,
    dp_nominal=220 + 20)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Blocks.Interfaces.RealOutput TRooAir "Room air temperature"
    annotation (Placement(transformation(extent={{180,-10},{200,10}}),
        iconTransformation(extent={{180,-10},{200,10}})));
  WeatherTable.Chicago weaDat "Chicago"
    annotation (Placement(transformation(extent={{-100,98},{-80,120}})));
  Buildings.Fluid.Sources.Boundary_pT sin(
    redeclare package Medium = MediumA,
    use_T_in=false,
    T=285.15,
    nPorts=1) "sink" annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-90,-30})));
equation
  connect(weaBus, zon1.weaBus) annotation (Line(
      points={{-50,130},{116,130},{116,40},{56,40},{56,18}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-3,6},{-3,6}},
      horizontalAlignment=TextAlignment.Right));
  connect(coiSou.ports[1],res. port_a) annotation (Line(points={{-80,30},{-40,
          30}},                                color={0,127,255}));
  connect(zon1.TRooAir, TRooAir)
    annotation (Line(points={{91,0},{190,0}}, color={0,0,127}));
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{-82.2,109.22},{-68.1,109.22},{-68.1,130},{-50,130}},
      color={255,204,51},
      thickness=0.5));
  connect(res.port_b, zon1.supplyAir) annotation (Line(points={{-20,30},{28,30},
          {28,2},{50,2}}, color={0,127,255}));
  connect(sin.ports[1], zon1.returnAir) annotation (Line(points={{-80,-30},{28,
          -30},{28,-2},{50,-2}}, color={0,127,255}));
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
end OneZone;
