include <../Global/Parameters.scad>
include <../Global/GenericField.scad>

BRICK_LENGTH     = 7.8;
BRICK_WIDTH      = 4;
BRICK_HEIGHT     = 5;

FOUNDATION_WIDTH  = 34.5;
FOUNDATION_DEPTH  = 18.5;
FOUNDATION_HEIGHT = 2.25;

DRIVER_STATION_OFFSET = 18;
DRIVER_STATION_WIDTH  = 42;
DRIVER_STATION_LENGTH = 120;

HUMAN_STATION_OFFSET = 12;
HUMAN_STATION_WIDTH  = 24;
HUMAN_STATION_LENGTH = 48;

SKYBRIDGE_NEUTRAL_TOP = 20;
SKYBRIDGE_TOP         = 14;
PIPE_DIAMETER         = 1;

FLOOR_PLATE_WIDTH     = 17.4;
FLOOR_PLATE_LENGTH    = 45;
FLOOR_PLATE_HEIGHT    = 1.5;
FLOOR_LEG_WIDTH       = 2;
FLOOR_LEG_HEIGHT      = 12;
FLOOR_BRIDGE_BOTTOM   = 10.5;

TAPE_WIDTH = 2;

module infield_tape() {

    DIAGONAL_LENGTH = sqrt( 2*pow(TILE_WIDTH,2));

    color("blue") {
        // building_sites
        translate([-3*TILE_WIDTH,-2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,-135]) cube([TAPE_WIDTH,DIAGONAL_LENGTH,TAPE_HEIGHT],center=false);
        
        // depots
        translate([2*TILE_WIDTH,2*TILE_WIDTH,TILE_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TILE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([2*TILE_WIDTH,2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,TILE_WIDTH,TAPE_HEIGHT],center=false);

        // skybridge
        color("blue")
            translate([-1,-3*TILE_WIDTH,1]) 
                scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,(FIELD_WIDTH-FLOOR_PLATE_LENGTH)/2+TAPE_WIDTH,TAPE_HEIGHT],center=false);
    }

