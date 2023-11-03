include <CenterStageField.scad>
include <Simulator.scad>
include <AutonomousRed.scad>

//startX           = 15;
//startY           = 61;
//startHeading     = -90;

spike1X          = 15;
//spike1Y          = 37;
//heading1         = -35; 

spike2X         = 8;
spike2Y         = 34;
//heading2         = -90;
 
spike3X         = 6;
spike3Y         = 35;
//heading3        = -125;  

//mediaryX        = 15;
//mediaryY        = 47;
//mediaryHeading  = 0;

//backdropX       = 49;
//backdropHeading = 0;
backdropY1      = 40;
backdropY2      = 35;
backdropY3      = 30;

//audienceX       = -58;
//audienceY       = 40;
//audienceHeading = 0;

//travelX         = 35;
//travelY         = 12;
//travelHeading   = 0;

//centerX         = -58;
//centerY         = 11;
//centerHeading  = 0;

//parkX = 46;
parkyL = 60;
parkyR = 10;

// Spike 1
//locL = [
//    [startX,flipValue(startY),1,0,0,flipHeading(startHeading)],
//    [spike1X,flipValue(spike1Y),1,0,0,flipHeading(heading1)],
//    [mediaryX,flipValue(mediaryY),1,0,0,mediaryHeading],
//    [backdropX,backdropY1,1,0,0,backdropHeading],
//    [parkX,parkyL,1,0,0,backdropHeading],
//];
//
//locR = [
//    [shiftStart(startX),flipValue(startY),1,0,0,flipHeading(startHeading)],
//    [invertSpike(spike1X),flipValue(spike1Y),1,0,0,flipHeading(heading1)],
//    [invertRight(mediaryX),flipValue(mediaryY),1,0,0,mediaryHeading],
//    [audienceX,flipValue(audienceY),1,0,0,audienceHeading],
//    [centerX,flipValue(centerY),1,0,0,centerHeading],
//    [travelX,flipValue(travelY),1,0,0,travelHeading],
//    [backdropX,backdropY1,1,0,0,backdropHeading],
//    [parkX,parkyR,1,0,0,backdropHeading],
//];

// Spike 2
//locL = [
//    [startX,flipValue(startY),1,0,0,flipHeading(startHeading)],
//    [spike2X,spike2Y,1,0,0,flipHeading(heading2)],
//    [mediaryX,flipValue(mediaryY),1,0,0,mediaryHeading],
//    [backdropX,backdropY2,1,0,0,backdropHeading],
//    [parkX,parkyL,1,0,0,backdropHeading],
//];
//
//locR = [
//    [shiftStart(startX),flipValue(startY),1,0,0,flipHeading(startHeading)],
//    [invertSpike(spike2X),spike2Y,1,0,0,flipHeading(heading2)],
//    [audienceX,invertRight(audienceY),1,0,0,audienceHeading],
//    [centerX,flipValue(centerY),1,0,0,centerHeading],
//    [travelX,flipValue(travelY),1,0,0,travelHeading],
//    [backdropX,backdropY2,1,0,0,backdropHeading],
//    [parkX,parkyR,1,0,0,backdropHeading],
//];

// Spike 3
locL = [
    [startX,flipValue(startY),1,0,0,flipHeading(startHeading)],
    [spike3X,spike3Y,1,0,0,flipHeading(heading3)],
    [mediaryX,flipValue(mediaryY),1,0,0,mediaryHeading],
    [backdropX,backdropY3,1,0,0,backdropHeading],
    [parkX,parkyL,1,0,0,backdropHeading],
];

locR = [
    [shiftStart(startX),flipValue(startY),1,0,0,flipHeading(startHeading)],
    [invertSpike(spike3X),spike3Y,1,0,0,flipHeading(heading3)],
    [invertRight(mediaryX),flipValue(mediaryY),1,0,0,mediaryHeading],
    [audienceX,flipValue(audienceY),1,0,0,audienceHeading],
    [centerX,flipValue(centerY),1,0,0,centerHeading],
    [travelX,flipValue(travelY),1,0,0,travelHeading],
    [backdropX,backdropY3,1,0,0,backdropHeading],
    [parkX,parkyR,1,0,0,backdropHeading],
];

function xyzR(t,i) = 
    lookup(t, [
        [0/len(locR),locR[0][i]],
        [1/len(locR),locR[1][i]],
        [2/len(locR),locR[2][i]],
        [3/len(locR),locR[3][i]],
        [4/len(locR),locR[4][i]],
        [5/len(locR),locR[5][i]],
        [6/len(locR),locR[6][i]],
        [7/len(locR),locR[7][i]],
      ]
);

function xyzL(t,i) = 
    lookup(t, [
        [0/len(locL),locL[0][i]],
        [1/len(locL),locL[1][i]],
        [2/len(locL),locL[2][i]],
        [3/len(locL),locL[3][i]],
        [4/len(locL),locL[4][i]],
      ]
);

//RunSimulationL(xyzL($t,0),xyzL($t,1),xyzL($t,2),xyzL($t,3),xyzL($t,4),xyzL($t,5));

//RunSimulationR(xyzR($t,0),xyzR($t,1),xyzR($t,2),xyzR($t,3),xyzR($t,4),xyzR($t,5));

RunSimulation(xyzR($t,0),xyzR($t,1),xyzR($t,2),xyzR($t,3),xyzR($t,4),xyzR($t,5),
              xyzL($t,0),xyzL($t,1),xyzL($t,2),xyzL($t,3),xyzL($t,4),xyzL($t,5));
