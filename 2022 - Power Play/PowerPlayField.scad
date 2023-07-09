include <../Global/Parameters.scad>
include <../Global/GenericField.scad>

OUTFIELD_OFFSET = 18;
OUTFIELD_WIDTH  = 42;
OUTFIELD_LENGTH = 120;

GROUND_JUNCTION_HEIGHT  = 1;
GROUND_JUNCTION_RADUIS1 = 2;
GROUND_JUNCTION_RADUIS2 = 1.5;

SPRING_HEIGHT = 3;

TAPE_WIDTH = 2;

module add_junctions() {

    // ground junctions
    color("black") {
        for (i=[2:-1:-2]) {
            for (j=[2:-1:-2]) {
                translate([i*TILE_WIDTH,j*TILE_WIDTH,TILE_HEIGHT])
                    scale([FIELD_SCALE,FIELD_SCALE,1]) draw_ground_junction();
            }
        }
    }
}

module add_poles() {

    LOW_JUNCTION_HEIGHT    = 13.5 - SPRING_HEIGHT;
    MEDIUM_JUNCTION_HEIGHT = 23.5 - SPRING_HEIGHT;
    HIGH_JUNCTION_HEIGHT   = 33.5 - SPRING_HEIGHT;

    // add springs
    color("silver") {
        draw_spring(-1, -2);
        draw_spring( 1, -2);
        draw_spring(-2, -1);
        draw_spring( 2, -1);
        draw_spring(-2,  1);
        draw_spring( 2,  1);
        draw_spring(-1,  2);
        draw_spring( 1,  2);
 
        draw_spring(-1, -1);
        draw_spring( 1, -1);
        draw_spring(-1,  1);
        draw_spring( 1,  1);

        draw_spring( 0, -1);
        draw_spring(-1,  0);
        draw_spring( 1,  0);
        draw_spring( 0,  1);
    }

    // add poles
    color("yellow") {
        draw_pole(-1, -2, LOW_JUNCTION_HEIGHT);
        draw_pole( 1, -2, LOW_JUNCTION_HEIGHT);
        draw_pole(-2, -1, LOW_JUNCTION_HEIGHT);
        draw_pole( 2, -1, LOW_JUNCTION_HEIGHT);
        draw_pole(-2,  1, LOW_JUNCTION_HEIGHT);
        draw_pole( 2,  1, LOW_JUNCTION_HEIGHT);
        draw_pole(-1,  2, LOW_JUNCTION_HEIGHT);
        draw_pole( 1,  2, LOW_JUNCTION_HEIGHT);
 
        draw_pole(-1, -1, MEDIUM_JUNCTION_HEIGHT);
        draw_pole( 1, -1, MEDIUM_JUNCTION_HEIGHT);
        draw_pole(-1,  1, MEDIUM_JUNCTION_HEIGHT);
        draw_pole( 1,  1, MEDIUM_JUNCTION_HEIGHT);

        draw_pole( 0, -1, HIGH_JUNCTION_HEIGHT);
        draw_pole(-1,  0, HIGH_JUNCTION_HEIGHT);
        draw_pole( 1,  0, HIGH_JUNCTION_HEIGHT);
        draw_pole( 0,  1, HIGH_JUNCTION_HEIGHT);
    }
}

module draw_ground_junction() {

    cylinder( h=GROUND_JUNCTION_HEIGHT, r1=GROUND_JUNCTION_RADUIS1, r2=GROUND_JUNCTION_RADUIS2,center=true);
}

module draw_pole(x, y, height) {
    POLE_RADIUS = .5;

    translate([x*TILE_WIDTH,y*TILE_WIDTH,TILE_HEIGHT+SPRING_HEIGHT])
        scale([FIELD_SCALE,FIELD_SCALE,1])
            cylinder( h=height, r=POLE_RADIUS,center=false);
}

module draw_spring(x, y) {
    SPRING_RADIUS = .25;
    translate([x*TILE_WIDTH,y*TILE_WIDTH,(TILE_HEIGHT)])
        scale([FIELD_SCALE,FIELD_SCALE,1])
            cylinder( h=SPRING_HEIGHT, r=SPRING_RADIUS,center=false);
}

module infield_tape() {

