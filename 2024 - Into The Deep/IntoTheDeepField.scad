include <../Global/Parameters.scad>
use <../Global/GenericField.scad>

TAPE_WIDTH = 1;

OUTFIELD_X_OFFSET = 0;
OUTFIELD_Y_OFFSET = 18;
OUTFIELD_WIDTH    = 40;
OUTFIELD_LENGTH   = 120;

WING_OFFSET       = 12;
WING_LENGTH       = 51;
WING_WIDTH        = 36;

SPIKE_LENGTH      = 3.5;

PIPE_DIAMETER     = 1;
VERTICAL_HW       = 2;

module infield_tape() {

    LONG_DIAGONAL_LENGTH  = sqrt( 2*pow(TILE_WIDTH,2));
    SHORT_DIAGONAL_LENGTH = sqrt( 2*pow(.5*TILE_WIDTH,2));
    ASCENT_ZONE_LENGTH = 28;
    DIAGONAL_LENGTH = 27;
    WHITE_GAP = 11;

    color("red") {
        translate([-3*TILE_WIDTH,-2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-135]) cube([TAPE_WIDTH,LONG_DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);
        translate([3*TILE_WIDTH-WALL_FRAME_WIDTH,-2.5*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,180]) cube([TILE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([2*TILE_WIDTH,-2.5*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,135]) cube([TAPE_WIDTH,SHORT_DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);
    }

    color("blue") {
        translate([2*TILE_WIDTH,3*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-135]) cube([TAPE_WIDTH,LONG_DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);
        translate([-3*TILE_WIDTH,2.5*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([TILE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([-2*TILE_WIDTH-WALL_FRAME_WIDTH,2.5*TILE_WIDTH+TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1])  rotate([0,0,-45]) cube([TAPE_WIDTH,SHORT_DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);
    }
    
    color("white") {
        translate([TILE_WIDTH,TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-150]) cube([TAPE_WIDTH,ASCENT_ZONE_LENGTH,TAPE_HEIGHT],center=false);
        translate([TILE_WIDTH-TAPE_WIDTH,-TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-30]) cube([TAPE_WIDTH,ASCENT_ZONE_LENGTH,TAPE_HEIGHT],center=false);
        translate([-TILE_WIDTH,TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,150]) cube([TAPE_WIDTH,ASCENT_ZONE_LENGTH,TAPE_HEIGHT],center=false);
        translate([-TILE_WIDTH-TAPE_WIDTH,-TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,30]) cube([TAPE_WIDTH,ASCENT_ZONE_LENGTH,TAPE_HEIGHT],center=false);
    }

    // Lower right
    spikeMark(-3*TILE_WIDTH,-TILE_WIDTH-SPIKE_LENGTH,"white");
    spikeMark(-2.5*TILE_WIDTH-TAPE_WIDTH,-TILE_WIDTH-SPIKE_LENGTH,"white");
    spikeMark(-2*TILE_WIDTH-TAPE_WIDTH,-TILE_WIDTH-SPIKE_LENGTH,"white");

    // Lower left
    spikeMark(-3*TILE_WIDTH,TILE_WIDTH,"blue");
    spikeMark(-2.5*TILE_WIDTH-TAPE_WIDTH,TILE_WIDTH,"blue");
    spikeMark(-2*TILE_WIDTH-TAPE_WIDTH,TILE_WIDTH,"blue");
    
    // Upper right
    spikeMark(3*TILE_WIDTH-WALL_FRAME_WIDTH,-TILE_WIDTH-SPIKE_LENGTH,"red");
    spikeMark(2.5*TILE_WIDTH-TAPE_WIDTH,-TILE_WIDTH-SPIKE_LENGTH,"red");
    spikeMark(2*TILE_WIDTH-TAPE_WIDTH,-TILE_WIDTH-SPIKE_LENGTH,"red");

    // Upper left
    spikeMark(3*TILE_WIDTH-WALL_FRAME_WIDTH,TILE_WIDTH,"white");
    spikeMark(2.5*TILE_WIDTH-TAPE_WIDTH,TILE_WIDTH,"white");
    spikeMark(2*TILE_WIDTH-TAPE_WIDTH,TILE_WIDTH,"white");
}

module spikeMark(x,y,inColor) {
    color(inColor) {
        translate([x,y,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([TAPE_WIDTH,SPIKE_LENGTH,TAPE_HEIGHT],center=false);
    }
}

module outfield_tape() {

    color("blue") {
        translate([FIELD_WIDTH/2-OUTFIELD_X_OFFSET-TILE_WIDTH,FIELD_WIDTH/2+OUTFIELD_Y_OFFSET+OUTFIELD_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([OUTFIELD_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([FIELD_WIDTH/2-OUTFIELD_X_OFFSET+TAPE_WIDTH-TILE_WIDTH,FIELD_WIDTH/2+OUTFIELD_Y_OFFSET+OUTFIELD_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,90]) cube([TAPE_WIDTH,OUTFIELD_LENGTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);
        translate([FIELD_WIDTH/2-OUTFIELD_X_OFFSET+TAPE_WIDTH-TILE_WIDTH,FIELD_WIDTH/2+OUTFIELD_Y_OFFSET,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,90]) cube([TAPE_WIDTH,OUTFIELD_LENGTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);
         translate([FIELD_WIDTH/2-OUTFIELD_LENGTH-OUTFIELD_X_OFFSET+2*TAPE_WIDTH-TILE_WIDTH,FIELD_WIDTH/2+OUTFIELD_Y_OFFSET+OUTFIELD_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([OUTFIELD_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
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
   }
}

module baskets() {
    BASKET_BAR_HEIGHT = 45;
    BASKET_LEVEL1     = 26;
    BASKET_LEVEL2     = 43;
    BASKET_HEIGHT     = 6;
    BASKET_WIDTH      = 8;
    BASKET_DEPTH      = 4;

    color("silver") {
        translate([3*TILE_WIDTH-WALL_FRAME_WIDTH,3*TILE_WIDTH-2*WALL_FRAME_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-90,0]) cube([BASKET_BAR_HEIGHT,VERTICAL_HW,VERTICAL_HW],center=false);
        translate([-3*TILE_WIDTH+2*WALL_FRAME_WIDTH,-3*TILE_WIDTH+WALL_FRAME_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-90,0]) cube([BASKET_BAR_HEIGHT,VERTICAL_HW,VERTICAL_HW],center=false);
    }
    
    color("white") {
        // blue
        translate([3*TILE_WIDTH-WALL_FRAME_WIDTH-1,3*TILE_WIDTH-7,BASKET_LEVEL1-BASKET_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,45]) cube([BASKET_DEPTH,BASKET_WIDTH,BASKET_HEIGHT],center=false);
        translate([3*TILE_WIDTH-WALL_FRAME_WIDTH-1,3*TILE_WIDTH-7,BASKET_LEVEL2-BASKET_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,45]) cube([BASKET_DEPTH,BASKET_WIDTH,BASKET_HEIGHT],center=false);
        // red
        translate([-3*TILE_WIDTH+4,-3*TILE_WIDTH,BASKET_LEVEL1-BASKET_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,45]) cube([BASKET_DEPTH,BASKET_WIDTH,BASKET_HEIGHT],center=false);
        translate([-3*TILE_WIDTH+4,-3*TILE_WIDTH,BASKET_LEVEL2-BASKET_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,45]) cube([BASKET_DEPTH,BASKET_WIDTH,BASKET_HEIGHT],center=false);
    }
}

module submersible() {
    BARRIER_HEIGHT      = 2;
    BARRIER_WIDTH       = 1;
    SHORT_LEG_LENGTH    = 27.5;
    LONG_LEG_LENGTH    = 42.75;
    FOOTER_OFFSET      = 10.3;
    TRUSS_LENGTH       = 20;
    SUBMERSIBLE_X      = 13.5;
    SUBMERSIBLE_HEIGHT = 36;
    SUBMERSIBLE_WIDTH  = 27.5;
    SUBMERSIBLE_LENGTH = 44.7;
    ASCENT_LEVEL1      = 20;
    ASCENT_LEVEL2      = 36;
    RUNG_LEVEL1        = 13;
    RUNG_LEVEL2        = 26;
    COLLAR_LENGTH      = 2;
    TAPE_LENGTH        = 1;
   
    color("silver") {
        // Truss legs
        translate([-TILE_WIDTH,TILE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-60,0]) cube([TRUSS_LENGTH,BARRIER_HEIGHT,BARRIER_HEIGHT],center=false);
        translate([-TILE_WIDTH,-TILE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-60,0]) cube([TRUSS_LENGTH,BARRIER_HEIGHT,BARRIER_HEIGHT],center=false);
        translate([TILE_WIDTH,TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,240,0]) cube([TRUSS_LENGTH,BARRIER_HEIGHT,BARRIER_HEIGHT],center=false);
        translate([TILE_WIDTH,-TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,240,0]) cube([TRUSS_LENGTH,BARRIER_HEIGHT,BARRIER_HEIGHT],center=false);

        // Verticals
        translate([-SUBMERSIBLE_X,TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-90,0]) cube([SUBMERSIBLE_HEIGHT,VERTICAL_HW,VERTICAL_HW],center=false);
        translate([-SUBMERSIBLE_X,-TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-90,0]) cube([SUBMERSIBLE_HEIGHT,VERTICAL_HW,VERTICAL_HW],center=false);
        translate([SUBMERSIBLE_X,TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-90,0]) cube([SUBMERSIBLE_HEIGHT,VERTICAL_HW,VERTICAL_HW],center=false);
        translate([SUBMERSIBLE_X,-TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-90,0]) cube([SUBMERSIBLE_HEIGHT,VERTICAL_HW,VERTICAL_HW],center=false);

        // Widths
        translate([-SUBMERSIBLE_X,TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([SUBMERSIBLE_WIDTH,BARRIER_WIDTH,BARRIER_HEIGHT],center=false);
        translate([-SUBMERSIBLE_X,-TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([SUBMERSIBLE_WIDTH,BARRIER_WIDTH,BARRIER_HEIGHT],center=false);
        translate([-SUBMERSIBLE_X,TILE_WIDTH+1,ASCENT_LEVEL2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([PIPE_DIAMETER,SUBMERSIBLE_WIDTH-2,PIPE_DIAMETER],center=false);
        translate([-SUBMERSIBLE_X,-TILE_WIDTH+1.5,ASCENT_LEVEL2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([PIPE_DIAMETER,SUBMERSIBLE_WIDTH-2,PIPE_DIAMETER],center=false);

        // Lengths
        translate([-SUBMERSIBLE_X,TILE_WIDTH+VERTICAL_HW,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([SUBMERSIBLE_LENGTH+3*VERTICAL_HW,BARRIER_WIDTH,BARRIER_HEIGHT],center=false);
        translate([SUBMERSIBLE_X-3*BARRIER_WIDTH,TILE_WIDTH+VERTICAL_HW,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([SUBMERSIBLE_LENGTH+3*VERTICAL_HW,BARRIER_WIDTH,BARRIER_HEIGHT],center=false);        translate([-SUBMERSIBLE_X-2,-TILE_WIDTH+PIPE_DIAMETER,ASCENT_LEVEL1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([PIPE_DIAMETER,SUBMERSIBLE_LENGTH+4,PIPE_DIAMETER],center=false);
        translate([-SUBMERSIBLE_X-2,-TILE_WIDTH+PIPE_DIAMETER,ASCENT_LEVEL2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([PIPE_DIAMETER,SUBMERSIBLE_LENGTH+4,PIPE_DIAMETER],center=false);
        translate([SUBMERSIBLE_X-2,-TILE_WIDTH+PIPE_DIAMETER,ASCENT_LEVEL1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([PIPE_DIAMETER,SUBMERSIBLE_LENGTH+4,PIPE_DIAMETER],center=false);
        translate([SUBMERSIBLE_X-2,-TILE_WIDTH+PIPE_DIAMETER,ASCENT_LEVEL2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([PIPE_DIAMETER,SUBMERSIBLE_LENGTH+4,PIPE_DIAMETER],center=false);
    }

    color("red") {
        translate([-SUBMERSIBLE_X,-TILE_WIDTH+PIPE_DIAMETER,RUNG_LEVEL1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([PIPE_DIAMETER,SUBMERSIBLE_WIDTH-2,PIPE_DIAMETER],center=false);
        translate([-SUBMERSIBLE_X,-TILE_WIDTH+PIPE_DIAMETER,RUNG_LEVEL2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([PIPE_DIAMETER,SUBMERSIBLE_WIDTH-2,PIPE_DIAMETER],center=false);

        translate([-SUBMERSIBLE_X-2,-TILE_WIDTH+PIPE_DIAMETER+2,ASCENT_LEVEL1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([PIPE_DIAMETER,TAPE_LENGTH,PIPE_DIAMETER],center=false);
        translate([-SUBMERSIBLE_X-2,0,ASCENT_LEVEL1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([PIPE_DIAMETER,TAPE_LENGTH,PIPE_DIAMETER],center=false);
        translate([-SUBMERSIBLE_X-2,TILE_WIDTH-PIPE_DIAMETER-2,ASCENT_LEVEL1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([PIPE_DIAMETER,TAPE_LENGTH,PIPE_DIAMETER],center=false);
        translate([-SUBMERSIBLE_X-2,-TILE_WIDTH+PIPE_DIAMETER+2,ASCENT_LEVEL2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([PIPE_DIAMETER,TAPE_LENGTH,PIPE_DIAMETER],center=false);
        translate([-SUBMERSIBLE_X-2,0,ASCENT_LEVEL2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([PIPE_DIAMETER,TAPE_LENGTH,PIPE_DIAMETER],center=false);
        translate([-SUBMERSIBLE_X-2,TILE_WIDTH-PIPE_DIAMETER-2,ASCENT_LEVEL2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([PIPE_DIAMETER,TAPE_LENGTH,PIPE_DIAMETER],center=false);
    }

    color("blue") {
        translate([-SUBMERSIBLE_X,TILE_WIDTH+PIPE_DIAMETER,RUNG_LEVEL1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([PIPE_DIAMETER,SUBMERSIBLE_WIDTH-2,PIPE_DIAMETER],center=false);
        translate([-SUBMERSIBLE_X,TILE_WIDTH+PIPE_DIAMETER,RUNG_LEVEL2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-90]) cube([PIPE_DIAMETER,SUBMERSIBLE_WIDTH-2,PIPE_DIAMETER],center=false);

        translate([SUBMERSIBLE_X-2,TILE_WIDTH-PIPE_DIAMETER-2,ASCENT_LEVEL1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([PIPE_DIAMETER,TAPE_LENGTH,PIPE_DIAMETER],center=false);
        translate([SUBMERSIBLE_X-2,0,ASCENT_LEVEL1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([PIPE_DIAMETER,TAPE_LENGTH,PIPE_DIAMETER],center=false);
        translate([SUBMERSIBLE_X-2,-TILE_WIDTH+PIPE_DIAMETER+2,ASCENT_LEVEL1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([PIPE_DIAMETER,TAPE_LENGTH,PIPE_DIAMETER],center=false);
        translate([SUBMERSIBLE_X-2,TILE_WIDTH-PIPE_DIAMETER-2,ASCENT_LEVEL2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([PIPE_DIAMETER,TAPE_LENGTH,PIPE_DIAMETER],center=false);
        translate([SUBMERSIBLE_X-2,0,ASCENT_LEVEL2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([PIPE_DIAMETER,TAPE_LENGTH,PIPE_DIAMETER],center=false);
        translate([SUBMERSIBLE_X-2,-TILE_WIDTH+PIPE_DIAMETER+2,ASCENT_LEVEL2]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,0]) cube([PIPE_DIAMETER,TAPE_LENGTH,PIPE_DIAMETER],center=false);
    }
}

module truss_leg(_y) {

    color("silver") {
        translate([-TILE_WIDTH-1,_y,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,30,0]) cube([LEG_WIDTH,LEG_WIDTH,TRUSS_Y2],center=false);

        translate([0-1,_y,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-30,0]) cube([LEG_WIDTH,LEG_WIDTH,TRUSS_Y2],center=false);

        translate([-.5*TILE_WIDTH+2.5,_y,20]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,90]) cube([LEG_WIDTH,LEG_WIDTH+3,4],center=false);
    }
}

module DrawField() {

    BuildField();

    infield_tape();

    outfield_tape();
    
    submersible();

    baskets();
}

DrawField();
