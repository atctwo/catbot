# Cat Shaped Battle Bot
This repo contains the design files for the Cat Battlebot family.  This is a mostly-antweight-class battlebot which is shaped like a cat.  It was designed by Queen's University Belfast's Robotics Society (QRS) in 2024.

# Features
- it looks like a cat :)
- the cat's head is actually a plough which you can use to push opponents out of the arena
- the cat's tongue is actually a spinner weapon so you can lick other opponents
- you can decide which would be more useful based on your opponent
- driven by two wheels in the middle of the chassis for protection, which stick out of both sides of the bot so it can operate flipped
  - the QRS logo on the lids indicate the direction of "forward" for the motors, depending on which side is up
- has an optional shield which covers the main chassis (designed to be 3D printed out of TPU)
- internal walls to protect components from the wheels and the very fast spinner weapon
- designed using OpenSCAD, so *almost everything* is parametric and can be modified
- a BOM is included for each of the supported configurations
- external-facing screws are countersunk because it looks cool

## Planned Features
- hole in a lid which can be used with a long pokey thing to toggle a power switch

# Configurations
The default values in `cat_bot.scad` create a bot called **Little Cat**, which is the main bot for this repo.
- it's 150x150mm
- driven by two micro metal motors, preferably high torque ones to make pushing other bots easier

Since everything's parametric, additional profiles are included in this repo.  For now, the only other profile is **Big Cat**
- 200x200mm
- driven by a Tamiya Double Gearbox

# Building
First, consider which configuration you want to build.  Second, look at [the Bill of Materials](./bom.md) to find out what you need to assemble your cat.

Each configuration consists of 3-4 main components.  The base of the model is **the bottom lid** - this is the part onto which all the motors and electronics are mounted.  In between the wheel walls, there's a big block with holes in it - these are for M3 brass inserts.  With Big Cat, the Tamiya gearbox's two mounting holes screw onto the two inserts beside the wheels.  With Little Cat, each motor is held in place by a [micro metal bracket](./renders/micro_metal_bracket.stl), which screw into place using four M3 screws.  The spinner motor also screws into the bottom lid, but I haven't got that far yet :P

In theory, you could run the whole bot with just the bottom lid, but then your electronics would be exposed.  As such, the bottom lid attaches to **the main chassis** via four screws.  Make sure you get the chassis the right way up, since the spinner blade has to protrude from the hole in the front.

Optionally, the TPU shielding can be installed by simply sliding it over the main chassis (probably, I haven't actually tested this yet).

Once the bottom lid is attached to the chassis, and the TPU shielding has been installed if desired, the spinner blade can be attached to the spinner motor by sliding it in through the hole in the front of the bot.  Finally, the top lid can be attached to the main chassis in the same way the bottom lid was.

# Repo Structure
- [`exploded_view/`](./exploded_view/) - location to store images and render videos of an exploded view animation
- [`imports/`](./imports/) - external files imported by `cat_bot.scad` (eg: an SVG of the QRS logo)
- [`MCAD/`](./MCAD/) - submodule to MCAD, an OpenSCAD library dependency
- [`renders/](./renders/) - exported STL versions of each part of each version of each configuration
- [`bom.md`](./bom.md) - bill of materials for each config
- [`cat_bot.json`](./cat_bot.json) - OpenSCAD configuration profiles
- [`cat_bot.scad`](./cat_bot.scad) - the main OpenSCAD source code file
- [`micro_metal_bracket.scad`](./micro_metal_bracket.scad) - a little bracket for the micro metal motors used by Little Cat
- [`readme.md`](./readme.md) - this readme!