# Cat Shaped Battle Bot
This repo contains the design files for **Cat Bot** (sometimes known as **Scratch**).  This is a ~410g battlebot I made that looks like a cat.  It was designed for the Robotics Society at Queen's University Belfast, for competition at my local battlebots group [Hacker Battlebots](https://x.com/HackrBattleBots).

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
- a [BOM](./bom.md) is included for each of the supported configurations
- external-facing screws are countersunk because it looks cool
- around 410 grams, and around 150mm x 150mm x 40mm [TODO: check this]

# Configurations
This bot was originally designed with two configurations: Little Cat and Big Cat.  As time went on, I only focused development on Little Cat so Big Cat kinda got left behind.  As such, it is deprecated and untested.  If you want to try Big Cat, check out git tag `v1.0.3`!

# Building
So, you want to build your own Cat Bot?  This section will detail the steps required to do that.  First, take a look at the [bill of materials](./bom.md).

The base of the bot is **the bottom lid** - this is the part onto which all the motors and electronics are mounted.  In between the wheel walls, there's a big block with eight holes in it - these are for M3 brass inserts.  Both motors are held in place by a [micro metal bracket](./renders/micro_metal_bracket.stl), which screw into place using four pan-head M3 screws each.  

The weapon motor mounts onto the front of the bottom lid.  There are four countersunk holes for M2 screws to go through the lid into the motor.  The wires of the motor can be kept out of the way by slotting them into the slot in the protective wall around the spinner area.  Don't attach the weapon blade yet, since it's easier to install once the main chassis is installed.

> [!TIP]
> When printing the bottom lid, it's recommended that you print the area around the weapon mounting holes with 100% infill.
>
> When using Cura, you can create a support blocking cube, position and scale it around the mounting holes, then specify it to have 100% infill at overlapping areas in the Per-Model settings.
>
> <img alt="Screenshot of cura showing lid_bottom.stl with a support blocker cube over the weapon mounting holes" src="./extras/weapon_infill_1.png" height="200px">
> <img alt="Screenshot of cura's per-model settings menu showing the cube set to have 100% infill, with mesh type set to 'Modify settings for overlaps'" src="./extras/weapon_infill_2.png" height="200px">
> <img alt="Screenshot of the result of slicing, only showing up to the 8th layer; the area around the mounting holes is at 100% infill while the rest of the model is at 20% infill" src="./extras/weapon_infill_3.png" height="200px">

At this point, mount the wheels into the bot using the micro metal mounts.  It's a good idea to attach the wheels to the motor axles before attaching them to the bottom lid, since it's quite difficult to remove the wheels once the motors are mounted.

Now, press the two M2.5 brass inserts into the holes around the switch hole in the main chassis.  I would also install the switch at this point because it can be tricky to do later.

In theory, you could run the whole bot with just the bottom lid, but then your electronics would be exposed.  As such, the bottom lid attaches to the main chassis via four M3 screws, into four M3 brass inserts in the chassis corners.  Make sure you get the chassis the right way up, since the spinner blade has to protrude from the hole in the front.  Speaking of the spinner, the blade can be attached to the spinner motor by sliding it in through the hole in the front of the bot, and fastening with four M2 screws.

With all the motors attached to the lid, the electronics can be added.  To be honest, I mounted all of the driver boards and wiring using a lot of Blu Tack.  There are more elegant ways to do this but it works well!

Finally, the top lid can be attached to the main chassis in the same way the bottom lid was.

Optionally, the TPU shielding can be installed by simply sliding it over the main chassis.  It should friction fit over the main chassis.  I usually start by sliding the hole in the front of the shielding over the protruding weapon, then dragging the shielding down and over the bot.

> [!NOTE]
> When printing parts for the bot, pre-rendered renders of each part are provided in the [`renders`](./renders/) directory.  But if you're making changes to the OpenSCAD source, make sure to clone this repo's submodules (specifically [MCAD](https://github.com/openscad/MCAD), which this project depends on).  You can do this by running `git submodule update --init --recursive`.

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