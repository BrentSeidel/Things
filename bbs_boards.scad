//
// This is a collection of models and mounts for various breakout boards -
// mostly from AdaFruit.  Boards are added as I get the board, have a chance
// to take measurements, and a need to mount it.  Should some nice person
// provide measurements, I can add additional boards...
//
use <bbs_pins.scad>
use <bbs_components.scad>
use <bbs_connectors.scad>

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

//--------------------------------------------------------------------------------------
// Model for VL53L0X Distance Sensor
// AdaFruit item #3317
//

module bbs_vl53l0x_standoffs(height, radius, facets)
{
    hole_radius = 2.15/2;
    union()
    {
      translate([1.37+hole_radius, 14.01+hole_radius, 0]) cylinder($fn=facets, h=height, r=radius);
      translate([16.57+hole_radius, 14.07+hole_radius, 0]) cylinder($fn=facets, h=height, r=radius);
    }
}

module bbs_vl53l0x()
{
    hole_radius = 2.15/2;
    width = 17.78;
    length = 20.58;
    difference()
  { 
        union()
        {
            cube([length, width, 2], center=false);
            translate([1.93, 2.47, 0])  bbs_header(7);
        }
        translate([0, 0, -1]) bbs_vl53l0x_standoffs(4, hole_radius, 12);
    }
}

//--------------------------------------------------------------------------------------
// Model for character LCD backpack
// AdaFruit item #292
//
// This board is actually designed to mount on the back of a character LCD using the header
// strip.  This board has only one mounting hole, which unfortunately doesn't line up with
// the mounting hole on the 20x4 character LCD panel that I have.
//

module bbs_LCD_backpack_standoffs(height, radius, facets)
{
    hole_radius = 2.75/2;
    translate([1.345+hole_radius, 1.32+hole_radius, 0]) cylinder($fn=facets, h=height, r=radius);
}

module bbs_LCD_backpack()
{
    hole_radius = 2.15/2;
    width = 22.23;
    length = 50.29;
    difference()
  { 
        union()
        {
            cube([length, width, 2]);
            translate([7.96, 1.94, 0])  bbs_header(16);
            translate([0.53, 14.05, 2]) cube([18.08, 6.98, 9.03]);
        }
        translate([0, 0, -1]) bbs_LCD_backpack_standoffs(4, hole_radius, 12);
    }
}

//--------------------------------------------------------------------------------------
// Model for TB6612 Dual H-Bridge Driver
// AdaFruit item #2448
//
// This board is actually designed to mount on the back of a character LCD using the header
// strip.  This board has only one mounting hole, which unfortunately doesn't line up with
// the mounting hole on the 20x4 character LCD panel that I have.
//

module bbs_tb6612_standoffs(height, radius, facets)
{
    hole_radius = 2.15/2;
    union()
    {
      translate([1.37+hole_radius, 1.42+hole_radius, 0]) cylinder($fn=facets, h=height, r=radius);
      translate([22.78+hole_radius, 1.42+hole_radius, 0]) cylinder($fn=facets, h=height, r=radius);
    }
}

module bbs_tb6612()
{
    hole_radius = 2.15/2;
    width = 19.03;
    length = 27.00;
    difference()
  { 
        union()
        {
            cube([length, width, 2], center=false);
            translate([5.62, 2.47, 0])  bbs_header(6);
            translate([2.00, 15.73, 0])  bbs_header(10);
        }
        translate([0, 0, -1]) bbs_tb6612_standoffs(4, hole_radius, 12);
    }
}

//--------------------------------------------------------------------------------------
// Model Ping Sonar sensor
//
// The sensor comes from Parallax and is designed for their BASIC stamp series of
// controllers.  With a bit of work, it can be used by other microcontrollers.  Here
// is a model and a mount for it.
//

module bbs_ping_sonar_standoffs(height, radius, facets)
{
    hole_radius = 3.10/2;
    translate([1.03+hole_radius, 1.24+hole_radius, 0]) cylinder(h=height, r=radius, $fn=facets);
    translate([41.41+hole_radius, 17.19+hole_radius, 0]) cylinder(h=height, r=radius, $fn=facets);
}

