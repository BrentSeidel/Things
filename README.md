# Things
A collection of models that can be 3D printed

## Origin
I have been playing around with a number of embedded computers like Raspberry PIs and Arduinos and my desk has been getting rather cluttered.  So I thought, wouldn't it be greate if I could attach some of these circuit boards onto a tray and slide it into some sort of a rack.  A quick look around revealed nothing like this.  There were a number of boxes for the Raspberry Pi, but they just gave a bit of protection to the Pi and didn't solve the clutter problem.  The other issue is that sometimes I want to use a Pi with a couple of other little boards and sometimes I want to hook up some things to an Arduino.  So, the solution needs to be flexible.

Thus was born the rack and tray.  The tray model is generic and needs to be customized for whatever configuration of components you want.  The tray will then slide into a rack.  The racks have holes so that multiple racks can be stacked and attached together.  Also panels can be attached to the racks.  The panels can contain things like switches, LEDs, LCDs, or whatever.  Currently the library of parts is rather small, but will grow.

## Notes
Most (currently all) of these models are created using OpenSCAD.  They are defined as modules with the module names prefixed by "bbs\_" just to reduce the chance of name collisions with anything else that you might be doing.

## Contents
### Rack
This is the basic rack.  it is a parametarized OpenSCAD module.  The parameter controls the height of the rack.

### Tray
This is the generic tray.  It will need to be customized for your application.

### Panel
This is a generic panel.  The hight of the panel is a parameter.  It will need to be customized for your application, or you can just use it as a blank panel.
