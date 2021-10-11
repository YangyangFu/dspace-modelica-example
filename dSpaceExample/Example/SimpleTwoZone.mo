within dSpaceExample.Example;
model SimpleTwoZone "Simplified VAV"
  extends Modelica.Icons.Example;

  dSpaceExample.SimpleTwoZone twoZon
    annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Modelica.Blocks.Sources.Step yvav1(
    height=1,
    offset=0,
    startTime=6*3600)
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Sources.Step yvav2(
    height=1,
    offset=0,
    startTime=6*3600)
    annotation (Placement(transformation(extent={{-60,20},{-40,40}})));
equation
  connect(yvav1.y, twoZon.yVAV1) annotation (Line(points={{-39,-10},{-26,-10},{
          -26,0},{-12,0}}, color={0,0,127}));
  connect(yvav2.y, twoZon.yVAV2) annotation (Line(points={{-39,30},{-26,30},{
          -26,7},{-12,7}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=86400,
      Tolerance=0.001,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Euler"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=0,
        InlineOrder=2,
        InlineFixedStep=0.001)));
end SimpleTwoZone;
