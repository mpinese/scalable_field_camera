STL_DIR = STL_4x5
SCAD_DIR = scad

STRUCTURAL_PARTS = body front_lid back_plate focusing_block ground_glass_frame front_standard slider rails front_standard_tilt_plate lensboard_carrier tripod_plate front_lid_dovetail pulling_lever_plate lensboard
CONTROL_PARTS = focus_wheel lensboard_upper_clamp lensboard_lower_clamp pulling_lever locking_lever locking_rail thumbscrews
GENERAL_PARTS = ground_glass_clamp bellows_back_frame bellows_front_frame handle_strap_cover
FLEXIBLE_PARTS = handle_strap


STRUCTURAL_TARGETS = $(patsubst %,$(STL_DIR)/%_structural.stl,$(STRUCTURAL_PARTS))
CONTROL_TARGETS = $(patsubst %,$(STL_DIR)/%_control.stl,$(CONTROL_PARTS))
GENERAL_TARGETS = $(patsubst %,$(STL_DIR)/%_general.stl,$(GENERAL_PARTS))
FLEXIBLE_TARGETS = $(patsubst %,$(STL_DIR)/%_flexible.stl,$(FLEXIBLE_PARTS))

.PHONY: all clean

all: $(STRUCTURAL_TARGETS) $(CONTROL_TARGETS) $(GENERAL_TARGETS) $(FLEXIBLE_TARGETS)

$(STL_DIR)/%_structural.stl: $(SCAD_DIR)/%.scad
	mkdir -p $(STL_DIR)
	openscad -o $@ $<

$(STL_DIR)/%_control.stl: $(SCAD_DIR)/%.scad
	mkdir -p $(STL_DIR)
	openscad -o $@ $<

$(STL_DIR)/%_general.stl: $(SCAD_DIR)/%.scad
	mkdir -p $(STL_DIR)
	openscad -o $@ $<

$(STL_DIR)/%_flexible.stl: $(SCAD_DIR)/%.scad
	mkdir -p $(STL_DIR)
	openscad -o $@ $<

clean:
	rm -f ${STL_DIR}/*.stl
