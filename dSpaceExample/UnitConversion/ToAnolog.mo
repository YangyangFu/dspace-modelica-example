within dSpaceExample.UnitConversion;
model ToAnolog
  parameter Real x_min;
  parameter Real x_max;
  parameter Real v_min;
  parameter Real v_max;

  Modelica.Blocks.Interfaces.RealInput x "Simulation signal from models"
    annotation (Placement(transformation(extent={{-140,-20},{-100,20}})));
  Modelica.Blocks.Interfaces.RealOutput v "Voltage signal"
                                          annotation (Placement(transformation(
          extent={{100,-10},{120,10}}), iconTransformation(extent={{100,-10},{120,
            10}})));
  Modelica.Blocks.Math.Gain gai(k=(v_max - v_min)/(x_max - x_min))
    annotation (Placement(transformation(extent={{0,20},{20,40}})));
  Modelica.Blocks.Nonlinear.Limiter limX(uMax=x_max, uMin=x_min)
    annotation (Placement(transformation(extent={{-80,-10},{-60,10}})));
  Modelica.Blocks.Nonlinear.Limiter limV(uMax=v_max, uMin=v_min)
    annotation (Placement(transformation(extent={{40,-10},{60,10}})));
  Modelica.Blocks.Math.Add add(k2=-1)
    annotation (Placement(transformation(extent={{-40,20},{-20,40}})));
  Modelica.Blocks.Sources.Constant x_min_b(k=x_min)
    annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{0,-40},{20,-20}})));
  Modelica.Blocks.Sources.Constant v_min_b(k=v_min)
    annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
equation
  connect(x, limX.u)
    annotation (Line(points={{-120,0},{-82,0}}, color={0,0,127}));
  connect(limV.y,v)
    annotation (Line(points={{61,0},{110,0}}, color={0,0,127}));
  connect(limX.y, add.u1) annotation (Line(points={{-59,0},{-50,0},{-50,36},{-42,
          36}}, color={0,0,127}));
  connect(x_min_b.y, add.u2) annotation (Line(points={{-59,50},{-54,50},{-54,24},
          {-42,24}}, color={0,0,127}));
  connect(add.y, gai.u)
    annotation (Line(points={{-19,30},{-2,30}}, color={0,0,127}));
  connect(v_min_b.y, add1.u2) annotation (Line(points={{-59,-50},{-30,-50},{-30,
          -36},{-2,-36}}, color={0,0,127}));
  connect(gai.y, add1.u1) annotation (Line(points={{21,30},{26,30},{26,2},{-18,
          2},{-18,-24},{-2,-24}}, color={0,0,127}));
  connect(add1.y,limV. u) annotation (Line(points={{21,-30},{28,-30},{28,0},{38,
          0}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                  Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-159,152},{141,112}},
          lineColor={0,0,255},
          textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end ToAnolog;
