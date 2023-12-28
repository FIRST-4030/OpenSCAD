 include <../Global/Parameters.scad>
use <CenterStageField.scad>
use <Simulator.scad>

// April Tag Coordinates
// 1) 62, 41.4, 4.6 
// 2) 62, 35.5, 4.6 
// 3) 62, 29.3, 4.6 
// 4) 62, -29.3, 4.6 
// 5) 62, -35.5, 4.6 
// 6) 62, -41.4, 4.6 
// 7) -70.6, -41, 6.0 
// 8) -70.6, -35.5, 4.5 
// 9) -70.6, 35.5, 4.5 
// 10) -70.6, 41, 6.0

roboLog = [[-39,-62.5,90], // 1
[-43.246,-34.944,115.12],  // 2 spike
[-45    ,-43    ,45],  // Why backup to 50?  -39,-42,0 [-49.369,-50.513,114.763]
[-58.331,-41.224,356.844],  // looking for at 7 or 8?
[-57.986,-36.254,0.593], // 4 ?
[-54.406,-35.659,0],  // 5 ?
[-58.808,-36.055,359.685],  //6 collect?
[-57.812,-8.085,0.004], //7 too close to center, y=-11
[35.086,-8.478,0.448], // 8  too close to center, y=-11
[36.068,-37.977,0.582], // 9 y=-35.5?
[37.275,-36.882,0], // 10 align
[50.092,-29.615,0.049], // good
[47.912,-13.094,0.292]]; // park good

function convertToPoints(Pose) =
    let (n = len(Pose))
    [ for (i=[0:n-1]) [Pose[i][0],Pose[i][1]] ];
function invertPoints(array) = 
    let (n = len(array))
    [ for (i=[n-1:-1:0]) [array[i][0]+1,array[i][1]+1] ];
        
PosePoints = convertToPoints(roboLog);
reversePoints = invertPoints(PosePoints);
MergePoints = concat(PosePoints,reversePoints);
color("aqua") translate([0,0,3]) polygon(MergePoints);
    
for(i=[0:1:12]) {
    positionRobot("red",roboLog[i][0],roboLog[i][1],roboLog[i][2]);
    *echo(roboLog[i][0],roboLog[i][1],roboLog[i][2]);
}


//positionRobot("yellow",15,-43,45); // test
DrawField();
