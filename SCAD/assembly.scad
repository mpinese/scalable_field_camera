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
    color("red") translate([-152, 0, 100]) rotate([180, -90, 0]) body();
    color("green") translate([0, 0, 0]) rotate([0, 0, 0]) front_lid();
    color("blue") translate([-147, 0, 100]) rotate([0, 270, 0]) back_plate();
    color("grey") translate([64, -68, 10]) rotate([90, 0, 90]) focus_wheel();
    color("teal") translate([52.5, 0, 5]) rotate([0, 0, 0]) focusing_block();

    color("forestgreen") translate([-159, 0, 97]) rotate([0, 270, 0]) ground_glass_frame();
    color("grey") translate([-167, 0, 28]) rotate([0, 270, 0]) ground_glass_clamp();
    color("grey") translate([-167, 0, 165.5]) rotate([0, 90, 0]) ground_glass_clamp();

    color("yellow") translate([0, 0, 22]) rotate([0, 0, 0]) front_standard();
    color("lightgreen") translate([0, 0, 27]) rotate([0, 180, 180]) slider();
    color("pink") translate([-50, 0, 5]) rotate([0, 0, 0]) rails();
    color("lightblue") translate([0, -65, 65]) rotate([0, 270, 270]) front_standard_tilt_plate();
    color("lightblue") translate([0, 65, 65]) rotate([0, 270, 90]) front_standard_tilt_plate();

    color("brown") translate([-8, 0, 112]) rotate([0, 90, 0]) lensboard_carrier();
    color("orange") translate([11, 0, 173.5]) rotate([0, 90, 0]) lensboard_upper_clamp();
    color("salmon") translate([11, 0, 54.5]) rotate([0, 270, 0]) lensboard_lower_clamp();

    color("darkgrey") translate([-17, 0, -2]) rotate([0, 180, 0]) tripod_plate();

    color("lightgrey") translate([-133, 0, 100]) rotate([0, 270, 0]) bellows_back_frame();
    color("lightgrey") translate([-8, 0, 110]) rotate([0, 90, 0]) bellows_front_frame();

    translate([-25, 0, 0]) rotate([180, 0, 0]) front_lid_dovetail();

    color("silver") translate([-10, 0, 16]) rotate([0, 0, 0]) pulling_lever_plate();
    color("purple") translate([-10, -25, 18]) rotate([0, 0, 0]) pulling_lever();
    color("magenta") translate([-10, 25, 18]) rotate([0, 0, 0]) scale([1, -1, 1]) pulling_lever();

    color("black") translate([-156, -85, 190]) rotate([0, 90, 0]) locking_lever();
    color("black") translate([-152, 85, 190]) rotate([180, 90, 0]) locking_lever();
    color("white") translate([-152, 80, 10]) rotate([90, 0, 270]) locking_rail();
    color("lightyellow") translate([-152, -80, 10]) rotate([270, 0, 90]) scale([1, -1, 1]) locking_rail();
    
    /* Additional parts:
    
    Screw, M3, 10mm, countersunk: 6
    
    */
    //color("black") translate([-70, 30, -7]) screw(l=10);
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




