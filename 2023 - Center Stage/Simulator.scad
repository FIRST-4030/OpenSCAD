include <CenterStageField.scad>

PRINT_SCALER = 1;  // SET TO 1 FOR INCHES, 25.4 FOR MM

ROBOT_LENGTH = 16.0*PRINT_SCALER;
ROBOT_WIDTH  = 16.0*PRINT_SCALER;
ROBOT_HEIGHT = 2*PRINT_SCALER;
WHEEL_LEN    = 1.5*PRINT_SCALER;
WHEEL_WID    = 3.0*PRINT_SCALER;

function shiftStart(inX)     = -(inX+24);
function invertSpike(inPos)  = inPos-47;
function flipHeading(inHead) = inHead-180;  // used on blue side
function invertRight(inPos)  = -inPos-17;   // used on blue side
function flipValue(inPos)    = -inPos;      // used on blue side

function invertLeft(inPos) = -(inPos+34);   // used on red side

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
//robot_2D($fn=30);  // Turn this line on to export the SVG for Easel

module robot(inColor) {  // 3D Chassis
    color(inColor) { // Intakes
        linear_extrude(ROBOT_HEIGHT) robot_2D();
    }
    
    color("green") { // Intakes
        translate([-7,0,ROBOT_HEIGHT]) rotate([90,90,0]) cylinder(h=5,d=3,center=true,$fn=32);
    }
}

module RunSimulation(xR,yR,zR,alphaR,betaR,phiR,
                     xL,yL,zL,alphaL,betaL,phiL) {
    translate([xR,yR,zR]) rotate([alphaR,betaR,phiR])  robot("plum");
    translate([xL,yL,zL]) rotate([alphaL,betaL,phiL])  robot("lightblue");
}
                     
module RunSimulationL(xL,yL,zL,alphaL,betaL,phiL) {
    translate([xL,yL,zL]) rotate([alphaL,betaL,phiL])  robot("lightblue");
}

module RunSimulationR(xR,yR,zR,alphaR,betaR,phiR) {
    translate([xR,yR,zR]) rotate([alphaR,betaR,phiR])  robot("plum");
}
