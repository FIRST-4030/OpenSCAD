include <../Global/Parameters.scad>
include <../Global/GenericField.scad>

OUTFIELD_X_OFFSET = 18;
OUTFIELD_Y_OFFSET = 24;
OUTFIELD_WIDTH  = 42;
OUTFIELD_LENGTH = 108;

WING_OFFSET = 12;
WING_LENGTH = 51;
WING_WIDTH = 36;

FLOOR_PLATE_WIDTH     = 17.4;
FLOOR_PLATE_LENGTH    = 45;
FLOOR_LEG_WIDTH       = 2;
FLOOR_LEG_HEIGHT1     = 14;
FLOOR_LEG_HEIGHT2     = 23.5;
FLOOR_BRIDGE_BOTTOM   = 10.5;

TAPE_WIDTH = 1;

module infield_tape() {

    LONG_DIAGONAL_LENGTH  = sqrt( 2*pow(TILE_WIDTH,2));
    SHORT_DIAGONAL_LENGTH = sqrt( 2*pow(.5*TILE_WIDTH,2));
    DIAGONAL_LENGTH = 27;
    SPIKE_LENGTH = 12;
    WHITE_STRIP = 6;
    WHITE_GAP = 11;

    color("red") {
        translate([-3*TILE_WIDTH,-2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-135]) cube([TAPE_WIDTH,LONG_DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);
        translate([10.75,2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([3*TILE_WIDTH-10.75,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([0,3*TILE_WIDTH-WALL_FRAME_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,-153]) cube([TAPE_WIDTH,DIAGONAL_LENGTH-2,TAPE_HEIGHT],center=false);

        translate([1*TILE_WIDTH,-2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,-90]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        translate([1*TILE_WIDTH,-1*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,-90]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        translate([1*TILE_WIDTH,-2*TILE_WIDTH+6,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,0]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);

        translate([1*TILE_WIDTH,0,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,-90]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        translate([1*TILE_WIDTH,1*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,-90]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        translate([1*TILE_WIDTH,6,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,0]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
    }

    color("blue") {
        translate([2*TILE_WIDTH,-3*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-45]) cube([TAPE_WIDTH,LONG_DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);
        translate([-3*TILE_WIDTH,2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([2*TILE_WIDTH+10.75,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([0,3*TILE_WIDTH-WALL_FRAME_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,-211]) cube([TAPE_WIDTH,DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);

        translate([-1*TILE_WIDTH,-2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,90]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        translate([-1*TILE_WIDTH,-1*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,90]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        translate([-1*TILE_WIDTH,-2*TILE_WIDTH+6,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,0]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);

        translate([-1*TILE_WIDTH,0,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,90]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        translate([-1*TILE_WIDTH,1*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,90]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        translate([-1*TILE_WIDTH,6,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,0]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        }


    color("white") {
        translate([-1*TILE_WIDTH,-3*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([TAPE_WIDTH,WHITE_STRIP,TAPE_HEIGHT],center=false);
        translate([-1*TILE_WIDTH+WHITE_GAP,-3*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([TAPE_WIDTH,WHITE_STRIP,TAPE_HEIGHT],center=false);
        translate([-1*TILE_WIDTH-WHITE_GAP,-3*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([TAPE_WIDTH,WHITE_STRIP,TAPE_HEIGHT],center=false);

        translate([1*TILE_WIDTH,-3*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([TAPE_WIDTH,WHITE_STRIP,TAPE_HEIGHT],center=false);
        translate([1*TILE_WIDTH+WHITE_GAP,-3*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([TAPE_WIDTH,WHITE_STRIP,TAPE_HEIGHT],center=false);
        translate([1*TILE_WIDTH-WHITE_GAP,-3*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([TAPE_WIDTH,WHITE_STRIP,TAPE_HEIGHT],center=false);
    }
}

module outfield_tape() {

    color("blue") {
        translate([-FIELD_WIDTH/2-OUTFIELD_X_OFFSET-OUTFIELD_WIDTH,FIELD_WIDTH/2-OUTFIELD_Y_OFFSET,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([OUTFIELD_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-FIELD_WIDTH/2-OUTFIELD_X_OFFSET-OUTFIELD_WIDTH+TAPE_WIDTH,FIELD_WIDTH/2-OUTFIELD_Y_OFFSET,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,180]) cube([TAPE_WIDTH,OUTFIELD_LENGTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-FIELD_WIDTH/2-OUTFIELD_X_OFFSET,FIELD_WIDTH/2-OUTFIELD_Y_OFFSET+TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,180]) cube([TAPE_WIDTH,OUTFIELD_LENGTH+2*TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-FIELD_WIDTH/2-OUTFIELD_X_OFFSET-OUTFIELD_WIDTH,FIELD_WIDTH/2-OUTFIELD_LENGTH-TAPE_WIDTH-OUTFIELD_Y_OFFSET+2*TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([OUTFIELD_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([FIELD_WIDTH/2+OUTFIELD_X_OFFSET+OUTFIELD_WIDTH+TAPE_WIDTH,-FIELD_WIDTH/2+10,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,180]) cube([WING_LENGTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([FIELD_WIDTH/2+OUTFIELD_X_OFFSET+OUTFIELD_WIDTH+TAPE_WIDTH,-FIELD_WIDTH/2+10,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([WING_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([FIELD_WIDTH/2+OUTFIELD_X_OFFSET+OUTFIELD_WIDTH+TAPE_WIDTH,-FIELD_WIDTH/2-WING_WIDTH+10,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,180]) cube([WING_LENGTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([FIELD_WIDTH/2+OUTFIELD_X_OFFSET+OUTFIELD_WIDTH-WING_LENGTH+TAPE_WIDTH,-FIELD_WIDTH/2+10-TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([WING_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
    }

    color("red") {
        translate([FIELD_WIDTH/2+OUTFIELD_X_OFFSET,FIELD_WIDTH/2-OUTFIELD_Y_OFFSET,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([OUTFIELD_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([FIELD_WIDTH/2+OUTFIELD_X_OFFSET+OUTFIELD_WIDTH+TAPE_WIDTH,FIELD_WIDTH/2-OUTFIELD_Y_OFFSET,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,180]) cube([TAPE_WIDTH,OUTFIELD_LENGTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([FIELD_WIDTH/2+OUTFIELD_X_OFFSET,FIELD_WIDTH/2-OUTFIELD_Y_OFFSET+TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,180]) cube([TAPE_WIDTH,OUTFIELD_LENGTH+2*TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([FIELD_WIDTH/2+OUTFIELD_X_OFFSET,FIELD_WIDTH/2-OUTFIELD_LENGTH-TAPE_WIDTH-OUTFIELD_Y_OFFSET+2*TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([OUTFIELD_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2-OUTFIELD_X_OFFSET-OUTFIELD_WIDTH,-FIELD_WIDTH/2+10-TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([WING_LENGTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-FIELD_WIDTH/2-OUTFIELD_X_OFFSET-OUTFIELD_WIDTH,-FIELD_WIDTH/2+10-TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([WING_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-FIELD_WIDTH/2-OUTFIELD_X_OFFSET-OUTFIELD_WIDTH+TAPE_WIDTH,-FIELD_WIDTH/2-WING_WIDTH+10-TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([WING_LENGTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-FIELD_WIDTH/2-OUTFIELD_X_OFFSET-OUTFIELD_WIDTH+WING_LENGTH-TAPE_WIDTH,-FIELD_WIDTH/2+10-TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([WING_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
    }

    color("grey") {
        translate([-FIELD_WIDTH/2,-FIELD_WIDTH/2-24,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([FIELD_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-FIELD_WIDTH/2,-FIELD_WIDTH/2-48,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([FIELD_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-FIELD_WIDTH/2,-FIELD_WIDTH/2-72,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([FIELD_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
    }
}

module truss_legs() {

    color("silver") {
        translate([3*TILE_WIDTH-WALL_FRAME_WIDTH-FLOOR_LEG_WIDTH,-TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([-30,0,0]) cube([FLOOR_LEG_WIDTH,FLOOR_LEG_WIDTH,FLOOR_LEG_HEIGHT2],center=false);

        translate([3*TILE_WIDTH-WALL_FRAME_WIDTH-FLOOR_LEG_WIDTH,0,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([30,0,0]) cube([FLOOR_LEG_WIDTH,FLOOR_LEG_WIDTH,FLOOR_LEG_HEIGHT2],center=false);

        translate([3*TILE_WIDTH-WALL_FRAME_WIDTH-FLOOR_LEG_WIDTH,-.5*TILE_WIDTH-1,19]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([FLOOR_LEG_WIDTH,FLOOR_LEG_WIDTH+3,4],center=false);
    }
}

module drawField() {

    BuildField();

    infield_tape();

    outfield_tape();

    truss_legs();
}

drawField();
