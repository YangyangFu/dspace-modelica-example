within dSpaceExample.Debug;
model WeatherFromCSV "Test weather reader in dspace"
  Modelica.Blocks.Interfaces.RealOutput TDryBul "Outdoor air temperature"
    annotation (Placement(transformation(extent={{100,-10},{120,10}}),
        iconTransformation(extent={{100,-8},{120,12}})));
  Modelica.Blocks.Sources.CombiTimeTable wea(
    tableOnFile=true,
    tableName="tab",
    fileName=ModelicaServices.ExternalReferences.loadResource(
        "modelica://dSpaceExample/weather.txt"),
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
equation
  connect(wea.y[1], TDryBul)
    annotation (Line(points={{-59,0},{110,0}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=604800,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Cvode"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=0,
        InlineOrder=2,
        InlineFixedStep=0.001)));
end WeatherFromCSV;
