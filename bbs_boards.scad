//
// This is a collection of models and mounts for various breakout boards -
// mostly from AdaFruit.  Boards are added as I get the board, have a chance
// to take measurements, and a need to mount it.  Should some nice person
// provide measurements, I can add additional boards...
//
use <bbs_pins.scad>

//--------------------------------------------------------------------------------------
// Model for the RA8875 LCD breakout board
// AdaFruit item #
//
module bbs_ra8875_standoffs(height, radius, facets)
{
    hole_radius = 2.5/2;
    union()
    {
      translate([1.44+hole_radius, 1.25+hole_radius, 0]) cylinder($fn=facets, h=height, r=radius);
      translate([1.22+hole_radius, 36.27+hole_radius, 0]) cylinder($fn=facets, h=height, r=radius);
      translate([44.64+hole_radius, 1.32+hole_radius, 0]) cylinder($fn=facets, h=height, r=radius);
      translate([44.64+hole_radius, 36.83+hole_radius, 0]) cylinder($fn=facets, h=height, r=radius);
    }
}

module bbs_ra8875()
{
    hole_radius = 2.5/2;
    width = 39.83;
    length = 48.46;
    difference()
  { 
        union()
        {
            cube([length, width, 2], center=false);
            translate([6, 3, 0]) bbs_header(15);
            translate([16, 35, 2]) cube([25.45, 6, 2], center=false);
            translate([4, 19, 2]) cube([4, 4, 4], center=false);
        }
        translate([0, 0, -1]) bbs_ra8875_standoffs(4, hole_radius, 12);
    }
}

//--------------------------------------------------------------------------------------
// Model for 16 channel PWM/Servo driver
// AdaFruit item #815
//

module bbs_pwm16_standoffs(height, radius, facets)
{
    hole_radius = 2.4/2;
    union()
    {
      translate([2.00+hole_radius, 2.00+hole_radius, 0]) cylinder($fn=facets, h=height, r=radius);
      translate([2.00+hole_radius, 20.80+hole_radius, 0]) cylinder($fn=facets, h=height, r=radius);
      translate([58.13+hole_radius, 2.00+hole_radius, 0]) cylinder($fn=facets, h=height, r=radius);
      translate([58.13+hole_radius, 20.80+hole_radius, 0]) cylinder($fn=facets, h=height, r=radius);
    }
}

module bbs_pwm16()
{
    hole_radius = 2.4/2;
    width = 25.37;
    length = 62.32;
    difference()
  { 
        union()
        {
            cube([length, width, 2], center=false);
            translate([27.53, 0.66, 1.5]) cube([7.53, 7.02, 8.43]); // Servo power
            translate([2.2, 5.76, 1.5]) rotate([0, 0, 90]) rotate([180, 0, 0]) bbs_header(6);
            translate([length - 2.2, 5.76, 1.5]) rotate([0, 0, 90]) rotate([180, 0, 0]) bbs_header(6);
            // Servo/PWM headers
            for (i = [0 : 3])
            {
                translate([7.27 + i*2.54, 18.64, 1.5]) rotate([0, 0, 90]) rotate([180, 0, 0]) bbs_header(3);
                translate([19.43 + i*2.54, 18.64, 1.5]) rotate([0, 0, 90]) rotate([180, 0, 0]) bbs_header(3);
                translate([34.37 + i*2.54, 18.64, 1.5]) rotate([0, 0, 90]) rotate([180, 0, 0]) bbs_header(3);
                translate([47.56 + i*2.54, 18.64, 1.5]) rotate([0, 0, 90]) rotate([180, 0, 0]) bbs_header(3);
            }
        }
        translate([0, 0, -1]) bbs_pwm16_standoffs(4, hole_radius, 12);
    }
}


//--------------------------------------------------------------------------------------
// Model for BME280 Temperature, pressure, humidity sensor
// AdaFruit item #2652
//

module bbs_bme280_standoffs(height, radius, facets)
{
    hole_radius = 2.15/2;
    union()
    {
      translate([1.46+hole_radius, 15.46+hole_radius, 0]) cylinder($fn=facets, h=height, r=radius);
      translate([14.15+hole_radius, 15.75+hole_radius, 0]) cylinder($fn=facets, h=height, r=radius);
    }
}

module bbs_bme280()
{
    hole_radius = 2.15/2;
    width = 19.53;
    length = 17.74;
    difference()
  { 
        union()
        {
            cube([length, width, 2], center=false);
            translate([0.94, 2.47, 0])  bbs_header(7);
        }
        translate([0, 0, -1]) bbs_bme280_standoffs(4, hole_radius, 12);
    }
}


color("red") bbs_pwm16();
color("green") translate([0, 40, 0]) bbs_ra8875();
color("blue") translate([70, 0, 0]) bbs_bme280();
