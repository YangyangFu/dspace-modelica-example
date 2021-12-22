within dSpaceExample.Example;
model TwoZoneVAVUnitConverted "Simplified VAV"
  extends Modelica.Icons.Example;

  Modelica.Blocks.Sources.Step yvav1(
    height=5,
    offset=0,
    startTime=9*3600)
    annotation (Placement(transformation(extent={{-60,-20},{-40,0}})));
  Modelica.Blocks.Sources.Step yvav2(
    height=5,
    offset=0,
    startTime=6*3600)
    annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
  dSpaceExample.TwoZoneVAVUnitConvertedBackup twoZon
    annotation (Placement(transformation(extent={{-8,-4},{12,16}})));
  Modelica.Blocks.Sources.Constant const(k=8)
    annotation (Placement(transformation(extent={{-80,60},{-60,80}})));
equation
  connect(yvav1.y, twoZon.yVAV1) annotation (Line(points={{-39,-10},{-26,-10},{
          -26,2.66667},{-9.42857,2.66667}},
                           color={0,0,127}));
  connect(const.y, twoZon.yVAV2) annotation (Line(points={{-59,70},{-34,70},{
          -34,7.11111},{-9.42857,7.11111}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=3600,
      Tolerance=0.001,
      __Dymola_fixedstepsize=0.001,
      __Dymola_Algorithm="Cvode"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=0,
        InlineOrder=2,
        InlineFixedStep=0.001)));
end TwoZoneVAVUnitConverted;
