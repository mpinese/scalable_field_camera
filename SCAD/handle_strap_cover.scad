include <baseconfig.scad>;

use <modules.scad>;
use <handle_strap.scad>;

vChamferSize = 1.0;

module handle_strap_cover() {

module cover_d(l, w, h, c) {
    hull() {
        translate([-l+w/2, 0, 0]) chamfer_cylinder(d=w, h=h, c=c);
        translate([-l+w/2, -w/2, 0]) chamfer_cube(l-w/2, w, h, c=c);
    }
}


difference() {
    cover_d(l=vHandleStrapMovement_l/2+vHandleStrapCoverExtra_l*2+vHandleStrap_w/2, w=vHandleStrap_w + 2*2, h=vHandleStrap_h+2, c=vChamferSize);
    cover_d(l=vHandleStrapMovement_l/2+vHandleStrapCoverExtra_l*2+vHandleStrap_w/2-1.5, w=vHandleStrap_w + 1, h=vHandleStrap_h+1, c=0.5);
    translate([-vHandleStrapCoverExtra_l, 0, vHandleStrap_h+2])rotate([180, 0, 0]) countersunk_screw(vScrew1Hole_d+vTolerance, 10);
    translate([-vHandleStrapCoverExtra_l-vStrapHoleSpacing, 0, vHandleStrap_h+2]) rotate([180, 0, 0]) countersunk_screw(vScrew1Hole_d+vTolerance, 10);
}

}

handle_strap_cover();

