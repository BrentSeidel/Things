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
            translate([0, 0, -0.5]) cylinder(h=height + 1, r=diameter/2 - 0.1, $fn=20);
            translate([0.0, -0.5, -0.5]) cube([diameter/2+1.2, 1.0, height + 1]);
        }
    }
}

module bbs_led_cutout(diameter, height)
{
    translate([0, 0, -0.5]) cylinder(h=height + 1, r=diameter/2 + 2);
}

bbs_led_mount(5, 2);
translate([0, 0, -1]) color("red") bbs_led_cutout(5, 2);
