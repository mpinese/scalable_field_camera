// loading the base configuration
include <baseconfig.scad>;

vOuterSize_w = vLensboard_l-0.5;
vOuterSize_h = vLensboard_w-0.5;
vHoleSize_d = 34.6;
vThickness_d = vLensboard_h;
vFillet_r = 2.0;

vOffset_w = vOuterSize_w/2-vFillet_r;
vOffset_h = vOuterSize_h/2-vFillet_r;

module lensboard() {

difference() {
    hull() {
        translate([vOffset_w, vOffset_h, 0]) cylinder(h=vThickness_d, r=vFillet_r);
        translate([-vOffset_w, vOffset_h, 0]) cylinder(h=vThickness_d, r=vFillet_r);
        translate([vOffset_w, -vOffset_h, 0]) cylinder(h=vThickness_d, r=vFillet_r);
        translate([-vOffset_w, -vOffset_h, 0]) cylinder(h=vThickness_d, r=vFillet_r);
    };
    
    translate([0, 0, -1]) cylinder(h=vThickness_d+2, d=vHoleSize_d);
}
 
}

lensboard();
