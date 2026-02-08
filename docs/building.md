# Building Your Own Cat
So, you want to build your own Cat Bot?  This document details the entire process, from 3D printing the chassis parts, to wiring, to assembly.  I would recommend first taking a look at the [bill of materials](./bom.md) to get an idea of all the parts you'll need.  Next, read through this page to get an idea of the entire process before starting.

Most importantly, have fun and enjoy your new combat friend!

<center>
<img src="./images/catastrophe.jpg" alt="A pile of 3D printed cat bot parts stacked in the middle of a very messy desk" width="70%">
</center>

## Contents
- [Building Your Own Cat](#building-your-own-cat)
  - [Contents](#contents)
- [Gather and Make Parts](#gather-and-make-parts)
  - [Wheels](#wheels)
  - [Colours](#colours)
  - [Next Part](#next-part)
- [Wiring](#wiring)
- [Assembly](#assembly)
  - [Bottom Lid](#bottom-lid)
  - [Chassis and Weapon](#chassis-and-weapon)

# Gather and Make Parts
Most of the structural parts of the bot are designed to be 3D printed (or molded), while the rest can be purchased.  An overview can be found in the BOM, but here are the full details.

> [!NOTE]
> When printing parts for the bot, pre-rendered renders of each part are provided in the [`renders`](../renders/) directory.  But if you're making changes to the OpenSCAD source, make sure to clone this repo's submodules (specifically [MCAD](https://github.com/openscad/MCAD), which this project depends on).  You can do this by running `git submodule update --init --recursive`.

<table>

  <tr>
    <td style="width: 150px;"><img alt="Picture of the bot's main chassis.  It's in the shape of an outline of a cat's head" src="./images/chassis.jpg" width="150px"></td>
    <td>The <b>main chassis</b> is what holds the two lids together, and absorbs most of the battles' impacts.  It's designed to be printed in TPU, ideally at 100% infill</td>
  </tr>

  <tr>
    <td style="width: 150px;"><img alt="Picture of the bottom lid.  It's in the shape of a cat's head but has lots of mounting parts attached to it" src="./images/bottom_lid_predye.jpg" width="150px"></td>
    <td>The <b>bottom lid</b> is what all of the internals of the bot are mounted onto.  Currently this should also be printed in TPU, but it's possible this will change in the future to something more rigid</td>
  </tr>

  <tr>
    <td style="width: 150px;"><img alt="Picture of the top lid.  It's in the shape of a cat's head and is flat" src="./images/top_lid_predye.jpg" width="150px"></td>
    <td>The <b>top lid</b> looks like the bottom lid but is flat on the inside.  This can be printed as one TPU piece, but...</td>
  </tr>

  <tr>
    <td style="width: 150px;"><img alt="Picture of the split top lid parts - two cat head shaped parts (one pink and one white) laid beside each other." src="./images/top_lid_split.jpg" width="150px"></td>
    <td>...I would recommend printing the <b>"split" lid</b> - this consists of a TPU top half and a PLA bottom half, which are glued together.  This helps to prevent lid bending when the contents are squished in.</td>
  </tr>

  <tr>
    <td style="width: 150px;"><img alt="Two micro metal mounting brackets, with the left one upside down to show the inside" src="./images/micro_metal_mounts_square.jpg" width="150px"></td>
    <td>The two motors are held on to the bottom lid with <b>micro metal brackets</b>, usually printed in something solid like PLA or PETG</td>
  </tr>

  <tr>
    <td style="width: 150px;"><img alt="Picture of four LED sims.  They look like translucent cones" src="./images/led_shim.jpg" width="150px"></td>
    <td><p>The bot's status LED is held into the chassis with a <b>LED shim</b>.  As well as securing the LED into the chassis, the shim provides a flat bit on the outside of the chassis so the LED doesn't need to poke through.  The light is diffused through the shim to the outside.</p>
    <p>I would print this out of translucent PLA, with 0% infill and a circular top/bottom infill pattern (to prevent the light from being too scattered).</p>
    </td>
  </tr>

</table>

> [!TIP]
> When printing the bottom lid, it's recommended that you print the area around the weapon mounting holes with 100% infill.
>
> When using Cura, you can create a support blocking cube, position and scale it around the mounting holes, then specify it to have 100% infill at overlapping areas in the Per-Model settings.
>
> <img alt="Screenshot of cura showing lid_bottom.stl with a support blocker cube over the weapon mounting holes" src="./images/weapon_infill_1.png" height="200px">
> <img alt="Screenshot of cura's per-model settings menu showing the cube set to have 100% infill, with mesh type set to 'Modify settings for overlaps'" src="./images/weapon_infill_2.png" height="200px">
> <img alt="Screenshot of the result of slicing, only showing up to the 8th layer; the area around the mounting holes is at 100% infill while the rest of the model is at 20% infill" src="./images/weapon_infill_3.png" height="200px">

## Wheels
While you can use any 42mm diameter wheels, Cat Bot includes some funky custom wheels.  These have three parts:

<table>

  <tr>
    <td><img alt="Picture of a wheel hub.  It's a black circular thing with five spokes and five 'lips' sticking out of the sides" src="./images/wheel_hub.jpg" width="150px"></td>
    <td>The main hub, printed in TPU at around 20% - 50% infill depending on how squishy you want it</td>
  </tr>

  <tr>
    <td><img alt="Picture of four axle inserts.  They look like small but long rectangles with a D-shaped hole in the centre" src="./images/axle_insert.jpg" width="150px"></td>
    <td>The axle insert, printed in something rigid like PETG</td>
  </tr>

  <tr>
    <td><img alt="Picture of the wheel tread.  It's a hollow cylinder with chevrons on the outside" src="./images/wheel_tread.jpg" width="150px"></td>
    <td>The grippy tread of the wheel, cast from two-part silicone</td>
  </tr>

</table>


To assemble the wheel, push a hub insert into the square hole in the hub.  Pull the tyre onto the hub, and make sure to align the lips on the hub with the gaps on the inside of the tyres

<center>
<img alt="Picture of the assembled wheel" src="./images/wheel_complete.jpg" height="300px">
</center>

> [!TIP]
> **Casting the tyres**
> 
> To make the mold for the tyres, I used Cura's Mold Mode.  Load the original tyre STL into Cura, then search for Mold Mode in the slicer settings and enable it.
>
> <center><img src="./images/wheel-1.png" alt="A screenshot showing the tyre model loaded into Cura" height="200px"> <img src="./images/wheel-3.png" alt="A screenshot showing Cura's mold mode setting" height="200px"> <img src="./images/wheel-4.png" alt="A screenshot showing the model now being sliced as mold" height="200px"></center>
> 
> This should make a mold, but there won't be a bottom.  To solve this, select the model and go to the translate (move) menu.  Untick "Drop Down Model", and set the Z offset to 5mm.  This should raise the model up, creating a base for the mold.
> 
> <center><img src="./images/wheel-5.png" alt="A screenshot showing Cura's model translation settings" height="200px"> <img src="./images/wheel-6.png" alt="A screenshot showing the model now rendering as a mold with a bottom" height="200px"></center>
> 
> After printing the mold, mix your silicone (I found I needed about 15g per wheel) and pour it slowly in.  Since the mold is a big circle, I tried to move the pour around its circumference to ensure it was even.  I found that over the first few hours after pouring, the silicone level would fall, so you might need to top it up after a bit.
> 
> <center><img src="./images/wheel-7.jpg" alt="A picture of the tyre mold full of silicone" height="300px"></center>
>
> Once the silicone has cured, removing the tyre can be a bit tricky.  If you're careful, you can pry it out using a flat thing like a flathead screwdriver and a pair of flat tweezers.

## Colours
The colours of everything are up to you but generally I print the chassis and wheels in black, the top lid in pink, and the bottom lid in blue.  

It's kinda hard to get pink and light blue TPU, so generally I print them in white and dye them using **synthetic** clothes dye (eg: Rit) (non-synthetic dye doesn't seem to work that well).  The process I found worked was:

- pour half a bottle of dye into medium sized tub (around 3 litres ish) full of water.  
- place the part into the dye water and use a wooden block to hold the part under the water, making sure the block was only touching internal surfaces since they would end up discoloured.
- leave the part for about an hour, and maybe give it an extra 30 mins if it looked like it needed it.

<center>
<img src="./images/rit.jpg" alt="A picture of two bottles of synthetic clothes dye - one pink and one blue" height="300px">
<img src="./images/dye_tubs.jpg" alt="A picture of two tubs full of dye dissolved in water, along with a drying mat, all placed on a large plastic mat" height="300px">
</center>

## Next Part
With everything printed, molded, and dyed, you're ready to move onto the next part!

<center>
<img src="./images/parts.jpg" alt="A picture of all the finished parts of the bot laid out on a desk" width="70%">
</center>

# Wiring
Within the hobby of combat robotics there are many different ways to wire a cat.  While Cat Bot is designed around a few specific design choices (eg: motor type), most of the wiring is really up to you!  

This section of the document describes the wiring that I used for the electronics, but it's more of a guide than a ruleset.  Feel free to deviate from or ignore this section completely!  (Just make sure your wiring can handle the amount of power your bot is expected to draw, and has the appropriate failsafes!)

<center>
<img src="./images/wiring.drawio.svg" alt="Diagram showing the wiring of the bot's electronics" width="70%">
</center>

In general there are a few main components.  Please refer to the BOM for info on specific component choices, but broadly there should be:

- the **battery** supplies power to everything.  I used a 2 cell, 300mAh LiPo battery, but I would have gone with a 3 cell if there was more space inside the bot.  Make sure your battery can source enough current for all the other components to use.
- the **power switch** is recommended since you can cut the power in an emergency without having to undo all the lid screws
- the **drive ESC** supplies power and drives the two main brushed drive motors.  You could use two ESCs (one for each motor) but dual ESCs are a lot more convenient
- the **weapon ESC** drives the brushless spinner weapon motor
- the **receiver** receives input from a remote controller.  Most bots use a RX module that supports a standard flight controller, but in my case I used an ESP32 with some [custom firmware](https://github.com/atctwo/bbrx) for use with a Bluetooth gamepad
- a **power led** to show when the bot is running
  - generally this can be put across the battery power with an appropriate resistor, but in my Cat Bot build the power LED is [controlled by the ESP32](https://github.com/atctwo/bbrx/blob/main/docs/usage/status_led.md) to show controller connection status

# Assembly
Now that you have everything printed and wired, you can start to assemble the bot!  Make sure you have a screwdriver and a way to insert brass inserts.

## Bottom Lid
The base of the bot is the bottom lid - this is the part onto which all the motors and electronics are mounted.  In between the wheel walls, there are two blocks each with four holes - these are for M3 brass inserts.  Both motors are held in place by a [micro metal bracket](../renders/wheels/micro_metal_bracket_v2.stl), which screw into place using four pan-head M3 screws each.  

<center>
<img src="./images/bottom_lid_inserts.jpg" alt="A picture of the bottom lid with brass inserts inserted into the motor mount holes" height="300px">
<img src="./images/micro_metal_mounts.jpg" alt="Two micro metal mounting brackets, with the left one upside down to show the inside" height="300px">
</center>

At this point, attach the wheels to the motors, and mount the motors to the bottom lid using the brackets.  It's a good idea to attach the wheels to the motor axles before attaching them to the bottom lid, since it's quite difficult to add or remove the wheels once the motors are mounted.

<center>
<img src="./images/motor-mount-1.jpg" alt="A picture the left drive motor mounted into the chassis, with the axle sticking out into the walled-off area for wheels" height="300px">
<img src="./images/motor-mount-2.jpg" alt="A top down view of the motor and wheel mounted into the chassis" height="300px">
</center>

The weapon motor mounts onto the front of the bottom lid.  There are four countersunk holes for M2 screws to go through the lid into the motor.  Make sure to put a bit of threadlock on them to mitigate the effects of vibration.

There are an additional two holes around the motor - these are to secure the edge of the lid to the chassis, so we'll look at these later.  The wires of the motor can be kept out of the way by slotting them into the slot in the protective wall around the spinner area.  

<center>
<img src="./images/weapon_motor_mounting.jpg" alt="A picture showing the weapon motor mounted onto the front of the bottom lid, with its wires routed through a small hole in the protective wall" height="300px">
</center>
<center>
<img src="./images/weapon_mounting_screws.drawio.svg" alt="A picture showing the screws around the bottom of the weapon motor, and what they are used for" height="300px">
</center>

Don't attach the weapon blade yet, since it's easier to install once the main chassis is installed.

## Chassis and Weapon
I would install the power switch into the chassis at this point because it can be tricky to do later.  Press the two M2.5 brass inserts into the holes around the switch hole in the main chassis.  The switch will probably end up quite recessed, so I would colour the top of the actuator with a little bit of paint so you can see it.  You may also need to use a flathead screwdriver to actuate the switch once it's installed.

<center>
<img src="./images/switch-assembly-mounted.jpg" alt="A picture of the power switch assembly mounted into the chassis" height="300px">
<img src="./images/switch-recessed.jpg" alt="A side-on view of the switch from the outside of the chassis, showing the blue painted top of the switch actuator" height="300px">
</center>

In theory, you could run the whole bot with just the bottom lid, but then your electronics would be exposed.  As such, the bottom lid attaches to the main chassis via four M3 screws, into four M3 brass inserts in the chassis corners.  Make sure you get the chassis the right way up, since the spinner blade has to protrude from the hole in the front.  

<center>
<img src="./images/chassis-inserts.jpg" alt="A picture of the chassis with brass inserts inserted into the corners and switch hole" height="300px">
<img src="./images/electronics.jpg" alt="A picture of the bot with the top lid removed, with all the electronics tightly packed in" height="300px">
</center>

When the bottom lid is printed from TPU, the forces produced by the spinner can cause the whole weapon assembly to "wobble".  This can lead to the weapon damaging the opening in the chassis, and possibly reducing the overall force of the weapon.  That's why there are two extra M2 holes around the motor!  These allow the edge of the bottom lid to be fastened onto two M2x3 inserts in the "nubs" protruding from the inside of the chassis. 

<center>
<img src="./images/nubs-ext.jpg" alt="The nubs as viewed from below, showing the brass inserts" height="300px">
<img src="./images/nubs-int.jpg" alt="The nubs as viewed from inside the chassis with the bottom lid attached, with the weapon motor sitting between them" height="300px">
</center>

Speaking of the spinner, the blade can be attached to the spinner motor by sliding it in through the hole in the front of the bot, and fastening with four M2 screws.  These screws should ideally have a large / thick head to be able to handle the forces put on them by the weapon.  I would also apply some (lots of?) threadlock since these screws will very quickly vibrate out.

<center>
<img src="./images/weapon_mounting.jpg" alt="A picture of the weapon mounted onto the weapon motor" height="300px">
</center>

For the status LED, a 5mm LED should friction fit into the shim, which should friction fit into the hole on the side of the chassis.  If either interfaces are a bit loose, but a wee bit of super glue on when inserting.

<center>
<img src="./images/status_led_mounting.jpg" alt="A closeup of the status LED mounted to the chassis via the shim" height="300px">
</center>

Finally, the top lid can be attached to the main chassis in the same way the bottom lid was.

<center>
<img src="./images/top_lid_mounting.jpg" alt="A picture of the bot with the top lid attached to the chassis" height="300px">
</center>

That's it!  Connect a battery, flip the switch, pair your controller, and have fun :3