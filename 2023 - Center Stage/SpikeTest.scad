use <CenterStageField.scad>
use <Simulator.scad>

isBlue = true; // 
audience = true; //
spike = 1; // [1,2,3]
DRAWPOSE = "start"; // ["start","spike","mediary"]

robotColor = isBlue ? "blue" : "red";

startPoseX = audience ? -39 : 15;
startPoseY = isBlue ? 61 : -61;
startPoseAng = isBlue ? -90 : 90;
if (DRAWPOSE == "start") positionRobot(robotColor,startPoseX,startPoseY,startPoseAng);
    
// robot Start is shifted left (or right), adjust for spike move
startShiftX = isBlue ? (audience ? 4 : -4) : (audience ? 4 : -4);
echo(startShiftX=startShiftX);

spikeDeltaX = (spike == 1) ? (isBlue ? 5 : -5) : ((spike == 2) ? 0 : (isBlue ? -5 : 5) );
echo(spikeDeltaX=spikeDeltaX);
SPIKEX = startPoseX + spikeDeltaX + startShiftX;

spikeDeltaY = (spike == 1) ? 24 : ((spike == 2) ? 27 : 24 );
signedSpikeDeltaY = isBlue ? -spikeDeltaY : spikeDeltaY; 
SPIKEY = startPoseY + signedSpikeDeltaY;
spikeDeltaAng = (spike == 1) ? 45 : ((spike == 2) ? 0 : -45 );
SPIKEANG = startPoseAng + spikeDeltaAng;
if (DRAWPOSE == "spike") {
    echo(SPIKEX=SPIKEX, SPIKEY=SPIKEY, SPIKEANG=SPIKEANG);
    positionRobot(robotColor,SPIKEX, SPIKEY, SPIKEANG);
}

drawField();