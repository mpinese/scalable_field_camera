$fn=50;

lens_dia = 26;
lens_thickness = 12.3;
lens_rad = 28;
lens_ffd = 75;
lens_rfd = 67;
lens_dia_allowance = 0.5;

tube_rfd_factor = 1.0;

tube_od = 28;
tube_id = 25;
thread_length = 10;

// Basic representation of the lens
module lens() {
    intersection() {
        cylinder(h=lens_thickness, d=lens_dia);
        translate([0, 0, -(lens_rad-lens_thickness)]) sphere(r=lens_rad);
        }
}

module tube1() {
    difference() {
        cylinder(h=lens_rfd*tube_rfd_factor+2, d=tube_od);
        cylinder(h=lens_rfd*tube_rfd_factor, d=tube_id);
        translate([0, 0, lens_rfd*tube_rfd_factor]) cylinder(h=2, d=lens_dia+lens_dia_allowance);
    }
}

%lens();
translate([0, 0, -lens_rfd/2]) tube1();