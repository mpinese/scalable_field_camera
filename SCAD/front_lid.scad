// loading the base configuration
include <baseconfig.scad>;

// some modules such as hex, countersunk screws, roof, wedge are available in a module file
use <modules.scad>;


module front_lid() {

// our outer frame measurements - caution overall
vFrontLidOuter_l = vBodyOuter_l;
vFrontLidOuter_w = vBodyOuter_w;
vFrontLidOuter_h = 2*vWall_strength;
vFrontLid_wall = vWall_strength;
vFrontLidOuter_offsetX = -vFrontLidOuter_l/2;
vFrontLidOuter_offsetY = -vFrontLidOuter_w/2;
vFrontLidOuter_offsetZ = 0;

vFrontLidInner_l = vFrontLidOuter_l-(2*vFrontLid_wall); // on X-axis
vFrontLidInner_w = vFrontLidOuter_w-(2*vFrontLid_wall); // on Y-axis
vFrontLidInner_h = vFrontLidOuter_h-vFrontLid_wall;
vFrontLidInner_offsetX = -vFrontLidInner_l/2;
vFrontLidInner_offsetY = -vFrontLidInner_w/2;
vFrontLidInner_offsetZ = vFrontLid_wall;

// our edges depend on the wall strength
vEdgeBolt_d = 2*vFrontLid_wall;
vEdgeBolt_h = 2*vFrontLid_wall;
vEdgeBolt_offsetX = vFrontLidInner_offsetX;
vEdgeBolt_offsetY = vFrontLidInner_offsetY;
vEdgeBolt_offsetZ = 0;

vEdgeBoltCone_d2 = vEdgeBolt_d-4+vTolerance;
vEdgeBoltCone_d1 = (vEdgeBoltCone_d2/2)+vTolerance;
vEdgeBoltCone_h = (vEdgeBoltCone_d1/2)+vTolerance;
vEdgeBoltCone_offsetZ = vEdgeBolt_h-vEdgeBoltCone_h;

// rails
vRailTolerance = vTolerance;

vRailBlock_l = vFrontLidOuter_l;
vRailBlock_w = vLowerRail_w+10; // 5mm on each side is sufficient
vRailBlock_h = vDoveTail_h;
vRailBlock_offsetX = -vRailBlock_l/2;
vRailBlock_offsetY = -vRailBlock_w/2;
vRailBlock_offsetZ = vFrontLid_wall;

// cutout via roof
vRailCutout_l = vFrontLidInner_l;
vRailCutout_w = vLowerRail_w + vRailTolerance;
vRailCutout_h = vRailCutout_w/2;
vRailCutout_offsetX = vRailBlock_offsetX + 2*vFrontLid_wall;
vRailCutout_offsetY = vRailCutout_w/2;
vRailCutout_offsetZ = vFrontLid_wall;

vRailMidCutout_l = vFrontLidInner_l-10;
vRailMidCutout_w = vRailBlock_w/2;
vRailMidCutout_h = 2;
vRailMidCutout_offsetX = -(vRailMidCutout_l/2)+5;
vRailMidCutout_offsetY = -vRailMidCutout_w/2;
vRailMidCutout_offsetZ = vFrontLid_wall-vRailMidCutout_h;

// hinges
vHingeTolerance = 0.3;
vHingeTubeOuter_r = vFrontLid_wall;
vHingeTubeOuter_h = vFrontLidOuter_w;
vHingeTubeInner_d = vHingeHole+vHingeTolerance;
vHingeTube_offsetX = vFrontLidInner_offsetX;
vHingeTube_offsetY = -vFrontLidOuter_offsetY;
vHingeTube_offsetZ = vFrontLidOuter_h;

vHingeCutout_l = 2*vFrontLid_wall;
vHingeCutout_w = vHingeBaseWidth+vHingeTolerance;
vHingeCutout_h = vHingeCutout_l;
vHingeCutout_offsetX = vFrontLidOuter_offsetX;
vHingeCutout_offsetY = vHingeInnerDistance/2;
vHingeCutout_offsetZ = vFrontLid_wall;



// lens indent
vLensIndent_d2 = 70;
vLensIndent_d1 = vLensIndent_d2-(2*vFrontLid_wall);
vLensIndent_h = vFrontLid_wall;
vLensIndent_offsetX = 0;
vLensIndent_offsetY = 0;
vLensIndent_offsetZ = 1;


vFocusingKnobCutout_d = vFocusingKnob_d+1;
vFocusingKnobCutout_l = vFocusingKnob_h;
vFocusingKnobCutout_offsetX = -vFrontLidOuter_offsetX-vFocusingKnobCutout_l-10;
vFocusingKnobCutout_offsetY = -(vBodyOuter_w/2)+10+7; // focus lever length - 7mm
vFocusingKnobCutout_offsetZ = 6+vFrontLid_wall;

vFocusingBlockScrew_d = vScrew1Hole_d;
vFocusingBlockScrew_h = 10;
vFocusingBlockScrew1_offsetX = vFocusingKnobCutout_offsetX-5;
vFocusingBlockScrew1_offsetY = vFocusingKnobCutout_offsetY+8;

vFocusingBlockScrew2_offsetX = vFocusingKnobCutout_offsetX-5;
vFocusingBlockScrew2_offsetY = vFocusingKnobCutout_offsetY-8;

vFocusingBlockScrew3_offsetX = vFocusingKnobCutout_offsetX+vFocusingKnobCutout_l+5;
vFocusingBlockScrew3_offsetY = vFocusingKnobCutout_offsetY+8;

vFocusingBlockScrew4_offsetX = vFocusingKnobCutout_offsetX+vFocusingKnobCutout_l+5;
vFocusingBlockScrew4_offsetY = vFocusingKnobCutout_offsetY-8;

vFocusingBlockScrew_offsetZ = 0;

vFocusingBlockCutout_l = vFrontLid_wall;
vFocusingBlockCutout_w = (vFrontLidOuter_w-vRailBlock_w-(2*vEdgeBolt_d))/2; 
vFocusingBlockCutout_h = vFrontLid_wall;
vFocusingBlockCutout_offsetX = -vFrontLidInner_offsetX;
vFocusingBlockCutout_offsetY = vFrontLidInner_offsetY+vFrontLid_wall;
vFocusingBlockCutout_offsetZ = vFrontLid_wall;

// Insert holes for the stabilizing lid
vLidHole_d = vInsertM3Hole_d;
vLidHole_h = vInsertM3MinDepth_h;
assert(vFrontLid_wall >= vInsertM3MinDepth_h);

vLidHoleRow_length = (vLidHoleCount_x-1)*vLidHoleDist_x;
vLidHoleRow_offsetX = -vLidHoleRow_length/2-17.5;
vLidHoleRow_offsetY = vLidHoleDist_y/2;
vLidHoleRow_offsetZ = 0; // No offset to enable easy insert installation



difference(){
    union(){
        difference(){
            union(){
                // base plate in x direction
                translate([vFrontLidOuter_offsetX, vFrontLidInner_offsetY, vFrontLidOuter_offsetZ])
                    cube([vFrontLidOuter_l, vFrontLidInner_w, vFrontLidOuter_h]);
                // base plate in y direction
                translate([vFrontLidInner_offsetX, vFrontLidOuter_offsetY, vFrontLidOuter_offsetZ])
                    cube([vFrontLidInner_l, vFrontLidOuter_w, vFrontLidOuter_h]);
            };

            // cutout (we get a little bit asymmetric here, because we want to have a double strength wall below our hinges)
            translate([vFrontLidInner_offsetX+vFrontLid_wall, vFrontLidInner_offsetY, vFrontLidInner_offsetZ])
                cube([vFrontLidInner_l-vFrontLid_wall, vFrontLidInner_w, vFrontLidInner_h]);
        };


        // edge bolts
        translate([vEdgeBolt_offsetX, vEdgeBolt_offsetY, vEdgeBolt_offsetZ])
            cylinder(d=vEdgeBolt_d, h=vEdgeBolt_h);

        translate([vEdgeBolt_offsetX, -vEdgeBolt_offsetY, vEdgeBolt_offsetZ])
            cylinder(d=vEdgeBolt_d, h=vEdgeBolt_h);

        translate([-vEdgeBolt_offsetX, vEdgeBolt_offsetY, vEdgeBolt_offsetZ])
            cylinder(d=vEdgeBolt_d, h=vEdgeBolt_h);

        translate([-vEdgeBolt_offsetX, -vEdgeBolt_offsetY, vEdgeBolt_offsetZ])
            cylinder(d=vEdgeBolt_d, h=vEdgeBolt_h);

        // rail block
        translate([vRailBlock_offsetX, vRailBlock_offsetY, vRailBlock_offsetZ])
            cube([vRailBlock_l, vRailBlock_w, vRailBlock_h]);

        // hinge tube
        translate([vHingeTube_offsetX, vHingeTube_offsetY, vHingeTube_offsetZ])
            rotate([90, 0, 0])
                cylinder(r=vHingeTubeOuter_r, h=vHingeTubeOuter_h);
        /*        
        // back thread block
        translate([vBackThreadBlock_offsetX, vBackThreadBlock_offsetY, vBackThreadBlock_offsetZ])
            cube([vBackThreadBlock_l, vBackThreadBlock_w, vBackThreadBlock_h]);
        
        translate([vBackThreadBlock_offsetX, vFocusingRodHole_offsetY, vFocusingRodHole_offsetZ])
            rotate([0, 90, 0])
                cylinder(d=vBackThreadBlock_d, h=vBackThreadBlock_l);    
       */
        
    };
    
    // rail cutout
    translate([vRailCutout_offsetX, -vRailCutout_offsetY, vRailCutout_offsetZ])
        cube([vRailCutout_l, vRailCutout_w, vRailTolerance]);
    
    translate([vRailCutout_offsetX, -vRailCutout_offsetY, vRailCutout_offsetZ+vRailTolerance])
        roof(vRailCutout_l, vRailCutout_w, vRailCutout_h);
    
    translate([vRailMidCutout_offsetX, vRailMidCutout_offsetY, vRailMidCutout_offsetZ])
        cube([vRailMidCutout_l, vRailMidCutout_w, vRailMidCutout_h]);
     
    // hinge hole
    translate([vHingeTube_offsetX, vHingeTube_offsetY, vHingeTube_offsetZ])
        rotate([90, 0, 0])
            cylinder(d=vHingeTubeInner_d, h=vHingeTubeOuter_h);
    
    // Hinge insert holes
   translate([vHingeTube_offsetX, vHingeTube_offsetY, vHingeTube_offsetZ])
        rotate([90, 0, 0])
            cylinder(d=vInsertM5Hole_d, h=vInsertM5MinDepth_h);
   translate([vHingeTube_offsetX, -vHingeTube_offsetY, vHingeTube_offsetZ])
        rotate([-90, 0, 0])
            cylinder(d=vInsertM5Hole_d, h=vInsertM5MinDepth_h);
    
    
    // hinge cutouts
    translate([vHingeCutout_offsetX, vHingeCutout_offsetY, vHingeCutout_offsetZ])
        cube([vHingeCutout_l, vHingeCutout_w, vHingeCutout_h]);
    translate([vHingeCutout_offsetX, -vHingeCutout_offsetY-vHingeCutout_w, vHingeCutout_offsetZ])
        cube([vHingeCutout_l, vHingeCutout_w, vHingeCutout_h]);
    
     
    // focusing knob cutout
    translate([vFocusingKnobCutout_offsetX, vFocusingKnobCutout_offsetY, vFocusingKnobCutout_offsetZ])
        rotate([0, 90, 0])
            cylinder(d=vFocusingKnobCutout_d, h=vFocusingKnobCutout_l);
            
    // cutout in front wall for focusing block
    translate([vFocusingBlockCutout_offsetX, vFocusingBlockCutout_offsetY, vFocusingBlockCutout_offsetZ])
        cube([vFocusingBlockCutout_l, vFocusingBlockCutout_w, vFocusingBlockCutout_h]);
    
    // screw holes for front focusing block
    
    translate([vFocusingBlockScrew2_offsetX, vFocusingBlockScrew2_offsetY, vFocusingBlockScrew_offsetZ])
        countersunk_screw(vFocusingBlockScrew_d, vFocusingBlockScrew_h);
    
    translate([vFocusingBlockScrew3_offsetX, vFocusingBlockScrew3_offsetY, vFocusingBlockScrew_offsetZ])
        countersunk_screw(vFocusingBlockScrew_d, vFocusingBlockScrew_h);
    
   
    // lens indent
    translate([vLensIndent_offsetX, vLensIndent_offsetY, vLensIndent_offsetZ])
        cylinder(d1=vLensIndent_d1, d2=vLensIndent_d2, h=vLensIndent_h);
    
    // Insert holes for screwing the stabilizer lid
    // Suppress holes for i = 2 as these impinge on the lens indent
    translate([vLidHoleRow_offsetX, vLidHoleRow_offsetY, vLidHoleRow_offsetZ])
    for (i = [0:vLidHoleCount_x-1]){ 
        if (i != 2) {
        translate([i*vLidHoleDist_x, 0, 0])
        cylinder(d=vLidHole_d, h=vLidHole_h); }
    };
    
    translate([vLidHoleRow_offsetX, -vLidHoleRow_offsetY, vLidHoleRow_offsetZ])
    for (i = [0:vLidHoleCount_x-1]){ 
        if (i != 2) {
        translate([i*vLidHoleDist_x, 0, 0])
        cylinder(d=vLidHole_d, h=vLidHole_h); }
    };
    
    // cones for edge bolts from body
    translate([-vEdgeBolt_offsetX, vEdgeBolt_offsetY, vEdgeBoltCone_offsetZ])
        cylinder(d1=vEdgeBoltCone_d1, d2=vEdgeBoltCone_d2, h=vEdgeBoltCone_h);
    translate([-vEdgeBolt_offsetX, -vEdgeBolt_offsetY, vEdgeBoltCone_offsetZ])
        cylinder(d1=vEdgeBoltCone_d1, d2=vEdgeBoltCone_d2, h=vEdgeBoltCone_h);
    
};


};

front_lid();
