within dSpaceExample.Debug;
model WeatherMat "Table that reads data from mat file"

  Modelica.Blocks.Sources.CombiTimeTable timTab(
    table=DataFiles.readMATmatrix(Modelica.Utilities.Files.loadResource("modelica://dSpaceExample/matsource.mat"),
        "tab1"))
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
        InlineOrder=2,
        InlineFixedStep=0.001)));
end WeatherMat;
