within dSpaceExample.WeatherTable;
model ChicagoWeatherReader

  parameter Modelica.SIunits.Angle lon(displayUnit="deg")=-1.534493;
  parameter Modelica.SIunits.Angle lat(displayUnit="deg")=0.732689;

  Buildings.BoundaryConditions.WeatherData.ReaderTMY3
                                            weaDat(filNam=
        Modelica.Utilities.Files.loadResource(
        "modelica://Buildings/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos"))
    annotation (Placement(transformation(extent={{-20,-10},{0,10}})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus "Weather data bus"
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
equation
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{0,0},{30,0}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}},
      horizontalAlignment=TextAlignment.Left));
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
      Interval=3600,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Cvode"));
end ChicagoWeatherReader;
