within dSpaceExample.Debug;
model WeatherFromCSV "Test weather reader in dspace"
  Modelica.Blocks.Interfaces.RealOutput TDryBul "Outdoor air temperature"
    annotation (Placement(transformation(extent={{100,-10},{120,10}}),
        iconTransformation(extent={{100,-8},{120,12}})));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(__Dymola_fixedstepsize=0.001, __Dymola_Algorithm="Euler"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=1,
        InlineOrder=2,
        InlineFixedStep=0.001)));
end WeatherFromCSV;
