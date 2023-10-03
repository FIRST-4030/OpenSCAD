include <./CenterStageField.scad>

ROBOT_LENGTH = 17.5;
ROBOT_WIDTH = 17.5;
ROBOT_HEIGHT = 4;

drawField();

module robot() {
    color("silver") // Chassis
        difference() {
            translate([0,0,2]) cube([ROBOT_LENGTH,ROBOT_WIDTH,ROBOT_HEIGHT],center=true);
            translate([-6,0,3]) cube([8,8,6],center=true);
        }

    color("green") { // Intakes
        translate([-7.5,4,ROBOT_HEIGHT])  cylinder(h=8,d=3,center=true,$fn=32);
        translate([-7.5,-4,ROBOT_HEIGHT]) cylinder(h=8,d=3,center=true,$fn=32);
    }
}

// The following lines draw the objects

loc = [
[-36,-70,0,0,0,0],
[-60,-36,0,0,0,0],
[-60,-12,0,0,0,0],
[36,-12,0,0,0,0],
[50,-36,0,0,0,0]
];

function xyz(t,i) = 
    lookup(t, [
        [0/len(loc),loc[0][i]],
        [1/len(loc),loc[1][i]],
        [2/len(loc),loc[2][i]],
        [3/len(loc),loc[3][i]],
        [4/len(loc),loc[4][i]]
    ]
);

module run_simulation(x,y,z,alpha,beta,phi) {
    translate([x,y,z]) rotate([alpha,beta,phi])  robot();
}

run_simulation(xyz($t,0),xyz($t,1),xyz($t,2),xyz($t,3),xyz($t,4),xyz($t,5));
