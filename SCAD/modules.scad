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
    cylinder(d1=vScrew_d*2, d2=0, h=vScrew_d);
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
    echo(Insert = d, od, l);
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
    echo(CountersunkScrew = d, l);
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

module screw_m2_cs(l) {
    color("silver") screw_cs(l, d=2, dk=3.8, s=1.5, t=0.75);
}
module screw_m5_cs(l) {
    color("silver") screw_cs(l, d=5, dk=9.5, s=3, t=1.6);
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
    echo(ButtonheadScrew = d, l);
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

module screw_m3_bh(l) {
    color("silver") screw_bh(l, d=3, dk=5.7, s=2, t=1);
}


module nut_m5() {
    echo(Nut = 5);
    difference() {
        rotate([0, 0, 30]) cylinder(h=3.9, d=8*2/sqrt(3), $fn=6);
        cylinder(h=5, d=5, $fn=15);
        }
    }
    
    
module thumbscrew(bolt_d, bolt_dk, screw_d, screw_h, n_knurls, knurl_d, knurl_f) {
    // bolt_d:  central bolt diameter
    // bolt_dk: bolt head max diameter
    // screw_d: thumbscrew outer diameter
    // screw_h: thumbscrew height
    // n_knurls: number of knurls
    
    min_knurl_offset = screw_d/2 - knurl_d;
    max_knurl_offset = screw_d/2 + knurl_d;
    knurl_offset = min_knurl_offset + knurl_f*(max_knurl_offset - min_knurl_offset);
    
    difference()
    {
        union()
        {
            translate([0, 0, 1]) cylinder(screw_h-2, d=screw_d);
            cylinder(1, d1=screw_d-1, d2=screw_d);
            translate([0, 0, screw_h-1]) cylinder(1, d1=screw_d, d2=screw_d-1);
        }
        cylinder(screw_h, d=bolt_d);
        cylinder(bolt_dk/2, d1=bolt_dk, d2=0);
        for (i = [1:n_knurls])
        {
            rotate([0, 0, i*360/(n_knurls)]) translate([knurl_offset, 0, 0]) cylinder(screw_h, d=knurl_d);
        }
    }
}

module thumbscrew_m5(screw_d, screw_h, n_knurls, knurl_d, knurl_f) {
    thumbscrew(5, 9.5, screw_d, screw_h, n_knurls, knurl_d, knurl_f);
}


module t6_flange_coupler() {
    // T6 flange coupler
    // Example: https://www.aliexpress.com/item/1005008049363389.html
    echo(FlangeCoupler = 6);
    difference() {
        union() {
            translate([0, 0, 2]) cylinder(h=10, d=10);
            cylinder(h=2, d=22);
        }
        cylinder(h=12, d=6);
        translate([0, 15, 7]) rotate([90, 0, 0]) cylinder(h=30, d=3);
        for (i = [0:3]) {
            rotate([0, 0, 45+90*i]) translate([-8, 0, 0]) cylinder(h=2, d=3);
        }
    }
}


module AXK0619_thrust_bearing() {
    echo(ThrustBearing = "AXK0619");
    difference() {
        cylinder(h=4, d=19);
        cylinder(h=4, d=6);
    }
}


module t6_lead_screw(l) {
    echo(LeadScrewT6 = l);
    color("silver") cylinder(h=l, d=6);
}

module t6_lead_screw_nut() {
    echo("LeadScrewT6Nut");
    intersection()
    {
        difference() {
            union() {
                cylinder(h=15, d=12);
                translate([0, 0, 1.5]) cylinder(h=3.5, d=24);
            }
            cylinder(h=15, d=6);
        }  
        translate([-50, -12.5/2, -50]) cube([100, 12.5, 100]);
    }
}

module m5_rod(l) {
    echo(ThreadedRodM5 = l);
    color("silver") cylinder(h=l, d=5);
}


module screw_m3_grub(l) {
    echo(GrubScrew = 3, l);
    cylinder(h=l, d=3, $fn=15);
}


module washer_m6() {
    // M6x12x0.8 washer
    echo(Washer = 6, 0.8);
    difference() {
        cylinder(h=0.8, d=12);
        cylinder(h=0.8, d=6.6);
    }
}


module springwasher_m6() {
    // M6x12x1.5 washer (compresses to 0.5)
    // Show as compressed (~0.5 mm height)
    echo(SpringWasher = 6);
    difference() {
        cylinder(h=0.5, d=12);
        cylinder(h=0.6, d=6);
    }
}