include <CenterStageField.scad>

ROBOT_LENGTH = 17.0;
ROBOT_WIDTH = 16.0;
ROBOT_HEIGHT = 4;

//DrawField();

module robot() {
    color("silver") // Chassis
        difference() {
            translate([0,0,2]) cube([ROBOT_LENGTH,ROBOT_WIDTH,ROBOT_HEIGHT],center=true);
            translate([-6,0,3]) cube([8,8,6],center=true);
        }

    color("green") { // Intakes
        translate([-7.5,4,ROBOT_HEIGHT])  cylinder(h=8,d=3,center=true,$fn=32);
        translate([-7.5,-4,ROBOT_HEIGHT]) cylinder(h=8,d=3,center=true,$fn=32);
    }
}

// The following lines draw the objects

translate([-33,-62,0]) rotate([0,0,90])  robot(); // Start
translate([-56,-30,0]) rotate([0,0,90])  robot(); // PLAT_POINT
translate([-40,-55,0]) rotate([0,0,180]) robot(); // PLAT_POINT_2
translate([2,-38,0])   rotate([0,0,180]) robot(); // MID_POINT
translate([18,-24,0])  rotate([0,0,200]) robot(); // BLOCK_POINT
