use <modules.scad>;

// front_standard_tilt_plate bolts
// tilt (upper two)
rotate([180, 0, 0]) thumbscrew_m5(screw_d=22, screw_h=8, n_knurls=12, knurl_d=3, knurl_f=0.6);
translate([0, 50, 0]) rotate([180, 0, 0]) thumbscrew_m5(screw_d=22, screw_h=8, n_knurls=12, knurl_d=3, knurl_f=0.6);

// shift (centre two)
module shift_thumbscrew() {
    difference() {
        union() {
            thumbscrew_m5(screw_d=18, screw_h=8, n_knurls=12, knurl_d=3, knurl_f=0.6);
            translate([0, 0, 8]) cylinder(h=6, d=9);
        }
        cylinder(h=8+6, d=5.5);
        cylinder(h=6, d=10.5);
        translate([0, 0, 6]) cylinder(h=5, d1=10, d2=0);
    }
}

translate([50, 50, 0]) rotate([180, 0, 0]) shift_thumbscrew();

translate([50, 0, 0]) rotate([180, 0, 0]) shift_thumbscrew();

// for pulling_lever_plate front swing screw
translate([0, 100, 0]) rotate([180, 0, 0]) thumbscrew_m5(screw_d=22, screw_h=5, n_knurls=16, knurl_d=3, knurl_f=0.6);

// for screw into tripod_plate
translate([50, 100, 0]) rotate([180, 0, 0]) thumbscrew_m5(screw_d=20, screw_h=4.5, n_knurls=16, knurl_d=3, knurl_f=0.6);
