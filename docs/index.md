# bpmn - BPMN diagrams in R



R package [bpmn](https://github.com/bergant/bpmn) is an interface to the [bpmn-js](https://github.com/bpmn-io/bpmn-js) JavaScript library (a BPMN 2.0 rendering toolkit and web modeler) from [bpmn.io](https://bpmn.io/) - a "Web-based tooling for BPMN, DMN and CMMN diagrams".
 
Using JavaScript in R is handled by [htmlwidgets](https://github.com/ramnathv/htmlwidgets) package. 


## Install 
Install R package (and required java script libraries) from GitHub:


```r
devtools::install_github("bergant/bpmn")
```


## Display a BPMN diagram


```r
library(bpmn)
```


Use `bpmn` widget with a BPMN file:


```r
bpmn_file <- system.file("examples/qr-code.bpmn", package = "bpmn")
bpmn(bpmn_file)
```

<!--html_preserve--><div id="htmlwidget-aab2f969fea607789813" style="width:864px;height:336px;" class="bpmn html-widget"></div>
<script type="application/json" data-for="htmlwidget-aab2f969fea607789813">{"x":{"bpmn_model":"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"\" xsi:schemaLocation=\"http://www.omg.org/spec/BPMN/20100524/MODEL http://www.omg.org/spec/BPMN/2.0/20100501/BPMN20.xsd\">\n  <collaboration id=\"sid-c0e745ff-361e-4afb-8c8d-2a1fc32b1424\">\n    <participant id=\"sid-87F4C1D6-25E1-4A45-9DA7-AD945993D06F\" name=\"Customer\" processRef=\"sid-C3803939-0872-457F-8336-EAE484DC4A04\">\n    <\/participant>\n  <\/collaboration>\n  <process id=\"sid-C3803939-0872-457F-8336-EAE484DC4A04\" isClosed=\"false\" isExecutable=\"false\" name=\"Customer\" processType=\"None\">\n    <extensionElements/>\n    <laneSet id=\"sid-b167d0d7-e761-4636-9200-76b7f0e8e83a\">\n      <lane id=\"sid-57E4FE0D-18E4-478D-BC5D-B15164E93254\">\n        <flowNodeRef>sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138<\/flowNodeRef>\n        <flowNodeRef>sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26<\/flowNodeRef>\n        <flowNodeRef>SCAN_OK<\/flowNodeRef>\n        <flowNodeRef>sid-E49425CF-8287-4798-B622-D2A7D78EF00B<\/flowNodeRef>\n        <flowNodeRef>sid-E433566C-2289-4BEB-A19C-1697048900D2<\/flowNodeRef>\n        <flowNodeRef>sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9<\/flowNodeRef>\n      <\/lane>\n    <\/laneSet>\n    <startEvent id=\"sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138\" name=\"Notices&#10;QR code\">\n      <outgoing>sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD<\/outgoing>\n    <\/startEvent>\n    <task completionQuantity=\"1\" id=\"sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26\" isForCompensation=\"false\" name=\"Scan QR code\" startQuantity=\"1\">\n      <incoming>sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D<\/incoming>\n      <outgoing>sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A<\/outgoing>\n    <\/task>\n    <exclusiveGateway gatewayDirection=\"Diverging\" id=\"SCAN_OK\" name=\"Scan successful?&#10;\">\n      <incoming>sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A<\/incoming>\n      <outgoing>sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB<\/outgoing>\n      <outgoing>sid-337A23B9-A923-4CCE-B613-3E247B773CCE<\/outgoing>\n    <\/exclusiveGateway>\n    <task completionQuantity=\"1\" id=\"sid-E49425CF-8287-4798-B622-D2A7D78EF00B\" isForCompensation=\"false\" name=\"Open product information in mobile  app\" startQuantity=\"1\">\n      <incoming>sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB<\/incoming>\n      <outgoing>sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C<\/outgoing>\n    <\/task>\n    <endEvent id=\"sid-E433566C-2289-4BEB-A19C-1697048900D2\" name=\"Is informed\">\n      <incoming>sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C<\/incoming>\n    <\/endEvent>\n    <exclusiveGateway gatewayDirection=\"Converging\" id=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\">\n      <incoming>sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD<\/incoming>\n      <incoming>sid-337A23B9-A923-4CCE-B613-3E247B773CCE<\/incoming>\n      <outgoing>sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D<\/outgoing>\n    <\/exclusiveGateway>\n    <sequenceFlow id=\"sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD\" sourceRef=\"sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138\" targetRef=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\"/>\n    <sequenceFlow id=\"sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A\" sourceRef=\"sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26\" targetRef=\"SCAN_OK\"/>\n    <sequenceFlow id=\"sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C\" sourceRef=\"sid-E49425CF-8287-4798-B622-D2A7D78EF00B\" targetRef=\"sid-E433566C-2289-4BEB-A19C-1697048900D2\"/>\n    <sequenceFlow id=\"sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB\" name=\"No\" sourceRef=\"SCAN_OK\" targetRef=\"sid-E49425CF-8287-4798-B622-D2A7D78EF00B\"/>\n    <sequenceFlow id=\"sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D\" sourceRef=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\" targetRef=\"sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26\"/>\n    <sequenceFlow id=\"sid-337A23B9-A923-4CCE-B613-3E247B773CCE\" name=\"Yes\" sourceRef=\"SCAN_OK\" targetRef=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\"/>\n  <\/process>\n  <bpmndi:BPMNDiagram id=\"sid-74620812-92c4-44e5-949c-aa47393d3830\">\n    <bpmndi:BPMNPlane bpmnElement=\"sid-c0e745ff-361e-4afb-8c8d-2a1fc32b1424\" id=\"sid-cdcae759-2af7-4a6d-bd02-53f3352a731d\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-87F4C1D6-25E1-4A45-9DA7-AD945993D06F\" id=\"sid-87F4C1D6-25E1-4A45-9DA7-AD945993D06F_gui\" isHorizontal=\"true\">\n        <omgdc:Bounds height=\"250.0\" width=\"933.0\" x=\"42.5\" y=\"75.0\"/>\n        <bpmndi:BPMNLabel labelStyle=\"sid-84cb49fd-2f7c-44fb-8950-83c3fa153d3b\">\n          <omgdc:Bounds height=\"59.142852783203125\" width=\"12.000000000000014\" x=\"47.49999999999999\" y=\"170.42857360839844\"/>\n        <\/bpmndi:BPMNLabel>\n      <\/bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-57E4FE0D-18E4-478D-BC5D-B15164E93254\" id=\"sid-57E4FE0D-18E4-478D-BC5D-B15164E93254_gui\" isHorizontal=\"true\">\n        <omgdc:Bounds height=\"250.0\" width=\"903.0\" x=\"72.5\" y=\"75.0\"/>\n      <\/bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138\" id=\"sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138_gui\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"150.0\" y=\"165.0\"/>\n        <bpmndi:BPMNLabel labelStyle=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\n          <omgdc:Bounds height=\"22.0\" width=\"46.35714340209961\" x=\"141.8214282989502\" y=\"197.0\"/>\n        <\/bpmndi:BPMNLabel>\n      <\/bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26\" id=\"sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26_gui\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"352.5\" y=\"140.0\"/>\n        <bpmndi:BPMNLabel labelStyle=\"sid-84cb49fd-2f7c-44fb-8950-83c3fa153d3b\">\n          <omgdc:Bounds height=\"12.0\" width=\"84.0\" x=\"360.5\" y=\"172.0\"/>\n        <\/bpmndi:BPMNLabel>\n      <\/bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SCAN_OK\" id=\"SCAN_OK_gui\" isMarkerVisible=\"true\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"550.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel labelStyle=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\n          <omgdc:Bounds height=\"12.0\" width=\"102.0\" x=\"521.0\" y=\"127.0\"/>\n        <\/bpmndi:BPMNLabel>\n      <\/bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E49425CF-8287-4798-B622-D2A7D78EF00B\" id=\"sid-E49425CF-8287-4798-B622-D2A7D78EF00B_gui\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"687.5\" y=\"140.0\"/>\n        <bpmndi:BPMNLabel labelStyle=\"sid-84cb49fd-2f7c-44fb-8950-83c3fa153d3b\">\n          <omgdc:Bounds height=\"36.0\" width=\"83.14285278320312\" x=\"695.9285736083984\" y=\"162.0\"/>\n        <\/bpmndi:BPMNLabel>\n      <\/bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E433566C-2289-4BEB-A19C-1697048900D2\" id=\"sid-E433566C-2289-4BEB-A19C-1697048900D2_gui\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"865.0\" y=\"166.0\"/>\n        <bpmndi:BPMNLabel labelStyle=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\n          <omgdc:Bounds height=\"11.0\" width=\"62.857147216796875\" x=\"847.5714263916016\" y=\"196.0\"/>\n        <\/bpmndi:BPMNLabel>\n      <\/bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\" id=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9_gui\" isMarkerVisible=\"true\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"160.0\"/>\n      <\/bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A\" id=\"sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A_gui\">\n        <omgdi:waypoint x=\"452.5\" y=\"180\"/>\n        <omgdi:waypoint x=\"550.0\" y=\"180\"/>\n      <\/bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB\" id=\"sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB_gui\">\n        <omgdi:waypoint x=\"590.0\" y=\"180\"/>\n        <omgdi:waypoint x=\"687.5\" y=\"180\"/>\n        <bpmndi:BPMNLabel labelStyle=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\n          <omgdc:Bounds height=\"12.048704338048935\" width=\"16.32155963195521\" x=\"597.8850936986571\" y=\"155\"/>\n        <\/bpmndi:BPMNLabel>\n      <\/bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD\" id=\"sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD_gui\">\n        <omgdi:waypoint x=\"180.0\" y=\"180\"/>\n        <omgdi:waypoint x=\"240.0\" y=\"180\"/>\n      <\/bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D\" id=\"sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D_gui\">\n        <omgdi:waypoint x=\"280.0\" y=\"180\"/>\n        <omgdi:waypoint x=\"352.5\" y=\"180\"/>\n      <\/bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C\" id=\"sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C_gui\">\n        <omgdi:waypoint x=\"787.5\" y=\"180.0\"/>\n        <omgdi:waypoint x=\"865.0\" y=\"180.0\"/>\n      <\/bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-337A23B9-A923-4CCE-B613-3E247B773CCE\" id=\"sid-337A23B9-A923-4CCE-B613-3E247B773CCE_gui\">\n        <omgdi:waypoint x=\"570.5\" y=\"200.0\"/>\n        <omgdi:waypoint x=\"570.5\" y=\"269.0\"/>\n        <omgdi:waypoint x=\"260.5\" y=\"269.0\"/>\n        <omgdi:waypoint x=\"260.5\" y=\"200.0\"/>\n        <bpmndi:BPMNLabel labelStyle=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\n          <omgdc:Bounds height=\"21.4285888671875\" width=\"12.0\" x=\"550\" y=\"205\"/>\n        <\/bpmndi:BPMNLabel>\n      <\/bpmndi:BPMNEdge>\n    <\/bpmndi:BPMNPlane>\n    <bpmndi:BPMNLabelStyle id=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\n      <omgdc:Font isBold=\"false\" isItalic=\"false\" isStrikeThrough=\"false\" isUnderline=\"false\" name=\"Arial\" size=\"11.0\"/>\n    <\/bpmndi:BPMNLabelStyle>\n    <bpmndi:BPMNLabelStyle id=\"sid-84cb49fd-2f7c-44fb-8950-83c3fa153d3b\">\n      <omgdc:Font isBold=\"false\" isItalic=\"false\" isStrikeThrough=\"false\" isUnderline=\"false\" name=\"Arial\" size=\"12.0\"/>\n    <\/bpmndi:BPMNLabelStyle>\n  <\/bpmndi:BPMNDiagram>\n<\/definitions>\n"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->


## Overlays

We can add additional notes (or any html element) aside any element of the 
diagram.


```r
overlays <- list(
  
  overlay(
    element = "SCAN_OK", 
    html = "<div style='color: red'>Mixed up the labels?</div>"
  ),
  overlay(
    element = "sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26", 
    html = "<div style='color: red'>Manually?</div>",
    top = -40,
    left = -40
  )
)

bpmn(bpmn_file, overlays = overlays)
```

<!--html_preserve--><div id="htmlwidget-711fe78102326af2b0a2" style="width:864px;height:336px;" class="bpmn html-widget"></div>
<script type="application/json" data-for="htmlwidget-711fe78102326af2b0a2">{"x":{"bpmn_model":"<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" expressionLanguage=\"http://www.w3.org/1999/XPath\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" targetNamespace=\"\" xsi:schemaLocation=\"http://www.omg.org/spec/BPMN/20100524/MODEL http://www.omg.org/spec/BPMN/2.0/20100501/BPMN20.xsd\">\n  <collaboration id=\"sid-c0e745ff-361e-4afb-8c8d-2a1fc32b1424\">\n    <participant id=\"sid-87F4C1D6-25E1-4A45-9DA7-AD945993D06F\" name=\"Customer\" processRef=\"sid-C3803939-0872-457F-8336-EAE484DC4A04\">\n    <\/participant>\n  <\/collaboration>\n  <process id=\"sid-C3803939-0872-457F-8336-EAE484DC4A04\" isClosed=\"false\" isExecutable=\"false\" name=\"Customer\" processType=\"None\">\n    <extensionElements/>\n    <laneSet id=\"sid-b167d0d7-e761-4636-9200-76b7f0e8e83a\">\n      <lane id=\"sid-57E4FE0D-18E4-478D-BC5D-B15164E93254\">\n        <flowNodeRef>sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138<\/flowNodeRef>\n        <flowNodeRef>sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26<\/flowNodeRef>\n        <flowNodeRef>SCAN_OK<\/flowNodeRef>\n        <flowNodeRef>sid-E49425CF-8287-4798-B622-D2A7D78EF00B<\/flowNodeRef>\n        <flowNodeRef>sid-E433566C-2289-4BEB-A19C-1697048900D2<\/flowNodeRef>\n        <flowNodeRef>sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9<\/flowNodeRef>\n      <\/lane>\n    <\/laneSet>\n    <startEvent id=\"sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138\" name=\"Notices&#10;QR code\">\n      <outgoing>sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD<\/outgoing>\n    <\/startEvent>\n    <task completionQuantity=\"1\" id=\"sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26\" isForCompensation=\"false\" name=\"Scan QR code\" startQuantity=\"1\">\n      <incoming>sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D<\/incoming>\n      <outgoing>sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A<\/outgoing>\n    <\/task>\n    <exclusiveGateway gatewayDirection=\"Diverging\" id=\"SCAN_OK\" name=\"Scan successful?&#10;\">\n      <incoming>sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A<\/incoming>\n      <outgoing>sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB<\/outgoing>\n      <outgoing>sid-337A23B9-A923-4CCE-B613-3E247B773CCE<\/outgoing>\n    <\/exclusiveGateway>\n    <task completionQuantity=\"1\" id=\"sid-E49425CF-8287-4798-B622-D2A7D78EF00B\" isForCompensation=\"false\" name=\"Open product information in mobile  app\" startQuantity=\"1\">\n      <incoming>sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB<\/incoming>\n      <outgoing>sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C<\/outgoing>\n    <\/task>\n    <endEvent id=\"sid-E433566C-2289-4BEB-A19C-1697048900D2\" name=\"Is informed\">\n      <incoming>sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C<\/incoming>\n    <\/endEvent>\n    <exclusiveGateway gatewayDirection=\"Converging\" id=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\">\n      <incoming>sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD<\/incoming>\n      <incoming>sid-337A23B9-A923-4CCE-B613-3E247B773CCE<\/incoming>\n      <outgoing>sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D<\/outgoing>\n    <\/exclusiveGateway>\n    <sequenceFlow id=\"sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD\" sourceRef=\"sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138\" targetRef=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\"/>\n    <sequenceFlow id=\"sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A\" sourceRef=\"sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26\" targetRef=\"SCAN_OK\"/>\n    <sequenceFlow id=\"sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C\" sourceRef=\"sid-E49425CF-8287-4798-B622-D2A7D78EF00B\" targetRef=\"sid-E433566C-2289-4BEB-A19C-1697048900D2\"/>\n    <sequenceFlow id=\"sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB\" name=\"No\" sourceRef=\"SCAN_OK\" targetRef=\"sid-E49425CF-8287-4798-B622-D2A7D78EF00B\"/>\n    <sequenceFlow id=\"sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D\" sourceRef=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\" targetRef=\"sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26\"/>\n    <sequenceFlow id=\"sid-337A23B9-A923-4CCE-B613-3E247B773CCE\" name=\"Yes\" sourceRef=\"SCAN_OK\" targetRef=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\"/>\n  <\/process>\n  <bpmndi:BPMNDiagram id=\"sid-74620812-92c4-44e5-949c-aa47393d3830\">\n    <bpmndi:BPMNPlane bpmnElement=\"sid-c0e745ff-361e-4afb-8c8d-2a1fc32b1424\" id=\"sid-cdcae759-2af7-4a6d-bd02-53f3352a731d\">\n      <bpmndi:BPMNShape bpmnElement=\"sid-87F4C1D6-25E1-4A45-9DA7-AD945993D06F\" id=\"sid-87F4C1D6-25E1-4A45-9DA7-AD945993D06F_gui\" isHorizontal=\"true\">\n        <omgdc:Bounds height=\"250.0\" width=\"933.0\" x=\"42.5\" y=\"75.0\"/>\n        <bpmndi:BPMNLabel labelStyle=\"sid-84cb49fd-2f7c-44fb-8950-83c3fa153d3b\">\n          <omgdc:Bounds height=\"59.142852783203125\" width=\"12.000000000000014\" x=\"47.49999999999999\" y=\"170.42857360839844\"/>\n        <\/bpmndi:BPMNLabel>\n      <\/bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-57E4FE0D-18E4-478D-BC5D-B15164E93254\" id=\"sid-57E4FE0D-18E4-478D-BC5D-B15164E93254_gui\" isHorizontal=\"true\">\n        <omgdc:Bounds height=\"250.0\" width=\"903.0\" x=\"72.5\" y=\"75.0\"/>\n      <\/bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138\" id=\"sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138_gui\">\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"150.0\" y=\"165.0\"/>\n        <bpmndi:BPMNLabel labelStyle=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\n          <omgdc:Bounds height=\"22.0\" width=\"46.35714340209961\" x=\"141.8214282989502\" y=\"197.0\"/>\n        <\/bpmndi:BPMNLabel>\n      <\/bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26\" id=\"sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26_gui\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"352.5\" y=\"140.0\"/>\n        <bpmndi:BPMNLabel labelStyle=\"sid-84cb49fd-2f7c-44fb-8950-83c3fa153d3b\">\n          <omgdc:Bounds height=\"12.0\" width=\"84.0\" x=\"360.5\" y=\"172.0\"/>\n        <\/bpmndi:BPMNLabel>\n      <\/bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"SCAN_OK\" id=\"SCAN_OK_gui\" isMarkerVisible=\"true\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"550.0\" y=\"160.0\"/>\n        <bpmndi:BPMNLabel labelStyle=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\n          <omgdc:Bounds height=\"12.0\" width=\"102.0\" x=\"521.0\" y=\"127.0\"/>\n        <\/bpmndi:BPMNLabel>\n      <\/bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E49425CF-8287-4798-B622-D2A7D78EF00B\" id=\"sid-E49425CF-8287-4798-B622-D2A7D78EF00B_gui\">\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"687.5\" y=\"140.0\"/>\n        <bpmndi:BPMNLabel labelStyle=\"sid-84cb49fd-2f7c-44fb-8950-83c3fa153d3b\">\n          <omgdc:Bounds height=\"36.0\" width=\"83.14285278320312\" x=\"695.9285736083984\" y=\"162.0\"/>\n        <\/bpmndi:BPMNLabel>\n      <\/bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-E433566C-2289-4BEB-A19C-1697048900D2\" id=\"sid-E433566C-2289-4BEB-A19C-1697048900D2_gui\">\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"865.0\" y=\"166.0\"/>\n        <bpmndi:BPMNLabel labelStyle=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\n          <omgdc:Bounds height=\"11.0\" width=\"62.857147216796875\" x=\"847.5714263916016\" y=\"196.0\"/>\n        <\/bpmndi:BPMNLabel>\n      <\/bpmndi:BPMNShape>\n      <bpmndi:BPMNShape bpmnElement=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9\" id=\"sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9_gui\" isMarkerVisible=\"true\">\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"160.0\"/>\n      <\/bpmndi:BPMNShape>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A\" id=\"sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A_gui\">\n        <omgdi:waypoint x=\"452.5\" y=\"180\"/>\n        <omgdi:waypoint x=\"550.0\" y=\"180\"/>\n      <\/bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB\" id=\"sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB_gui\">\n        <omgdi:waypoint x=\"590.0\" y=\"180\"/>\n        <omgdi:waypoint x=\"687.5\" y=\"180\"/>\n        <bpmndi:BPMNLabel labelStyle=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\n          <omgdc:Bounds height=\"12.048704338048935\" width=\"16.32155963195521\" x=\"597.8850936986571\" y=\"155\"/>\n        <\/bpmndi:BPMNLabel>\n      <\/bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD\" id=\"sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD_gui\">\n        <omgdi:waypoint x=\"180.0\" y=\"180\"/>\n        <omgdi:waypoint x=\"240.0\" y=\"180\"/>\n      <\/bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D\" id=\"sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D_gui\">\n        <omgdi:waypoint x=\"280.0\" y=\"180\"/>\n        <omgdi:waypoint x=\"352.5\" y=\"180\"/>\n      <\/bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C\" id=\"sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C_gui\">\n        <omgdi:waypoint x=\"787.5\" y=\"180.0\"/>\n        <omgdi:waypoint x=\"865.0\" y=\"180.0\"/>\n      <\/bpmndi:BPMNEdge>\n      <bpmndi:BPMNEdge bpmnElement=\"sid-337A23B9-A923-4CCE-B613-3E247B773CCE\" id=\"sid-337A23B9-A923-4CCE-B613-3E247B773CCE_gui\">\n        <omgdi:waypoint x=\"570.5\" y=\"200.0\"/>\n        <omgdi:waypoint x=\"570.5\" y=\"269.0\"/>\n        <omgdi:waypoint x=\"260.5\" y=\"269.0\"/>\n        <omgdi:waypoint x=\"260.5\" y=\"200.0\"/>\n        <bpmndi:BPMNLabel labelStyle=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\n          <omgdc:Bounds height=\"21.4285888671875\" width=\"12.0\" x=\"550\" y=\"205\"/>\n        <\/bpmndi:BPMNLabel>\n      <\/bpmndi:BPMNEdge>\n    <\/bpmndi:BPMNPlane>\n    <bpmndi:BPMNLabelStyle id=\"sid-e0502d32-f8d1-41cf-9c4a-cbb49fecf581\">\n      <omgdc:Font isBold=\"false\" isItalic=\"false\" isStrikeThrough=\"false\" isUnderline=\"false\" name=\"Arial\" size=\"11.0\"/>\n    <\/bpmndi:BPMNLabelStyle>\n    <bpmndi:BPMNLabelStyle id=\"sid-84cb49fd-2f7c-44fb-8950-83c3fa153d3b\">\n      <omgdc:Font isBold=\"false\" isItalic=\"false\" isStrikeThrough=\"false\" isUnderline=\"false\" name=\"Arial\" size=\"12.0\"/>\n    <\/bpmndi:BPMNLabelStyle>\n  <\/bpmndi:BPMNDiagram>\n<\/definitions>\n","overlays":[{"element":"SCAN_OK","type":"note","overlay":{"html":"<div style='color: red'>Mixed up the labels?<\/div>","position":{"bottom":0,"right":0}}},{"element":"sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26","type":"note","overlay":{"html":"<div style='color: red'>Manually?<\/div>","position":{"left":-40,"top":-40}}}]},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->

## Elements in the diagram

Extract elements from BPMN with `bpmn_get_elements`:


```r
library(xml2)

htmlTable::htmlTable(align = "lll",
  bpmn_get_elements(
    read_xml(bpmn_file)
  )
)
```

<table class='gmisc_table' style='border-collapse: collapse; margin-top: 1em; margin-bottom: 1em;' >
<thead>
<tr>
<th style='border-bottom: 1px solid grey; border-top: 2px solid grey;'> </th>
<th style='border-bottom: 1px solid grey; border-top: 2px solid grey; text-align: center;'>type</th>
<th style='border-bottom: 1px solid grey; border-top: 2px solid grey; text-align: center;'>name</th>
<th style='border-bottom: 1px solid grey; border-top: 2px solid grey; text-align: center;'>id</th>
</tr>
</thead>
<tbody>
<tr>
<td style='text-align: left;'>1</td>
<td style='text-align: left;'>extensionElements</td>
<td style='text-align: left;'></td>
<td style='text-align: left;'></td>
</tr>
<tr>
<td style='text-align: left;'>2</td>
<td style='text-align: left;'>laneSet</td>
<td style='text-align: left;'></td>
<td style='text-align: left;'>sid-b167d0d7-e761-4636-9200-76b7f0e8e83a</td>
</tr>
<tr>
<td style='text-align: left;'>3</td>
<td style='text-align: left;'>startEvent</td>
<td style='text-align: left;'>Notices
QR code</td>
<td style='text-align: left;'>sid-D7F237E8-56D0-4283-A3CE-4F0EFE446138</td>
</tr>
<tr>
<td style='text-align: left;'>4</td>
<td style='text-align: left;'>task</td>
<td style='text-align: left;'>Scan QR code</td>
<td style='text-align: left;'>sid-52EB1772-F36E-433E-8F5B-D5DFD26E6F26</td>
</tr>
<tr>
<td style='text-align: left;'>5</td>
<td style='text-align: left;'>exclusiveGateway</td>
<td style='text-align: left;'>Scan successful?
</td>
<td style='text-align: left;'>SCAN_OK</td>
</tr>
<tr>
<td style='text-align: left;'>6</td>
<td style='text-align: left;'>task</td>
<td style='text-align: left;'>Open product information in mobile  app</td>
<td style='text-align: left;'>sid-E49425CF-8287-4798-B622-D2A7D78EF00B</td>
</tr>
<tr>
<td style='text-align: left;'>7</td>
<td style='text-align: left;'>endEvent</td>
<td style='text-align: left;'>Is informed</td>
<td style='text-align: left;'>sid-E433566C-2289-4BEB-A19C-1697048900D2</td>
</tr>
<tr>
<td style='text-align: left;'>8</td>
<td style='text-align: left;'>exclusiveGateway</td>
<td style='text-align: left;'></td>
<td style='text-align: left;'>sid-5134932A-1863-4FFA-BB3C-A4B4078B11A9</td>
</tr>
<tr>
<td style='text-align: left;'>9</td>
<td style='text-align: left;'>sequenceFlow</td>
<td style='text-align: left;'></td>
<td style='text-align: left;'>sid-7B791A11-2F2E-4D80-AFB3-91A02CF2B4FD</td>
</tr>
<tr>
<td style='text-align: left;'>10</td>
<td style='text-align: left;'>sequenceFlow</td>
<td style='text-align: left;'></td>
<td style='text-align: left;'>sid-EE8A7BA0-5D66-4F8B-80E3-CC2751B3856A</td>
</tr>
<tr>
<td style='text-align: left;'>11</td>
<td style='text-align: left;'>sequenceFlow</td>
<td style='text-align: left;'></td>
<td style='text-align: left;'>sid-57EB1F24-BD94-479A-BF1F-57F1EAA19C6C</td>
</tr>
<tr>
<td style='text-align: left;'>12</td>
<td style='text-align: left;'>sequenceFlow</td>
<td style='text-align: left;'>No</td>
<td style='text-align: left;'>sid-8B820AF5-DC5C-4618-B854-E08B71FB55CB</td>
</tr>
<tr>
<td style='text-align: left;'>13</td>
<td style='text-align: left;'>sequenceFlow</td>
<td style='text-align: left;'></td>
<td style='text-align: left;'>sid-4DC479E5-5C20-4948-BCFC-9EC5E2F66D8D</td>
</tr>
<tr>
<td style='border-bottom: 2px solid grey; text-align: left;'>14</td>
<td style='border-bottom: 2px solid grey; text-align: left;'>sequenceFlow</td>
<td style='border-bottom: 2px solid grey; text-align: left;'>Yes</td>
<td style='border-bottom: 2px solid grey; text-align: left;'>sid-337A23B9-A923-4CCE-B613-3E247B773CCE</td>
</tr>
</tbody>
</table>

## More

There are a lot of bpmn-js features (e.g. designing a new diagram) which are not 
yet supported by this widget. Explore these on [bpmn.io demo site](http://demo.bpmn.io/).


## Project

GitHub: https://github.com/bergant/bpmn

Issues: https://github.com/bergant/bpmn/issues


## Licenses

bpmn package: MIT License

See [license file](https://github.com/bergant/bpmn/blob/master/inst/htmlwidgets/lib/bpmn-js/LICENSE) for the included **bpmn-js** library
