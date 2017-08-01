//
// Basic sliding tray to mount in a rack.  Varients of this tray can
// hold different electronic devices.  The knobs parameter is a boolean
// to determine in knobs are added to the tray (the default) or not.
// One may wish to omit the knobs if, for example, one wants a panel to
// cover the tray.
//
use <bbs_shapes.scad>
length=198;
width=160;
//module prism(l)
//{
//    linear_extrude(height=l) polygon([[0,0], [0,5], [2.5,2.5]]);
//}
module bbs_tray(knobs=true)
{
    difference()
    {
        union()
        {
            cube([length, width, 3], center=false); // Base
            translate([0, 0, 6])rotate([0, 90, 0]) rotate([0, 0, -90]) bbs_prism1(5, length); // Rail
            translate([0, width, 1])rotate([0, 90, 0]) rotate([0, 0, 90]) bbs_prism1(5, length); // Rail
            translate([0, 0, 0]) cube([length, 8, 7], center=false); // Side
            translate([0, width - 8, 0]) cube([length, 8, 7], center=false); // Side
//
            if (knobs)
            {
                translate([length, 3, 4]) rotate([0, 90, 0]) cylinder($fn=12, h=5, r=3);
                translate([length + 5, 0, 0]) cube([5, 8, 8], center=false); // Knob
                translate([length, width - 4, 4]) rotate([0, 90, 0]) cylinder($fn=12, h=5, r=3);
                translate([length + 5, width - 8, 0]) cube([5, 8, 8], center=false); // Knob
            }
        }
        union()
        {
        }
    }
}

bbs_tray();
