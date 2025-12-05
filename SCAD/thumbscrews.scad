use <modules.scad>;

// front_standard_tilt_plate bolts
rotate([180, 0, 0]) thumbscrew_m5(screw_d=22, screw_h=8, n_knurls=12, knurl_d=3, knurl_f=0.6);
translate([0, 50, 0]) rotate([180, 0, 0]) thumbscrew_m5(screw_d=22, screw_h=8, n_knurls=12, knurl_d=3, knurl_f=0.6);
translate([50, 50, 0]) rotate([180, 0, 0]) thumbscrew_m5(screw_d=18, screw_h=8, n_knurls=12, knurl_d=3, knurl_f=0.6);
translate([50, 0, 0]) rotate([180, 0, 0]) thumbscrew_m5(screw_d=18, screw_h=8, n_knurls=12, knurl_d=3, knurl_f=0.6);

// for pulling_lever_plate front swing screw
translate([0, 100, 0]) rotate([180, 0, 0]) thumbscrew_m5(screw_d=22, screw_h=5, n_knurls=16, knurl_d=3, knurl_f=0.6);

// for screw into tripod_plate
translate([50, 100, 0]) rotate([180, 0, 0]) thumbscrew_m5(screw_d=20, screw_h=4.5, n_knurls=16, knurl_d=3, knurl_f=0.6);
