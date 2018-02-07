//
// Mounts for LEDs.  The modules are parameterized based on the diameter of the LED.
// Since the LEDs don't have mounting hardware, they are just friction fit.
//
// Parameters:
// diameter - the diameter of the LED in mm
// height - the hight (thickness) in mm
//

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
//
// Mount for an LED to attach to an aluminum extrusion.  This inserts into a mount defined in 
// the bbs_t_extrusion file.
//
module extrusion_led()
{
    flange_dia = 5.8;
    lead_space = 1.9;
    small_r = 3*sqrt(3)/2;
    difference()
    {
        union()
        {
            rotate([0, 0, 30]) cylinder(r=3, h=25, $fn=6);
            translate([-small_r, 0, 25+flange_dia/2]) rotate([0, 90, 0]) cylinder(r=flange_dia/2, h=2, $fn=10);
            translate([-small_r, -flange_dia/2, 25]) cube([2, flange_dia, flange_dia/2]);
        }
        union()
        {
            translate([-2.7, lead_space/2, 24.5+flange_dia/2]) cube([3, 1, 1]);
            translate([-2.7, -1-lead_space/2, 24.5+flange_dia/2]) cube([3, 1, 1]);
        }
    }
}

//
// Mount for an CdS photosensor to attach to an aluminum extrusion.  This inserts into a mount defined in 
// the bbs_t_extrusion file.
//
module extrusion_CdS()
{
    flange_dia = 5.8;
    lead_space = 3.1;
    small_r = 3*sqrt(3)/2;
    difference()
    {
        union()
        {
            rotate([0, 0, 30]) cylinder(r=3, h=25, $fn=6);
            translate([-small_r, 0, 25+flange_dia/2]) rotate([0, 90, 0]) cylinder(r=flange_dia/2, h=2, $fn=10);
            translate([-small_r, -flange_dia/2, 25]) cube([2, flange_dia, flange_dia/2]);
        }
        union()
        {
            translate([-2.7, lead_space/2, 24.5+flange_dia/2]) cube([3, 1, 1]);
            translate([-2.7, -1-lead_space/2, 24.5+flange_dia/2]) cube([3, 1, 1]);
        }
    }
}

rotate([0, -90, 0]) extrusion_led();
//bbs_led_mount(5, 2);
//translate([0, 0, -1]) color("red") bbs_led_cutout(5, 2);