    LONG_DIAGONAL_LENGTH  = sqrt( 2*pow(TILE_WIDTH,2));
    SHORT_DIAGONAL_LENGTH = sqrt( 2*pow(.5*TILE_WIDTH,2));

    color("blue") {
        translate([-3*TILE_WIDTH,-2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-135]) cube([TAPE_WIDTH,LONG_DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);

        translate([3*TILE_WIDTH,2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,45]) cube([TAPE_WIDTH,LONG_DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);

        translate([-3*TILE_WIDTH,-2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-135]) cube([TAPE_WIDTH,LONG_DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);

        translate([-3*TILE_WIDTH,-.5*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-45]) cube([TAPE_WIDTH,SHORT_DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);

        translate([-3*TILE_WIDTH,.5*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-135]) cube([TAPE_WIDTH,SHORT_DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);

        translate([-.5*TILE_WIDTH,-3*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,TILE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-.5*TILE_WIDTH,2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,TILE_WIDTH,TAPE_HEIGHT],center=false);
    }

    color("red") {
        translate([-3*TILE_WIDTH,2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,45]) cube([LONG_DIAGONAL_LENGTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([3*TILE_WIDTH,-2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-135]) cube([LONG_DIAGONAL_LENGTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([3*TILE_WIDTH,-.5*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,45]) cube([TAPE_WIDTH,SHORT_DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);

        translate([3*TILE_WIDTH,.5*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,135]) cube([TAPE_WIDTH,SHORT_DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);

        translate([.5*TILE_WIDTH,-3*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,TILE_WIDTH,TAPE_HEIGHT],center=false);

        translate([.5*TILE_WIDTH,2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,TILE_WIDTH,TAPE_HEIGHT],center=false);
    }
}

module outfield_tape() {

    color("blue") {
        translate([-FIELD_WIDTH/2-OUTFIELD_OFFSET-OUTFIELD_WIDTH+TAPE_WIDTH,-FIELD_WIDTH/2,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([OUTFIELD_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2-OUTFIELD_OFFSET-OUTFIELD_WIDTH,-FIELD_WIDTH/2,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,OUTFIELD_LENGTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2-OUTFIELD_OFFSET,-FIELD_WIDTH/2,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,OUTFIELD_LENGTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2-OUTFIELD_OFFSET-OUTFIELD_WIDTH,-FIELD_WIDTH/2+OUTFIELD_LENGTH-TAPE_WIDTH-TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([OUTFIELD_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
    }

    color("red") {
        translate([FIELD_WIDTH/2+OUTFIELD_OFFSET+TAPE_WIDTH,-FIELD_WIDTH/2,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([OUTFIELD_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([FIELD_WIDTH/2+OUTFIELD_OFFSET,-FIELD_WIDTH/2,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,OUTFIELD_LENGTH,TAPE_HEIGHT],center=false);

        translate([FIELD_WIDTH/2+OUTFIELD_OFFSET+OUTFIELD_WIDTH,-FIELD_WIDTH/2,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,OUTFIELD_LENGTH,TAPE_HEIGHT],center=false);

        translate([FIELD_WIDTH/2+OUTFIELD_OFFSET,-FIELD_WIDTH/2+OUTFIELD_LENGTH-TAPE_WIDTH-TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([OUTFIELD_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
    }
}

module perimeter() {

    color("black") {
        translate([FIELD_WIDTH/2,-FIELD_WIDTH/2,1]) 
            cube([TAPE_WIDTH,FIELD_WIDTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2,FIELD_WIDTH/2,1]) 
            rotate([0,0,-90]) cube([TAPE_WIDTH,FIELD_WIDTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2,FIELD_WIDTH/2,1]) 
            rotate([0,0,180]) cube([TAPE_WIDTH,FIELD_WIDTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2-TAPE_WIDTH,-FIELD_WIDTH/2,1]) 
            rotate([0,0,-90]) cube([TAPE_WIDTH,FIELD_WIDTH+2*TAPE_WIDTH,TAPE_HEIGHT],center=false);
    }
}

module drawField() {

    BuildField();

    infield_tape();

    outfield_tape();

    add_junctions();

    add_poles();

    perimeter();

}

drawField();
