/*
This is a collection of the modules which are used heavily within the whole project.
Almost all parts rely on the modules to remain "as is", especially regarding their current orientation.
So please act very carefully here, otherwise you may screw up the complete design!

*/
include <baseconfig.scad>;


// roof module - this is heavily used for dovetail cutouts
// please keep as is
module roof(l, w, h){
    polyhedron(
        points=[
            [0,0,0],
            [l,0,0],
            [l,w,0],
            [0,w,0],
            [0,w/2,h],
            [l,w/2,h]
            ],
        faces=[
            [0,1,2,3],
            [0,4,1],
            [1,4,5,2],
            [2,5,3],
            [3,5,4,0]
            ]
            );
    };

// a wedge module - this is heavily used for cutting edges
// please keep as is    
module wedge(l, w, h) {
    polyhedron(
            points=[
                [0,0,0],
                [l,0,0],
                [l,w,0],
                [0,w,0],
                [0,0,h],
                [l,0,h]
            ],
            faces=[
                [0,3,2,1],
                [0,1,5,4],
                [1,2,5],
                [2,3,4,5],
                [3,0,4]
            ]
    );
   };

// simple tube module.   
module tube(d1, d2, h) {
    difference() {
        cylinder(d=d1, h=h);
        cylinder(d=d2, h=h);
        };
    };

// mainly used for making holes for countersunk screws
// please keep as is    
module countersunk_screw(vScrew_d, vScrew_l){
    union(){
    cylinder(d=vScrew_d, h=vScrew_l);
    cylinder(d1=vScrew_d*2, h=vScrew_d);
    };
};

// module for making hexagons, e.g. hex nuts. kw is the key width
// please keep as is
module hex(kw, h) {
	render()
        translate([0, 0, h/2])
            intersection_for(a = [0, 120, 240]) {
                rotate([0, 0, a])
                    cube([kw, 3 * kw, h], true);
                }
}


// Heatset insert
// d: Thread diameter
// od: Outer diameter
// l: Total length
module insert(d, od, l)
{
    difference() {
        cylinder(l, d=od, $fn=15);
        translate([0, 0, -0.5]) cylinder(l+1, d=d, $fn=15);
        };
}

module insert_m2()
{
    color("gold") insert(2, vInsertM2Size_d, vInsertM2Depth_h);
}

module insert_m3()
{
    color("gold") insert(3, vInsertM3Size_d, vInsertM3Depth_h);
}

module insert_m5()
{
    color("gold") insert(5, vInsertM5Size_d, vInsertM5Depth_h);
}

// Countersunk screw, metric, for display
// Example: https://www.aliexpress.com/item/1005007838338973.html
module screw_cs(l, d=3, dk=6, s=2, t=1) {
    // l: total length (including head) in mm
    // d: thread diameter (eg 3 for M3)
    // dk: max head diameter
    // s: hex socket flat-to-flat size
    // t: hex socket depth
    difference() {
        union() {
            cylinder(h=l, r=d/2, $fn=15);
            cylinder(h=(dk-d)/2, r1=dk/2, r2=d/2, $fn=15);
            }
        cylinder(h=t, r=s/2*2/sqrt(3), $fn=6);
    }
}

module screw_m3_cs(l) {
    color("silver") screw_cs(l, d=3, dk=6, s=2, t=1);
}

// Button head screw, metric, for display
// Example: https://www.aliexpress.com/item/32967225441.html
module screw_bh(l, d=3, k=1.5, dk=5.5, s=2, t=1) {
    // l: shaft length (NOT including head) in mm
    // d: thread diameter (eg 3 for M3)
    // k: head depth
    // dk: head max diameter
    // s: hex socket flat-to-flat size
    // t: hex socket depth
    difference() {
        union() {
            translate([0, 0, k]) cylinder(h=l, r=d/2, $fn=15);
            difference() {
                translate([0, 0, k]) intersection() {
                    sphere(d=dk, $fn=15);
                    translate([-dk/2, -dk/2, -dk]) cube(dk);
                }
                translate([-dk/2, -dk/2, -dk]) cube(dk);
            }
        }
        cylinder(h=t, r=s/2*2/sqrt(3), $fn=6);
    }
}

module screw_m2_bh(l) {
    color("silver") screw_bh(l, d=2, dk=3.4, s=1.175, t=0.6);
}
