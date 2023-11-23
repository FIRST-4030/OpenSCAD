include <../Global/Parameters.scad>
use <CenterStageField.scad>
use <Simulator.scad>

isBlue = true;
showAprilTags = false;

if (showAprilTags) {
    DisplayAprilTags();
}

robotColor = isBlue ? "blue" : "red";

DrawField();

//Concatinate moves:
loc0 = [[-39.000 ,-62.500 ,90.000 ]];
loc1 = concat(loc0, [[-43.246 ,-34.944 ,115.120 ]]);
loc2 = concat(loc1, [[-49.369 ,-50.513 ,114.763 ]]);
loc3 = concat(loc2, [[-58.331 ,-41.224 ,0]]);
loc4 = concat(loc3, [[-54.406 ,-35.659 ,0.000 ]]);
loc5 = concat(loc4, [[-54.406 ,-35.659 ,0.000 ]]);
loc6 = concat(loc5, [[-58.808 ,-36.055 ,0]]);
loc7 = concat(loc6, [[-57.812 ,-8.085 ,0.004 ]]);
loc8 = concat(loc7, [[35.086 ,-8.478 ,0.448 ]]);
loc9 = concat(loc8, [[36.068 ,-37.977 ,0.582 ]]);
loc10 = concat(loc9, [[37.275 ,-36.882 ,0.000 ]]);
loc11 = concat(loc10, [[50.092 ,-29.615 ,0.049 ]]);
loc12 = concat(loc11, [[47.912 ,-13.094 ,0.292 ]]);

function xyz(t,i) = 
    lookup(t, [
        [0/len(loc12),loc12[0][i]],
        [1/len(loc12),loc12[1][i]],
        [2/len(loc12),loc12[2][i]],
        [3/len(loc12),loc12[3][i]],
        [4/len(loc12),loc12[4][i]],
        [5/len(loc12),loc12[5][i]],
        [6/len(loc12),loc12[6][i]],
        [7/len(loc12),loc12[7][i]],
        [8/len(loc12),loc12[8][i]],
        [10/len(loc12),loc12[9][i]],
        [11/len(loc12),loc12[10][i]],
        [12/len(loc12),loc12[11][i]],
        [13/len(loc12),loc12[12][i]],
      ]
);

positionRobot(robotColor,xyz($t,0),xyz($t,1),xyz($t,2));