within dSpaceExample;
model TestConstant "Test constant source for HIL in dSpace"
  extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.Constant const(k=2)
    annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  Modelica.Blocks.Interfaces.RealOutput y "Connector of Real output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(const.y, y)
    annotation (Line(points={{9,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StartTime=15724800,
      StopTime=15811200,
      Tolerance=1e-06,
      __Dymola_fixedstepsize=0.0001,
      __Dymola_Algorithm="Euler"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=2,
        InlineOrder=4,
        InlineFixedStep=0.0001)));
end TestConstant;
