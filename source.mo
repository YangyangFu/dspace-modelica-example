within ;
model source
  Modelica.Blocks.Sources.Constant con(k=1.5)
    annotation (Placement(transformation(extent={{-20,0},{0,20}})));
  Modelica.Blocks.Interfaces.RealOutput out "Connector of Real output signal"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(con.y, out)
    annotation (Line(points={{1,10},{50,10},{50,0},{110,0}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    uses(Modelica(version="3.2.3")),
    experiment(
      StartTime=0,
      StopTime=10,
      __Dymola_Algorithm="Cvode"));
end source;
