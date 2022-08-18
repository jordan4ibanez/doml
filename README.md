# doml
A D math library for OpenGL rendering calculations.

JOML translated to D with a few changes:

- Only doubles, no floats, you can cast down but you can't cast back up (precision loss). There are still integer structures

- No readonly views (Vector3DC etc)

- Simplified using D's strengths

Currently Translating: Vector_2i

## If you find anything wrong in any of the translations, open a commit or a problem :)