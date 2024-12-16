include <../Global/Parameters.scad>
use <IntoTheDeep.scad>
use <Simulator_8628.scad>

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
ext=0;
startX = isBlue ? -6 : 15;
startY = isBlue ? 62.5 : -62.5;
startAng = isBlue ? -90 : 90;
if (DRAWPOSE == "start") positionRobot(robotColor,startX,startY,startAng,ext);

stabilizerX = isBlue ? -6 : 15;
stabilizerY = isBlue ? 35 : -62.5;
stabilizerAng = isBlue ? -90 : 90;
if (DRAWPOSE == "stabilizer") positionRobot(robotColor,stabilizerX,stabilizerY,stabilizerAng,ext);

setForPush1X = isBlue ? -36 : 15;
setForPush1Y = isBlue ? 35 : -62.5;
setForPush1Ang = isBlue ? -90 : 90;
if (DRAWPOSE == "setForPush1") positionRobot(robotColor,setForPush1X,setForPush1Y,setForPush1Ang,ext);

setForPush2X = isBlue ? -38 : 15;
setForPush2Y = isBlue ? 14 : -62.5;
setForPush2Ang = isBlue ? -90 : 90;
if (DRAWPOSE == "setForPush2") positionRobot(robotColor,setForPush2X,setForPush2Y,setForPush2Ang,ext);

setForPush3X = isBlue ? -47 : 15;
setForPush3Y = isBlue ? 13 : -62.5;
setForPush3Ang = isBlue ? -90 : 90;
if (DRAWPOSE == "setForPush3") positionRobot(robotColor,setForPush3X,setForPush3Y,setForPush3Ang,ext);

push1X = isBlue ? -47 : 15;
push1Y = isBlue ? 60 : -62.5;
push1Ang = isBlue ? -90 : 90;
if (DRAWPOSE == "push1") positionRobot(robotColor,push1X,push1Y,push1Ang,ext);

setForPush4X = isBlue ? -47 : 15;
setForPush4Y = isBlue ? 13 : -62.5;
setForPush4Ang = isBlue ? -90 : 90;
if (DRAWPOSE == "setForPush4") positionRobot(robotColor,setForPush4X,setForPush4Y,setForPush4Ang,ext);

setForPush5X = isBlue ? -57 : 15;
setForPush5Y = isBlue ? 13 : -62.5;
setForPush5Ang = isBlue ? -90 : 90;
if (DRAWPOSE == "setForPush5") positionRobot(robotColor,setForPush5X,setForPush5Y,setForPush5Ang,ext);

push2X = isBlue ? -57 : 15;
push2Y = isBlue ? 60 : -62.5;
push2Ang = isBlue ? -90 : 90;
if (DRAWPOSE == "push2") positionRobot(robotColor,push2X,push2Y,push2Ang,ext);

deliver1X = isBlue ? -6 : 15;
deliver1Y = isBlue ? 35 : -62.5;
deliver1Ang = isBlue ? -90 : 90;
if (DRAWPOSE == "deliver1") positionRobot(robotColor,deliver1X,deliver1Y,deliver1Ang,ext);

pick2X = isBlue ? -37 : 15;
pick2Y = isBlue ? 60 : -62.5;
pick2Ang = isBlue ? -90 : 90;
if (DRAWPOSE == "pick2") positionRobot(robotColor,pick2X,pick2Y,pick2Ang,ext);

deliver2X = isBlue ? -6 : 15;
deliver2Y = isBlue ? 35 : -62.5;
deliver2Ang = isBlue ? -90 : 90;
if (DRAWPOSE == "deliver2") positionRobot(robotColor,deliver2X,deliver2Y,deliver2Ang,ext);

pick3X = isBlue ? -37 : 15;
pick3Y = isBlue ? 60 : -62.5;
pick3Ang = isBlue ? -90 : 90;
if (DRAWPOSE == "pick3") positionRobot(robotColor,pick3X,pick3Y,pick3Ang,ext);

deliver3X = isBlue ? -6 : 15;
deliver3Y = isBlue ? 35 : -62.5;
deliver3Ang = isBlue ? -90 : 90;
if (DRAWPOSE == "deliver3") positionRobot(robotColor,deliver3X,deliver3Y,deliver3Ang,ext);

pick4X = isBlue ? -37 : 15;
pick4Y = isBlue ? 60 : -62.5;
pick4Ang = isBlue ? -90 : 90;
if (DRAWPOSE == "pick4") positionRobot(robotColor,pick4X,pick4Y,pick4Ang,ext);

deliver4X = isBlue ? -6 : 15;
deliver4Y = isBlue ? 35 : -62.5;
deliver4Ang = isBlue ? -90 : 90;
if (DRAWPOSE == "deliver3") positionRobot(robotColor,deliver4X,deliver4Y,deliver4Ang,ext);

parkX = isBlue ? -50 : 15;
parkY = isBlue ? 60 : -62.5;
parkAng = isBlue ? -30 : 90;
if (DRAWPOSE == "park") positionRobot(robotColor,parkX,parkY,parkAng,ext);

DrawField();

//Concatinate moves:
loc0  = [[startX,startY,startAng,ext]];
loc1  = concat(loc0, [[stabilizerX,stabilizerY,stabilizerAng,ext]]);
loc2  = concat(loc1, [[setForPush1X,setForPush1Y,setForPush1Ang,ext]]);
loc3  = concat(loc2, [[setForPush2X,setForPush2Y,setForPush2Ang,ext]]);
loc4  = concat(loc3, [[setForPush3X,setForPush3Y,setForPush3Ang,ext]]);
loc5  = concat(loc4, [[push1X,push1Y,push1Ang,ext]]);
loc6  = concat(loc5, [[setForPush4X,setForPush4Y,setForPush4Ang,ext]]);
loc7  = concat(loc6, [[setForPush5X,setForPush5Y,setForPush5Ang,ext]]);
loc8  = concat(loc7, [[push2X,push2Y,push2Ang,ext]]);
loc9  = concat(loc8, [[deliver1X,deliver1Y,deliver1Ang,ext]]);
loc10 = concat(loc9, [[pick2X,pick2Y,pick2Ang,ext]]);
loc11 = concat(loc10,[[deliver2X,deliver2Y,deliver2Ang,ext]]);
loc12 = concat(loc11,[[pick3X,pick3Y,pick3Ang,ext]]);
loc13 = concat(loc12,[[deliver3X,deliver3Y,deliver3Ang,ext]]);
loc14 = concat(loc13,[[parkX,parkY,parkAng,ext]]);

function xyz(t,i) = 
    lookup(t, [
        [0/len(loc14), loc14[0][i]],
        [1/len(loc14), loc14[1][i]],
        [2/len(loc14), loc14[2][i]],
        [3/len(loc14), loc14[3][i]],
        [4/len(loc14), loc14[4][i]],
        [5/len(loc14), loc14[5][i]],
        [6/len(loc14), loc14[6][i]],
        [7/len(loc14), loc14[7][i]],
        [8/len(loc14), loc14[8][i]],
        [9/len(loc14), loc14[9][i]],
        [10/len(loc14),loc14[10][i]],
        [11/len(loc14),loc14[11][i]],
        [12/len(loc14),loc14[12][i]],
        [13/len(loc14),loc14[13][i]],
        [14/len(loc14),loc14[14][i]],
      ]
);

positionRobot(robotColor,xyz($t,0),xyz($t,1),xyz($t,2),xyz($t,3));