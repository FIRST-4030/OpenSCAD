//include <CenterStageField.scad>

PRINT_SCALER = 1;  // SET TO 1 FOR INCHES, 25.4 FOR MM

ROBOT_LENGTH = 15.0*PRINT_SCALER;
ROBOT_WIDTH  = 15.0*PRINT_SCALER;
CHAMF        = 1.0*PRINT_SCALER;
ROBOT_HEIGHT = 2*PRINT_SCALER;
WHEEL_LEN    = 1.4*PRINT_SCALER;
WHEEL_WID    = 2.0*PRINT_SCALER;

module robot_2D() {        
    difference() {
        polygon([[ROBOT_LENGTH/2,ROBOT_WIDTH/2-CHAMF],
        [ROBOT_LENGTH/2-CHAMF,ROBOT_WIDTH/2],
        [-ROBOT_LENGTH/2+CHAMF,ROBOT_WIDTH/2],
        [-ROBOT_LENGTH/2,ROBOT_WIDTH/2-CHAMF],
        [-ROBOT_LENGTH/2,-ROBOT_WIDTH/2+CHAMF],
        [-ROBOT_LENGTH/2+CHAMF,-ROBOT_WIDTH/2],
        [ROBOT_LENGTH/2-CHAMF,-ROBOT_WIDTH/2],
        [ROBOT_LENGTH/2,-ROBOT_WIDTH/2+CHAMF]]);
        //square([ROBOT_LENGTH,ROBOT_WIDTH],center=true); // represents robot outline
        
        // represents robot wheels
        translate([ROBOT_LENGTH*.3,ROBOT_WIDTH*.45,0]) wheel();
        translate([-ROBOT_LENGTH*.3,ROBOT_WIDTH*.45,0]) wheel();
        translate([ROBOT_LENGTH*.3,-ROBOT_WIDTH*.45,0]) wheel();
        translate([-ROBOT_LENGTH*.3,-ROBOT_WIDTH*.45,0]) wheel();
    }
    module wheel() {
        hull() {
            translate([WHEEL_LEN/2,0,0]) square(WHEEL_WID,center=true);
            translate([-WHEEL_LEN/2,0,0]) square(WHEEL_WID,center=true);
        }
    }
}
//robot_2D($fn=30);  // Turn this line on to export the SVG for Easel

module robot(inColor,extension) {  // 3D Chassis
    color(inColor,0.5) { // Intakes
        linear_extrude(ROBOT_HEIGHT) robot_2D();
    }
    
    color("silver") {
        translate([-3,0,ROBOT_HEIGHT]) rotate([0,-90,0]) cube([2,2,extension],center=false);
    }
}
//robot("blue",12);

module positionRobot(inColor="white",x=0,y=0,ang=0,placement = "") {
    echo("x=",x,", y=",y,", ang=",ang," placement=",placement);
    if (placement == "stabilizer") {
        translate([x,y,0]) rotate([0,0,ang]) robot(inColor,5);
    } else if (placement == "corner") { 
        translate([x,y,0]) rotate([0,0,ang]) robot(inColor,12);
    } else if (placement == "center") { 
        translate([x,y,0]) rotate([0,0,ang]) robot(inColor,10);
    } else if (placement == "park") { 
        translate([x,y,0]) rotate([0,0,ang]) robot(inColor,5);
    } else if (placement == "pick") { 
        translate([x,y,0]) rotate([0,0,ang]) robot(inColor,8);
    } else if (placement == "deliver") { 
        translate([x,y,0]) rotate([0,0,ang]) robot(inColor,22);
    } else { 
        echo("???",placement);
        translate([x,y,0]) rotate([0,0,ang]) robot(inColor,5);
    }
}
