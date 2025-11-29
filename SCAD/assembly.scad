$fn=50;

use <back_plate.scad>;
use <bellows_back_frame.scad>;
use <bellows_front_frame.scad>;
use <body.scad>;
use <focus_wheel.scad>;
use <focusing_block.scad>;
use <front_lid.scad>;
use <front_lid_dovetail.scad>;
use <front_standard.scad>;
use <front_standard_tilt_plate.scad>;
use <ground_glass_clamp.scad>;
use <ground_glass_frame.scad>;
use <lensboard_carrier.scad>;
use <lensboard_lower_clamp.scad>;
use <lensboard_upper_clamp.scad>;
use <locking_lever.scad>;
use <locking_rail.scad>;
use <pulling_lever.scad>;
use <pulling_lever_plate.scad>;
use <rails.scad>;
use <slider.scad>;
use <tripod_plate.scad>;
use <modules.scad>;

mode = "display";
//mode = "print";

if (mode == "display")
{
    difference() {
    union() {
    *color("red") translate([-152.5, 0, 100]) rotate([180, -90, 0]) body();
    *color("green") translate([0, 0, 0]) rotate([0, 0, 0]) front_lid();
    *color("blue") translate([-147.5, 0, 100]) rotate([0, 270, 0]) back_plate();
    color("grey") translate([64, -68, 10]) rotate([90, 0, 90]) focus_wheel();
    color("teal") translate([52.5, 0, 5]) rotate([0, 0, 0]) focusing_block();

    *color("forestgreen") translate([-159.5, 0, 97]) rotate([0, 270, 0]) ground_glass_frame();
    *color("grey") translate([-167.5, 0, 28]) rotate([0, 270, 0]) ground_glass_clamp();
    *color("grey") translate([-167.5, 0, 165.5]) rotate([0, 90, 0]) ground_glass_clamp();

    color("yellow") translate([0, 0, 22]) rotate([0, 0, 0]) front_standard();
    color("lightgreen") translate([0, 0, 27]) rotate([0, 180, 180]) slider();
    color("pink") translate([-50, 0, 5]) rotate([0, 0, 0]) rails();
    color("lightblue") translate([0, -65, 65]) rotate([0, 270, 270]) front_standard_tilt_plate();
    color("lightblue") translate([0, 65, 65]) rotate([0, 270, 90]) front_standard_tilt_plate();

    color("brown") translate([-8.5, 0, 112]) rotate([0, 90, 0]) lensboard_carrier();
    color("orange") translate([7.5, 0, 173.5]) rotate([0, 90, 0]) lensboard_upper_clamp();
    color("salmon") translate([10.5, 0, 54.5]) rotate([0, 270, 0]) lensboard_lower_clamp();

    *color("darkgrey") translate([-17, 0, -2]) rotate([0, 180, 0]) tripod_plate();

    *color("lightgrey") translate([-133, 0, 100]) rotate([0, 270, 0]) bellows_back_frame();
    color("lightgrey") translate([-8, 0, 110]) rotate([0, 90, 0]) bellows_front_frame();

    *translate([-25, 0, 0]) rotate([180, 0, 0]) front_lid_dovetail();

    color("silver") translate([-10, 0, 16]) rotate([0, 0, 0]) pulling_lever_plate();
    color("purple") translate([-10, -25, 18]) rotate([0, 0, 0]) pulling_lever();
    color("magenta") translate([-10, 25, 18]) rotate([0, 0, 0]) scale([1, -1, 1]) pulling_lever();

    *color("black") translate([-156.5, -85, 190]) rotate([0, 90, 0]) locking_lever();
    *color("black") translate([-152.5, 85, 190]) rotate([180, 90, 0]) locking_lever();
    *color("white") translate([-152.5, 80, 10]) rotate([90, 0, 270]) locking_rail();
    *color("lightyellow") translate([-152.5, -80, 10]) rotate([270, 0, 90]) scale([1, -1, 1]) locking_rail();
    
    // TODO: Consider replacing all M2s with M3s, to simplify BOM
    
    /* Additional parts:
    Screw, M3, 10mm, countersunk: 8
    M3x4x5 insert: 28
    Screw, M3, ??mm, ball head: 16 (bellows front frame & back frame)
    Screw, M2, 10mm, countersunk: 6
    M2x3.5x4 insert: 14
    M5x7x5 insert: 2
    
- bellows, for 4x5" order the bellows from standardcameras, for 5x7 or 8x10 order from eBay
- T6 nut (brass) 
- M5x20 screw (1x)
- M5 knurled nuts (3x)
- M5x10 screws with knurled heads (2x)
- M5x12 screws with knurled heads (2x)
- M5 press-in nuts (4x)
- countersunk screws 3x12 (30x)
- countersunk screws 2x10 (6x)
- ground glass 127x101mm
- about 600mm of 1.25mm spring steel wire for the ground glass frame
- about 100mm of 0.75mm spring steel wire for the pulling lever mechanism    
    */
    
    // TODO: grub for the focus knob.
    // TODO: scale for bellows extension?
    // TODO: Handle
    // TODO: Fix the hinge screw sticking out
    // TODO: Constraint on the lead screw
    //      Collars + thrust bearings / thrust bearings on focusing block.
    // TODO: Why does the focus wheel have a larger cutout?
    
    // Leadscrew, (T6, 2 or 4mm lead, 150mm)
    color("gold") translate([-60, -68, 11]) rotate([90, 0, 90]) cylinder(h=150, d=6);
    // Leadscrew flange
    // Flange coupler 6mm
    // TODO
    
    // TODO: Fix Leadscrew nut
    translate([-39, -68, 11]) rotate([0, 90, 0]) difference() {
        union() {
            cylinder(h=15, d=10.2);
            translate([0, 0, 1.5]) cylinder(h=3.5, d=22);
        }
        cylinder(h=15, d=6);
    }
    
    // TODO: Consider moving to MGN7 instead of the dovetail
    // There is just enough room for the outer profile of 17w x 8h
    // (rail + bearing). Bearing length for MGN7C is 13.5 mm.
    // translate([50, -50, 5]) cube([50, 17, 8]);
    
    %translate([81.25, -65, 0]) rotate([0, 90, 0]) cylinder(1.25, d=20);
    %translate([62.5, -65, 0]) rotate([0, 90, 0]) cylinder(1.5, d=20);
    // Total space: 2.75 mm
    // Can shrink wheel if required.
    // Thrust bearings typically 4 mm each (needle), 4.5 mm (ball)
    
    
    // Hinge screw (M5 threaded rod, 180mm)
    color("silver") translate([-87.5, 90, 10]) rotate([90, 0, 0]) cylinder(h=180, d=5);
    
    // focusing_block inserts
    translate([87.5, -60, 5]) insert_m3();
    translate([57.5, -76, 5]) insert_m3();
    
    // focusing_block screws
    translate([87.5, -60, 0]) screw_m3_cs(10);
    translate([57.5, -76, 0]) screw_m3_cs(10);
    
    // front_lid_dovetail inserts
    translate([-70, -30, 0]) insert_m3();
    translate([-35, -30, 0]) insert_m3();
    translate([35, -30, 0]) insert_m3();
    translate([-70, 30, 0]) insert_m3();
    translate([-35, 30, 0]) insert_m3();
    translate([35, 30, 0]) insert_m3();

    // front_lid_dovetail screws
    translate([-70, -30, -7]) screw_m3_cs(10);
    translate([-35, -30, -7]) screw_m3_cs(10);
    translate([35, -30, -7]) screw_m3_cs(10);
    translate([-70, 30, -7]) screw_m3_cs(10);
    translate([-35, 30, -7]) screw_m3_cs(10);
    translate([35, 30, -7]) screw_m3_cs(10);
    
    // body inserts
    translate([-152.5, 75, 15]) rotate([0, 90, 0]) insert_m2();
    translate([-152.5, 65, 15]) rotate([0, 90, 0]) insert_m2();
    translate([-152.5, -75, 15]) rotate([0, 90, 0]) insert_m2();
    translate([-152.5, -65, 15]) rotate([0, 90, 0]) insert_m2();
    translate([-152.5, 80, 185]) rotate([0, 90, 0]) insert_m2();
    translate([-152.5, -80, 185]) rotate([0, 90, 0]) insert_m2();
    translate([-142.5, 0, -2]) insert_m5();
    
    // body screws
    translate([-158, 75, 15]) rotate([0, 90, 0]) screw_m2_bh(8);    // back
    translate([-158, 65, 15]) rotate([0, 90, 0]) screw_m2_bh(8);    // back
    translate([-158, -75, 15]) rotate([0, 90, 0]) screw_m2_bh(8);   // back
    translate([-158, -65, 15]) rotate([0, 90, 0]) screw_m2_bh(8);   // back
    translate([-158, 80, 185]) rotate([0, 90, 0]) screw_m2_bh(8);   // back
    translate([-158, -80, 185]) rotate([0, 90, 0]) screw_m2_bh(8);  // back
    translate([-142.5, 0, -13.5]) screw_m5_cs(16);                  // bottom into tripod_plate
    translate([-137, -85, 30]) rotate([-90, 0, 0]) screw_m3_cs(10); // side into bellows_back_frame
    translate([-137, 85, 30]) rotate([90, 0, 0]) screw_m3_cs(10);   // side into bellows_back_frame
    translate([-137, -85, 170]) rotate([-90, 0, 0]) screw_m3_cs(10);// side into bellows_back_frame
    translate([-137, 85, 170]) rotate([90, 0, 0]) screw_m3_cs(10);  // side into bellows_back_frame
    
    // bellows_back_frame inserts
    translate([-137, -75.5, 30]) rotate([90, 0, 0]) insert_m3();
    translate([-137, 75.5, 30]) rotate([-90, 0, 0]) insert_m3();
    translate([-137, -75.5, 170]) rotate([90, 0, 0]) insert_m3();
    translate([-137, 75.5, 170]) rotate([-90, 0, 0]) insert_m3();
    translate([-136.5, -70, 20.5]) insert_m3();
    translate([-136.5, 70, 20.5]) insert_m3();
    translate([-136.5, -70, 175.5]) insert_m3();
    translate([-136.5, 70, 175.5]) insert_m3();

    translate([-137, -39.5, 179.5-2]) rotate([180, 0, 0]) insert_m3();
    translate([-137, 39.5, 179.5-2]) rotate([180, 0, 0]) insert_m3();
    translate([-137, -39.5, 20.5+2]) insert_m3();
    translate([-137, 39.5, 20.5+2]) insert_m3();
    translate([-137, 79.5-2, 60.5]) rotate([90, 0, 0]) insert_m3();
    translate([-137, 79.5-2, 139.5]) rotate([90, 0, 0]) insert_m3();
    translate([-137, -79.5+2, 60.5]) rotate([-90, 0, 0]) insert_m3();
    translate([-137, -79.5+2, 139.5]) rotate([-90, 0, 0]) insert_m3();
    
    // bellows_back_frame screws
    translate([-137, -39.5, 179.5]) rotate([180, 0, 0]) screw_m3_cs(10);
    translate([-137, 39.5, 179.5]) rotate([180, 0, 0]) screw_m3_cs(10);
    translate([-137, -39.5, 20.5]) screw_m3_cs(10);
    translate([-137, 39.5, 20.5]) screw_m3_cs(10);
    translate([-137, 79.5, 60.5]) rotate([90, 0, 0]) screw_m3_cs(10);
    translate([-137, 79.5, 139.5]) rotate([90, 0, 0]) screw_m3_cs(10);
    translate([-137, -79.5, 60.5]) rotate([-90, 0, 0]) screw_m3_cs(10);
    translate([-137, -79.5, 139.5]) rotate([-90, 0, 0]) screw_m3_cs(10);
    
    // ground_glass_frame inserts
    translate([-171, -60.5, 97]) rotate([-90, 0, 0]) insert_m2();
    translate([-171, 60.5, 97]) rotate([90, 0, 0]) insert_m2();
    translate([-167.5, -15, 28.5]) rotate([0, 90, 0]) insert_m2();
    translate([-167.5, 15, 28.5]) rotate([0, 90, 0]) insert_m2();
    translate([-167.5, -15, 165.5]) rotate([0, 90, 0]) insert_m2();
    translate([-167.5, 15, 165.5]) rotate([0, 90, 0]) insert_m2();
    
    // ground_glass_frame screws
    translate([-171, -65, 97]) rotate([-90, 0, 0]) screw_m2_bh(8);
    translate([-171, 65, 97]) rotate([90, 0, 0]) screw_m2_bh(8);

    // ground_glass_clamp screws
    translate([-172.5, -15, 28.5]) rotate([0, 90, 0]) screw_m2_bh(8);
    translate([-172.5, 15, 28.5]) rotate([0, 90, 0]) screw_m2_bh(8);
    translate([-172.5, -15, 165.5]) rotate([0, 90, 0]) screw_m2_bh(8);
    translate([-172.5, 15, 165.5]) rotate([0, 90, 0]) screw_m2_bh(8);
    }
    // Vertical section
    *translate([-137, -5000, -5000]) cube([1000, 10000, 10000]);
    // Horizontal section
    *translate([-5000, -5000, 165.5]) cube([10000, 10000, 10000]);
    }
}
else if (mode == "print")
{
    color("red") translate([0, 0, 0]) body();
    
    color("green") translate([200, 0, 0]) front_lid();
    color("blue") translate([400, 0, 0]) back_plate();
    color("grey") translate([500, 0, 0]) focus_wheel();
    color("teal") translate([500, 0, 0]) focusing_block();

    color("forestgreen") translate([700, 0, 0]) ground_glass_frame();
    color("grey") translate([800, 0, 0]) ground_glass_clamp();
    color("grey") translate([850, 0, 0]) ground_glass_clamp();

    color("yellow") translate([0, 200, 0]) front_standard();
    color("lightgreen") translate([100, 200, 0]) slider();
    color("pink") translate([200, 200, 0]) rails();
    color("lightblue") translate([400, 200, 0]) front_standard_tilt_plate();
    color("lightblue") translate([400, 250, 0]) front_standard_tilt_plate();

    color("brown") translate([600, 200, 0]) lensboard_carrier();
    color("orange") translate([700, 200, 0]) lensboard_upper_clamp();
    color("salmon") translate([800, 200, 0]) lensboard_lower_clamp();

    color("darkgrey") translate([0, 400, 0]) tripod_plate();

    color("lightgrey") translate([300, 400, 0]) bellows_back_frame();
    color("lightgrey") translate([500, 400, 0]) bellows_front_frame();

    translate([700, 400, 0]) front_lid_dovetail();

    color("silver") translate([0, 600, 0]) pulling_lever_plate();
    color("purple") translate([100, 600, 0]) pulling_lever();
    color("magenta") translate([100, 650, 0]) scale([1, -1, 1]) pulling_lever();

    color("black") translate([200, 600, 0]) locking_lever();
    color("black") translate([200, 650, 0]) locking_lever();
    color("white") translate([300, 600, 0]) rotate([0, 180, 0]) locking_rail();
    color("lightyellow") translate([300, 650, 0]) rotate([0, 180, 0]) scale([1, -1, 1]) locking_rail();
}




