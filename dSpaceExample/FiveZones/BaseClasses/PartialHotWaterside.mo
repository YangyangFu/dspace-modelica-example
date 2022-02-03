within dSpaceExample.FiveZones.BaseClasses;
partial model PartialHotWaterside
  "Partial model that implements hot water-side system"
  package MediumA = Buildings.Media.Air "Medium model for air";
  package MediumW = Buildings.Media.Water "Medium model for water";

  // Boiler parameters
  parameter Modelica.SIunits.MassFlowRate m_flow_boi_nominal= Q_flow_boi_nominal/4200/5
    "Nominal water mass flow rate at boiler";
  parameter Modelica.SIunits.Power Q_flow_boi_nominal
    "Nominal heating capaciaty(Positive means heating)";
  parameter Modelica.SIunits.Pressure dpSetPoiHW = 36000
    "Differential pressure setpoint at heating coil";
  Buildings.Fluid.Actuators.Valves.TwoWayEqualPercentage HWVal(
    redeclare package Medium = MediumW,
    m_flow_nominal=m_flow_boi_nominal,
    dpValve_nominal=6000) "Two-way valve"
    annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={98,-180})));
  Buildings.Fluid.Sources.Boundary_pT expVesBoi(redeclare replaceable package
      Medium = MediumW,
    T=318.15,           nPorts=1)
    "Expansion tank"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=180,
        origin={58,-319})));
  Buildings.Fluid.Sensors.TemperatureTwoPort THWRet(redeclare replaceable
      package Medium = MediumW, m_flow_nominal=m_flow_boi_nominal)
    "Boiler plant water return temperature"
    annotation (Placement(transformation(extent={{10,-10},{-10,10}},
        rotation=90,
        origin={98,-226})));
  Buildings.Fluid.FixedResistances.PressureDrop resHW(
    m_flow_nominal=m_flow_boi_nominal,
    redeclare package Medium = MediumW,
    dp_nominal=85000)  "Resistance in hot water loop" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={350,-260})));
  Buildings.Fluid.Boilers.BoilerPolynomial boi(
    redeclare package Medium = MediumW,
    m_flow_nominal=m_flow_boi_nominal,
    dp_nominal=60000,
    Q_flow_nominal=Q_flow_boi_nominal,
    T_nominal=318.15,
    fue=Buildings.Fluid.Data.Fuels.NaturalGasLowerHeatingValue())
    annotation (Placement(transformation(extent={{130,-330},{150,-310}})));
  Buildings.Fluid.Actuators.Valves.TwoWayLinear boiIsoVal(
    redeclare each package Medium = MediumW,
    m_flow_nominal=m_flow_boi_nominal,
    dpValve_nominal=6000) "Boiler Isolation Valve"
    annotation (Placement(transformation(extent={{282,-330},{302,-310}})));
  Buildings.Fluid.Movers.SpeedControlled_y pumHW(
    redeclare package Medium = MediumW,
    per=perPumHW,
    addPowerToMedium=false)
    annotation (Placement(transformation(extent={{198,-330},{218,-310}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort THWSup(redeclare replaceable
      package Medium = MediumW, m_flow_nominal=m_flow_boi_nominal)
    "Hot water supply temperature" annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=90,
        origin={350,-224})));
  Buildings.Fluid.Actuators.Valves.TwoWayEqualPercentage valBypBoi(
    redeclare package Medium = MediumW,
    m_flow_nominal=m_flow_boi_nominal,
    dpValve_nominal=6000,
    y_start=0,
    use_inputFilter=false,
    from_dp=true) "Bypass valve for boiler." annotation (Placement(
        transformation(extent={{-10,-10},{10,10}}, origin={230,-252})));
  Buildings.Fluid.Sensors.RelativePressure senRelPreHW(redeclare replaceable
      package Medium = MediumW) "Differential pressure"
    annotation (Placement(transformation(extent={{208,-196},{188,-216}})));
  parameter Buildings.Fluid.Movers.Data.Generic perPumHW(
          pressure=Buildings.Fluid.Movers.BaseClasses.Characteristics.flowParameters(
          V_flow=m_flow_boi_nominal/1000*{0.2,0.6,1.0,1.2},
          dp=(85000+60000+6000+6000)*{1.5,1.3,1.0,0.6}))
    "Performance data for primary pumps";
  Modelica.Blocks.Math.Gain dpSetGaiHW(k=1/dpSetPoiHW) "Gain effect"
    annotation (Placement(transformation(extent={{-120,-310},{-100,-290}})));
  Modelica.Blocks.Math.Gain dpGaiHW(k=1/dpSetPoiHW) "Gain effect"
    annotation (Placement(transformation(extent={{-120,-350},{-100,-330}})));
  Buildings.Controls.Continuous.LimPID pumSpeHW(
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ti=40,
    yMin=0.2,
    k=0.1) "Pump speed controller"
    annotation (Placement(transformation(extent={{-70,-330},{-50,-310}})));
  Buildings.Controls.OBC.CDL.Continuous.Product proPumHW
    annotation (Placement(transformation(extent={{-32,-324},{-12,-304}})));
  FaultInjection.Experimental.SystemLevelFaults.Controls.MinimumFlowBypassValve
    minFloBypHW(controllerType=Modelica.Blocks.Types.SimpleController.PI)
    "Hot water loop minimum bypass valve control"
    annotation (Placement(transformation(extent={{-74,-258},{-54,-238}})));
  Buildings.Fluid.Sensors.MassFlowRate   senHWFlo(redeclare package Medium =
        MediumW)
    "Sensor for hot water flow rate" annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=-90,
        origin={98,-278})));
  Buildings.Controls.Continuous.LimPID boiTSup(
    Td=1,
    k=0.5,
    controllerType=Modelica.Blocks.Types.SimpleController.PI,
    Ti=100) "Boiler supply water temperature"
    annotation (Placement(transformation(extent={{-74,-288},{-54,-268}})));
  Buildings.Controls.OBC.CDL.Continuous.Product proBoi
    annotation (Placement(transformation(extent={{-32,-282},{-12,-262}})));
  FaultInjection.Experimental.SystemLevelFaults.Controls.TrimResponse triResHW(
    uTri=0.9,
    dpMin(displayUnit="kPa") = 0.5*dpSetPoiHW,
    dpMax(displayUnit="kPa") = dpSetPoiHW)
    annotation (Placement(transformation(extent={{-156,-236},{-136,-216}})));
