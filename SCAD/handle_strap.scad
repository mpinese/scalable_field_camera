vHandleStrap_h = 2.0;
vHandleStrap_w = 15.0;
vHandleStrap_l = 100.0;

vHandleMovement_l = 35.0;

vHandleCutout_w = 4.0;

vCutoutOffset = vHandleStrap_l/2-vHandleMovement_l/4-(vHandleStrap_w-vHandleCutout_w)/2;

module handle_strap() {

module rounded_rect(l, w, h) {
    union()
    {
        translate([-l/2+w/2, 0, 0]) cylinder(h=h, d=w);
        translate([l/2-w/2, 0, 0]) cylinder(h=h, d=w);
        translate([-(l-w)/2, -w/2, 0]) cube([l-w, w, h]);
    }
}

difference() {
    rounded_rect(vHandleStrap_l, vHandleStrap_w, vHandleStrap_h);
    translate([-vCutoutOffset, 0, 0]) rounded_rect(vHandleMovement_l/2, vHandleCutout_w, vHandleStrap_h);
    translate([vCutoutOffset, 0, 0]) rounded_rect(vHandleMovement_l/2, vHandleCutout_w, vHandleStrap_h);
}

}
handle_strap();
