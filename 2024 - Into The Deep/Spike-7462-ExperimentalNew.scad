include <../Global/Parameters.scad>
use <IntoTheDeep.scad>
use <Simulator_7462.scad>

showPosition = true;
showAprilTags = true;

DRAWPOSE = "none"; 

if (showAprilTags) {
    DisplayAprilTags();
}

robotColor = "white";
ext=0;
startX = 15.8;
startY = -63;
startAng = 270;
if (DRAWPOSE == "start") positionRobot(robotColor,startX,startY,startAng,ext);

depositX = 1.8;
depositY = -32;
depositAng = 270;
if (DRAWPOSE == "deposit") positionRobot(robotColor,depositX,depositY,depositAng,ext);

pushPrep1X = 35;
pushPrep1Y = -35;
pushPrep1Ang = 270;
if (DRAWPOSE == "pushPrep1") positionRobot(robotColor,pushPrep1X,pushPrep1Y,pushPrep1Ang,ext);

pushPrep2X = 35;
pushPrep2Y =-20;
pushPrep2Ang = 270;
if (DRAWPOSE == "pushPrep2") positionRobot(robotColor,pushPrep2X,pushPrep2Y,pushPrep2Ang,ext);

pushPrep3X = 35;
pushPrep3Y =-20;
pushPrep3Ang = 270;
if (DRAWPOSE == "pushPrep3") positionRobot(robotColor,pushPrep3X,pushPrep3Y,pushPrep3Ang,ext);

pushPrep4X = 47;
pushPrep4Y =-12;
pushPrep4Ang = 270;
if (DRAWPOSE == "pushPrep4") positionRobot(robotColor,pushPrep4X,pushPrep4Y,pushPrep4Ang,ext);

brickPushX = 48;
brickPushY= -55;
brickPushAng = 270;
if (DRAWPOSE == "brickPush") positionRobot(robotColor,brickPushX,brickPushY,brickPushAng,ext);

pushPrep5X = 47;
pushPrep5Y =-12;
pushPrep5Ang = 270;
if (DRAWPOSE == "pushPrep5") positionRobot(robotColor,pushPrep5X,pushPrep5Y,pushPrep5Ang,ext);

pushPrep6X = 58;
pushPrep6Y =-12;
pushPrep6Ang = 270;
if (DRAWPOSE == "pushPrep6") positionRobot(robotColor,pushPrep6X,pushPrep6Y,pushPrep6Ang,ext);

brickPush2X = 48;
brickPush2Y= -55;
brickPush2Ang = 270;
if (DRAWPOSE == "brickPush2") positionRobot(robotColor,brickPush2X,brickPush2Y,brickPush2Ang,ext);

collectionX = 45;
collectionY= -55;
collectionAng = 270;
if (DRAWPOSE == "collection") positionRobot(robotColor,collectionX,collectionY,collectionAng,ext);

intermediaryX = 8;
intermediaryY = -33;
intermediaryAng = 270;
if (DRAWPOSE == "intermediary") positionRobot(robotColor,intermediaryX,intermediaryY,intermediaryAng,ext);

deposit2X = -4;
deposit2Y = -33;
deposit2Ang =270;
if (DRAWPOSE == "deposit2") positionRobot(robotColor,deposit2X,deposit2Y,deposit2Ang,ext);

deposit3X = -2;
deposit3Y = -33;
deposit3Ang =270;
if (DRAWPOSE == "deposit3") positionRobot(robotColor,deposit3X,deposit3Y,deposit3Ang,ext);

deposit4X = 0;
deposit4Y = -33;
deposit4Ang =270;
if (DRAWPOSE == "deposit4") positionRobot(robotColor,deposit4X,deposit4Y,deposit4Ang,ext);

parkX = 50;
parkY = -55;
parkAng = 180;
if (DRAWPOSE == "park") positionRobot(robotColor,parkX,parkY,parkAng,ext);

DrawField();

//Concatinate moves:
loc0  = [[startX,startY,startAng,ext]];
loc1  = concat(loc0,  [[depositX,depositY,depositAng,ext]]);
loc2  = concat(loc1,  [[pushPrep1X,pushPrep1Y,pushPrep1Ang,ext]]);
loc3  = concat(loc2,  [[pushPrep2X,pushPrep2Y,pushPrep2Ang,ext]]);
loc4  = concat(loc3,  [[pushPrep3X,pushPrep3Y,pushPrep3Ang,ext]]);
loc5  = concat(loc4,  [[pushPrep4X,pushPrep4Y,pushPrep4Ang,ext]]);
loc6  = concat(loc5,  [[brickPushX,brickPushY,brickPushAng,ext]]);
loc7  = concat(loc6,  [[pushPrep5X,pushPrep5Y,pushPrep5Ang,ext]]);
loc8  = concat(loc7,  [[pushPrep6X,pushPrep6Y,brickPush2Ang,ext]]);
loc9  = concat(loc8,  [[brickPush2X,brickPush2Y,brickPush2Ang,ext]]);
loc10 = concat(loc9,  [[collectionX,collectionY,collectionAng,ext]]);
loc11 = concat(loc10, [[intermediaryX,intermediaryY,intermediaryAng,ext]]);
loc12 = concat(loc11, [[deposit2X,deposit2Y,deposit2Ang,ext]]);
loc13 = concat(loc12,  [[collectionX,collectionY,collectionAng,ext]]);
loc14 = concat(loc13, [[intermediaryX,intermediaryY,intermediaryAng,ext]]);
loc15 = concat(loc14, [[deposit3X,deposit3Y,deposit3Ang,ext]]);
loc16 = concat(loc15,  [[collectionX,collectionY,collectionAng,ext]]);
loc17 = concat(loc16, [[intermediaryX,intermediaryY,intermediaryAng,ext]]);
loc18 = concat(loc17, [[deposit4X,deposit4Y,deposit4Ang,ext]]);
loc19 = concat(loc18, [[parkX,parkY,parkAng,ext]]);

function xyz(t,i) = 
    lookup(t, [
        [0/len(loc19),  loc19[0][i]],
        [1/len(loc19),  loc19[1][i]],
        [2/len(loc19),  loc19[2][i]],
        [3/len(loc19),  loc19[3][i]],
        [4/len(loc19),  loc19[4][i]],
        [5/len(loc19),  loc19[5][i]],
        [6/len(loc19),  loc19[6][i]],
        [7/len(loc19),  loc19[7][i]],
        [8/len(loc19),  loc19[8][i]],
        [9/len(loc19),  loc19[9][i]],
        [10/len(loc19), loc19[10][i]],
        [11/len(loc19), loc19[11][i]],
        [12/len(loc19), loc19[12][i]],
        [13/len(loc19), loc19[13][i]],
        [14/len(loc19), loc19[14][i]],
        [15/len(loc19), loc19[15][i]],
        [16/len(loc19), loc19[16][i]],
        [17/len(loc19), loc19[17][i]],
        [18/len(loc19), loc19[18][i]],
        [19/len(loc19), loc19[19][i]],
      ]
);

positionRobot(robotColor,xyz($t,0),xyz($t,1),xyz($t,2),xyz($t,3));