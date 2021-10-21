within dSpaceExample.Debug.Examples;
model TwoVAVTerminals
  extends Modelica.Icons.Example;

  dSpaceExample.Debug.TwoVAVTerminals vav
    annotation (Placement(transformation(extent={{-10,-12},{10,8}})));
  Modelica.Blocks.Sources.Step yvav1(
    height=1,
    offset=0,
    startTime=12*3600)
    annotation (Placement(transformation(extent={{-62,-22},{-42,-2}})));
  Modelica.Blocks.Sources.Step yvav2(
    height=1,
    offset=0,
    startTime=6*3600)
    annotation (Placement(transformation(extent={{-62,18},{-42,38}})));
equation
  connect(yvav2.y, vav.yVAV2) annotation (Line(points={{-41,28},{-26,28},{-26,5},
          {-12,5}}, color={0,0,127}));
  connect(yvav1.y, vav.yVAV1) annotation (Line(points={{-41,-12},{-26,-12},{-26,
          -2},{-12,-2}}, color={0,0,127}));
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
end TwoVAVTerminals;
