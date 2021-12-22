within dSpaceExample.Debug;
model OA
  replaceable package MediumA = Buildings.Media.Air;
  replaceable package MediumW = Buildings.Media.Water;
  parameter Modelica.SIunits.MassFlowRate m_flow_nominal=0.75
    "Mass flow rate of this thermal zone";
  parameter Modelica.SIunits.Volume VRoo=48*2.7 "Room volume";

  Buildings.BoundaryConditions.WeatherData.Bus weaBus annotation (Placement(
        transformation(extent={{-72,0},{-32,40}}),   iconTransformation(extent={{-76,80},
            {-56,100}})));
  WeatherTable.Chicago weaDat "Chicago"
    annotation (Placement(transformation(extent={{-100,-12},{-80,10}})));
  Modelica.Blocks.Interfaces.RealOutput TOut_V "Outdoor air temp" annotation (
      Placement(transformation(extent={{100,-70},{120,-50}}),
        iconTransformation(extent={{80,74},{100,94}})));
  Modelica.Blocks.Interfaces.RealOutput RHOut_V "Outdoor air rh" annotation (
      Placement(transformation(extent={{100,-90},{120,-70}}),
        iconTransformation(extent={{80,54},{100,74}})));
  UnitConversion.ToAnolog toV_TOut(
    x_min=-20,
    x_max=120,
    v_min=0,
    v_max=5)  "-20F-120F  mapping to 0 - 5V"
    annotation (Placement(transformation(extent={{50,60},{70,80}})));
  UnitConversion.ToAnolog toV_RHOut(
    x_min=0,
    x_max=100,
    v_min=0,
    v_max=5)  "1-100 mapping to 0 - 10V"
    annotation (Placement(transformation(extent={{50,30},{70,50}})));
  UnitConversion.KToF kToF_TOut
    annotation (Placement(transformation(extent={{10,60},{30,80}})));
  Modelica.Blocks.Math.Gain gain(k=100)
    annotation (Placement(transformation(extent={{12,30},{32,50}})));
  Modelica.Blocks.Sources.RealExpression modTim(y=time) "Modelica time"
    annotation (Placement(transformation(extent={{50,90},{70,110}})));
  Modelica.Blocks.Interfaces.RealOutput t "Value of Real output" annotation (
      Placement(transformation(extent={{100,-50},{120,-30}}),
        iconTransformation(extent={{100,-50},{120,-30}})));
  Modelica.Blocks.Interfaces.RealOutput TOut annotation (Placement(
        transformation(extent={{100,10},{120,30}}), iconTransformation(extent={
            {100,10},{120,30}})));
  Modelica.Blocks.Interfaces.RealOutput RH
                          "Output signal connector" annotation (Placement(
        transformation(extent={{100,-12},{120,8}}), iconTransformation(extent={
            {100,-12},{120,8}})));
equation
  connect(weaDat.weaBus, weaBus) annotation (Line(
      points={{-82.2,-0.78},{-70.1,-0.78},{-70.1,20},{-52,20}},
      color={255,204,51},
      thickness=0.5));
  connect(kToF_TOut.F, toV_TOut.x) annotation (Line(points={{31,70},{48,70}},
                                       color={0,0,127}));
  connect(weaBus.TDryBul, kToF_TOut.K) annotation (Line(
      points={{-52,20},{-52,70},{8,70}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(toV_TOut.v, TOut_V) annotation (Line(points={{71,70},{88,70},{88,-60},
          {110,-60}},      color={0,0,127}));
  connect(toV_RHOut.v, RHOut_V) annotation (Line(points={{71,40},{84,40},{84,
          -80},{110,-80}},     color={0,0,127}));
  connect(gain.y, toV_RHOut.x)
    annotation (Line(points={{33,40},{48,40}},     color={0,0,127}));
  connect(weaBus.relHum, gain.u) annotation (Line(
      points={{-52,20},{-52,40},{10,40}},
      color={255,204,51},
      thickness=0.5), Text(
      string="%first",
      index=-1,
      extent={{-6,3},{-6,3}},
      horizontalAlignment=TextAlignment.Right));
  connect(modTim.y, t) annotation (Line(points={{71,100},{82,100},{82,-40},{110,
          -40}},     color={0,0,127}));
  connect(kToF_TOut.F, TOut) annotation (Line(points={{31,70},{40,70},{40,20},{
          110,20}}, color={0,0,127}));
  connect(gain.y, RH) annotation (Line(points={{33,40},{40,40},{40,-2},{110,-2}},
        color={0,0,127}));
  annotation (Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,
            100}})),                                                                  Icon(
        coordinateSystem(extent={{-100,-100},{80,100}}),
        graphics={Rectangle(
          extent={{-102,100},{80,-100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-165,154},{135,114}},
          lineColor={0,0,255},
          textString="%name")}),
    experiment(
      StopTime=86400,
      __Dymola_fixedstepsize=0.01,
      __Dymola_Algorithm="Euler"),
    __Dymola_experimentFlags(Advanced(
        InlineMethod=4,
        InlineOrder=2,
        InlineFixedStep=0.01)));
end OA;
