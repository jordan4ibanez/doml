# doml
A D math library for OpenGL rendering calculations.

JOML translated to D with a few changes:

- Only doubles, no floats, you can cast down but you can't cast back up (precision loss). There are still integer structures

- No readonly views (Vector3DC etc)

- Simplified using D's strengths

Currently Translating: Vector2i test

Note: set all switches to final so they automatically get out of bounds errors