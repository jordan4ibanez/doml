# DOML
A D math library for OpenGL rendering calculations.

Discord link: https://discord.gg/dRPyvubfyg

JOML translated to D with a few changes:

- Only doubles, no floats, you can cast down but you can't cast back up (precision loss). There are still integer structures

- That's not a joke, search float in vscode, you're going to get these two and 4 keywords from builtin libraries in math.d

- No readonly views (Vector3DC etc)

- Simplified using D's strengths

- Only structs, no GC impact

This was a monumental effort, if you find anything wrong, please help me fix it.

There are a few missing elements, they will (hopefully) be translated in later on.

You should be able to follow a LWJGL tutorial (mostly, remember it's structs now) and get a functioning OpenGL/Vulkan/Metal/DirectX/Software Rendering program.

Also hi.

Todo:
- Make EVERYTHING gettable as a raw array!