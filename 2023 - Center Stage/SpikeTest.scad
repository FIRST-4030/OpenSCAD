 include <../Global/Parameters.scad>
use <CenterStageField.scad>
use <Simulator.scad>

showPosition = true;
showAprilTags = false;
isBlue = true;
audience = true;
spike = 1; // [1,2,3]

DRAWPOSE = "start"; // ["start","spike","Ni","San","Shi","Go","Rok","Shichi","none"]

function blueAprilY() = (spike==1) ?  41 : ((spike==2) ?  35 :  29 );
function redAprilY()  = (spike==1) ? -29 : ((spike==2) ? -35 : -41 );

if (showAprilTags) {
    DisplayAprilTags();
}

robotColor = isBlue ? "blue" : "red";

startPoseX = audience ? -39 : 15; // -39 = -36-3,  15 = 12+3
startPoseY = isBlue ? 62.5 : -62.5;
startPoseAng = isBlue ? -90 : 90;
if (DRAWPOSE == "start") positionRobot(robotColor,startPoseX,startPoseY,startPoseAng);

// robot Start is shifted left (or right) of tile center. Adjust for spike move
startShiftX = audience ? 3.7 : -3.7;

spikeDeltaX = (spike == 1) ? (isBlue ? 5 : -5) : ((spike == 2) ? 0 : (isBlue ? -5 : 5) );
SpikeX = startPoseX + spikeDeltaX + startShiftX;

spikeDeltaY = (spike == 1) ? 28 : ((spike == 2) ? 29 : 26 );
signedSpikeDeltaY = isBlue ? -spikeDeltaY : spikeDeltaY; 
SpikeY = startPoseY + signedSpikeDeltaY;
spikeDeltaAng = (spike == 1) ? 45 : ((spike == 2) ? 0 : -45 );
SpikeAng = startPoseAng + spikeDeltaAng;
if ((DRAWPOSE == "spike") && (showPosition)) {
    echo(SpikeX=SpikeX, SpikeY=SpikeY, SpikeAng=SpikeAng);
    positionRobot(robotColor,SpikeX, SpikeY, SpikeAng);
}

NiX = audience ? -36 : 12;
NiY = isBlue ? 42 : -42;
NiAng = 0;
if ((DRAWPOSE == "Ni") && (showPosition)) {
    positionRobot(robotColor,NiX,NiY,NiAng);
}

SanX = audience ? -56 : 35;
SanY = isBlue ? 42 : -42;
SanAng = 0;
if ((DRAWPOSE == "San") && (showPosition)) {
   positionRobot(robotColor,SanX,SanY,SanAng);
}

ShiX = audience ? -56 : 35;
ShiY = isBlue ? (audience ? 12 : 42) : (audience ? -12 : -42);
ShiAng = 0;
if ((DRAWPOSE == "Shi") && (showPosition)) {
    positionRobot(robotColor,ShiX,ShiY,ShiAng);
}

GoX = audience ? 35 : 35;
GoY = isBlue ? (audience ? 12 : 42) : (audience ? -12 : -42);
GoAng = 0;
if ((DRAWPOSE == "Go") && (showPosition)) {
    positionRobot(robotColor,GoX,GoY,GoAng);
}

RokX = 48;
RokY = isBlue ? blueAprilY() : redAprilY();
RokAng = 0;
if ((DRAWPOSE == "Rok") && (showPosition)) {
    positionRobot(robotColor,RokX,RokY,RokAng);
}

ShichiX = 48;
ShichiY =  isBlue ? (audience ? 12 : 55) : (audience ? -12 : -55);
ShichiAng = 0;
if ((DRAWPOSE == "Shichi") && (showPosition)) {
    positionRobot(robotColor,ShichiX,ShichiY,ShichiAng);
}


DrawField();

//Concatinate moves:
loc0 = [[startPoseX,startPoseY,startPoseAng]];
loc1 = concat(loc0,[[SpikeX, SpikeY, SpikeAng]]);
loc2 = concat(loc1,[[NiX,NiY,NiAng]]);
loc3 = concat(loc2,[[SanX,SanY,SanAng]]);
loc4 = concat(loc3,[[ShiX,ShiY,ShiAng]]);
loc5 = concat(loc4,[[GoX,GoY,GoAng]]);
loc6 = concat(loc5,[[RokX,RokY,RokAng]]);
loc7 = concat(loc6,[[ShichiX,ShichiY,ShichiAng]]);

function xyz(t,i) = 
    lookup(t, [
        [0/len(loc7),loc7[0][i]],
        [1/len(loc7),loc7[1][i]],
        [2/len(loc7),loc7[2][i]],
        [3/len(loc7),loc7[3][i]],
        [4/len(loc7),loc7[4][i]],
        [5/len(loc7),loc7[5][i]],
        [6/len(loc7),loc7[6][i]],
        [7/len(loc7),loc7[7][i]],
      ]
);

positionRobot(robotColor,xyz($t,0),xyz($t,1),xyz($t,2));