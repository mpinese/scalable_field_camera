# An Opinionated Remix of Edgar Kech's _Scalable large format field camera_

Edgar Kech has gifted the community an outstanding design in his [Scalable Field Camera](https://github.com/edgarkech/scalable_field_camera).

This is my personal remix of Edgar's work, with quality-of-life tweaks, more robust mechanical fixtures, and bugfixes. If printed in the recommended filament this camera is exceptionally lightweight, being 965 g (2.1 lb) including bellows and ground glass. I've used it in multiple photo trips now with no issues.

My remix is focused on 4&times;5 cameras only and will need tweaking for larger formats. If you're looking to print a larger camera, consider Edgar's original design.

## Changes from the original design:
- Exceptionally lightweight: 965g with bellows and ground glass.
- Threaded heat-set inserts used throughout; no more screwing into plastic.
- 3D printed knobs and lensboard, to remove reliance on hard-to-source parts.
- A more streamlined hinge.
- (Work in progress!) Harmonising the fasteners used, in an attempt to simplify the Bill of Materials.
- Many minor bugfixes
- Reorganised the source to better report the components used.
- A handle!

## Bill of Materials:
- 3D printer filament, see below for notes on filament choice. < 1 kg of filament will be needed in all cases. A small amount of TPU will be needed for the handle.
- Bellows. I followed the [Standard Camera bellows guide](https://standardcameras.com/pages/how-to-make-a-bellows) and it worked well. Note however that it's critical that the bellows material be as thin as possible; if it's too thick, the camera will not be able to close. I had success with ripstop nylon for the outer, and a very thin synthetic material used to blackout windows (black on one side, silver on the other) -- together these two were only 0.14 mm thick.
- Ground glass, 127 x 101 mm
- 600mm of 1.25mm spring steel wire
- 100mm of 0.75mm spring steel wire
- 1x brass T6 leadscrew nut (as are common on 3D printers). Ideally a double-trimmed flange type or else you will need to cut off two sides of the circular flange in order for it to fit.
- 1x T6 leadscrew, length 150 mm. Ensure that the leadscrew and nut are compatible (ie same lead and pitch).
- 3x plain washer, 6 mm, 0.8 mm thick
- 1x spring washer, 6 mm
- 1x carbon fibre rod, solid, 4 mm OD, >= 160 mm long
- 2x grub screw, M5 x 5 mm
- 4x button head machine screw, M3 x 8 mm
- 12x button head machine screw, M2 x 8 mm
- 4x countersunk machine screw, M3 x 6 mm
- 4x countersunk machine screw, M3 x 8 mm
- 23x countersunk machine screw, M3 x 10 mm
- 2x countersunk machine screw, M5 x 16 mm
- 4x countersunk machine screw, M5 x 20 mm
- 8x grub screw, M3 x 5 mm
- 10x grub screw, M3 x 8 mm
- 1x hex nut, M5
- 12x heat set insert, M2 x 3.5 x 3 (3.5 mm OD, 3 mm depth)
- 56x heat set insert, M3 x 5 x 4 (5 mm OD, 4 mm depth) -- sometimes called the "Voron" size
- 8x heat set insert, M5 x 7 x 5 (7 mm OD, 5 mm depth)

All parts are easily sourced from AliExpress.


## Filament
I used and recommend Siraya Tech's PPA-CF for this build: it is lightweight, strong, and stiff. However, it is also expensive and requires a printer with a heated chamber.

ABS is a cheaper option than PPA-CF, though it also requires a heated chamber printer, and it will likely require thicker walls than PPA-CF, thus increasing weight.

If you do not have access to a heated chamber printer then the next best option would be PLA, ideally filled (eg PLA-CF) for best printability. However, bear in mind that a PLA body will be both heavier, and less heat resistant, than the PPA-CF. This is probably not an issue in normal use, but if you were to leave your PLA camera in a hot car, it may warp.

I do not recommend PETG.

The handle will need to be printed in a flexible material like TPU.


## Printing and Assembly
- Print with 0.2 mm layer height throughout and 15% infill.
- Parts are labelled as "structural", "general", "control", and "flexible".
  - Structural parts should be printed in a stiff material like PPA-CF, with at least 4 walls side, top, and bottom. If using ABS or PLA, increase to at least 5 walls side, top, and bottom.
  - General and control parts can be printed in any material, with 3 walls.
  - Flexible parts should be printed in TPU with 100% infill.
- Construct following assembly.scad (open in OpenSCAD nightly version, and the full assembly with all parts will be browsable). Also consult [Edgar Kech's Scalable Field Camera](https://github.com/edgarkech/scalable_field_camera) repo for further instructions and photos.


## Licence
CC-BY-NC-SA 4.0, see CC-BY-NC-SA-LICENSE.


## Attribution
- Original design by Edgar Kech, https://github.com/edgarkech/scalable_field_camera.
- Modifications by Mark Pinese
