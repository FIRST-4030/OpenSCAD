include <Parameters.scad>

// Render an empty field

module tile() {
    color("grey") cube([TILE_WIDTH,TILE_WIDTH,TILE_HEIGHT],center=false);
}

module field_tiles() {
    for (i=[-3:1:2]) {
        for (j=[-3:1:2]) {
            translate([i*TILE_WIDTH,j*TILE_WIDTH,0])
                scale([FIELD_SCALE,FIELD_SCALE,1]) tile();
        }
    }
}

module field_wall() {

    WALL_COLOR = "black";

    color(WALL_COLOR)
        translate([-FIELD_WIDTH/2+WALL_FRAME_WIDTH,-FIELD_WIDTH/2,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([FIELD_WIDTH,WALL_FRAME_WIDTH,WALL_FRAME_WIDTH],center=false);

    color(WALL_COLOR)
        translate([-FIELD_WIDTH/2+WALL_FRAME_WIDTH,-FIELD_WIDTH/2,WALL_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([FIELD_WIDTH,WALL_FRAME_WIDTH,WALL_FRAME_WIDTH],center=false);

    color(WALL_COLOR)
        translate([-FIELD_WIDTH/2,-FIELD_WIDTH/2,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([WALL_FRAME_WIDTH,WALL_FRAME_WIDTH,WALL_HEIGHT],center=false);

    color(WALL_COLOR)
        translate([-FIELD_WIDTH/6,-FIELD_WIDTH/2,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([WALL_FRAME_WIDTH,WALL_FRAME_WIDTH,WALL_HEIGHT],center=false);

    color(WALL_COLOR)
        translate([FIELD_WIDTH/6,-FIELD_WIDTH/2,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([WALL_FRAME_WIDTH,WALL_FRAME_WIDTH,WALL_HEIGHT],center=false);

    color(WALL_COLOR)
        translate([FIELD_WIDTH/2-2*WALL_FRAME_WIDTH,-FIELD_WIDTH/2,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([WALL_FRAME_WIDTH,WALL_FRAME_WIDTH,WALL_HEIGHT],center=false);
}

module BuildField() {

    field_tiles();

    field_wall();

    translate( [0, FIELD_WIDTH-2*WALL_FRAME_WIDTH, 0]) field_wall();

    translate( [0, 0, 0])  rotate([0, 0, 90]) field_wall();

    translate( [-FIELD_WIDTH+WALL_FRAME_WIDTH, 0, 0])  rotate([0, 0, 90]) field_wall();
}
