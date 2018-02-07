# Things
A collection of models that can be 3D printed

## Origin
I have been playing around with a number of embedded computers like Raspberry PIs and Arduinos and my desk has been getting rather cluttered.  So I thought, wouldn't it be great if I could attach some of these circuit boards onto a tray and slide it into some sort of a rack.  A quick look around revealed nothing like this.  There were a number of boxes for the Raspberry Pi, but they just gave a bit of protection to the Pi and didn't solve the clutter problem.  The other issue is that sometimes I want to use a Pi with a couple of other little boards and sometimes I want to hook up some things to an Arduino.  So, the solution needs to be flexible.

Thus was born the rack and tray.  The tray model is generic and needs to be customized for whatever configuration of components you want.  The tray will then slide into a rack.  The racks have holes so that multiple racks can be stacked and attached together.  Also panels can be attached to the racks.  The panels can contain things like switches, LEDs, LCDs, or whatever.  Currently the library of parts is rather small, but will grow.

## Notes
Most (currently all) of these models are created using OpenSCAD.  They are defined as modules with the module names prefixed by "bbs\_" just to reduce the chance of name collisions with anything else that you might be doing.

I expect to be adding more items as time passes.

The measurements for these items are based on data that I have.  Either measurements that I’ve made or found somewhere.  Even if the measurements are absolutely correct, due to variations in 3D printers, you may need to make minor adjustments for things to work on your 3D printer.

## Contents
### rack
This is the basic rack.  it is a parametrized OpenSCAD module.  The parameter controls the height of the rack.

### tray
This is the generic tray.  It will need to be customized for your application.

### panel
This is a generic panel.  The hight of the panel is a parameter.  It will need to be customized for your application, or you can just use it as a blank panel.

### arduino
This file is a collector for all Arduino models.  Currently, it contains an Arduino Mega 2560 which will probably work for the Due and the Mega.

### boards
This file contains models for miscellaneous boards.

### connectors
This currently contains a module to generate cutouts for D-Sub connectors.  Connector sizes 1-6 are supported.  I have tested sizes 1 (9-pin) and 3 (25-pin) with connectors that I have and they seem to work.  Some size adjustments were made.

Additional types of connectors may be added.

### constants
This contains a number of functions that return common values.  Examples are standard sizes for screw/bolt holes.

### half\_breadboad
This is a block representing a half-sized breadboard.  It is most useful for doing fit checking.  This may be expanded to have a more detailed model and more breadboard sizes.

This will probably be expanded to contain other breadboards.

### lcd\_20x4
This is a module for a 20 character by 4 line LCD.  This is modeled on AdaFruit part number 198.  Included are a model for the LCD module and cutouts for panel mounting the module.

### lcd7
This is a model for a 7 inch diagonal LCD touchscreen available from AdaFruit.

### leds
This is a couple of modules for cutouts for LEDs and plastic springs to hold them.  The models are parametrized based on the LED size.

### pins
Contains a module for generating header pins.

### RaspberryPi
This file contains modules for all Raspberry Pi models.  Currently, it contains a model of the Raspberry Pi 3.  It’s not finished, but works OK for basic interference checks.  Also included is a module to generate the standoffs and mounting holes.  It will probably also work for a Raspberry Pi 2.

### rj45
Currently incomplete.  This will eventually be a module for a clip in RJ45 connector and a module for a mount for it to clip into.

### shapes
This is a collection of modules for miscellaneous shapes used in other modules.

### switches
This contains modules for switches and panel cutouts for the switches.  More switches will likely be added.

### t\_extrusion
This contains models for things to work with aluminum t-slotted extrusions.  Mounting holes are based on a 20mm X 20mm grid.
