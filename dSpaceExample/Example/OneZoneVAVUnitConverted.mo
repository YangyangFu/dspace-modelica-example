within dSpaceExample.Example;
model OneZoneVAVUnitConverted "Simplified VAV"
  extends Modelica.Icons.Example;

  dSpaceExample.OneZoneVAVUnitConverted       oneZon
    annotation (Placement(transformation(extent={{-8,-4},{12,16}})));
  Modelica.Blocks.Sources.Constant const(k=0)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
  Modelica.Blocks.Sources.Constant zer(k=10)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
equation
  connect(const.y,oneZon. yVAV2) annotation (Line(points={{-59,70},{-34,70},{
          -34,7.11111},{-9.42857,7.11111}}, color={0,0,127}));
  connect(zer.y, oneZon.yHea2) annotation (Line(points={{-59,30},{-50,30},{-50,
          5.62963},{-9.42857,5.62963}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=3600,
      Tolerance=0.001,
      __Dymola_fixedstepsize=0.1,
      __Dymola_Algorithm="Euler"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=0,
        InlineOrder=2,
        InlineFixedStep=0.001)));
end OneZoneVAVUnitConverted;
