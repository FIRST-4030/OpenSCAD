include <../Global/Parameters.scad>
use <IntoTheDeep.scad>
use <Simulator.scad>

showPosition = true;
showAprilTags = true;
isBlue = true;

/*
** Define the various robot pose positions
** "none,start,stabilizer,
** "setForPush1,setForPush2,setForPush3,setForPush4,setForPush5,
** "push1,push2,deliver1,deliver2,deliver3,pick2,pick3,park
*/
DRAWPOSE = "none"; 

if (showAprilTags) {
    DisplayAprilTags();
}

robotColor = "white";

startX   = isBlue ? -6 : 15;
startY   = isBlue ? 62.5 : -62.5;
startAng = isBlue ? -90 : 90;
startExt = "start";
if (DRAWPOSE == "start") positionRobot(robotColor,startX,startY,startAng,startExt);

stabilizerX   = isBlue ? -6 : 15;
stabilizerY   = isBlue ? 35 : -62.5;
stabilizerAng = isBlue ? -90 : 90;
stabilizerExt = "stabilizer";
if (DRAWPOSE == "stabilizer") positionRobot(robotColor,stabilizerX,stabilizerY,stabilizerAng,stabilizerExt);

setForPick1X   = isBlue ? -58 : 15;
setForPick1Y   = isBlue ? 40 : -62.5;
setForPick1Ang = isBlue ? 55 : 90;
setForPick1Ext = "corner";
if (DRAWPOSE == "setForPick1") positionRobot(robotColor,setForPick1X,setForPick1Y,setForPick1Ang,setForPick1Ext);

place1X   = isBlue ? -58 : 15;
place1Y   = isBlue ? 40 : -62.5;
place1Ang = isBlue ? 270 : 90;
place1Ext = "deliver";
if (DRAWPOSE == "place1") positionRobot(robotColor,place1X,place1Y,place1Ang,place1Ext);

setForPick2X   = isBlue ? -58 : 15;
setForPick2Y   = isBlue ? 40 : -62.5;
setForPick2Ang = isBlue ? 90 : 90;
setForPick2Ext = "center";
if (DRAWPOSE == "setForPick2") positionRobot(robotColor,setForPick2X,setForPick2Y,setForPick2Ang,setForPick2Ext);

place2X   = isBlue ? -58 : 15;
place2Y   = isBlue ? 40 : -62.5;
place2Ang = isBlue ? 270 : 90;
place2Ext = "deliver";
if (DRAWPOSE == "place2") positionRobot(robotColor,place2X,place2Y,place2Ang,place2Ext);

setForPick3X  = isBlue ? -58 : 15;
setForPick3Y   = isBlue ? 40 : -62.5;
setForPick3Ang = isBlue ? 130 : 90;
setForPick3Ext = "corner";
if (DRAWPOSE == "setForPick3") positionRobot(robotColor,setForPick3X,setForPick3Y,setForPick3Ang,setForPick3Ext);

place3X   = isBlue ? -58 : 15;
place3Y   = isBlue ? 40 : -62.5;
place3Ang = isBlue ? 270 : 90;
place3Ext = "deliver";
if (DRAWPOSE == "place3") positionRobot(robotColor,place3X,place3Y,place3Ang,place3Ext);

pick1X = isBlue ? -58 : 15;
pick1Y = isBlue ? 60 : -62.5;
pick1Ang = isBlue ? 270 : 90;
pick1Ext = "pick";
if (DRAWPOSE == "pick1") positionRobot(robotColor,pick1X,pick1Y,pick1Ang,pick1Ext);

deliver1X = isBlue ? -6 : 15;
deliver1Y = isBlue ? 35 : -62.5;
deliver1Ang = isBlue ? 270 : 90;
deliver1Ext = "deliver";
if (DRAWPOSE == "deliver1") positionRobot(robotColor,deliver1X,deliver1Y,deliver1Ang,deliver1Ext);

pick2X = isBlue ? -37 : 15;
pick2Y = isBlue ? 60 : -62.5;
pick2Ang = isBlue ? 270 : 90;
pick2Ext = "pick";
if (DRAWPOSE == "pick2") positionRobot(robotColor,pick2X,pick2Y,pick2Ang,pick2Ext);

deliver2X = isBlue ? -6 : 15;
deliver2Y = isBlue ? 35 : -62.5;
deliver2Ang = isBlue ? 270 : 90;
deliver2Ext = "deliver";
if (DRAWPOSE == "deliver2") positionRobot(robotColor,deliver2X,deliver2Y,deliver2Ang,deliver2Ext);

pick3X = isBlue ? -37 : 15;
pick3Y = isBlue ? 60 : -62.5;
pick3Ang = isBlue ? 270 : 90;
pick3Ext = "pick";
if (DRAWPOSE == "pick3") positionRobot(robotColor,pick3X,pick3Y,pick3Ang,pick3Ext);

deliver3X = isBlue ? -6 : 15;
deliver3Y = isBlue ? 35 : -62.5;
deliver3Ang = isBlue ? 270 : 90;
deliver3Ext = "deliver";
if (DRAWPOSE == "deliver3") positionRobot(robotColor,deliver3X,deliver3Y,deliver3Ang,deliver3Ext);