    color("red") {
        // building_sites
        translate([-3*TILE_WIDTH,2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,0,45]) cube([DIAGONAL_LENGTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        // depots
        translate([2*TILE_WIDTH,-2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TILE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([2*TILE_WIDTH,-3*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,TILE_WIDTH,TAPE_HEIGHT],center=false);

        // skybridge
        translate([-1,FLOOR_PLATE_LENGTH/2-TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,(FIELD_WIDTH-FLOOR_PLATE_LENGTH)/2+TAPE_WIDTH,TAPE_HEIGHT],center=false);
    }
}

module outfield_tape() {

    color("blue") {
        // Add blue driver station box
        translate([-FIELD_WIDTH/2,-FIELD_WIDTH/2-DRIVER_STATION_OFFSET,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([DRIVER_STATION_LENGTH-TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2,-FIELD_WIDTH/2-DRIVER_STATION_OFFSET-DRIVER_STATION_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([DRIVER_STATION_LENGTH-TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2,-FIELD_WIDTH/2-DRIVER_STATION_OFFSET-DRIVER_STATION_WIDTH,0]) 
            cube([TAPE_WIDTH,DRIVER_STATION_WIDTH,TAPE_HEIGHT],center=false);

        translate([2*TILE_WIDTH-TAPE_WIDTH,-FIELD_WIDTH/2-DRIVER_STATION_OFFSET-DRIVER_STATION_WIDTH,0]) 
            cube([TAPE_WIDTH,DRIVER_STATION_WIDTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);

        // Add human player box
        translate([2*TILE_WIDTH,FIELD_WIDTH/2+HUMAN_STATION_OFFSET,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,HUMAN_STATION_LENGTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([2*TILE_WIDTH+HUMAN_STATION_WIDTH-2*TAPE_WIDTH,FIELD_WIDTH/2+HUMAN_STATION_OFFSET,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,HUMAN_STATION_LENGTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([2*TILE_WIDTH,FIELD_WIDTH/2+HUMAN_STATION_OFFSET,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([HUMAN_STATION_WIDTH-TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([2*TILE_WIDTH,FIELD_WIDTH/2+HUMAN_STATION_OFFSET+HUMAN_STATION_LENGTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([HUMAN_STATION_WIDTH-TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
    }

    color("red") {
        // Add red driver station box
        translate([-FIELD_WIDTH/2,FIELD_WIDTH/2+DRIVER_STATION_OFFSET,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([DRIVER_STATION_LENGTH-TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2,FIELD_WIDTH/2+DRIVER_STATION_OFFSET+DRIVER_STATION_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([DRIVER_STATION_LENGTH-TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2,FIELD_WIDTH/2+DRIVER_STATION_OFFSET,0]) 
            cube([TAPE_WIDTH,DRIVER_STATION_WIDTH,TAPE_HEIGHT],center=false);

        translate([2*TILE_WIDTH-TAPE_WIDTH,FIELD_WIDTH/2+DRIVER_STATION_OFFSET,0]) 
            cube([TAPE_WIDTH,DRIVER_STATION_WIDTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);

        // Add human player box
        translate([2*TILE_WIDTH,-FIELD_WIDTH/2-HUMAN_STATION_OFFSET-HUMAN_STATION_LENGTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,HUMAN_STATION_LENGTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([2*TILE_WIDTH+HUMAN_STATION_WIDTH-TAPE_WIDTH-TAPE_WIDTH,-FIELD_WIDTH/2-HUMAN_STATION_OFFSET-HUMAN_STATION_LENGTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,HUMAN_STATION_LENGTH+TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([2*TILE_WIDTH,-FIELD_WIDTH/2-HUMAN_STATION_OFFSET,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([HUMAN_STATION_WIDTH-TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([2*TILE_WIDTH,-FIELD_WIDTH/2-HUMAN_STATION_OFFSET-HUMAN_STATION_LENGTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([HUMAN_STATION_WIDTH-TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
    }
}

module foundation() {

    // Place foundations 1 BRICK width from wall and 1 BRICK width from field centerline
    // Note: Foundation is located based upon its centerpoint to make it easier to postion it in later iterations

    color("blue")
        translate([-FIELD_WIDTH/2+BRICK_WIDTH,-FOUNDATION_DEPTH-BRICK_WIDTH/2,TILE_HEIGHT]) 
            cube([FOUNDATION_WIDTH,FOUNDATION_DEPTH,FOUNDATION_HEIGHT],center=false);

    color("red") // foundation
        translate([-FIELD_WIDTH/2+BRICK_WIDTH,BRICK_WIDTH/2,TILE_HEIGHT]) 
            cube([FOUNDATION_WIDTH,FOUNDATION_DEPTH,FOUNDATION_HEIGHT],center=false);
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

module quarry() {
    for (i=[0:5]) {
        // Offset of brick is based upon the center of the brick. So, the offfset of each brick is,
        //             edge of field - wall thickness  - number of bricks - space between bricks (.5")
        brick_offset = 3*TILE_WIDTH - WALL_FRAME_WIDTH - (i+1)*BRICK_LENGTH - .5*i*.5;
        echo("off=",brick_offset,", i=",i);
        translate([brick_offset,-TILE_WIDTH,TILE_HEIGHT]) 
            cube([BRICK_LENGTH,BRICK_WIDTH,BRICK_HEIGHT],center=false);
    }
}

module skybridge() {

    // Add center plate
    color("black")
        translate([-FLOOR_PLATE_WIDTH/2,-FLOOR_PLATE_LENGTH/2,TILE_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([FLOOR_PLATE_WIDTH,FLOOR_PLATE_LENGTH,FLOOR_PLATE_HEIGHT],center=false);

    // Add angled legs
    skybridge_legs();

    translate( [0, FIELD_WIDTH/3-FLOOR_LEG_WIDTH, 0]) skybridge_legs();

    skybridge_supports();

    translate( [0, FIELD_WIDTH, 0]) skybridge_supports();

    // Add cross beams on top of neutral zone
    color("yellow") {
        translate([FLOOR_LEG_WIDTH/2,-TILE_WIDTH+FLOOR_LEG_WIDTH,SKYBRIDGE_NEUTRAL_TOP]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,90,0]) cube([PIPE_DIAMETER,2*TILE_WIDTH-FLOOR_LEG_WIDTH-PIPE_DIAMETER,PIPE_DIAMETER],center=false);
 
        translate([-FLOOR_LEG_WIDTH/2,-TILE_WIDTH+FLOOR_LEG_WIDTH,SKYBRIDGE_NEUTRAL_TOP]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,90,0]) cube([PIPE_DIAMETER,2*TILE_WIDTH-FLOOR_LEG_WIDTH-PIPE_DIAMETER,PIPE_DIAMETER],center=false);
    }

    color("blue") {
        // Add blue rods above blue skybridge
        translate([-FLOOR_LEG_WIDTH,-3*TILE_WIDTH,SKYBRIDGE_TOP+1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,90,0]) cube([PIPE_DIAMETER,2*TILE_WIDTH+PIPE_DIAMETER,PIPE_DIAMETER],center=false);

         translate([FLOOR_LEG_WIDTH/2,-3*TILE_WIDTH,SKYBRIDGE_TOP+1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,90,0]) cube([PIPE_DIAMETER,2*TILE_WIDTH+PIPE_DIAMETER,PIPE_DIAMETER],center=false);
    }

    color("red") {
        // Add red rods above blue skybridge
        translate([-FLOOR_LEG_WIDTH,TILE_WIDTH,SKYBRIDGE_TOP+1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,90,0]) cube([PIPE_DIAMETER,2*TILE_WIDTH,PIPE_DIAMETER],center=false);

        translate([FLOOR_LEG_WIDTH/2,TILE_WIDTH,SKYBRIDGE_TOP+1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,90,0]) cube([PIPE_DIAMETER,2*TILE_WIDTH,PIPE_DIAMETER],center=false);
    }
}

module skybridge_legs() {

    color("silver") {
        translate([-FLOOR_PLATE_WIDTH/2,-TILE_WIDTH,FLOOR_PLATE_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,30,0]) cube([FLOOR_LEG_WIDTH,FLOOR_LEG_WIDTH,FLOOR_PLATE_HEIGHT+FLOOR_LEG_HEIGHT],center=false);

        translate([FLOOR_PLATE_WIDTH/2-FLOOR_LEG_WIDTH,-TILE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,-30,0]) cube([FLOOR_LEG_WIDTH,FLOOR_LEG_WIDTH,FLOOR_PLATE_HEIGHT+FLOOR_LEG_HEIGHT],center=false);

        translate([-FLOOR_LEG_WIDTH,-TILE_WIDTH,FLOOR_BRIDGE_BOTTOM]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([2*FLOOR_LEG_WIDTH,FLOOR_LEG_WIDTH,SKYBRIDGE_NEUTRAL_TOP-FLOOR_BRIDGE_BOTTOM],center=false);
    }
}

module skybridge_supports() {

    color("silver")
        translate([-FLOOR_LEG_WIDTH,-3*TILE_WIDTH-FLOOR_LEG_WIDTH/2,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([2*FLOOR_LEG_WIDTH,FLOOR_LEG_WIDTH/2,SKYBRIDGE_TOP],center=false);
}

module DrawField() {

    BuildField();

    infield_tape();

    outfield_tape();

    quarry(); mirror([0,1,0]) quarry();

    foundation();

    perimeter();

    skybridge();
}

DrawField();
