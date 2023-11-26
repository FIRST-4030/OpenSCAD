// FTC 7462 Centerstage Drone Template
// Render (F6) and then Export as .svg, then print

module drone2D(W=115,L=177) {
    // W and L = paper size for drone, in mm
    difference() {
        square([W,L]);
        polygon([[0,0],[W/2,0],[W/2,W/2]]);
        translate([W,0,0]) rotate([0,0,90]) polygon([[0,0],[W/2,0],[W/2,W/2]]);
        translate([0,W,0]) rotate([0,0,-90]) polygon([[0,0],[W/2,0],[W/2,W/2]]);
        translate([W,W,0]) rotate([0,0,180]) polygon([[0,0],[W/2,0],[W/2,W/2]]);
        translate([W*.44,W,0]) rotate([0,0,90]) text("7462",size=15);
        translate([W*.58,W*1.4,0]) rotate([0,0,-90]) text("7462",size=15);
    }
}

drone2D();
