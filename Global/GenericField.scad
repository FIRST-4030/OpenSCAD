include<Parameters.scad>

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

    color(WALL_COLOR) {
        translate([-FIELD_WIDTH/2,-FIELD_WIDTH/2-1,0]) 
            cube([FIELD_WIDTH,WALL_FRAME_WIDTH,WALL_FRAME_WIDTH],center=false);

        translate([-FIELD_WIDTH/2,-FIELD_WIDTH/2-1,WALL_HEIGHT]) 
            cube([FIELD_WIDTH,WALL_FRAME_WIDTH,WALL_FRAME_WIDTH],center=false);

        translate([-FIELD_WIDTH/2,-FIELD_WIDTH/2-1,0]) 
            cube([WALL_FRAME_WIDTH,WALL_FRAME_WIDTH,WALL_HEIGHT],center=false);

        translate([-FIELD_WIDTH/6,-FIELD_WIDTH/2-1,0]) 
            cube([WALL_FRAME_WIDTH,WALL_FRAME_WIDTH,WALL_HEIGHT],center=false);

        translate([FIELD_WIDTH/6,-FIELD_WIDTH/2-1,0]) 
            cube([WALL_FRAME_WIDTH,WALL_FRAME_WIDTH,WALL_HEIGHT],center=false);

        translate([FIELD_WIDTH/2-WALL_FRAME_WIDTH,-FIELD_WIDTH/2-1,0]) 
            cube([WALL_FRAME_WIDTH,WALL_FRAME_WIDTH,WALL_HEIGHT],center=false);
        }
}

module labelWalls() {
    fontSize = 2;
    baseLevel = 5;
    
    color("green") {
        translate([FIELD_WIDTH/2,0,baseLevel]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([90,0,90]) text("X+", size=fontSize);
        translate([-FIELD_WIDTH/2,0,baseLevel]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([90,0,90]) text("X-", size=fontSize);
        translate([0,FIELD_WIDTH/2,baseLevel]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([90,0,0]) text("+Y", size=fontSize);
        translate([0,-FIELD_WIDTH/2,baseLevel]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([90,0,0]) text("Y-", size=fontSize);
    }
}

module BuildField() {

    field_tiles();

    field_wall();

    translate( [0, FIELD_WIDTH+WALL_FRAME_WIDTH, 0]) field_wall();

    translate( [0, 0, 0])  rotate([0, 0, 90]) field_wall();
    
    translate( [0, 0, 0])  rotate([0, 0, -90]) field_wall();

    labelWalls();
}

BuildField();
translate([70.5,70.5,0]) circle(r=2,$fn=20);  // size check
translate([-70.5,-70.5,0]) circle(r=2,$fn=20);  // size check
