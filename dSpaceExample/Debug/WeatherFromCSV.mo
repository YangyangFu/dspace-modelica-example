within dSpaceExample.Debug;
model WeatherFromCSV
  Modelica.Blocks.Sources.CombiTimeTable timTab(
    tableOnFile=true,
    tableName="tab",
    fileName=ModelicaServices.ExternalReferences.loadResource("modelica://dSpaceExample/weather.txt"),
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));

  Modelica.Blocks.Interfaces.RealOutput TDryBul
    "Connector of Real output signals"
    annotation (Placement(transformation(extent={{100,-10},{120,10}})));
equation
  connect(timTab.y[1], TDryBul)
    annotation (Line(points={{-39,0},{110,0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=86400,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Euler"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=4,
        InlineOrder=4,
        InlineFixedStep=0.001)));
end WeatherFromCSV;
