include <../Global/Parameters.scad>
include <../Global/GenericField.scad>

TAPE_WIDTH = 1;

OUTFIELD_X_OFFSET = 24;
OUTFIELD_Y_OFFSET = 18;
OUTFIELD_WIDTH    = 42;
OUTFIELD_LENGTH   = 108;

WING_OFFSET       = 12;
WING_LENGTH       = 51;
WING_WIDTH        = 36;

SPIKE_LENGTH      = 12;

BACKDROP_LENGTH   = 40;
BACKDROP_WIDTH    = 25.5;
BACKDROP_HEIGHT   = 2;

CONNECTOR         = 3;

PIPE_DIAMETER     = 1;

LEG_WIDTH         = 2;
TRUSS_X1          = -15;
TRUSS_X2          = -6;
TRUSS_Y1          = 14;
TRUSS_Y2          = 22;
TRUSS_WIDTH       = 20;
TRUSS_CROSS       = 10;

TRUSS1            = 21.5;
TRUSS2            = 22.5;
TRUSS3            = 46.25;

TRUSS2_OFFSET     = TRUSS3/2 + TRUSS2;
TRUSS1_OFFSET     = TRUSS2_OFFSET + TRUSS1;

module infield_tape() {

    LONG_DIAGONAL_LENGTH  = sqrt( 2*pow(TILE_WIDTH,2))-3;
    SHORT_DIAGONAL_LENGTH = sqrt( 2*pow(.5*TILE_WIDTH,2));
    DIAGONAL_LENGTH = 27;
    SPIKE_LENGTH = 12;
    WHITE_STRIP = 6;
    WHITE_GAP = 11;

