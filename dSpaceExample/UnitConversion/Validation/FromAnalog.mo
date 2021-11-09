within dSpaceExample.UnitConversion.Validation;
model FromAnalog
  extends Modelica.Icons.Example;

  dSpaceExample.UnitConversion.FromAnalog volToUni(
    v_min=0,
    v_max=10,
    y_min=0,
    y_max=1) annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Sine sine(
    amplitude=5,
    freqHz=1/(3600),
    offset=5)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
equation
  connect(sine.y, volToUni.v)
    annotation (Line(points={{-39,0},{-12,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end FromAnalog;
