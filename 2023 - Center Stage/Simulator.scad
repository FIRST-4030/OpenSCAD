include <CenterStageField.scad>
PRINT_SCALER = 1;  // SET TO 1 FOR INCHES, 25.4 FOR MM

ROBOT_LENGTH = 16.0*PRINT_SCALER;
ROBOT_WIDTH = 16.0*PRINT_SCALER;
ROBOT_HEIGHT = 4*PRINT_SCALER;
WHEEL_LEN = 1.5*PRINT_SCALER;
WHEEL_WID = 3.0*PRINT_SCALER;


module robot_2D() {
    difference() {
        square([ROBOT_LENGTH,ROBOT_WIDTH],center=true); // represents robot outline
        
        // represents purple pixel holder in front of robot
        translate([ROBOT_LENGTH/2,0,0]) square([3*PRINT_SCALER,3*PRINT_SCALER],center=true);
        
        // represents robot wheels
        translate([ROBOT_LENGTH*.3,ROBOT_WIDTH*.45,0]) wheel();
        translate([-ROBOT_LENGTH*.3,ROBOT_WIDTH*.45,0]) wheel();
        translate([ROBOT_LENGTH*.3,-ROBOT_WIDTH*.45,0]) wheel();
        translate([-ROBOT_LENGTH*.3,-ROBOT_WIDTH*.45,0]) wheel();
    }
    module wheel() {
        hull() {
            translate([WHEEL_LEN/2,0,0]) circle(d=WHEEL_WID,$fn=30);
            translate([-WHEEL_LEN/2,0,0]) circle(d=WHEEL_WID,$fn=30);
        }
    }
}
*robot_2D($fn=30);  // Turn this line on to export the SVG for Easel

module robot() {  // 3D Chassis
        linear_extrude(ROBOT_HEIGHT) robot_2D();
}

loc = [
[-39,-62,0,0,0,90],
[-42,-40,0,0,0,135],
[-36,-60,0,0,0,90],
[-53,-60,0,0,0,90],
[-53,-12,0,0,0,0],
[25, -12, 0, 0, 0, 0]
];

function xyz(t,i) = 
    lookup(t, [
        [0/len(loc),loc[0][i]],
        [1/len(loc),loc[1][i]],
        [2/len(loc),loc[2][i]],
        [3/len(loc),loc[3][i]],
        [4/len(loc),loc[4][i]],
        [5/len(loc),loc[5][i]]
    ]
);

module run_simulation(x,y,z,alpha,beta,phi) {
    translate([x,y,z]) rotate([alpha,beta,phi])  robot();
}

run_simulation(xyz($t,0),xyz($t,1),xyz($t,2),xyz($t,3),xyz($t,4),xyz($t,5));
