//
// Mounts for LEDs.  The modules are parameterized based on the diameter of the LED.
// Since the LEDs don't have mounting hardware, they are just friction fit.
//
// Parameters:
// diameter - the diameter of the LED in mm
// height - the hight (thickness) in mm
//
use <bbs_t_extrusion.scad>

module bbs_led_mount(diameter, height)
{
    difference()
    {
        union()
        {
            cylinder(h=height, r=diameter/2 + 1);
            translate([-diameter/2 - 2, -2, 0]) cube([2, 4, height]);
        }
        union()
        {
            translate([0, 0, -0.5]) cylinder(h=height + 1, r=diameter/2 - 0.2, $fn=20);
            translate([0.0, -0.5, -0.5]) cube([diameter/2+1.2, 1.0, height + 1]);
        }
    }
}

module bbs_led_cutout(diameter, height)
{
    translate([0, 0, -0.5]) cylinder(h=height + 1, r=diameter/2 + 2);
}
//-------------------------------------------------------------------------
// Mount for an LED to attach to an aluminum extrusion.  This inserts into a mount defined in 
// the bbs_t_extrusion file.
//
module extrusion_led(len)
{
    flange_dia = 5.8;
    lead_space = 1.9;
    small_r = 3*sqrt(3)/2;
    difference()
    {
        union()
        {
            extrusion_mount_fitting(len);
            translate([-small_r, 0, flange_dia/2]) rotate([0, 90, 0]) cylinder(r=flange_dia/2, h=2, $fn=10);
            translate([-small_r, -flange_dia/2, 0]) cube([2, flange_dia, flange_dia/2]);
        }
        union()
        {
            translate([-2.7, lead_space/2, flange_dia/2-0.5]) cube([3, 1, 1]);
            translate([-2.7, -1-lead_space/2, flange_dia/2-0.5]) cube([3, 1, 1]);
        }
    }
}
//
// A hood to shield a LED or light detector
//
module bbs_extrusion_led_hood(len, thickness)
{
    height = len;
    difference()
    {
        cylinder(h=height, r=thickness + 5.8/2);
        union()
        {
            translate([0, 0, -0.1]) rotate([0, 0, 18]) cylinder(h=height*2, r=5.8/2, $fn=10);
            translate([0, 0, height-3]) rotate([90, 0, 0]) cylinder(r=3, h=25, $fn=6);
            translate([-3, -(thickness+5.8), height-3]) cube([6, thickness+5.8, 6]);
        }
    }
}
//
// Mount for an CdS photosensor to attach to an aluminum extrusion.  This inserts into a mount defined in 
// the bbs_t_extrusion file.
//
module extrusion_CdS(len)
{
    flange_dia = 5.8;
    lead_space = 3.1;
    small_r = 3*sqrt(3)/2;
    difference()
    {
        union()
        {
            extrusion_mount_fitting(len);
            translate([-small_r, 0, flange_dia/2]) rotate([0, 90, 0]) cylinder(r=flange_dia/2, h=2, $fn=10);
            translate([-small_r, -flange_dia/2, 0]) cube([2, flange_dia, flange_dia/2]);
        }
        union()
        {
            translate([-2.7, lead_space/2, flange_dia/2-0.5]) cube([3, 1, 1]);
            translate([-2.7, -1-lead_space/2, flange_dia/2-0.5]) cube([3, 1, 1]);
        }
    }
}
//
// Target or blocker for light beams
//
module extrusion_target(len, rad)
{
    small_r = 3*sqrt(3)/2;
    union()
    {
        extrusion_mount_fitting(len);
        translate([-small_r, 0, rad-0.3]) rotate([0, 90, 0]) cylinder(r=rad, h=small_r*2);
    }
}

rotate([0, -90, 0]) extrusion_led(25);
//rotate([0, -90, 0]) extrusion_CdS(25);
//rotate([0, -90, 0]) extrusion_target(25, 20);
//translate([0, 10, 0])
//bbs_extrusion_led_hood(25, 2);
//bbs_led_mount(5, 2);
//translate([0, 0, -1]) color("red") bbs_led_cutout(5, 2);
