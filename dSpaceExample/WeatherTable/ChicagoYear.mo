within dSpaceExample.WeatherTable;
model ChicagoYear

  parameter Modelica.SIunits.Angle lon(displayUnit="deg")=-1.534493;
  parameter Modelica.SIunits.Angle lat(displayUnit="deg")=0.732689;

  Modelica.Blocks.Sources.CombiTimeTable wea(
    tableOnFile=true,
    tableName="tab",
    fileName=ModelicaServices.ExternalReferences.loadResource("modelica://dSpaceExample/Resources/weather/weather_hourly.txt"),
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    annotation (Placement(transformation(extent={{-12,-10},{8,10}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                  Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-159,152},{141,112}},
          lineColor={0,0,255},
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=31536000,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Cvode"));
end ChicagoYear;
