# doml
A D math library for OpenGL rendering calculations.

JOML translated to D with a few changes:

- Only doubles, no floats, you can cast down but you can't cast back up (precision loss). There are still integer structures

- No readonly views (Vector3DC etc)

- Simplified using D's strengths

This was a monumental effort, if you find anything wrong, please help me fix it.

There are a few missing elements, they will (hopefully) be translated in later on.