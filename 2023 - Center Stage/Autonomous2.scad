include <CenterStageField.scad>
include <Simulator.scad>

loc = [
[-39,-62,0,0,0,90],
[-42,-40,0,0,0,135],
[-36,-58,0,0,0,180],
[ 30,-58,0,0,0,180],
[ 45,-35,0,0,0,180],
[ 48,-36,0,0,0,180],
[ 35,-36,0,0,0,180],
[ 35,-10,0,0,0,0],
[ -55,-10,0,0,0,0],
[ -55,-24,0,0,0,0],
[ -58,-24,0,0,0,0],
];

function xyz(t,i) = 
    lookup(t, [
        [0/len(loc),loc[0][i]],
        [1/len(loc),loc[1][i]],
        [2/len(loc),loc[2][i]],
        [3/len(loc),loc[3][i]],
        [4/len(loc),loc[4][i]],
        [5/len(loc),loc[5][i]],
        [6/len(loc),loc[6][i]],
        [7/len(loc),loc[7][i]],
        [8/len(loc),loc[8][i]],
        [9/len(loc),loc[9][i]],
        [10/len(loc),loc[10][i]]
  ]
);

RunSimulation(xyz($t,0),xyz($t,1),xyz($t,2),xyz($t,3),xyz($t,4),xyz($t,5));