module bbs_ping_sonar()
{
    hole_radius = 3.10/2;
    sensor_rad = 16.16/2;
    sensor_height = 12.28;
    difference()
    {
        union()
        {
            cube([45.51, 21.27, 2]);
            translate([1.89+sensor_rad, 2.16+sensor_rad, 2]) cylinder(h=sensor_height, r=sensor_rad);
            translate([43.53-sensor_rad, 2.16+sensor_rad, 2]) cylinder(h=sensor_height, r=sensor_rad);
            translate([19.19, -7.79, 2]) cube([7.6, 10.57, 2.99]);
        }
        union()
        {
            translate([0, 0, -1]) bbs_ping_sonar_standoffs(4, hole_radius, 12);
        }
    }
}

//--------------------------------------------------------------------------------------
// Model for dual MCP23017 GPIO Board
// This board in contained in the Circuits repository as IOBoard.

module bbs_GPIO_standoffs(height, radius, facets)
{
  union()
  {
    translate([3.82, 3.82, -0.1]) cylinder($fn=facets, h=height, r=radius);
    translate([3.82, 40.640, -0.1]) cylinder($fn=facets, h=height, r=radius);
    translate([95.250, 3.82, -0.1]) cylinder($fn=facets, h=height, r=radius);
    translate([95.250, 40.640, -0.1]) cylinder($fn=facets, h=height, r=radius);
  }
}

module bbs_GPIO()
{
  difference()
  {
    union()
    {
      translate([0, 0, -1.4]) color("red") cube([99.43, 47.14, 1.4]);
      translate([55.87, 6.58, 0]) rotate([0, 0, 180]) bbs_2x5_rt();
      translate([11.42, 40.80, 0]) bbs_2x5_rt();
      translate([33.01, 40.80, 0]) bbs_2x5_rt();
      translate([53.71, 40.80, 0]) bbs_2x5_rt();
      translate([73.655, 40.80, 0]) bbs_2x5_rt();
      translate([40.63, 28.83, 0]) rotate([0, 0, 180]) bbs_DIP(28, 0.300);
      translate([85.08, 28.83, 0]) rotate([0, 0, 180]) bbs_DIP(28, 0.300);
    }
    union()
    {
      translate([0, 0, -1.4]) bbs_GPIO_standoffs(4, 1.25, 12);
    }
  }
}

//--------------------------------------------------------------------------------------
// Model for 10 conductor ribbon cable breakout board
// This board in contained in the Circuits repository as Ribbon-10.


module bbs_Ribbon10_standoffs(height, radius, facets)
{
  union()
  {
    translate([5.08, 5.08, -0.1]) cylinder($fn=facets, h=height, r=radius);
    translate([31.75, 5.08, -0.1]) cylinder($fn=facets, h=height, r=radius);
  }
}

module bbs_Ribbon10()
{
  difference()
  {
    union()
    {
      translate([0, 0, -1.4]) color("red") cube([36.83, 24.13, 1.4]);
      translate([24.13, 6.58, 0]) rotate([0, 0, 180]) bbs_2x5_rt();
    }
    union()
    {
      translate([0, 0, -1.4]) bbs_Ribbon10_standoffs(4, 1.25, 12);
    }
  }
}

//--------------------------------------------------------------------------------------
bbs_GPIO();
//bbs_Ribbon10();
//color("red") bbs_pwm16();
//color("red") translate([0, 40, 0]) bbs_ra8875();
//color("red") translate([70, 0, 0]) bbs_bme280();
//color("red") translate([70, 40, 0]) bbs_LCD_backpack();
//color("green") translate([90, 0, 0]) bbs_vl53l0x();
//color("blue") translate([120, 0, 0]) bbs_ping_sonar();
//color("green") translate([130, 40, 0]) bbs_tb6612();

