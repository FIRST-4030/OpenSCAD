include <../Global/Parameters.scad>
include <../Global/GenericField.scad>

OUTFIELD_OFFSET = 18;
OUTFIELD_WIDTH  = 42;
OUTFIELD_LENGTH = 120;

TAPE_WIDTH = 1;

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
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,OUTFIELD_LENGTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2-OUTFIELD_OFFSET-OUTFIELD_WIDTH,-FIELD_WIDTH/2+OUTFIELD_LENGTH-TAPE_WIDTH-TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([OUTFIELD_WIDTH+TAPE_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2-OUTFIELD_OFFSET,-FIELD_WIDTH/2,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,OUTFIELD_LENGTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);
    }

    color("red") {
        translate([FIELD_WIDTH/2+OUTFIELD_OFFSET,-FIELD_WIDTH/2,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([OUTFIELD_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([FIELD_WIDTH/2+OUTFIELD_OFFSET,-FIELD_WIDTH/2,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,OUTFIELD_LENGTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([FIELD_WIDTH/2+OUTFIELD_OFFSET,-FIELD_WIDTH/2+OUTFIELD_LENGTH-TAPE_WIDTH-TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([OUTFIELD_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([FIELD_WIDTH/2+OUTFIELD_OFFSET+OUTFIELD_WIDTH,-FIELD_WIDTH/2,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,OUTFIELD_LENGTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);
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
}

drawField();
