//
// Panel for rack.  This can screw on to the front or back of a rack.  This is a basic
// blank panel.  It can be modified with cutouts for any assortment of switches, LEDs,
// LCDs, connectors, and whatever else you can think of.  The height of the panel is
// measured in frames, which is the number of screw holes spaced 20mm apart.
//

use <bbs_shapes.scad>
use <bbs_rack.scad>

module bbs_panel(frames)
{
    $fn = 20;
    length = frames *20;
    width = 161;
    height = 2;
    screw = 4.1/2;
    difference()
    {
        cube([length, width + 10, height]);
        union()
        {
            for(a = [5:20:length-10])
            {
                translate([a, 10, -1]) cylinder(r=screw, h=height + 2);
                translate([a, width, -1]) cylinder(r=screw, h=height + 2);
            }
        }
    }
}

bbs_panel(2);
