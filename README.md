# doml
A D math library for OpenGL rendering calculations.

JOML translated to D with a few changes:

- Only doubles, no floats, you can cast down but you can't cast back up (precision loss). There are still integer structures

- No readonly views (Vector3DC etc)

- Simplified using D's strengths

Note: set all switches to final so they automatically get out of bounds errors

Need to make most things references so they work like in java

Tests needing translation:
quaterniond
rayaabbintersection