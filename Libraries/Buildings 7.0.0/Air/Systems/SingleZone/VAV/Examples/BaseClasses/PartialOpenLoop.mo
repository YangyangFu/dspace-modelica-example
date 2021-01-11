within Buildings.Air.Systems.SingleZone.VAV.Examples.BaseClasses;
partial model PartialOpenLoop
  "Partial model of a single zone variable air volume flow system and thermal zone"

  package MediumA = Buildings.Media.Air "Buildings library air media package";
  package MediumW = Buildings.Media.Water "Buildings library air media package";

  parameter Modelica.SIunits.Temperature TSupChi_nominal=279.15
    "Design value for chiller leaving water temperature";

  Buildings.Air.Systems.SingleZone.VAV.ChillerDXHeatingEconomizer hvac(
    redeclare package MediumA = MediumA,
    redeclare package MediumW = MediumW,
    mAir_flow_nominal=0.75,
    etaHea_nominal=0.99,
    QHea_flow_nominal=7000,
    QCoo_flow_nominal=-7000,
    TSupChi_nominal=TSupChi_nominal)   "Single zone VAV system"
    annotation (Placement(transformation(extent={{-40,-20},{0,20}})));
  Buildings.Air.Systems.SingleZone.VAV.Examples.BaseClasses.Room zon(
      mAir_flow_nominal=0.75,
      lat=weaDat.lat) "Thermal envelope of single zone"
    annotation (Placement(transformation(extent={{40,-20},{80,20}})));
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(
      computeWetBulbTemperature=false,
      filNam=Modelica.Utilities.Files.loadResource("modelica://Buildings/Resources/weatherdata/DRYCOLD.mos"))
    annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
  Modelica.Blocks.Continuous.Integrator EFan "Total fan energy"
    annotation (Placement(transformation(extent={{40,-50},{60,-30}})));
  Modelica.Blocks.Continuous.Integrator EHea "Total heating energy"
    annotation (Placement(transformation(extent={{40,-80},{60,-60}})));
  Modelica.Blocks.Continuous.Integrator ECoo "Total cooling energy"
    annotation (Placement(transformation(extent={{40,-110},{60,-90}})));
  Modelica.Blocks.Math.MultiSum EHVAC(nu=4)  "Total HVAC energy"
    annotation (Placement(transformation(extent={{80,-80},{100,-60}})));
  Modelica.Blocks.Continuous.Integrator EPum "Total pump energy"
    annotation (Placement(transformation(extent={{40,-140},{60,-120}})));

  BoundaryConditions.WeatherData.Bus weaBus annotation (Placement(
        transformation(extent={{-50,60},{-10,100}}), iconTransformation(extent=
            {{-250,-2},{-230,18}})));
equation
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{-60,80},{-30,80}},
      color={255,204,51},
      thickness=0.5), Text(
      textString="%second",
      index=1,
      extent={{6,3},{6,3}}));

  connect(hvac.supplyAir, zon.supplyAir) annotation (Line(points={{0,8},{10,8},
          {10,2},{40,2}},          color={0,127,255}));
  connect(hvac.returnAir, zon.returnAir) annotation (Line(points={{0,0},{6,0},{
          6,-2},{10,-2},{40,-2}},  color={0,127,255}));

  connect(hvac.weaBus, weaBus) annotation (Line(
      points={{-36,17.8},{-36,80},{-30,80}},
      color={255,204,51},
      thickness=0.5));
  connect(zon.weaBus, weaBus) annotation (Line(
      points={{46,18},{42,18},{42,80},{-30,80}},
      color={255,204,51},
      thickness=0.5));

  connect(hvac.PFan, EFan.u) annotation (Line(points={{1,18},{24,18},{24,-40},{
          38,-40}},  color={0,0,127}));
  connect(hvac.QHea_flow, EHea.u) annotation (Line(points={{1,16},{22,16},{22,
          -70},{38,-70}},
                     color={0,0,127}));
  connect(hvac.PCoo, ECoo.u) annotation (Line(points={{1,14},{20,14},{20,-100},
          {38,-100}},color={0,0,127}));
  connect(hvac.PPum, EPum.u) annotation (Line(points={{1,12},{18,12},{18,-130},{
          38,-130}},   color={0,0,127}));

  connect(EFan.y, EHVAC.u[1]) annotation (Line(points={{61,-40},{70,-40},{70,
          -64.75},{80,-64.75}}, color={0,0,127}));
  connect(EHea.y, EHVAC.u[2])
    annotation (Line(points={{61,-70},{80,-70},{80,-68.25}}, color={0,0,127}));
  connect(ECoo.y, EHVAC.u[3]) annotation (Line(points={{61,-100},{70,-100},{70,
          -71.75},{80,-71.75}}, color={0,0,127}));
  connect(EPum.y, EHVAC.u[4]) annotation (Line(points={{61,-130},{74,-130},{74,
          -75.25},{80,-75.25}}, color={0,0,127}));
  annotation (
Documentation(info="<html>
<p>
The thermal zone is based on the BESTEST Case 600 envelope, while the HVAC
system is based on a conventional VAV system with air cooled chiller and
economizer.  See documentation for the specific models for more information.
</p>
</html>", revisions="<html>
<ul>
<li>
November 27, 2019, by David Blum:<br/>
Removed <code>experiment</code> annotation.
</li>
<li>
July 29, 2019, by David Blum:<br/>
First implementation.
</li>
</ul>
</html>"),
    Diagram(coordinateSystem(extent={{-160,-160},{120,140}})));
end PartialOpenLoop;
