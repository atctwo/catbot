# Building Your Own Cat
So, you want to build your own Cat Bot?  This document will detail the steps required to do that.  First, take a look at the [bill of materials](./bom.md), and make sure you have all the parts you'll need.

<center>
<img src="./images/catastrophe.jpg" alt="A pile of 3D printed cat bot parts stacked in the middle of a very messy desk" width="70%">
</center>

# Gather and Make Parts
Most of the structural parts of the bot are designed to be 3D printed (or molded), while the rest can be purchased.  Full details are in the BOM but here's a quick summary of the main parts you'll need to print or make.

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
    <td style="width: 150px;"></td>
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
todo :p

# Assembly
Now that you have everything printed and wires, you can start to assemble the bot!  Make sure you have a screwdriver and a way to insert brass inserts.

## Bottom Lid
The base of the bot is the bottom lid - this is the part onto which all the motors and electronics are mounted.  In between the wheel walls, there are two blocks each with four holes - these are for M3 brass inserts.  Both motors are held in place by a [micro metal bracket](../renders/micro_metal_bracket.stl), which screw into place using four pan-head M3 screws each.  

The weapon motor mounts onto the front of the bottom lid.  There are four countersunk holes for M2 screws to go through the lid into the motor.  There are an additional two holes around the motor - these are to secure the edge of the lid to the chassis, so we'll look at these later.  The wires of the motor can be kept out of the way by slotting them into the slot in the protective wall around the spinner area.  

Don't attach the weapon blade yet, since it's easier to install once the main chassis is installed.

## Wheels
At this point, mount the wheels into the bot using the micro metal mounts.  It's a good idea to attach the wheels to the motor axles before attaching them to the bottom lid, since it's quite difficult to remove the wheels once the motors are mounted.  If you are using the custom wheels, first insert the inserts into the big square hole in the hub, then cut enough grippy stuff to wrap around the wheels to make treads.  I usually attach the treads using thin double sided tape.

## Chassis and Weapon
Now, press the two M2.5 brass inserts into the holes around the switch hole in the main chassis.  I would also install the switch at this point because it can be tricky to do later.

In theory, you could run the whole bot with just the bottom lid, but then your electronics would be exposed.  As such, the bottom lid attaches to the main chassis via four M3 screws, into four M3 brass inserts in the chassis corners.  Make sure you get the chassis the right way up, since the spinner blade has to protrude from the hole in the front.  

When the bottom lid is printed from TPU, the forces produced by the spinner can cause the whole weapon assembly to "wobble".  This can lead to the weapon damaging the opening in the chassis, and possibly reducing the overall force of the weapon.  That's why there are two extra M2 holes around the motor!  These allow the edge of the bottom lid to be fastened onto two M2x3 inserts in the "nubs" protruding from the inside of the chassis. 

Speaking of the spinner, the blade can be attached to the spinner motor by sliding it in through the hole in the front of the bot, and fastening with four M2 screws.  These screws should ideally have a large / thick head to be able to handle the forces put on them by the weapon.

## Electronics and Finishing Touches
With all the motors attached to the lid, the electronics can be added.  To be honest, I mounted all of the driver boards and wiring using a lot of Blu Tack.  There are more elegant ways to do this but it works well!

Finally, the top lid can be attached to the main chassis in the same way the bottom lid was.

That's it!  Connect a battery, flip the switch, pair your controller, and have fun :3