    color("red") {
        translate([-2*TILE_WIDTH,3*TILE_WIDTH-2*WALL_FRAME_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,135]) cube([TAPE_WIDTH,LONG_DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);
        translate([2*TILE_WIDTH,-3*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,90]) cube([3*TILE_WIDTH-10.75,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([3*TILE_WIDTH-WALL_FRAME_WIDTH,-TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,118]) cube([TAPE_WIDTH,DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);

        translate([TILE_WIDTH-2*TAPE_WIDTH,-TILE_WIDTH-TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])rotate([180,0,0]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        translate([SPIKE_LENGTH/2-1,-TILE_WIDTH-TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,-90]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        translate([0,-TILE_WIDTH-TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([180,0,0]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);

        translate([-TILE_WIDTH-2*TAPE_WIDTH,-TILE_WIDTH-TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([180,0,0]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        translate([-2*TILE_WIDTH+SPIKE_LENGTH/2,-TILE_WIDTH-TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,-90]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        translate([-2*TILE_WIDTH,-TILE_WIDTH-TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([180,0,0]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
    }

    color("blue") {
        translate([-2*TILE_WIDTH-WALL_FRAME_WIDTH,-3*TILE_WIDTH+2*WALL_FRAME_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,45]) cube([TAPE_WIDTH,LONG_DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);
        translate([2*TILE_WIDTH-TAPE_WIDTH,3*TILE_WIDTH-WALL_FRAME_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([2*TILE_WIDTH+10.75,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([3*TILE_WIDTH-WALL_FRAME_WIDTH,-TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,59]) cube([TAPE_WIDTH,DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);

        translate([TILE_WIDTH-2*TAPE_WIDTH,TILE_WIDTH+TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])rotate([0,0,0]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        translate([SPIKE_LENGTH/2-1,TILE_WIDTH+TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,-90]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        translate([0,TILE_WIDTH+TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,0]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);

        translate([-TILE_WIDTH-2*TAPE_WIDTH,TILE_WIDTH+TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,0]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        translate([-2*TILE_WIDTH+SPIKE_LENGTH/2,TILE_WIDTH+TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,-90]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
        translate([-2*TILE_WIDTH,TILE_WIDTH+TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,0]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
    }

    color("white") {
        translate([-3*TILE_WIDTH,-TILE_WIDTH-WHITE_GAP,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([TAPE_WIDTH,WHITE_STRIP,TAPE_HEIGHT],center=false);
        translate([-3*TILE_WIDTH,-TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([TAPE_WIDTH,WHITE_STRIP,TAPE_HEIGHT],center=false);
        translate([-3*TILE_WIDTH,-TILE_WIDTH+WHITE_GAP,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([TAPE_WIDTH,WHITE_STRIP,TAPE_HEIGHT],center=false);

        translate([-3*TILE_WIDTH,2*TILE_WIDTH-WHITE_GAP,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([TAPE_WIDTH,WHITE_STRIP,TAPE_HEIGHT],center=false);
        translate([-3*TILE_WIDTH,TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([TAPE_WIDTH,WHITE_STRIP,TAPE_HEIGHT],center=false);
        translate([-3*TILE_WIDTH,TILE_WIDTH-WHITE_GAP,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([TAPE_WIDTH,WHITE_STRIP,TAPE_HEIGHT],center=false);
    }
}

module outfield_tape() {

    color("blue") {
        translate([FIELD_WIDTH/2-OUTFIELD_X_OFFSET,FIELD_WIDTH/2+OUTFIELD_Y_OFFSET+OUTFIELD_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([OUTFIELD_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([FIELD_WIDTH/2-OUTFIELD_X_OFFSET+TAPE_WIDTH,FIELD_WIDTH/2+OUTFIELD_Y_OFFSET+OUTFIELD_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,90]) cube([TAPE_WIDTH,OUTFIELD_LENGTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([FIELD_WIDTH/2-OUTFIELD_X_OFFSET+TAPE_WIDTH,FIELD_WIDTH/2+OUTFIELD_Y_OFFSET,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,90]) cube([TAPE_WIDTH,OUTFIELD_LENGTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);
         translate([FIELD_WIDTH/2-OUTFIELD_LENGTH-OUTFIELD_X_OFFSET+2*TAPE_WIDTH,FIELD_WIDTH/2+OUTFIELD_Y_OFFSET+OUTFIELD_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([OUTFIELD_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2+10,-FIELD_WIDTH/2-OUTFIELD_Y_OFFSET-OUTFIELD_WIDTH-TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,90]) cube([WING_LENGTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-FIELD_WIDTH/2+10,-FIELD_WIDTH/2-OUTFIELD_Y_OFFSET-OUTFIELD_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,180]) cube([WING_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-FIELD_WIDTH/2-WING_WIDTH+10,-FIELD_WIDTH/2-OUTFIELD_Y_OFFSET-OUTFIELD_WIDTH-TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,90]) cube([WING_LENGTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-FIELD_WIDTH/2+10-TAPE_WIDTH,-FIELD_WIDTH/2-WING_OFFSET+2*TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,180]) cube([WING_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
   }

    color("red") {
        translate([FIELD_WIDTH/2-OUTFIELD_X_OFFSET,-FIELD_WIDTH/2-OUTFIELD_Y_OFFSET,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([OUTFIELD_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
         translate([FIELD_WIDTH/2-OUTFIELD_X_OFFSET,-FIELD_WIDTH/2-OUTFIELD_Y_OFFSET-OUTFIELD_WIDTH-TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,90]) cube([TAPE_WIDTH,OUTFIELD_LENGTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([FIELD_WIDTH/2-OUTFIELD_X_OFFSET+TAPE_WIDTH,-FIELD_WIDTH/2-OUTFIELD_Y_OFFSET,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,90]) cube([TAPE_WIDTH,OUTFIELD_LENGTH+2*TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([FIELD_WIDTH/2-OUTFIELD_LENGTH-TAPE_WIDTH-OUTFIELD_X_OFFSET+2*TAPE_WIDTH,-FIELD_WIDTH/2-OUTFIELD_Y_OFFSET,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([OUTFIELD_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2+10,FIELD_WIDTH/2+OUTFIELD_Y_OFFSET+OUTFIELD_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([WING_LENGTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-FIELD_WIDTH/2+10,FIELD_WIDTH/2+10,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,180]) cube([WING_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false); cube([WING_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-FIELD_WIDTH/2+10,FIELD_WIDTH/2+WING_OFFSET+WING_LENGTH-2*TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,180]) cube([WING_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-FIELD_WIDTH/2+10-WING_WIDTH,FIELD_WIDTH/2+WING_OFFSET+WING_LENGTH-2*TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([WING_LENGTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
   }

    color("grey") {
        translate([-FIELD_WIDTH/2-24,-FIELD_WIDTH/2,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,90]) cube([FIELD_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-FIELD_WIDTH/2-48,-FIELD_WIDTH/2,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,90]) cube([FIELD_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-FIELD_WIDTH/2-72,-FIELD_WIDTH/2,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,90]) cube([FIELD_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
    }
}

module backdrops() {

    color("black") {
        translate([60,22,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-60,0]) cube([BACKDROP_LENGTH,BACKDROP_WIDTH,2],center=false);
        translate([60,-47,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-60,0]) cube([BACKDROP_LENGTH,BACKDROP_WIDTH,2],center=false);
    }

    color("white") {
        translate([65,25,12]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-60,0]) cube([1,20,1],center=false);
        translate([69,25,19]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-60,0]) cube([1,20,1],center=false);
        translate([73,25,26]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-60,0]) cube([1,20,1],center=false);

        translate([65,-44,12]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-60,0]) cube([1,20,1],center=false);
        translate([69,-44,19]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-60,0]) cube([1,20,1],center=false);
        translate([73,-44,26]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-60,0]) cube([1,20,1],center=false);

        translate([60.5,28,4]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-60,0]) cube([2,2,1],center=false);
        translate([60.5,34,4]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-60,0]) cube([2,2,1],center=false);
        translate([60.5,40,4]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-60,0]) cube([2,2,1],center=false);

        translate([60.5,-42,4]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-60,0]) cube([2,2,1],center=false);
        translate([60.5,-36,4]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-60,0]) cube([2,2,1],center=false);
        translate([60.5,-30,4]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-60,0]) cube([2,2,1],center=false);
    }
}

module bars() {
    color("yellow") {
        translate([TRUSS_X1,TRUSS2_OFFSET-PIPE_DIAMETER,TRUSS_Y1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,180]) cube([PIPE_DIAMETER,TRUSS2,PIPE_DIAMETER],center=false);
        translate([TRUSS_X2,TRUSS1_OFFSET,TRUSS_Y1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,180]) cube([PIPE_DIAMETER,TRUSS2,PIPE_DIAMETER],center=false);
        translate([TRUSS_X1,-TRUSS2_OFFSET+PIPE_DIAMETER,TRUSS_Y1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([PIPE_DIAMETER,TRUSS2,PIPE_DIAMETER],center=false);
        translate([TRUSS_X2,-TRUSS1_OFFSET,TRUSS_Y1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([PIPE_DIAMETER,TRUSS1,PIPE_DIAMETER],center=false);
        
        translate([-TRUSS_WIDTH/2,-TRUSS3/2,TRUSS_Y2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([PIPE_DIAMETER,TRUSS3,PIPE_DIAMETER],center=false);
        translate([-TRUSS_WIDTH/2+5,-TRUSS3/2,TRUSS_Y1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([PIPE_DIAMETER,TRUSS3,PIPE_DIAMETER],center=false);
        translate([-TRUSS_WIDTH/2,-TRUSS3/2+2*LEG_WIDTH,TRUSS_Y2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([-90,-35,0]) cube([PIPE_DIAMETER,TRUSS_CROSS,PIPE_DIAMETER],center=false);
        translate([-TRUSS_WIDTH/2,0,TRUSS_Y2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([-90,-35,0]) cube([PIPE_DIAMETER,TRUSS_CROSS,PIPE_DIAMETER],center=false);
        translate([-TRUSS_WIDTH/2,TRUSS3/2-2*LEG_WIDTH-1,TRUSS_Y2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([-90,-35,0]) cube([PIPE_DIAMETER,TRUSS_CROSS,PIPE_DIAMETER],center=false);
    }

    color("red") {
        translate([-TRUSS_WIDTH/2-2,-TRUSS1_OFFSET,TRUSS_Y2]) 
                scale([FIELD_SCALE,FIELD_SCALE,1]) cube([PIPE_DIAMETER,TRUSS1,PIPE_DIAMETER],center=false);
        translate([-TRUSS_WIDTH/2,-TRUSS2_OFFSET+PIPE_DIAMETER,TRUSS_Y2]) 
                scale([FIELD_SCALE,FIELD_SCALE,1]) cube([PIPE_DIAMETER,TRUSS2,PIPE_DIAMETER],center=false);
    }

    color("blue") {
        translate([-TRUSS_WIDTH/2-2,TRUSS1_OFFSET,TRUSS_Y2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,180]) cube([PIPE_DIAMETER,TRUSS1,PIPE_DIAMETER],center=false);
        translate([-TRUSS_WIDTH/2,TRUSS2_OFFSET-PIPE_DIAMETER,TRUSS_Y2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,180]) cube([PIPE_DIAMETER,TRUSS2,PIPE_DIAMETER],center=false);
    }

    color("black") {
        translate([-TRUSS_WIDTH/2-1.5,TRUSS3/2-6,TRUSS_Y2+1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([-90,-35,0]) cube([CONNECTOR,CONNECTOR,CONNECTOR],center=false);
        translate([-TRUSS_WIDTH/2-1.5,-1,TRUSS_Y2+1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([-90,-35,0]) cube([CONNECTOR,CONNECTOR,CONNECTOR],center=false);
        translate([-TRUSS_WIDTH/2-1.5,-TRUSS3/2+3,TRUSS_Y2+1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([-90,-35,0]) cube([CONNECTOR,CONNECTOR,CONNECTOR],center=false);

        translate([-7,TRUSS3/2-6,TRUSS_Y1+1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([-90,-35,0]) cube([CONNECTOR,CONNECTOR,CONNECTOR],center=false);
        translate([-7,-1,TRUSS_Y1+1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([-90,-35,0]) cube([CONNECTOR,CONNECTOR,CONNECTOR],center=false);
        translate([-7,-TRUSS3/2+3,TRUSS_Y1+1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([-90,-35,0]) cube([CONNECTOR,CONNECTOR,CONNECTOR],center=false);
    }
}

module truss_leg(_y) {

    color("silver") {
        translate([-TILE_WIDTH,_y,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,30,0]) cube([LEG_WIDTH,LEG_WIDTH,TRUSS_Y2],center=false);

        translate([0,_y,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-30,0]) cube([LEG_WIDTH,LEG_WIDTH,TRUSS_Y2],center=false);

        translate([-.5*TILE_WIDTH+3.5,_y,20]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,90]) cube([LEG_WIDTH,LEG_WIDTH+3,4],center=false);
    }
}

module drawField() {

    BuildField();

    infield_tape();

    outfield_tape();

    truss_leg(3*TILE_WIDTH-WALL_FRAME_WIDTH-LEG_WIDTH-1);

    truss_leg(2*TILE_WIDTH-WALL_FRAME_WIDTH-LEG_WIDTH);

    truss_leg(TILE_WIDTH-WALL_FRAME_WIDTH-LEG_WIDTH);

    truss_leg(-TILE_WIDTH-WALL_FRAME_WIDTH+LEG_WIDTH);

    truss_leg(-2*TILE_WIDTH-WALL_FRAME_WIDTH+LEG_WIDTH);

    truss_leg(-3*TILE_WIDTH-WALL_FRAME_WIDTH+LEG_WIDTH);

    bars();

    backdrops();
}

drawField();