within dSpaceExample.FiveZones.BaseClasses;
partial model RunTime "Equipment run time"

  Modelica.Blocks.Continuous.Integrator  chiRunTim "Chiller run time"
    annotation (Placement(transformation(extent={{1340,630},{1360,650}})));

  Modelica.Blocks.Continuous.Integrator boiRunTim "Boiler run time"
    annotation (Placement(transformation(extent={{1340,600},{1360,620}})));
  Modelica.Blocks.Continuous.Integrator supFanRunTim "Supply fan run time"
    annotation (Placement(transformation(extent={{1340,570},{1360,590}})));
  Modelica.Blocks.Continuous.Integrator cooTowRunTim "Cooling tower run time"
    annotation (Placement(transformation(extent={{1340,540},{1360,560}})));
  Modelica.Blocks.Continuous.Integrator  CHWPRunTim "CHWP run time"
    annotation (Placement(transformation(extent={{1400,630},{1420,650}})));
  Modelica.Blocks.Continuous.Integrator CWPRunTim "CWP run time"
    annotation (Placement(transformation(extent={{1400,600},{1420,620}})));
  Modelica.Blocks.Continuous.Integrator HWPRunTim "HWP run time"
    annotation (Placement(transformation(extent={{1400,570},{1420,590}})));
  Buildings.Controls.OBC.CDL.Integers.Sources.Constant conInt(k=1)
    "Unit signal"
    annotation (Placement(transformation(extent={{1460,680},{1480,700}})));
  Modelica.Blocks.Math.BooleanChange sigChaChi(u(fixed=true, start=false))
    "Signal changes of chiller"
    annotation (Placement(transformation(extent={{1460,650},{1480,670}})));
  Modelica.Blocks.MathInteger.TriggeredAdd swiTimChi "Triggered addition"
    annotation (Placement(transformation(extent={{1520,680},{1540,700}})));
  Modelica.Blocks.MathInteger.TriggeredAdd swiTimBoi "Triggered addition"
    annotation (Placement(transformation(extent={{1520,620},{1540,640}})));
  Modelica.Blocks.Math.BooleanChange sigChaBoi(u(start=false, fixed=true))
    "Signal changes of boiler"
    annotation (Placement(transformation(extent={{1460,600},{1480,620}})));
  Modelica.Blocks.MathInteger.TriggeredAdd swiTimFan "Triggered addition"
    annotation (Placement(transformation(extent={{1520,580},{1540,600}})));
  Modelica.Blocks.Math.BooleanChange sigChaFan(u(start=false, fixed=true))
    "Signal changes of fan"
    annotation (Placement(transformation(extent={{1460,550},{1480,570}})));
  Modelica.Blocks.Math.BooleanChange sigChaCooTow(u(start=false, fixed=true))
    "Signal changes of cooling tower"
    annotation (Placement(transformation(extent={{1460,500},{1480,520}})));
  Modelica.Blocks.MathInteger.TriggeredAdd swiTimCooTow "Triggered addition"
    annotation (Placement(transformation(extent={{1520,530},{1540,550}})));
  Modelica.Blocks.Math.BooleanChange sigChaCHWP(u(start=false, fixed=true))
    "Signal changes of CHWP"
    annotation (Placement(transformation(extent={{1460,450},{1480,470}})));
  Modelica.Blocks.MathInteger.TriggeredAdd swiTimCHWP "Triggered addition"
    annotation (Placement(transformation(extent={{1520,480},{1540,500}})));
  Modelica.Blocks.Math.BooleanChange sigChaCWP(u(start=false, fixed=true))
    "Signal changes of fan"
    annotation (Placement(transformation(extent={{1460,390},{1480,410}})));
  Modelica.Blocks.MathInteger.TriggeredAdd swiTimCWP "Triggered addition"
    annotation (Placement(transformation(extent={{1520,420},{1540,440}})));
  Modelica.Blocks.Math.BooleanChange sigChaHWP(u(start=false, fixed=true))
    "Signal changes of HWP"
    annotation (Placement(transformation(extent={{1460,340},{1480,360}})));
  Modelica.Blocks.MathInteger.TriggeredAdd swiTimHWP "Triggered addition"
    annotation (Placement(transformation(extent={{1520,370},{1540,390}})));
equation
  connect(conInt.y, swiTimChi.u)
    annotation (Line(points={{1482,690},{1516,690}}, color={255,127,0}));
  connect(sigChaChi.y, swiTimChi.trigger) annotation (Line(points={{1481,660},{1524,
          660},{1524,678}}, color={255,0,255}));
  connect(sigChaBoi.y, swiTimBoi.trigger) annotation (Line(points={{1481,610},{1524,
          610},{1524,618}}, color={255,0,255}));
  connect(conInt.y, swiTimBoi.u) annotation (Line(points={{1482,690},{1500,690},
          {1500,630},{1516,630}}, color={255,127,0}));
  connect(sigChaFan.y, swiTimFan.trigger) annotation (Line(points={{1481,560},{1524,
          560},{1524,578}}, color={255,0,255}));
  connect(sigChaCooTow.y, swiTimCooTow.trigger) annotation (Line(points={{1481,510},
          {1524,510},{1524,528}}, color={255,0,255}));
  connect(sigChaCHWP.y, swiTimCHWP.trigger) annotation (Line(points={{1481,460},
          {1524,460},{1524,478}}, color={255,0,255}));
  connect(sigChaCWP.y, swiTimCWP.trigger) annotation (Line(points={{1481,400},{1524,
          400},{1524,418}}, color={255,0,255}));
  connect(sigChaHWP.y, swiTimHWP.trigger) annotation (Line(points={{1481,350},{1524,
          350},{1524,368}}, color={255,0,255}));
  connect(conInt.y, swiTimFan.u) annotation (Line(points={{1482,690},{1500,690},
          {1500,590},{1516,590}}, color={255,127,0}));
  connect(conInt.y, swiTimCooTow.u) annotation (Line(points={{1482,690},{1500,690},
          {1500,540},{1516,540}}, color={255,127,0}));
  connect(conInt.y, swiTimCHWP.u) annotation (Line(points={{1482,690},{1500,690},
          {1500,490},{1516,490}}, color={255,127,0}));
  connect(conInt.y, swiTimCWP.u) annotation (Line(points={{1482,690},{1500,690},
          {1500,430},{1516,430}}, color={255,127,0}));
  connect(conInt.y, swiTimHWP.u) annotation (Line(points={{1482,690},{1500,690},
          {1500,380},{1516,380}}, color={255,127,0}));
  annotation (Diagram(coordinateSystem(extent={{-100,-100},{1580,700}})), Icon(
        coordinateSystem(extent={{-100,-100},{1580,700}})));
end RunTime;
