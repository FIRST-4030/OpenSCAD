// FTC 7462 Centerstage Drone Template
//  Template for Interlock paper airplane
// Render (F6) and then Export as .svg, then print full scale

PAPER_LENGTH = 182; // MM 
PAPER_WIDTH = 118;  // MM
TEXT_H = 12;

module drone2D(W=PAPER_WIDTH,L=PAPER_LENGTH) {
    // W and L = paper size for drone, in mm
    color("red") 
    //linear_extrude(1) {
    difference() {
        square([W,L]);
        polygon([[0,0],[W/2,0],[W/2,W/2]]);
        translate([W,0,0]) rotate([0,0,90]) polygon([[0,0],[W/2,0],[W/2,W/2]]);
        translate([0,W,0]) rotate([0,0,-90]) polygon([[0,0],[W/2,0],[W/2,W/2]]);
        translate([W,W,0]) rotate([0,0,180]) polygon([[0,0],[W/2,0],[W/2,W/2]]);
        
        translate([W*.44,W+TEXT_H,0]) rotate([0,0,90]) text("7462",size=TEXT_H);
        translate([W*.24,W+TEXT_H,0]) rotate([0,0,90]) text("7462",size=TEXT_H);
        translate([W*.59,W+4*TEXT_H,0]) rotate([0,0,-90]) text("7462",size=TEXT_H);
        translate([W*.77,W+4*TEXT_H,0]) rotate([0,0,-90]) text("7462",size=TEXT_H);
    }

}

// two drones per sheet
drone2D();
translate([PAPER_WIDTH+10,0,0]) drone2D();
