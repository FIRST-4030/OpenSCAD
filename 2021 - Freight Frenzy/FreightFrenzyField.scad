include <../Global/Parameters.scad>
include <../Global/GenericField.scad>

TAPE_WIDTH = 2;

OUTFIELD_OFFSET = 18;
OUTFIELD_WIDTH  = 42;
OUTFIELD_LENGTH = 120;

BAR_DIAMETER    = 1;

WAREHOUSE_LENGTH = 43.5;

module barriers() {
    BARRIER_GAP    = 13.7;
    HORIZONTAL_BAR = 28;
    BAR_SEPARATION = 3;
    BAR_HEIGHT     = 1;
    VERTICAL_BAR   = 2*TILE_WIDTH-BARRIER_GAP-BAR_SEPARATION/2;

    color("black") {
        // vertical bars
        translate([-TILE_WIDTH-BAR_SEPARATION/2,TILE_WIDTH+BAR_SEPARATION/2,TILE_HEIGHT+BAR_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([-90,0,0]) cylinder( h=VERTICAL_BAR, r=BAR_DIAMETER/2,center=false);
        translate([-TILE_WIDTH+BAR_SEPARATION/2,TILE_WIDTH+BAR_SEPARATION/2,TILE_HEIGHT+BAR_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([-90,0,0]) cylinder( h=VERTICAL_BAR, r=BAR_DIAMETER/2,center=false);

        translate([TILE_WIDTH-BAR_SEPARATION/2,TILE_WIDTH+BAR_SEPARATION/2,TILE_HEIGHT+BAR_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([-90,0,0]) cylinder( h=VERTICAL_BAR, r=BAR_DIAMETER/2,center=false);
        translate([TILE_WIDTH+BAR_SEPARATION/2,TILE_WIDTH+BAR_SEPARATION/2,TILE_HEIGHT+BAR_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([-90,0,0]) cylinder( h=VERTICAL_BAR, r=BAR_DIAMETER/2,center=false);

        // horizontal bars
        translate([-3*TILE_WIDTH+BARRIER_GAP,TILE_WIDTH+BAR_SEPARATION/2,TILE_HEIGHT+BAR_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,90,0]) cylinder( h=4*HORIZONTAL_BAR, r=BAR_DIAMETER/2,center=false);
        translate([-3*TILE_WIDTH+BARRIER_GAP,TILE_WIDTH-BAR_SEPARATION/2,TILE_HEIGHT+BAR_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) rotate([0,90,0]) cylinder( h=4*HORIZONTAL_BAR, r=BAR_DIAMETER/2,center=false);

        // bar stands
        for (i=[0:4]) {
            translate([-3*TILE_WIDTH+BARRIER_GAP+i*(HORIZONTAL_BAR-.75),TILE_WIDTH-BAR_SEPARATION/2-BAR_DIAMETER/2,TILE_HEIGHT]) 
                scale([FIELD_SCALE,FIELD_SCALE,1]) cube( [.5,BAR_SEPARATION+BAR_DIAMETER,TILE_HEIGHT],center=false);
        }
        translate([-TILE_WIDTH-BAR_SEPARATION/2,TILE_WIDTH+BAR_SEPARATION/2,TILE_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube( [BAR_SEPARATION+BAR_DIAMETER,.5,TILE_HEIGHT],center=false);
        translate([TILE_WIDTH-BAR_SEPARATION/2,TILE_WIDTH+BAR_SEPARATION/2,TILE_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube( [BAR_SEPARATION+BAR_DIAMETER,.5,TILE_HEIGHT],center=false);

        translate([-TILE_WIDTH-BAR_SEPARATION/2,3*TILE_WIDTH-BARRIER_GAP-BAR_DIAMETER,TILE_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube( [BAR_SEPARATION+BAR_DIAMETER/2,.5,TILE_HEIGHT],center=false);
        translate([TILE_WIDTH-BAR_SEPARATION/2,3*TILE_WIDTH-BARRIER_GAP-BAR_DIAMETER,TILE_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube( [BAR_SEPARATION+BAR_DIAMETER/2,.5,TILE_HEIGHT],center=false);
    }
}

module carousels() {
    
    CAROUSEL_DIAMETER = 15;
    CAROUSEL_HEIGHT   = 1;
    CAROUSEL_OFFSET   = 2;
    CAROUSEL_BASE   = WALL_HEIGHT + 1;
    color("grey") {
        translate([-3*TILE_WIDTH+CAROUSEL_OFFSET,-3*TILE_WIDTH+CAROUSEL_OFFSET,TILE_HEIGHT+CAROUSEL_BASE]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=CAROUSEL_HEIGHT, r=CAROUSEL_DIAMETER/2,center=false);
        translate([3*TILE_WIDTH-CAROUSEL_OFFSET,-3*TILE_WIDTH+CAROUSEL_OFFSET,TILE_HEIGHT+CAROUSEL_BASE]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=CAROUSEL_HEIGHT, r=CAROUSEL_DIAMETER/2,center=false);
    }

    color("blue") {
        translate([-3*TILE_WIDTH+CAROUSEL_OFFSET,-3*TILE_WIDTH+CAROUSEL_OFFSET,TILE_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=CAROUSEL_BASE, r=BAR_DIAMETER/2,center=false);
    }

    color("red") {
        translate([3*TILE_WIDTH-CAROUSEL_OFFSET,-3*TILE_WIDTH+CAROUSEL_OFFSET,TILE_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=CAROUSEL_BASE, r=BAR_DIAMETER/2,center=false);
    }
}
    
module hubs() {

    BASE_DIAMETER   = 8;
    LOWER_DIAMETER  = 18;
    MIDDLE_DIAMETER = 15;
    UPPER_DIAMETER  = 12;
    HUB_HEIGHT      = 2;
    HUB_SPACING     = 4;

    color("black") {
        translate([-TILE_WIDTH,-.5*TILE_WIDTH,TILE_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=HUB_HEIGHT, r=BASE_DIAMETER/2,center=false);
        translate([-TILE_WIDTH,-.5*TILE_WIDTH,TILE_HEIGHT+HUB_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=HUB_HEIGHT, r=LOWER_DIAMETER/2,center=false);
        translate([TILE_WIDTH,-.5*TILE_WIDTH,TILE_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=HUB_HEIGHT, r=BASE_DIAMETER/2,center=false);
        translate([TILE_WIDTH,-.5*TILE_WIDTH,TILE_HEIGHT+HUB_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=HUB_HEIGHT, r=LOWER_DIAMETER/2,center=false);
    }

    color("blue") {
        translate([-TILE_WIDTH,-.5*TILE_WIDTH,TILE_HEIGHT+HUB_HEIGHT+HUB_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=HUB_SPACING, r=BAR_DIAMETER/2,center=false);
        translate([-TILE_WIDTH,-.5*TILE_WIDTH,TILE_HEIGHT+HUB_HEIGHT+HUB_HEIGHT+HUB_SPACING]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=HUB_HEIGHT, r=MIDDLE_DIAMETER/2,center=false);
        translate([-TILE_WIDTH,-.5*TILE_WIDTH,TILE_HEIGHT+HUB_HEIGHT+HUB_HEIGHT+HUB_SPACING+HUB_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=HUB_SPACING, r=BAR_DIAMETER/2,center=false);
        translate([-TILE_WIDTH,-.5*TILE_WIDTH,TILE_HEIGHT+HUB_HEIGHT+HUB_HEIGHT+HUB_SPACING+HUB_HEIGHT+HUB_SPACING]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=HUB_HEIGHT, r=UPPER_DIAMETER/2,center=false);
        translate([-TILE_WIDTH,-.5*TILE_WIDTH,TILE_HEIGHT+HUB_HEIGHT+HUB_HEIGHT+HUB_SPACING+HUB_HEIGHT+HUB_SPACING+HUB_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=HUB_SPACING, r=BAR_DIAMETER/2,center=false);
    }

    color("red") {
        translate([TILE_WIDTH,-.5*TILE_WIDTH,TILE_HEIGHT+HUB_HEIGHT+HUB_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=HUB_SPACING, r=BAR_DIAMETER/2,center=false);
        translate([TILE_WIDTH,-.5*TILE_WIDTH,TILE_HEIGHT+HUB_HEIGHT+HUB_HEIGHT+HUB_SPACING]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=HUB_HEIGHT, r=MIDDLE_DIAMETER/2,center=false);
        translate([TILE_WIDTH,-.5*TILE_WIDTH,TILE_HEIGHT+HUB_HEIGHT+HUB_HEIGHT+HUB_SPACING+HUB_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=HUB_SPACING, r=BAR_DIAMETER/2,center=false);
        translate([TILE_WIDTH,-.5*TILE_WIDTH,TILE_HEIGHT+HUB_HEIGHT+HUB_HEIGHT+HUB_SPACING+HUB_HEIGHT+HUB_SPACING]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=HUB_HEIGHT, r=UPPER_DIAMETER/2,center=false);
        translate([TILE_WIDTH,-.5*TILE_WIDTH,TILE_HEIGHT+HUB_HEIGHT+HUB_HEIGHT+HUB_SPACING+HUB_HEIGHT+HUB_SPACING+HUB_HEIGHT]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cylinder( h=HUB_SPACING, r=BAR_DIAMETER/2,center=false);
    }
}

module infield_tape() {

    // Warehouses
    color("white") {

        translate([-TILE_WIDTH-TAPE_WIDTH,TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,2*TILE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-3*TILE_WIDTH,TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([2*TILE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-3*TILE_WIDTH,2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TILE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-2*TILE_WIDTH-TAPE_WIDTH,2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,TILE_WIDTH,TAPE_HEIGHT],center=false);

        translate([TILE_WIDTH,TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,2*TILE_WIDTH,TAPE_HEIGHT],center=false);

        translate([TILE_WIDTH,TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([2*TILE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([2*TILE_WIDTH,2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TILE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([2*TILE_WIDTH,2*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,TILE_WIDTH,TAPE_HEIGHT],center=false);
    }

    // Storage Units

    color("blue") {

        translate([-2*TILE_WIDTH,-3*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,TILE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-TILE_WIDTH-TAPE_WIDTH,-3*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,TILE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-2*TILE_WIDTH,-2*TILE_WIDTH-TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TILE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
    }

    color("red") {

        translate([2*TILE_WIDTH-TAPE_WIDTH,-3*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,TILE_WIDTH,TAPE_HEIGHT],center=false);

        translate([TILE_WIDTH,-3*TILE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,TILE_WIDTH,TAPE_HEIGHT],center=false);

        translate([TILE_WIDTH,-2*TILE_WIDTH-TAPE_WIDTH,1]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TILE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
    }

    // Barcodes
    BARCODE_DELTA = 8.4;
    BARCODE_START1 = 25.75;
    BARCODE_START2 = BARCODE_START1+2*BARCODE_DELTA+30.5;

    color("blue") {

        for (i=[0:2]) {
            translate([-1.5*TILE_WIDTH,-3*TILE_WIDTH+BARCODE_START1+i*BARCODE_DELTA,1]) 
                scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

            translate([-1.5*TILE_WIDTH,-3*TILE_WIDTH+BARCODE_START2+i*BARCODE_DELTA,1]) 
                scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        }
    }

    color("red") {

        for (i=[0:2]) {
            translate([1.5*TILE_WIDTH,-3*TILE_WIDTH+BARCODE_START1+i*BARCODE_DELTA,1]) 
                scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

            translate([1.5*TILE_WIDTH,-3*TILE_WIDTH+BARCODE_START2+i*BARCODE_DELTA,1]) 
                scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
        }
    }
}

module outfield_tape() {

    color("blue") {
        translate([-FIELD_WIDTH/2-OUTFIELD_OFFSET,-FIELD_WIDTH/2+TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,FIELD_WIDTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2-OUTFIELD_OFFSET-OUTFIELD_WIDTH,-FIELD_WIDTH/2+TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([OUTFIELD_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2-OUTFIELD_OFFSET-OUTFIELD_WIDTH,-FIELD_WIDTH/2+TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,FIELD_WIDTH,TAPE_HEIGHT],center=false);

        translate([-FIELD_WIDTH/2-OUTFIELD_OFFSET-OUTFIELD_WIDTH,FIELD_WIDTH/2-TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([OUTFIELD_WIDTH+TAPE_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);
    }

    color("red") {
        translate([FIELD_WIDTH/2+OUTFIELD_OFFSET,-FIELD_WIDTH/2+TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,FIELD_WIDTH,TAPE_HEIGHT],center=false);

        translate([FIELD_WIDTH/2+OUTFIELD_OFFSET,-FIELD_WIDTH/2+TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([OUTFIELD_WIDTH,TAPE_WIDTH,TAPE_HEIGHT],center=false);

        translate([FIELD_WIDTH/2+OUTFIELD_OFFSET+OUTFIELD_WIDTH,-FIELD_WIDTH/2+TAPE_WIDTH,0]) 
            scale([FIELD_SCALE,FIELD_SCALE,1]) cube([TAPE_WIDTH,FIELD_WIDTH,TAPE_HEIGHT],center=false);

        translate([FIELD_WIDTH/2+OUTFIELD_OFFSET,FIELD_WIDTH/2-TAPE_WIDTH,0]) 
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

    barriers();

    carousels();

    hubs();

    perimeter();
}

drawField();
