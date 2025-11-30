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


/* TODO list    

 * Handle
 
//t6_lead_screw_nut();
// TODO: fix this

 * Fix the hinge screw sticking out

 * Grub for the focus knob.
 * Constraint on the lead screw
 * Fix the lead screw nut -- doesn't fit atm
 * Lead screw backlash? ABNs only common for T8.
 * Upgrade lead screw to T8?? Or T4??
 
 * Consider replacing all M2s with M3s, to simplify BOM
 * Scale for bellows extension?
 * Consider moving to MGN7 instead of the dovetail
 
*/

/* Additional parts for BOM:
- bellows, for 4x5" order the bellows from standardcameras, for 5x7 or 8x10 order from eBay
- ground glass 127x101mm
- about 600mm of 1.25mm spring steel wire for the ground glass frame
- about 100mm of 0.75mm spring steel wire for the pulling lever mechanism    
*/


mode = "display";
//mode = "print";

if (mode == "display")
{
    difference() {
    union() {
    color("red") translate([-152.5, 0, 100]) rotate([180, -90, 0]) body();
    color("green") translate([0, 0, 0]) rotate([0, 0, 0]) front_lid();
    color("blue") translate([-147.5, 0, 100]) rotate([0, 270, 0]) back_plate();
    color("grey") translate([65, -68, 10]) rotate([90, 0, 90]) focus_wheel();
    color("teal") translate([52.5, 0, 5]) rotate([0, 0, 0]) focusing_block();     
    
    //translate([62.5, -68, 10]) rotate([0, 90, 0]) AXK0619_thrust_bearing();
    //translate([62.5, -68, 10]) rotate([0, 90, 0]) t6_flange_coupler();
    
    color("forestgreen") translate([-159.5, 0, 97]) rotate([0, 270, 0]) ground_glass_frame();
    color("grey") translate([-167.5, 0, 28]) rotate([0, 270, 0]) ground_glass_clamp();
    color("grey") translate([-167.5, 0, 165.5]) rotate([0, 90, 0]) ground_glass_clamp();

    color("yellow") translate([0, 0, 22]) rotate([0, 0, 0]) front_standard();
    color("lightgreen") translate([0, 0, 27]) rotate([0, 180, 180]) slider();
    color("pink") translate([-50, 0, 5]) rotate([0, 0, 0]) rails();
    color("lightblue") translate([0, -65, 62]) rotate([0, 270, 270]) front_standard_tilt_plate();
    color("lightblue") translate([0, 65, 62]) rotate([0, 270, 90]) front_standard_tilt_plate();

    color("brown") translate([-8.5, 0, 112]) rotate([0, 90, 0]) lensboard_carrier();
    color("orange") translate([7.5, 0, 173.5]) rotate([0, 90, 0]) lensboard_upper_clamp();
    color("salmon") translate([10.5, 0, 54.5]) rotate([0, 270, 0]) lensboard_lower_clamp();

    color("darkgrey") translate([-17, 0, -2]) rotate([0, 180, 0]) tripod_plate();

    color("lightgrey") translate([-133, 0, 100]) rotate([0, 270, 0]) bellows_back_frame();
    color("lightgrey") translate([-8, 0, 112]) rotate([0, 90, 0]) bellows_front_frame();

    translate([-25, 0, 0]) rotate([180, 0, 0]) front_lid_dovetail();

    color("silver") translate([-10, 0, 16]) rotate([0, 0, 0]) pulling_lever_plate();
    color("purple") translate([-10, -25, 18]) rotate([0, 0, 0]) pulling_lever();
    color("magenta") translate([-10, 25, 18]) rotate([0, 0, 0]) scale([1, -1, 1]) pulling_lever();

    color("black") translate([-156.5, -85, 190]) rotate([0, 90, 0]) locking_lever();
    color("black") translate([-152.5, 85, 190]) rotate([180, 90, 0]) locking_lever();
    color("white") translate([-152.5, 80, 10]) rotate([90, 0, 270]) locking_rail();
    color("lightyellow") translate([-152.5, -80, 10]) rotate([270, 0, 90]) scale([1, -1, 1]) locking_rail();
    
    // front_standard_tilt_plate bolts
    translate([0, -78, 112]) rotate([-90, 0, 0]) thumbscrew_m5(screw_d=22, screw_h=8, n_knurls=12, knurl_d=3, knurl_f=0.6);
    translate([0, 78, 112]) rotate([90, 0, 0]) thumbscrew_m5(screw_d=22, screw_h=8, n_knurls=12, knurl_d=3, knurl_f=0.6);
    translate([0, -73, 170]) rotate([-90, 0, 0]) thumbscrew_m5(screw_d=18, screw_h=8, n_knurls=12, knurl_d=3, knurl_f=0.6);
    translate([0, 73, 170]) rotate([90, 0, 0]) thumbscrew_m5(screw_d=18, screw_h=8, n_knurls=12, knurl_d=3, knurl_f=0.6);
    
    // for pulling_lever_plate front swing screw
    translate([0, 0, 37]) rotate([180, 0, 0]) thumbscrew_m5(screw_d=22, screw_h=5, n_knurls=16, knurl_d=3, knurl_f=0.6);
    
    // for screw into tripod_plate
    translate([-142.5, 0, -13.5]) rotate([0, 0, 0]) thumbscrew_m5(screw_d=20, screw_h=4.5, n_knurls=16, knurl_d=3, knurl_f=0.6);

    // Leadscrew, (T6, 2 or 4mm lead, 150mm)
    translate([-62, -68, 11]) rotate([90, 0, 90]) t6_lead_screw(150);
        
    // Leadscrew nut
    translate([-39, -68, 11]) rotate([90, 0, 90]) t6_lead_screw_nut();
    
    // Hinge screw (M5 threaded rod, 180mm)
    translate([-87.5, 90, 10]) rotate([90, 0, 0]) m5_rod(180);
    
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
    translate([-136.5, -75.5, 30]) rotate([90, 0, 0]) insert_m3();
    translate([-136.5, 75.5, 30]) rotate([-90, 0, 0]) insert_m3();
    translate([-136.5, -75.5, 170]) rotate([90, 0, 0]) insert_m3();
    translate([-136.5, 75.5, 170]) rotate([-90, 0, 0]) insert_m3();
    translate([-136.5, -70, 20.5]) insert_m3();
    translate([-136.5, 70, 20.5]) insert_m3();
    translate([-136.5, -70, 175.5]) insert_m3();
    translate([-136.5, 70, 175.5]) insert_m3();

    translate([-136.5, -39.5, 179.5]) rotate([180, 0, 0]) insert_m3();
    translate([-136.5, 39.5, 179.5]) rotate([180, 0, 0]) insert_m3();
    translate([-136.5, -39.5, 20.5]) insert_m3();
    translate([-136.5, 39.5, 20.5]) insert_m3();
    translate([-136.5, 78.5, 60.5]) rotate([90, 0, 0]) insert_m3();
    translate([-136.5, 78.5, 139.5]) rotate([90, 0, 0]) insert_m3();
    translate([-136.5, -78.5, 60.5]) rotate([-90, 0, 0]) insert_m3();
    translate([-136.5, -78.5, 139.5]) rotate([-90, 0, 0]) insert_m3();
    
    // bellows_back_frame screws
    translate([-136.5, -39.5, 179.5]) rotate([180, 0, 0]) screw_m3_grub(8);
    translate([-136.5, 39.5, 179.5]) rotate([180, 0, 0]) screw_m3_grub(8);
    translate([-136.5, -39.5, 20.5]) screw_m3_grub(8);
    translate([-136.5, 39.5, 20.5]) screw_m3_grub(8);
    translate([-136.5, 79, 60.5]) rotate([90, 0, 0]) screw_m3_grub(8);
    translate([-136.5, 79, 139.5]) rotate([90, 0, 0]) screw_m3_grub(8);
    translate([-136.5, -79, 60.5]) rotate([-90, 0, 0]) screw_m3_grub(8);
    translate([-136.5, -79, 139.5]) rotate([-90, 0, 0]) screw_m3_grub(8);
    
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
    
    // pulling_lever_plate screws
    translate([-15, -7.5, 16]) screw_m3_cs(10);
    translate([-15, 7.5, 16]) screw_m3_cs(10);
    translate([-10, -25, 16]) screw_m3_cs(10);
    translate([-10, 25, 16]) screw_m3_cs(10);
    translate([5, -7.5, 16]) screw_m3_cs(10);
    translate([5, 7.5, 16]) screw_m3_cs(10);
    
    // pulling_lever_plate hex nut, M5
    translate([0, 0, 19]) nut_m5();
    
    // pulling_lever_plate front swing screw, M5x16
    translate([0, 0, 37]) rotate([180, 0, 0]) screw_m5_cs(16);
    
    // slider inserts
    translate([-15, -7.5, 22]) insert_m3();
    translate([-15, 7.5, 22]) insert_m3();
    translate([-10, -25, 23]) insert_m3();
    translate([-10, 25, 23]) insert_m3();
    translate([5, -7.5, 22]) insert_m3();
    translate([5, 7.5, 22]) insert_m3();
    
    // lensboard_upper_clamp screws
    translate([12, -25, 167.5]) rotate([0, -90, 0]) screw_m3_bh(8);
    translate([12, 25, 167.5]) rotate([0, -90, 0]) screw_m3_bh(8);
    
    // lensboard_lower_clamp screws
    translate([12, -25, 59.5]) rotate([0, -90, 0]) screw_m3_bh(8);
    translate([12, 25, 59.5]) rotate([0, -90, 0]) screw_m3_bh(8);
    
    // lensboard_carrier inserts
    translate([7.5, -25, 167.5]) rotate([0, -90, 0]) insert_m3();
    translate([7.5, 25, 167.5]) rotate([0, -90, 0]) insert_m3();
    translate([7.5, -25, 59.5]) rotate([0, -90, 0]) insert_m3();
    translate([7.5, 25, 59.5]) rotate([0, -90, 0]) insert_m3();
    translate([-0.5, -55, 170]) rotate([90, 0, 0]) insert_m5();
    translate([-0.5, 55, 170]) rotate([-90, 0, 0]) insert_m5();
    
    // lensboard_carrier screws
    translate([-5, -40, 54]) screw_m3_cs(10);
    translate([-5, 40, 54]) screw_m3_cs(10);
    translate([-5, -40, 170]) rotate([0, 180, 0]) screw_m3_cs(10);
    translate([-5, 40, 170]) rotate([0, 180, 0]) screw_m3_cs(10);

    translate([-5, 55, 72]) rotate([90, 0, 0]) screw_m3_cs(6);
    translate([-5, -55, 72]) rotate([-90, 0, 0]) screw_m3_cs(6);
    translate([-5, 55, 152]) rotate([90, 0, 0]) screw_m3_cs(6);
    translate([-5, -55, 152]) rotate([-90, 0, 0]) screw_m3_cs(6);
    
    // front_standard_tilt_plate inserts
    translate([0, 69.75, 112]) rotate([90, 0, 0]) insert_m5();
    translate([0, -69.75, 112]) rotate([-90, 0, 0]) insert_m5();
    
    // front_standard_tilt_plate bolts
    translate([0, -77.5, 112]) rotate([-90, 0, 0]) screw_m5_cs(20);
    translate([0, 77.5, 112]) rotate([90, 0, 0]) screw_m5_cs(20);
    translate([0, -72.5, 170]) rotate([-90, 0, 0]) screw_m5_cs(20);
    translate([0, 72.5, 170]) rotate([90, 0, 0]) screw_m5_cs(20);
    
    // bellows_front_frame inserts
    translate([-5, -40, 60]) insert_m3();
    translate([-5, 40, 60]) insert_m3();
    translate([-5, -40, 160]) insert_m3();
    translate([-5, 40, 160]) insert_m3();
    translate([-5, -48, 72]) rotate([90, 0, 0]) insert_m3();
    translate([-5, 48, 72]) rotate([-90, 0, 0]) insert_m3();
    translate([-5, -48, 152]) rotate([90, 0, 0]) insert_m3();
    translate([-5, 48, 152]) rotate([-90, 0, 0]) insert_m3();

    translate([-5, -22, 60]) insert_m3();
    translate([-5, 22, 60]) insert_m3();
    translate([-5, -22, 160]) insert_m3();
    translate([-5, 22, 160]) insert_m3();
    translate([-5, -48, 90]) rotate([90, 0, 0]) insert_m3();
    translate([-5, 48, 90]) rotate([-90, 0, 0]) insert_m3();
    translate([-5, -48, 134]) rotate([90, 0, 0]) insert_m3();
    translate([-5, 48, 134]) rotate([-90, 0, 0]) insert_m3();

    // bellows_front_frame screws
    translate([-4.5, -22, 164]) rotate([180, 0, 0]) screw_m3_grub(5);
    translate([-4.5, 22, 164]) rotate([180, 0, 0]) screw_m3_grub(5);
    translate([-4.5, -22, 60]) screw_m3_grub(5);
    translate([-4.5, 22, 60]) screw_m3_grub(5);
    translate([-4.5, 51, 90]) rotate([90, 0, 0]) screw_m3_grub(5);
    translate([-4.5, 51, 134]) rotate([90, 0, 0]) screw_m3_grub(5);
    translate([-4.5, -51, 90]) rotate([-90, 0, 0]) screw_m3_grub(5);
    translate([-4.5, -51, 134]) rotate([-90, 0, 0]) screw_m3_grub(5);
    }
    // Vertical section
    *translate([0, -5000, -5000]) cube([1000, 10000, 10000]);
    // Horizontal section
    *translate([-5000, -5000, 139.5]) cube([10000, 10000, 10000]);
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
    
    // front_standard_tilt_plate bolts
    translate([400, 600, 0]) rotate([180, 0, 0]) thumbscrew_m5(screw_d=22, screw_h=8, n_knurls=12, knurl_d=3, knurl_f=0.6);
    translate([400, 650, 0]) rotate([180, 0, 0]) thumbscrew_m5(screw_d=22, screw_h=8, n_knurls=12, knurl_d=3, knurl_f=0.6);
    translate([400, 750, 0]) rotate([180, 0, 0]) thumbscrew_m5(screw_d=18, screw_h=8, n_knurls=12, knurl_d=3, knurl_f=0.6);
    translate([450, 600, 0]) rotate([180, 0, 0]) thumbscrew_m5(screw_d=18, screw_h=8, n_knurls=12, knurl_d=3, knurl_f=0.6);
    
    // for pulling_lever_plate front swing screw
    translate([450, 650, 0]) rotate([180, 0, 0]) thumbscrew_m5(screw_d=22, screw_h=5, n_knurls=16, knurl_d=3, knurl_f=0.6);
    
    // for screw into tripod_plate
    translate([450, 750, 0]) rotate([180, 0, 0]) thumbscrew_m5(screw_d=20, screw_h=4.5, n_knurls=16, knurl_d=3, knurl_f=0.6);
}