pick4X = isBlue ? -37 : 15;
pick4Y = isBlue ? 60 : -62.5;
pick4Ang = isBlue ? 270 : 90;
pick4Ext = "pick";
if (DRAWPOSE == "pick4") positionRobot(robotColor,pick4X,pick4Y,pick4Ang,pick4Ext);

deliver4X = isBlue ? -6 : 15;
deliver4Y = isBlue ? 35 : -62.5;
deliver4Ang = isBlue ? 270 : 90;
deliver4Ext = "deliver";
if (DRAWPOSE == "deliver4") positionRobot(robotColor,deliver4X,deliver4Y,deliver4Ang,deliver4Ext);

pick5X = isBlue ? -37 : 15;
pick5Y = isBlue ? 60 : -62.5;
pick5Ang = isBlue ? 270 : 90;
pick5Ext = "pick";
if (DRAWPOSE == "pick5") positionRobot(robotColor,pick5X,pick4Y,pick5Ang,pick5Ext);

deliver5X = isBlue ? -6 : 15;
deliver5Y = isBlue ? 35 : -62.5;
deliver5Ang = isBlue ? 270 : 90;
deliver5Ext = "deliver";
if (DRAWPOSE == "deliver5") positionRobot(robotColor,deliver5X,deliver5Y,deliver5Ang,deliver5Ext);

parkX = isBlue ? -50 : 15;
parkY = isBlue ? 60 : -62.5;
parkAng = isBlue ? 330 : 90;
parkExt = "park";
if (DRAWPOSE == "park") positionRobot(robotColor,parkX,parkY,parkAng,parkExt);

DrawField();

//Concatinate moves:
loc0  = [[startX,startY,startAng,startExt]];
loc1  = concat(loc0, [[stabilizerX,stabilizerY,stabilizerAng,stabilizerExt]]);
loc2  = concat(loc1, [[setForPick1X,setForPick1Y,setForPick1Ang,setForPick1Ext]]);
loc3  = concat(loc2, [[place1X,place1Y,place1Ang,place1Ext]]);
loc4  = concat(loc3, [[setForPick2X,setForPick2Y,setForPick2Ang,setForPick2Ext]]);
loc5  = concat(loc4, [[place2X,place2Y,place2Ang,place2Ext]]);
loc6  = concat(loc5, [[setForPick3X,setForPick3Y,setForPick3Ang,setForPick3Ext]]);
loc7  = concat(loc6, [[place3X,place3Y,place3Ang,place3Ext]]);
loc8  = concat(loc7, [[pick1X,pick1Y,pick1Ang,pick1Ext]]);
loc9  = concat(loc8, [[deliver1X,deliver1Y,deliver1Ang,deliver1Ext]]);
loc10 = concat(loc9, [[deliver1X,deliver1Y,deliver1Ang,deliver1Ext]]);
loc11 = concat(loc10,[[pick2X,pick2Y,pick2Ang,pick2Ext]]);
loc12 = concat(loc11,[[deliver2X,deliver2Y,deliver2Ang,deliver2Ext]]);
loc13 = concat(loc12,[[pick3X,pick3Y,pick3Ang,pick3Ext]]);
loc14 = concat(loc13,[[deliver3X,deliver3Y,deliver3Ang,deliver3Ext]]);
loc15 = concat(loc14,[[pick4X,pick4Y,pick4Ang,pick4Ext]]);
loc16 = concat(loc15,[[deliver4X,deliver4Y,deliver4Ang,deliver4Ext]]);
loc17 = concat(loc16,[[pick5X,pick5Y,pick5Ang,pick5Ext]]);
loc18 = concat(loc17,[[deliver5X,deliver5Y,deliver5Ang,deliver5Ext]]);
loc19 = concat(loc18,[[parkX,parkY,parkAng,parkExt]]);

function xyz(t,i) = 
    lookup(t, [
        [0/len(loc19), loc19[0][i]],
        [1/len(loc19), loc19[1][i]],
        [2/len(loc19), loc19[2][i]],
        [3/len(loc19), loc19[3][i]],
        [4/len(loc19), loc19[4][i]],
        [5/len(loc19), loc19[5][i]],
        [6/len(loc19), loc19[6][i]],
        [7/len(loc19), loc19[7][i]],
        [8/len(loc19), loc19[8][i]],
        [9/len(loc19), loc19[9][i]],
        [10/len(loc19),loc19[10][i]],
        [11/len(loc19),loc19[11][i]],
        [12/len(loc19),loc19[12][i]],
        [13/len(loc19),loc19[13][i]],
        [14/len(loc19),loc19[14][i]],
        [15/len(loc19),loc19[15][i]],
        [16/len(loc19),loc19[16][i]],
        [17/len(loc19),loc19[17][i]],
        [18/len(loc19),loc19[18][i]],
        [19/len(loc19),loc19[19][i]],
      ]
);

positionRobot(robotColor,xyz($t,0),xyz($t,1),xyz($t,2),xyz($t,3));