equation
  connect(HWVal.port_b, THWRet.port_a)
    annotation (Line(points={{98,-190},{98,-216}},
                                                 color={238,46,47},
      thickness=0.5));
  connect(boi.port_b, pumHW.port_a)
    annotation (Line(points={{150,-320},{198,-320}},color={238,46,47},
      thickness=0.5));
  connect(pumHW.port_b, boiIsoVal.port_a)
    annotation (Line(points={{218,-320},{282,-320}}, color={238,46,47},
      thickness=0.5));
  connect(THWRet.port_a, senRelPreHW.port_b)
    annotation (Line(points={{98,-216},{98,-206},{188,-206}},
                                                  color={238,46,47},
      thickness=0.5));
  connect(senRelPreHW.port_a, THWSup.port_a)
    annotation (Line(points={{208,-206},{350,-206},{350,-214}},
                                                   color={238,46,47},
      thickness=0.5));
  connect(dpSetGaiHW.y, pumSpeHW.u_s)
    annotation (Line(points={{-99,-300},{-86,-300},{-86,-320},{-72,-320}},
                                                       color={0,0,127}));
  connect(dpGaiHW.y, pumSpeHW.u_m) annotation (Line(points={{-99,-340},{-60,
          -340},{-60,-332}},
                        color={0,0,127}));
  connect(senRelPreHW.p_rel, dpGaiHW.u) annotation (Line(points={{198,-197},{
          198,-68},{-182,-68},{-182,-340},{-122,-340}},
                                                  color={0,0,127}));
  connect(pumSpeHW.y, proPumHW.u2)
    annotation (Line(points={{-49,-320},{-34,-320}}, color={0,0,127}));
  connect(proPumHW.y, pumHW.y) annotation (Line(points={{-10,-314},{10,-314},{
          10,-360},{180,-360},{180,-300},{208,-300},{208,-308}},
                                           color={0,0,127}));
  connect(THWSup.port_b, resHW.port_a)
    annotation (Line(points={{350,-234},{350,-250}},
                                                   color={238,46,47},
      thickness=1));
  connect(resHW.port_b, boiIsoVal.port_b) annotation (Line(points={{350,-270},{
          350,-320},{302,-320}},       color={238,46,47},
      thickness=0.5));
  connect(expVesBoi.ports[1], boi.port_a) annotation (Line(points={{68,-319},{
          100,-319},{100,-320},{130,-320}},
                                      color={238,46,47},
      thickness=0.5));
  connect(boiTSup.u_m, boi.T) annotation (Line(points={{-64,-290},{-64,-296},{
          -98,-296},{-98,-64},{160,-64},{160,-312},{151,-312}},
                                         color={0,0,127}));
  connect(senHWFlo.m_flow, minFloBypHW.m_flow) annotation (Line(points={{87,-278},
          {72,-278},{72,-70},{-96,-70},{-96,-245},{-76,-245}}, color={0,0,127}));
  connect(valBypBoi.port_a, senHWFlo.port_a) annotation (Line(points={{220,-252},
          {98,-252},{98,-268}}, color={238,46,47},
      thickness=0.5));
  connect(THWRet.port_b, senHWFlo.port_a)
    annotation (Line(points={{98,-236},{98,-268}}, color={238,46,47},
      thickness=0.5));
  connect(senHWFlo.port_b, boi.port_a) annotation (Line(points={{98,-288},{98,
          -320},{130,-320}}, color={238,46,47},
      thickness=0.5));
  connect(valBypBoi.port_b, resHW.port_b) annotation (Line(points={{240,-252},{
          320,-252},{320,-290},{350,-290},{350,-270}}, color={238,46,47},
      thickness=0.5));
  connect(boiTSup.y, proBoi.u2)
    annotation (Line(points={{-53,-278},{-34,-278}}, color={0,0,127}));
  connect(proBoi.y, boi.y) annotation (Line(points={{-10,-272},{12,-272},{12,
          -358},{120,-358},{120,-312},{128,-312}},
                             color={0,0,127}));
  connect(triResHW.dpSet, dpSetGaiHW.u) annotation (Line(points={{-135,-221},{
          -128,-221},{-128,-300},{-122,-300}}, color={0,0,127}));
  connect(triResHW.TSet, boiTSup.u_s) annotation (Line(points={{-135,-231},{
          -100,-231},{-100,-278},{-76,-278}},
                                        color={0,0,127}));
  connect(HWVal.y_actual, triResHW.u) annotation (Line(points={{91,-185},{91,
          -200},{70,-200},{70,-66},{-180,-66},{-180,-226},{-158,-226}},
                                                      color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -380},{350,-60}})),                                  Diagram(
        coordinateSystem(preserveAspectRatio=false, extent={{-200,-380},{350,
            -60}})));
end PartialHotWaterside;
