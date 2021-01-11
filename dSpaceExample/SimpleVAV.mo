within dSpaceExample;
model SimpleVAV
  replaceable package MediumA = Buildings.Media.Air;
  replaceable package MediumW = Buildings.Media.Water;
  Buildings.Examples.VAVReheat.ThermalZones.VAVBranch vav(
    redeclare package MediumA = MediumA,
    redeclare package MediumW = MediumW,
    m_flow_nominal=m_flow_nominal,
    VRoo=VRoo)
    "Zone for core of buildings (azimuth will be neglected)"
    annotation (Placement(transformation(extent={{-20,-20},{20,20}})));
  Modelica.Blocks.Sources.Constant zer(k=0)
    annotation (Placement(transformation(extent={{-100,-40},{-80,-20}})));
  Buildings.Fluid.Sources.Boundary_pT sou(
    redeclare package Medium = MediumA,
    p(displayUnit="Pa") = 101325 + 240,
    T=286.15,
    nPorts=1)                             "Source"
    annotation (Placement(transformation(extent={{-40,-80},{-20,-60}})));
  Buildings.Fluid.Sources.Boundary_pT sin(
    redeclare package Medium = MediumA,
    p(displayUnit="Pa") = 101325,
    nPorts=1)                             "Sink"
    annotation (Placement(transformation(extent={{-40,60},{-20,80}})));
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=5.4
    "Mass flow rate of this thermal zone";
  parameter Modelica.SIunits.Volume VRoo=2698 "Room volume";

  Modelica.Blocks.Interfaces.RealInput yVAV "Signal for VAV damper"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Sources.RealExpression masFlo(y=vav.senMasFlo.m_flow)
    "Mass flowrate"
    annotation (Placement(transformation(extent={{20,60},{40,80}})));
  Modelica.Blocks.Interfaces.RealOutput m_flow "mass flowrate"
    annotation (Placement(transformation(extent={{100,50},{120,70}})));
  Modelica.Blocks.Math.Gain toVol(k=2118.88/1.29)
    annotation (Placement(transformation(extent={{40,30},{60,50}})));
  Modelica.Blocks.Interfaces.RealOutput cfm "Output signal connector"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(zer.y, vav.yVal) annotation (Line(points={{-79,-30},{-48,-30},{-48,-8},
          {-24,-8}}, color={0,0,127}));
  connect(sou.ports[1], vav.port_a) annotation (Line(points={{-20,-70},{-10,-70},
          {-10,-20}}, color={0,127,255}));
  connect(sin.ports[1], vav.port_b)
    annotation (Line(points={{-20,70},{-10,70},{-10,20}}, color={0,127,255}));
  connect(vav.yVAV, yVAV) annotation (Line(points={{-24,8},{-48,8},{-48,0},{
          -120,0}}, color={0,0,127}));
  connect(masFlo.y, m_flow) annotation (Line(points={{41,70},{84,70},{84,60},{
          110,60}}, color={0,0,127}));
  connect(masFlo.y, toVol.u) annotation (Line(points={{41,70},{58,70},{58,60},{
          28,60},{28,40},{38,40}}, color={0,0,127}));
  connect(toVol.y, cfm) annotation (Line(points={{61,40},{84,40},{84,0},{110,0}},
        color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                                Rectangle(
        extent={{-100,-100},{100,100}},
        lineColor={0,0,127},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid), Text(
        extent={{-158,152},{142,112}},
        textString="%name",
        lineColor={0,0,255})}),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=7200,
      Tolerance=1e-06,
      __Dymola_Algorithm="Dassl"));
end SimpleVAV;
