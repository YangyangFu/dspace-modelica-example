within dSpaceExample.FiveZones.BaseClasses;
partial model EnergyMeter "System example for fault injection"

 Modelica.Blocks.Sources.RealExpression eleSupFan(y=fanSup.P) "Pow of fan"
    annotation (Placement(transformation(extent={{1220,580},{1240,600}})));
  Modelica.Blocks.Sources.RealExpression eleChi(y=chiWSE.powChi[1])
    "Power of chiller"
    annotation (Placement(transformation(extent={{1220,560},{1240,580}})));
  Modelica.Blocks.Sources.RealExpression eleCHWP(y=chiWSE.powPum[1])
    "Power of chilled water pump"
    annotation (Placement(transformation(extent={{1220,540},{1240,560}})));
  Modelica.Blocks.Sources.RealExpression eleCWP(y=pumCW.P) "Power of CWP"
    annotation (Placement(transformation(extent={{1220,520},{1240,540}})));
  Modelica.Blocks.Sources.RealExpression eleCT(y=cooTow.PFan)
    "Power of cooling tower"
    annotation (Placement(transformation(extent={{1220,500},{1240,520}})));
  Modelica.Blocks.Sources.RealExpression eleHWP(y=pumHW.P)
    "Power of hot water pump"
    annotation (Placement(transformation(extent={{1220,480},{1240,500}})));
  Modelica.Blocks.Sources.RealExpression eleCoiVAV(y=cor.terHea.Q1_flow + nor.terHea.Q1_flow
         + wes.terHea.Q1_flow + eas.terHea.Q1_flow + sou.terHea.Q1_flow)
    "Power of VAV terminal reheat coil"
    annotation (Placement(transformation(extent={{1220,602},{1240,622}})));
  Modelica.Blocks.Sources.RealExpression gasBoi(y=boi.QFue_flow)
    "Gas consumption of gas boiler"
    annotation (Placement(transformation(extent={{1220,452},{1240,472}})));
  Modelica.Blocks.Math.MultiSum eleTot(nu=7) "Electricity in total"
    annotation (Placement(transformation(extent={{1284,606},{1296,618}})));

equation
  connect(eleCoiVAV.y, eleTot.u[1]) annotation (Line(points={{1241,612},{1262,
          612},{1262,615.6},{1284,615.6}}, color={0,0,127}));
  connect(eleSupFan.y, eleTot.u[2]) annotation (Line(points={{1241,590},{1262.5,
          590},{1262.5,614.4},{1284,614.4}}, color={0,0,127}));
  connect(eleChi.y, eleTot.u[3]) annotation (Line(points={{1241,570},{1264,570},
          {1264,613.2},{1284,613.2}}, color={0,0,127}));
  connect(eleCHWP.y, eleTot.u[4]) annotation (Line(points={{1241,550},{1266,550},
          {1266,612},{1284,612}}, color={0,0,127}));
  connect(eleCWP.y, eleTot.u[5]) annotation (Line(points={{1241,530},{1268,530},
          {1268,610.8},{1284,610.8}}, color={0,0,127}));
  connect(eleCT.y, eleTot.u[6]) annotation (Line(points={{1241,510},{1270,510},
          {1270,609.6},{1284,609.6}}, color={0,0,127}));
  connect(eleHWP.y, eleTot.u[7]) annotation (Line(points={{1241,490},{1272,490},
          {1272,608.4},{1284,608.4}}, color={0,0,127}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{1580,700}})), Icon(
        coordinateSystem(extent={{-100,-100},{1580,700}})));
end EnergyMeter;
