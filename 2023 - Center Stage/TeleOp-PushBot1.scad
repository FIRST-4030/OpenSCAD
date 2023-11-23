/*
  This file is used to develop a trajectory for the push-bot
  to return it to the same position with a single button
  push on driver station1
*/

include <../Global/Parameters.scad>
use <CenterStageField.scad>
use <Simulator.scad>

showPosition = true;
showAprilTags = false;
isBlue = true;
audience = true;

DRAWPOSE = "start"; // ["start","Ni","San","Shi","none"]

if (showAprilTags) {
    DisplayAprilTags();
}

robotColor = isBlue ? "blue" : "red";

startPoseX = 45;
startPoseY = isBlue ? 35 : -35;
startPoseAng = 0;
if (DRAWPOSE == "start") positionRobot(robotColor,startPoseX,startPoseY,startPoseAng);

NiX = 24;
NiY = isBlue ? 12 : -12;
NiAng = 180;
if ((DRAWPOSE == "Ni") && (showPosition)) {
    positionRobot(robotColor,NiX,NiY,NiAng);
}

SanX = -40;
SanY = isBlue ? 12 : -12;
SanAng = 180;
if ((DRAWPOSE == "San") && (showPosition)) {
   positionRobot(robotColor,SanX,SanY,SanAng);
}

ShiX = -55;
ShiY = isBlue ? -42 : 42;
ShiAng = isBlue ? 250 : 70;
if ((DRAWPOSE == "Shi") && (showPosition)) {
    positionRobot(robotColor,ShiX,ShiY,ShiAng);
}

DrawField();

//Concatinate moves:
loc0 = [[startPoseX,startPoseY,startPoseAng]];
loc1 = concat(loc0,[[NiX,NiY,NiAng]]);
loc2 = concat(loc1,[[SanX,SanY,SanAng]]);
loc3 = concat(loc2,[[ShiX,ShiY,ShiAng]]);

function xyz(t,i) = 
    lookup(t, [
        [0/len(loc3),loc3[0][i]],
        [1/len(loc3),loc3[1][i]],
        [2/len(loc3),loc3[2][i]],
        [3/len(loc3),loc3[3][i]],
      ]
);

positionRobot(robotColor,xyz($t,0),xyz($t,1),xyz($t,2));