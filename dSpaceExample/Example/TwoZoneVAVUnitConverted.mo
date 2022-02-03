within dSpaceExample.Example;
model TwoZoneVAVUnitConverted "Simplified VAV"
  extends Modelica.Icons.Example;

  dSpaceExample.TwoZoneVAVUnitConverted       twoZon
    annotation (Placement(transformation(extent={{-8,-4},{12,16}})));
  Modelica.Blocks.Sources.CombiTimeTable sch(
    table=[0,0; 7*3600,0; 7*3600,10; 19*3600,10; 19*3600,0; 24*3600,0],
    smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments,
    extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
    annotation (Placement(transformation(extent={{-60,10},{-40,30}})));
  Modelica.Blocks.Sources.Constant zer(k=0)
    annotation (Placement(transformation(extent={{-60,-30},{-40,-10}})));
equation
  connect(sch.y[1], twoZon.yVAV2) annotation (Line(points={{-39,20},{-20,20},{
          -20,7.11111},{-9.42857,7.11111}}, color={0,0,127}));
  connect(zer.y, twoZon.yHea2) annotation (Line(points={{-39,-20},{-20,-20},{
          -20,6},{-9.42857,6}}, color={0,0,127}));
  connect(zer.y, twoZon.yHea1) annotation (Line(points={{-39,-20},{-20,-20},{
          -20,1.55556},{-9.42857,1.55556}}, color={0,0,127}));
  connect(sch.y[1], twoZon.yVAV1) annotation (Line(points={{-39,20},{-20,20},{
          -20,3.03704},{-9.42857,3.03704}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=86400,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Cvode"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=0,
        InlineOrder=2,
        InlineFixedStep=0.001)));
end TwoZoneVAVUnitConverted;
