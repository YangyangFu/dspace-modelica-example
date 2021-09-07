within dSpaceExample.Example;
model SimpleVAV "Simplified VAV"
  extends Modelica.Icons.Example;

  dSpaceExample.SimpleVAV simpleVAV
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Step yvav(
    height=0.5,
    offset=0.5,
    startTime=3600)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(yvav.y, simpleVAV.yVAV)
    annotation (Line(points={{-39,0},{-12,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=7200,
      Tolerance=1e-06,
      __Dymola_Algorithm="Cvode"));
end SimpleVAV;
