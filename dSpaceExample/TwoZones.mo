within dSpaceExample;
package TwoZones "Two zone test"
  extends Modelica.Icons.Package;

  model TwoZoneFixedSupplyTemperature
    "Two VAV zones with fixed supply air temperature"
    //extends Modelica.Icons.Example;
    package MediumA = Buildings.Media.Air "Medium model for air";

     constant Integer numZon=2 "Total number of served VAV boxes";

    parameter Modelica.SIunits.Volume VRooSou=AFloSou*flo.hRoo
      "Room volume south";
    parameter Modelica.SIunits.Volume VRooNor=AFloNor*flo.hRoo
      "Room volume north";



    parameter Modelica.SIunits.Area AFloSou=flo.sou.AFlo "Floor area south";
    parameter Modelica.SIunits.Area AFloNor=flo.nor.AFlo "Floor area north";


    parameter Modelica.SIunits.Area AFlo[numZon]={flo.sou.AFlo,flo.nor.AFlo}
      "Floor area of each zone";
    final parameter Modelica.SIunits.Area ATot=sum(AFlo) "Total floor area";

    constant Real conv=1.2/3600 "Conversion factor for nominal mass flow rate";

    parameter Modelica.SIunits.MassFlowRate mSou_flow_nominal=6*VRooSou*conv
      "Design mass flow rate perimeter 1";

    parameter Modelica.SIunits.MassFlowRate mNor_flow_nominal=6*VRooNor*conv
      "Design mass flow rate perimeter 3";

    parameter Modelica.SIunits.MassFlowRate m_flow_nominal=0.7*(
        mSou_flow_nominal + mNor_flow_nominal) "Nominal mass flow rate";

    parameter Modelica.SIunits.Angle lat=41.98*3.14159/180 "Latitude";

  //  parameter Modelica.SIunits.HeatFlowRate QHeaCoi_nominal= 2.5*yFanMin*m_flow_nominal*1000*(20 - 4)
  //    "Nominal capacity of heating coil";

    parameter Boolean allowFlowReversal=true
      "= false to simplify equations, assuming, but not enforcing, no flow reversal"
      annotation (Evaluate=true);

    parameter Boolean use_windPressure=true "Set to true to enable wind pressure";

    parameter Boolean sampleModel=true
      "Set to true to time-sample the model, which can give shorter simulation time if there is already time sampling in the system model"
      annotation (Evaluate=true, Dialog(tab=
            "Experimental (may be changed in future releases)"));


    BaseClass.TwoZoneFloor flo(
      redeclare final package Medium = MediumA,
      final lat=lat,
      final use_windPressure=use_windPressure,
      final sampleModel=sampleModel)
      annotation (Placement(transformation(extent={{-8,-4},{48,56}})));
    Buildings.Fluid.Sources.MassFlowSource_T vavNor(
      redeclare package Medium = MediumA,
      use_Xi_in=true,
      use_m_flow_in=true,
      use_T_in=true,
      nPorts=2) "Ideal VAV damper for north zone"
      annotation (Placement(transformation(extent={{-40,30},{-20,50}})));
    Buildings.Fluid.Sources.MassFlowSource_T vavSou(
      redeclare package Medium = MediumA,
      use_Xi_in=true,
      use_m_flow_in=true,
      use_T_in=true,
      nPorts=2)      "Ideal VAV damper for south zone"
      annotation (Placement(transformation(extent={{-40,-40},{-20,-20}})));
    Buildings.Fluid.Sources.Boundary_pT vavNorSin(redeclare package Medium =
          MediumA, nPorts=2)
                   "Ideal VAV damper for north zone"
      annotation (Placement(transformation(extent={{98,28},{78,48}})));
    Buildings.Fluid.Sources.Boundary_pT vavSouSin(redeclare package Medium =
          MediumA, nPorts=2)
                   "Ideal VAV damper for south zone"
      annotation (Placement(transformation(extent={{100,-40},{80,-20}})));
    Modelica.Blocks.Math.Gain m_flow_nor(k=mNor_flow_nominal)
      "mass flowrate in north"
      annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
    Modelica.Blocks.Interfaces.RealInput yDamNor "Input signal connector"
      annotation (Placement(transformation(extent={{-140,60},{-100,100}})));
    Modelica.Blocks.Sources.Constant TSup(k=273.15 + 12)
      annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
    Buildings.Utilities.Psychrometrics.X_pTphi x_pTphi(use_p_in=false)
      annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
    Modelica.Blocks.Sources.Constant phiSup(k=0.9)
      "Relative humidity of supply air"
      annotation (Placement(transformation(extent={{-100,0},{-80,20}})));
    Modelica.Blocks.Interfaces.RealInput yDamSou "Input signal connector"
      annotation (Placement(transformation(extent={{-140,-80},{-100,-40}})));
    Modelica.Blocks.Math.Gain m_flow_sou(k=mSou_flow_nominal)
      "mass flowrate in south"
      annotation (Placement(transformation(extent={{-80,-70},{-60,-50}})));
    Modelica.Blocks.Interfaces.RealOutput TRooAir[2] "Room air temperatures"
      annotation (Placement(transformation(extent={{100,70},{120,90}})));
    Buildings.BoundaryConditions.WeatherData.Bus weaBus "Weather Data Bus"
      annotation (Placement(transformation(extent={{10,80},{30,100}}),
          iconTransformation(extent={{-88,80},{-68,100}})));
  equation
    connect(vavNor.ports[1], flo.portsNor[1])
      annotation (Line(points={{-20,42},{16,42},{16,18.6}}, color={0,127,255}));
    connect(vavNorSin.ports[1], flo.portsNor[2])
      annotation (Line(points={{78,40},{18,40},{18,18.6}}, color={0,127,255}));
    connect(vavSou.ports[1], flo.portsSou[1]) annotation (Line(points={{-20,-28},{
            16,-28},{16,10.6}},
                             color={0,127,255}));
    connect(vavSouSin.ports[1], flo.portsSou[2])
      annotation (Line(points={{80,-28},{18,-28},{18,10.6}}, color={0,127,255}));
    connect(m_flow_nor.y, vavNor.m_flow_in) annotation (Line(points={{-59,80},{-52,
            80},{-52,48},{-42,48}}, color={0,0,127}));
    connect(m_flow_nor.u, yDamNor)
      annotation (Line(points={{-82,80},{-120,80}}, color={0,0,127}));
    connect(TSup.y, vavNor.T_in) annotation (Line(points={{-79,50},{-54,50},{-54,44},
            {-42,44}}, color={0,0,127}));
    connect(TSup.y, x_pTphi.T) annotation (Line(points={{-79,50},{-68,50},{-68,10},
            {-62,10}}, color={0,0,127}));
    connect(phiSup.y, x_pTphi.phi) annotation (Line(points={{-79,10},{-70,10},{-70,
            4},{-62,4}}, color={0,0,127}));
    connect(TSup.y, vavSou.T_in) annotation (Line(points={{-79,50},{-68,50},{-68,-26},
            {-42,-26}}, color={0,0,127}));
    connect(m_flow_sou.u, yDamSou)
      annotation (Line(points={{-82,-60},{-120,-60}}, color={0,0,127}));
    connect(m_flow_sou.y, vavSou.m_flow_in) annotation (Line(points={{-59,-60},{-52,
            -60},{-52,-22},{-42,-22}}, color={0,0,127}));
    connect(flo.TRooAir, TRooAir) annotation (Line(points={{47,22},{64,22},{64,80},
            {110,80}}, color={0,0,127}));
    connect(weaBus, flo.weaBus) annotation (Line(
        points={{20,90},{22,90},{22,26},{29,26}},
        color={255,204,51},
        thickness=0.5));
    connect(x_pTphi.X[1], vavNor.Xi_in[1]) annotation (Line(points={{-39,10},{
            -28,10},{-28,28},{-54,28},{-54,36},{-42,36}}, color={0,0,127}));
    connect(x_pTphi.X[1], vavSou.Xi_in[1]) annotation (Line(points={{-39,10},{
            -28,10},{-28,-14},{-60,-14},{-60,-34},{-42,-34}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
                   Rectangle(
          extent={{-100,-100},{100,100}},
          lineColor={0,0,127},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-156,152},{144,112}},
          textString="%name",
          lineColor={0,0,255})}),                                  Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end TwoZoneFixedSupplyTemperature;

  package BaseClass
    model TwoZoneFloor "Model of a two-zone floor of the building"
      replaceable package Medium = Modelica.Media.Interfaces.PartialMedium
        "Medium model for air" annotation (choicesAllMatching=true);

      parameter Boolean use_windPressure=true
        "Set to true to enable wind pressure";

      parameter Buildings.HeatTransfer.Types.InteriorConvection intConMod=Buildings.HeatTransfer.Types.InteriorConvection.Temperature
        "Convective heat transfer model for room-facing surfaces of opaque constructions";
      parameter Modelica.SIunits.Angle lat "Latitude";
      parameter Real winWalRat(
        min=0.01,
        max=0.99) = 0.33 "Window to wall ratio for exterior walls";
      parameter Modelica.SIunits.Length hWin = 1.5 "Height of windows";
      parameter Buildings.HeatTransfer.Data.Solids.Plywood matFur(x=0.15, nStaRef=5)
        "Material for furniture"
        annotation (Placement(transformation(extent={{140,460},{160,480}})));
      parameter Buildings.HeatTransfer.Data.Resistances.Carpet matCar "Carpet"
        annotation (Placement(transformation(extent={{180,460},{200,480}})));
      parameter Buildings.HeatTransfer.Data.Solids.Concrete matCon(
        x=0.1,
        k=1.311,
        c=836,
        nStaRef=5) "Concrete"
        annotation (Placement(transformation(extent={{140,430},{160,450}})));
      parameter Buildings.HeatTransfer.Data.Solids.Plywood matWoo(
        x=0.01,
        k=0.11,
        d=544,
        nStaRef=1) "Wood for exterior construction"
        annotation (Placement(transformation(extent={{140,400},{160,420}})));
      parameter Buildings.HeatTransfer.Data.Solids.Generic matIns(
        x=0.087,
        k=0.049,
        c=836.8,
        d=265,
        nStaRef=5) "Steelframe construction with insulation"
        annotation (Placement(transformation(extent={{180,400},{200,420}})));
      parameter Buildings.HeatTransfer.Data.Solids.GypsumBoard matGyp(
        x=0.0127,
        k=0.16,
        c=830,
        d=784,
        nStaRef=2) "Gypsum board"
        annotation (Placement(transformation(extent={{138,372},{158,392}})));
      parameter Buildings.HeatTransfer.Data.Solids.GypsumBoard matGyp2(
        x=0.025,
        k=0.16,
        c=830,
        d=784,
        nStaRef=2) "Gypsum board"
        annotation (Placement(transformation(extent={{178,372},{198,392}})));
      parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic conExtWal(final
          nLay=3, material={matWoo,matIns,matGyp}) "Exterior construction"
        annotation (Placement(transformation(extent={{280,460},{300,480}})));
      parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic conIntWal(final
          nLay=1, material={matGyp2}) "Interior wall construction"
        annotation (Placement(transformation(extent={{320,460},{340,480}})));
      parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic conFlo(final
          nLay=1, material={matCon}) "Floor construction (opa_a is carpet)"
        annotation (Placement(transformation(extent={{280,420},{300,440}})));
      parameter Buildings.HeatTransfer.Data.OpaqueConstructions.Generic conFur(final
          nLay=1, material={matFur}) "Construction for internal mass of furniture"
        annotation (Placement(transformation(extent={{320,420},{340,440}})));
      parameter Buildings.HeatTransfer.Data.Solids.Plywood matCarTra(
        k=0.11,
        d=544,
        nStaRef=1,
        x=0.215/0.11) "Wood for floor"
        annotation (Placement(transformation(extent={{102,460},{122,480}})));
      parameter Buildings.HeatTransfer.Data.GlazingSystems.DoubleClearAir13Clear glaSys(
        UFra=2,
        shade=Buildings.HeatTransfer.Data.Shades.Gray(),
        haveInteriorShade=false,
        haveExteriorShade=false) "Data record for the glazing system"
        annotation (Placement(transformation(extent={{240,460},{260,480}})));
      parameter Real kIntNor(min=0, max=1) = 1
        "Gain factor to scale internal heat gain in north zone";
      constant Modelica.SIunits.Height hRoo=2.74 "Room height";

      parameter Boolean sampleModel = false
        "Set to true to time-sample the model, which can give shorter simulation time if there is already time sampling in the system model"
        annotation (
          Evaluate=true,
          Dialog(tab="Experimental (may be changed in future releases)"));

      Buildings.ThermalZones.Detailed.MixedAir nor(
        redeclare package Medium = Medium,
        lat=lat,
        AFlo=568.77/hRoo,
        hRoo=hRoo,
        nConExt=0,
        nConExtWin=1,
        datConExtWin(
          layers={conExtWal},
          A={49.91*hRoo},
          glaSys={glaSys},
          wWin={winWalRat/hWin*49.91*hRoo},
          each hWin=hWin,
          fFra={0.1},
          til={Buildings.Types.Tilt.Wall},
          azi={Buildings.Types.Azimuth.N}),
        nConPar=2,
        datConPar(
          layers={conFlo,conFur},
          A={568.77/hRoo,414.68},
          til={Buildings.Types.Tilt.Floor,Buildings.Types.Tilt.Wall}),
        nConBou=3,
        datConBou(
          layers={conIntWal,conIntWal,conIntWal},
          A={6.47,40.76,6.47}*hRoo,
          til={Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall}),
        nSurBou=0,
        nPorts=5,
        intConMod=intConMod,
        energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
        final sampleModel=sampleModel) "North zone"
        annotation (Placement(transformation(extent={{144,116},{184,156}})));
      Buildings.ThermalZones.Detailed.MixedAir sou(
        redeclare package Medium = Medium,
        lat=lat,
        AFlo=2698/hRoo,
        hRoo=hRoo,
        nConExt=0,
        nConExtWin=0,
        nConPar=2,
        datConPar(
          layers={conFlo,conFur},
          A={2698/hRoo,1967.01},
          til={Buildings.Types.Tilt.Floor,Buildings.Types.Tilt.Wall}),
        nConBou=0,
        nSurBou=4,
        surBou(
          A={40.76,24.13,40.76,24.13}*hRoo,
          each absIR=0.9,
          each absSol=0.9,
          til={Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall, Buildings.Types.Tilt.Wall}),
        nPorts=6,
        intConMod=intConMod,
        energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial,
        final sampleModel=sampleModel) "South zone"
        annotation (Placement(transformation(extent={{144,36},{184,76}})));
      Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsNor[2](
          redeclare package Medium = Medium) "Fluid inlets and outlets"
        annotation (Placement(transformation(extent={{70,118},{110,134}})));
      Modelica.Fluid.Vessels.BaseClasses.VesselFluidPorts_b portsSou[2](
          redeclare package Medium = Medium) "Fluid inlets and outlets"
        annotation (Placement(transformation(extent={{70,38},{110,54}})));
      Modelica.Blocks.Math.MatrixGain gai(K=20*[0.4; 0.4; 0.2])
        "Matrix gain to split up heat gain in radiant, convective and latent gain"
        annotation (Placement(transformation(extent={{-100,100},{-80,120}})));
      Modelica.Blocks.Sources.Constant uSha(k=0)
        "Control signal for the shading device"
        annotation (Placement(transformation(extent={{-80,170},{-60,190}})));
      Modelica.Blocks.Routing.Replicator replicator(nout=1)
        annotation (Placement(transformation(extent={{-40,170},{-20,190}})));
      Buildings.BoundaryConditions.WeatherData.Bus weaBus "Weather bus"
        annotation (Placement(transformation(extent={{200,190},{220,210}})));
      Buildings.Examples.VAVReheat.ThermalZones.RoomLeakage leaNor(
        redeclare package Medium = Medium,
        VRoo=568.77,
        s=49.91/33.27,
        azi=Buildings.Types.Azimuth.N,
        final use_windPressure=use_windPressure)
        "Model for air infiltration through the envelope"
        annotation (Placement(transformation(extent={{-56,300},{-20,340}})));
      Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirNor
        "Air temperature sensor"
        annotation (Placement(transformation(extent={{292,280},{312,300}})));
      Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temAirSou
        "Air temperature sensor"
        annotation (Placement(transformation(extent={{294,218},{314,238}})));
      Modelica.Blocks.Routing.Multiplex2 multiplex2_1
        annotation (Placement(transformation(extent={{340,280},{360,300}})));
      Modelica.Blocks.Interfaces.RealOutput TRooAir[2](
        each unit="K",
        each displayUnit="degC") "Room air temperatures"
        annotation (Placement(transformation(extent={{380,150},{400,170}}),
            iconTransformation(extent={{380,150},{400,170}})));
      Buildings.Airflow.Multizone.DoorDiscretizedOpen opeNorCor(
        redeclare package Medium = Medium,
        wOpe=10,
        forceErrorControlOnFlow=false) "Opening between perimeter3 and core"
        annotation (Placement(transformation(extent={{80,74},{100,94}})));
      Modelica.Blocks.Sources.CombiTimeTable intGaiFra(
        table=[0,0.05;
               8,0.05;
               9,0.9;
               12,0.9;
               12,0.8;
               13,0.8;
               13,1;
               17,1;
               19,0.1;
               24,0.05],
        timeScale=3600,
        extrapolation=Modelica.Blocks.Types.Extrapolation.Periodic)
        "Fraction of internal heat gain"
        annotation (Placement(transformation(extent={{-140,100},{-120,120}})));
      Buildings.Fluid.Sensors.RelativePressure senRelPre(redeclare package Medium = Medium)
        "Building pressure measurement"
        annotation (Placement(transformation(extent={{60,240},{40,260}})));
      Buildings.Fluid.Sources.Outside out(nPorts=1, redeclare package Medium = Medium)
        annotation (Placement(transformation(extent={{-58,240},{-38,260}})));
      Modelica.Blocks.Interfaces.RealOutput p_rel
        "Relative pressure signal of building static pressure" annotation (
          Placement(transformation(
            extent={{-10,-10},{10,10}},
            rotation=180,
            origin={-170,220})));

      Modelica.Blocks.Math.Gain gaiIntNor[3](each k=kIntNor)
        "Gain for internal heat gain amplification for north zone"
        annotation (Placement(transformation(extent={{-60,134},{-40,154}})));
    equation
      connect(nor.surf_conBou[2],sou. surf_surBou[3]) annotation (Line(
          points={{170,120},{170,100},{200,100},{200,26},{160.2,26},{160.2,42.25}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(uSha.y, replicator.u) annotation (Line(
          points={{-59,180},{-42,180}},
          color={0,0,127},
          smooth=Smooth.None,
          pattern=LinePattern.Dash));
      connect(replicator.y, nor.uSha) annotation (Line(
          points={{-19,180},{130,180},{130,154},{142.4,154}},
          color={0,0,127},
          pattern=LinePattern.Dash,
          smooth=Smooth.None));
      connect(replicator.y,sou. uSha) annotation (Line(
          points={{-19,180},{130,180},{130,74},{142.4,74}},
          color={0,0,127},
          pattern=LinePattern.Dash,
          smooth=Smooth.None));
      connect(gai.y,sou. qGai_flow)          annotation (Line(
          points={{-79,110},{120,110},{120,64},{142.4,64}},
          color={0,0,127},
          pattern=LinePattern.Dash,
          smooth=Smooth.None));
      connect(nor.weaBus, weaBus) annotation (Line(
          points={{181.9,153.9},{182,160},{182,168},{210,168},{210,200}},
          color={255,204,51},
          thickness=0.5,
          smooth=Smooth.None));
      connect(sou.weaBus, weaBus) annotation (Line(
          points={{181.9,73.9},{181.9,90},{210,90},{210,200}},
          color={255,204,51},
          thickness=0.5,
          smooth=Smooth.None));
      connect(weaBus, leaNor.weaBus) annotation (Line(
          points={{210,200},{-80,200},{-80,320},{-56,320}},
          color={255,204,51},
          thickness=0.5,
          smooth=Smooth.None));
      connect(nor.heaPorAir, temAirNor.port) annotation (Line(
          points={{163,136},{164,136},{164,290},{292,290}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(sou.heaPorAir, temAirSou.port) annotation (Line(
          points={{163,56},{162,56},{162,228},{294,228}},
          color={191,0,0},
          smooth=Smooth.None));
      connect(nor.ports[1], portsNor[1]) annotation (Line(
          points={{149,122.8},{114,122.8},{114,126},{80,126}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(nor.ports[2], portsNor[2]) annotation (Line(
          points={{149,124.4},{124,124.4},{124,126},{100,126}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(sou.ports[1],portsSou [1]) annotation (Line(
          points={{149,42.6667},{114,42.6667},{114,46},{80,46}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(sou.ports[2],portsSou [2]) annotation (Line(
          points={{149,44},{124,44},{124,46},{100,46}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(leaNor.port_b, nor.ports[3]) annotation (Line(
          points={{-20,320},{138,320},{138,126},{149,126}},
          color={0,127,255},
          smooth=Smooth.None,
          thickness=0.5));
      connect(opeNorCor.port_b1, nor.ports[4]) annotation (Line(
          points={{100,90},{124,90},{124,127.6},{149,127.6}},
          color={0,127,255},
          smooth=Smooth.None,
          thickness=0.5));
      connect(opeNorCor.port_a2, nor.ports[5]) annotation (Line(
          points={{100,78},{124,78},{124,129.2},{149,129.2}},
          color={0,127,255},
          smooth=Smooth.None,
          thickness=0.5));
      connect(opeNorCor.port_a1,sou. ports[4]) annotation (Line(
          points={{80,90},{76,90},{76,60},{142,60},{142,46.6667},{149,46.6667}},
          color={0,127,255},
          smooth=Smooth.None));
      connect(opeNorCor.port_b2,sou. ports[4]) annotation (Line(
          points={{80,78},{76,78},{76,60},{142,60},{142,46.6667},{149,46.6667}},
          color={0,127,255},
          smooth=Smooth.None,
          thickness=0.5));
      connect(intGaiFra.y, gai.u) annotation (Line(
          points={{-119,110},{-102,110}},
          color={0,0,127},
          smooth=Smooth.None,
          pattern=LinePattern.Dash));
      connect(sou.ports[6],  senRelPre.port_a) annotation (Line(
          points={{149,49.3333},{110,49.3333},{110,250},{60,250}},
          color={0,127,255},
          smooth=Smooth.None,
          thickness=0.5));
      connect(out.weaBus, weaBus) annotation (Line(
          points={{-58,250.2},{-70,250.2},{-70,250},{-80,250},{-80,200},{210,200}},
          color={255,204,51},
          thickness=0.5,
          smooth=Smooth.None), Text(
          textString="%second",
          index=1,
          extent={{6,3},{6,3}}));
      connect(out.ports[1], senRelPre.port_b) annotation (Line(
          points={{-38,250},{40,250}},
          color={0,127,255},
          smooth=Smooth.None,
          thickness=0.5));
      connect(senRelPre.p_rel, p_rel) annotation (Line(
          points={{50,241},{50,220},{-170,220}},
          color={0,0,127},
          smooth=Smooth.None,
          pattern=LinePattern.Dash));
      connect(gai.y, gaiIntNor.u) annotation (Line(
          points={{-79,110},{-68,110},{-68,144},{-62,144}},
          color={0,0,127},
          pattern=LinePattern.Dash));
      connect(gaiIntNor.y, nor.qGai_flow) annotation (Line(
          points={{-39,144},{142.4,144}},
          color={0,0,127},
          pattern=LinePattern.Dash));
      connect(temAirNor.T, multiplex2_1.u1[1]) annotation (Line(points={{312,290},{320,
              290},{320,296},{338,296}}, color={0,0,127}));
      connect(temAirSou.T, multiplex2_1.u2[1]) annotation (Line(points={{314,228},{328,
              228},{328,284},{338,284}}, color={0,0,127}));
      connect(multiplex2_1.y, TRooAir) annotation (Line(points={{361,290},{370,290},
              {370,160},{390,160}}, color={0,0,127}));
      annotation (defaultComponentName = "flo",
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-160,-100},
                {400,500}},
            initialScale=0.1)),     Icon(coordinateSystem(
              preserveAspectRatio=true, extent={{-160,-100},{400,500}}), graphics={
            Rectangle(
              extent={{-80,-80},{380,180}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-60,160},{360,-60}},
              pattern=LinePattern.None,
              lineColor={117,148,176},
              fillColor={170,213,255},
              fillPattern=FillPattern.Sphere),
            Rectangle(
              extent={{0,-80},{294,-60}},
              lineColor={95,95,95},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{0,-74},{294,-66}},
              lineColor={95,95,95},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-58,-60},{360,100}},
              lineColor={95,95,95},
              fillColor={95,95,95},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-52,90},{352,-36}},
              pattern=LinePattern.None,
              lineColor={117,148,176},
              fillColor={170,213,255},
              fillPattern=FillPattern.Sphere),
            Rectangle(
              extent={{-80,120},{-60,-20}},
              lineColor={95,95,95},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{-74,120},{-66,-20}},
              lineColor={95,95,95},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{360,122},{380,-18}},
              lineColor={95,95,95},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{366,122},{374,-18}},
              lineColor={95,95,95},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{2,170},{296,178}},
              lineColor={95,95,95},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{2,160},{296,180}},
              lineColor={95,95,95},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Rectangle(
              extent={{2,166},{296,174}},
              lineColor={95,95,95},
              fillColor={170,213,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-84,234},{-62,200}},
              lineColor={0,0,255},
              textString="dP")}),
        Documentation(revisions="<html>
<ul>
<li>
May 1, 2013, by Michael Wetter:<br/>
Declared the parameter record to be a parameter, as declaring its elements
to be parameters does not imply that the whole record has the variability of a parameter.
</li>
<li>
January 23, 2020, by Milica Grahovac:<br/>
Updated core zone geometry parameters related to 
room heat and mass balance.
</li>
</ul>
</html>",     info="<html>
<p>
Model of a floor that consists
of five thermal zones that are representative of one floor of the
new construction medium office building for Chicago, IL,
as described in the set of DOE Commercial Building Benchmarks.
There are four perimeter zones and one core zone.
The envelope thermal properties meet ASHRAE Standard 90.1-2004.
</p>
</html>"));
    end TwoZoneFloor;
  end BaseClass;

  package Examples "Examples"
    model TwoZoneFixedSupplyTemperature
      extends Modelica.Icons.Example;

      dSpaceExample.TwoZones.TwoZoneFixedSupplyTemperature zones
        annotation (Placement(transformation(extent={{-8,-12},{12,8}})));
      Modelica.Blocks.Sources.Constant yDam(k=0.7)
        annotation (Placement(transformation(extent={{-80,0},{-60,20}})));
      Buildings.BoundaryConditions.WeatherData.ReaderTMY3
                                                weaDat(filNam=
            Modelica.Utilities.Files.loadResource(
            "modelica://Buildings/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos"))
        annotation (Placement(transformation(extent={{-80,40},{-60,60}})));
    equation
      connect(yDam.y, zones.yDamNor) annotation (Line(points={{-59,10},{-30,10},
              {-30,6},{-10,6}}, color={0,0,127}));
      connect(yDam.y, zones.yDamSou) annotation (Line(points={{-59,10},{-30,10},
              {-30,-8},{-10,-8}}, color={0,0,127}));
      connect(weaDat.weaBus, zones.weaBus) annotation (Line(
          points={{-60,50},{-5.8,50},{-5.8,7}},
          color={255,204,51},
          thickness=0.5));
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)),
        experiment(
          StartTime=18316800,
          StopTime=18403200,
          __Dymola_Algorithm="Dassl"));
    end TwoZoneFixedSupplyTemperature;
  end Examples;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end TwoZones;
