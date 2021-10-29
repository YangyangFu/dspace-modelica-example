within dSpaceExample.UnitConversion.Validation;
model KToF
  extends Modelica.Icons.Example;

  dSpaceExample.UnitConversion.KToF kToF
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Step step(
    height=2,
    offset=273.15,
    startTime=3600)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(step.y, kToF.K)
    annotation (Line(points={{-39,0},{-12,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=7200, __Dymola_Algorithm="Dassl"));
end KToF;
