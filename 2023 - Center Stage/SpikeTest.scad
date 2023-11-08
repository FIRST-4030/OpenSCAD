include <../Global/Parameters.scad>
use <CenterStageField.scad>
use <Simulator.scad>

isBlue = true; // 
audience = true; //
spike = 1; // [1,2,3]
DRAWPOSE = "start"; // ["start","spike","Ni","San","none"]

robotColor = isBlue ? "blue" : "red";

startPoseX = audience ? -39 : 15; // -39 = -36-3,  15 = 12+3
startPoseY = isBlue ? 62.5 : -62.5;
startPoseAng = isBlue ? -90 : 90;
if (DRAWPOSE == "start") positionRobot(robotColor,startPoseX,startPoseY,startPoseAng);
    
// robot Start is shifted left (or right) of tile center. Adjust for spike move
startShiftX = audience ? 3.7 : -3.7;

spikeDeltaX = (spike == 1) ? (isBlue ? 5 : -5) : ((spike == 2) ? 0 : (isBlue ? -5 : 5) );
SPIKEX = startPoseX + spikeDeltaX + startShiftX;

spikeDeltaY = (spike == 1) ? 28 : ((spike == 2) ? 29 : 26 );
signedSpikeDeltaY = isBlue ? -spikeDeltaY : spikeDeltaY; 
SPIKEY = startPoseY + signedSpikeDeltaY;
spikeDeltaAng = (spike == 1) ? 45 : ((spike == 2) ? 0 : -45 );
SPIKEANG = startPoseAng + spikeDeltaAng;
if (DRAWPOSE == "spike") {
    echo(startShiftX=startShiftX);
    echo(spikeDeltaX=spikeDeltaX);
    echo(SPIKEX=SPIKEX, SPIKEY=SPIKEY, SPIKEANG=SPIKEANG);
    positionRobot(robotColor,SPIKEX, SPIKEY, SPIKEANG);
}

NiX = audience ? -1.5*TILE_WIDTH : 0.5*TILE_WIDTH;
NiY = isBlue ? 1.8*TILE_WIDTH : -1.8*TILE_WIDTH;
NiAng = 0;
if (DRAWPOSE == "Ni") {
    echo(NiX=NiX,NiY=NiY);
    positionRobot(robotColor,NiX,NiY,NiAng);
}

// San position is where the April Tag is read
SanX = audience ? -2.4*TILE_WIDTH : 1.5*TILE_WIDTH;
SanY = isBlue ? 1.8*TILE_WIDTH : -1.8*TILE_WIDTH;
SanAng = 0;
if (DRAWPOSE == "San") {
    echo(SanX=SanX,SanY=SanY);
    positionRobot(robotColor,SanX,SanY,SanAng);
}

drawField();

//Concatinate moves:
loc0 = [[startPoseX,startPoseY,startPoseAng]];
loc1 = concat(loc0,[[SPIKEX, SPIKEY, SPIKEANG]]);
loc2 = concat(loc1,[[NiX,NiY,NiAng]]);
loc3 = concat(loc2,[[SanX,SanY,SanAng]]);
echo(loc3=loc3);


function xyz(t,i) = 
    lookup(t, [
        [0/len(loc3),loc3[0][i]],
        [1/len(loc3),loc3[1][i]],
        [2/len(loc3),loc3[2][i]],
        [3/len(loc3),loc3[3][i]],
      ]
);

positionRobot(robotColor,xyz($t,0),xyz($t,1),xyz($t,2));