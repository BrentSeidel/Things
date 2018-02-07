//
// Panel for rack.  This can screw on to the front or back of a rack.  This is a basic
// blank panel.  It can be modified with cutouts for any assortment of switches, LEDs,
// LCDs, connectors, and whatever else you can think of.  The height of the panel is
// measured in frames, which is the number of screw holes spaced 20mm apart.
//
use <bbs_constants.scad>
use <bbs_shapes.scad>
//
// The module is provided in two versions.  In the _raw version, the length and width can be set to any
// size in units of 1mm.  In the non-_raw version, the length and width are set in units of frames (same
// as the height).  This is basically 20mm units with a little bit of processing.  Note that since the
// values are actually floating point, you can select any value, but don't do that.
//
//rack_width = bbs_std_rack_width();

module bbs_panel(frames_wide, frames_high)
{
    bbs_panel_raw(frames_wide*20 + 10, frames_high);
}
//
module bbs_panel_raw(rack_width, frames)
{
    $fn = 20;
    length = frames *20;
    height = 2;
    screw = screw_8_size()/2;
    difference()
    {
        cube([length, rack_width+10, height]);
        union()
        {
            for(a = [5:20:length-10])
            {
                translate([a, 10, -1]) cylinder(r=screw, h=height + 2);
                translate([a, rack_width, -1]) cylinder(r=screw, h=height + 2);
            }
        }
    }
}

bbs_panel(2, 2);
