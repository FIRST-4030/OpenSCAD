//include <CenterStageField.scad>
PRINT_SCALER = 1;  // SET TO 1 FOR INCHES, 25.4 FOR MM

ROBOT_LENGTH = 16.0*PRINT_SCALER;
ROBOT_WIDTH = 16.0*PRINT_SCALER;
ROBOT_HEIGHT = 4*PRINT_SCALER;
WHEEL_LEN = 1.5*PRINT_SCALER;
WHEEL_WID = 3.0*PRINT_SCALER;


module robot_2D() {
    difference() {
        square([ROBOT_LENGTH,ROBOT_WIDTH],center=true);
        
        translate([6*PRINT_SCALER,0,0]) square([4*PRINT_SCALER,8*PRINT_SCALER],center=true);
        
        translate([ROBOT_LENGTH*.3,ROBOT_WIDTH/2,0]) wheel();
        translate([-ROBOT_LENGTH*.3,ROBOT_WIDTH/2,0]) wheel();
        translate([ROBOT_LENGTH*.3,-ROBOT_WIDTH/2,0]) wheel();
        translate([-ROBOT_LENGTH*.3,-ROBOT_WIDTH/2,0]) wheel();
    }
    module wheel() {
        hull() {
            translate([WHEEL_LEN/2,0,0]) circle(d=WHEEL_WID,$fn=30);
            translate([-WHEEL_LEN/2,0,0]) circle(d=WHEEL_WID,$fn=30);
        }
    }
}
*robot_2D($fn=30);  // Turn this line on to export the SVG for Easel

//DrawField();

module robot() {
    color("silver") // Chassis
        linear_extrude(ROBOT_HEIGHT) robot_2D();
}
robot();  // at the field origin

// The following lines draw the robots
translate([-33,-62,0]) rotate([0,0,90])  color("green") robot(); // Start
translate([2,-38,0])   rotate([0,0,0]) color("yellow") robot(); // MID_POINT
translate([18,-24,0])  rotate([0,0,30]) color("blue") robot(); // BLOCK_POINT
