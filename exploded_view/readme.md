# Exploded View
This directory contains stuff to make an animated exploded view of the cat bot!

First, open `cat_bot.scad`.  Go to View -> Animate; this should open the animation bar below the 3D render pane.  Next, provide value for the FPS and Steps fields; normally I use 60 FPS and 240 steps.  Once you set these parameters the animation will start, and it will re-render the model for each step, so it can get quite laggy.  Once it's started, check the Dump Pictures box.  This will take a screenshot of each frame, and dump into the root of this repository's directory.  

After a few animation cycles and all the frames have been dumped, the Dump Pictures checkbox will uncheck itself.  Set the FPS to 0 and copy all the frame0000.png files into this directory.  To reset the model to it's unexploded state, reset the Time field to 0, then hide the animation bar.

> [!NOTE] Looping the animation
> The animation code is designed to make the animation loop automatically.  To achieve this, the model is at it's most exploded at time `$t=0.5`, and is not exploded at all at `$t=0` *and* `$t=1.0`.

Next, run [`make_exploded_view.sh`](./make_exploded_view.sh).  This will call `ffmpeg` and compile all the screenshots (specifically all .png files) into one mp4 file.  The rendered video is output as [`exploded_view.mp4`](./exploded_view.mp4):

<video controls src="exploded_view.mp4" title="Exploded View of Little Cat" loop></video>