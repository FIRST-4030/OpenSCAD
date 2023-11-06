use <CenterStageField.scad>
use <Simulator.scad>

startX          = 15;
startY          = -61;
startHeading    = 90;

spike1X         = 8;
spike1Y         = -37;
heading1        = 145; 

spike2X         = 7;
spike2Y         = -36;
heading2        = 90;

spike3X         = 18;
spike3Y         = -37;
heading3        = 55;  

mediaryX        = 15;
mediaryY        = -47;
mediaryHeading  = 0;

backdropX       = 49;
backdropHeading = 0;
backdropY1      = -30;
backdropY2      = -35;
backdropY3      = -40;

audienceX       = -58;
audienceY       = -40;
audienceHeading = 0;

travelX         = 35;
travelY         = -12;
travelHeading   = 0;

centerX         = -58;
centerY         = -11;
centerHeading   = 0;

parkX           = 46;
parkyL          = -12;
parkyR          = -60;

// Spike 1
//locL = [
//    [shiftStart(startX),startY,1,0,0,startHeading],
//    [invertSpike(spike1X),spike1Y,1,0,0,heading1],
//    [invertLeft(mediaryX),mediaryY,1,0,0,mediaryHeading],
//    [audienceX,audienceY,1,0,0,audienceHeading],
//    [centerX,centerY,1,0,0,centerHeading],
//    [travelX,travelY,1,0,0,travelHeading],
//    [backdropX,backdropY1,1,0,0,backdropHeading],
//    [parkX,parkyL,1,0,0,backdropHeading],
//];
//
//locR = [
//    [startX,startY,1,0,0,startHeading],
//    [spike1X,spike1Y,1,0,0,heading1],
//    [mediaryX,mediaryY,1,0,0,mediaryHeading],
//    [backdropX,backdropY1,1,0,0,backdropHeading],
//    [parkX,parkyR,1,0,0,backdropHeading],
//];

// Spike 2
locL = [
    [shiftStart(startX),startY,1,0,0,startHeading],
    [invertSpike(spike2X),spike2Y,1,0,0,heading2],
    [invertLeft(mediaryX),mediaryY,1,0,0,mediaryHeading],
    [audienceX,audienceY,1,0,0,audienceHeading],
    [centerX,centerY,1,0,0,centerHeading],
    [travelX,travelY,1,0,0,travelHeading],
    [backdropX,backdropY2,1,0,0,backdropHeading],
    [parkX,parkyL,1,0,0,backdropHeading],
];

locR = [
    [startX,startY,1,0,0,startHeading],
    [spike2X,spike2Y,1,0,0,heading2],
    [mediaryX,mediaryY,1,0,0,mediaryHeading],
    [backdropX,backdropY2,1,0,0,backdropHeading],
    [parkX,parkyR,1,0,0,backdropHeading],
];

// Spike 3
//locL = [
//    [shiftStart(startX),startY,1,0,0,startHeading],
//    [invertSpike(spike3X),spike3Y,1,0,0,heading3],
//    [invertLeft(mediaryX),mediaryY,1,0,0,mediaryHeading],
//    [audienceX,audienceY,1,0,0,audienceHeading],
//    [centerX,centerY,1,0,0,centerHeading],
//    [travelX,travelY,1,0,0,travelHeading],
//    [backdropX,backdropY3,1,0,0,backdropHeading],
//    [parkX,parkyL,1,0,0,backdropHeading],
//];
//
//locR = [
//    [startX,startY,1,0,0,startHeading],
//    [spike3X,spike3Y,1,0,0,heading3],
//    [mediaryX,mediaryY,1,0,0,mediaryHeading],
//    [backdropX,backdropY3,1,0,0,backdropHeading],
//    [parkX,parkyR,1,0,0,backdropHeading],
//];

function xyzR(t,i) = 
    lookup(t, [
        [0/len(locR),locR[0][i]],
        [1/len(locR),locR[1][i]],
        [2/len(locR),locR[2][i]],
        [3/len(locR),locR[3][i]],
        [4/len(locR),locR[4][i]],
      ]
);

function xyzL(t,i) = 
    lookup(t, [
        [0/len(locL),locL[0][i]],
        [1/len(locL),locL[1][i]],
        [2/len(locL),locL[2][i]],
        [3/len(locL),locL[3][i]],
        [4/len(locL),locL[4][i]],
        [5/len(locL),locL[5][i]],
        [6/len(locL),locL[6][i]],
        [7/len(locL),locL[7][i]],
 
      ]
);

//RunSimulationL(xyzL($t,0),xyzL($t,1),xyzL($t,2),xyzL($t,3),xyzL($t,4),xyzL($t,5));

//RunSimulationR(xyzR($t,0),xyzR($t,1),xyzR($t,2),xyzR($t,3),xyzR($t,4),xyzR($t,5));

//RunSimulation(xyzR($t,0),xyzR($t,1),xyzR($t,2),xyzR($t,3),xyzR($t,4),xyzR($t,5),
//              xyzL($t,0),xyzL($t,1),xyzL($t,2),xyzL($t,3),xyzL($t,4),xyzL($t,5));
              
drawField();
              