//
// This is an example of a panel.  I am using to test various of the cutouts and
// other panel related things.
//
use <bbs_panel.scad>
use <bbs_connectors.scad>
use <bbs_leds.scad>
use <bbs_switches.scad>

width = 171;
union()
{
    difference()
    {
        bbs_panel(3);
        union()
        {
            for(a = [1:8])
            {
                y = a*(width - 20)/8;
                translate([10, y, -0.1]) bbs_spdt_switch_cutout(2.2);
                translate([25, y, -0.1]) bbs_led_cutout(5, 2.2);
            }
            translate([40, 30, -0.1]) rotate([0, 0, 90]) bbs_d_cutout(1, 2.2);
            translate([40, 70, -0.1]) rotate([0, 0, 90]) bbs_d_cutout(2, 2.2);
            translate([40, 120, -0.1]) rotate([0, 0, 90]) bbs_d_cutout(3, 2.2);
        }
    }
    for(a = [1:8])
    {
        y = a*(width - 20)/8;
        translate([25, y, 0]) bbs_led_mount(5, 2);
        translate([17, y, 1.9]) linear_extrude(height = 0.3) rotate([0, 0, -90])
            text(str(a), halign="center", valign="center", size=5);
    }
    translate([50, 30, 1.9]) linear_extrude(height = 0.3) rotate([0, 0, -90])
            text("9/15 pin", halign="center", valign="center", size=5);
    translate([50, 70, 1.9]) linear_extrude(height = 0.3) rotate([0, 0, -90])
            text("15/26 pin", halign="center", valign="center", size=5);
    translate([50, 120, 1.9]) linear_extrude(height = 0.3) rotate([0, 0, -90])
            text("25/44 pin", halign="center", valign="center", size=5);
}