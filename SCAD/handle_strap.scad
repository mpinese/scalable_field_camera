include <baseconfig.scad>;
include <modules.scad>;

module handle_strap() {

difference() {
    rounded_rect(vHandleStrap_l, vHandleStrap_w, vHandleStrap_h);
    translate([-(vHandleStrapSlotOffsetFar+vHandleStrapSlotOffsetNear)/2, 0, 0]) rounded_rect(vHandleStrapSlotOffsetFar-vHandleStrapSlotOffsetNear, vHandleStrapCutout_w, vHandleStrap_h);
    translate([(vHandleStrapSlotOffsetFar+vHandleStrapSlotOffsetNear)/2, 0, 0]) rounded_rect(vHandleStrapMovement_l/2, vHandleStrapCutout_w, vHandleStrap_h);
}

}
handle_strap();
