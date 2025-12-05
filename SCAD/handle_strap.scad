include <baseconfig.scad>;
include <modules.scad>;

module handle_strap() {

difference() {
    hull() {
        translate([-vHandleStrap_l/2+vHandleStrap_w/2, 0, 1]) chamfer_cylinder(h=1, d=vHandleStrap_w, c=1);
        translate([-vHandleStrap_l/2+vHandleStrap_w/2, 0, 1]) rotate([0, 180, 0]) chamfer_cylinder(h=1, d=vHandleStrap_w, c=1);
        translate([vHandleStrap_l/2-vHandleStrap_w/2, 0, 1]) chamfer_cylinder(h=1, d=vHandleStrap_w, c=1);
        translate([vHandleStrap_l/2-vHandleStrap_w/2, 0, 1]) rotate([0, 180, 0]) chamfer_cylinder(h=1, d=vHandleStrap_w, c=1);
    }
    translate([-(vHandleStrapSlotOffsetFar+vHandleStrapSlotOffsetNear)/2, 0, 0]) rounded_rect(vHandleStrapSlotOffsetFar-vHandleStrapSlotOffsetNear, vHandleStrapCutout_w, vHandleStrap_h);
    translate([(vHandleStrapSlotOffsetFar+vHandleStrapSlotOffsetNear)/2, 0, 0]) rounded_rect(vHandleStrapMovement_l/2, vHandleStrapCutout_w, vHandleStrap_h);
}

}
handle_strap();
