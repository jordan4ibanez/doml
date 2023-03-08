module doml.tests.vector_3i_test;

import std.stdio;

import Math = doml.math;
import doml.tests.dunit_tests;
import doml.rounding_mode;

import doml.vector_3i;
import doml.vector_2d;
import doml.vector_3d;

/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 JOML.
 %$%#^ Translated by jordan4ibanez
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

/**
 * Test class for {@link Vector3i}.
 */
unittest {

    writeln("\nBEGINNING VECTOR3I TESTING\n");

    writeln("TESTING VECTOR3I ROUNDING");

    {
        Vector3i v1 = Vector3i(0.0, .6, .7, RoundingMode.FLOOR);
        Vector3i v2 = Vector3i(9.5, 1.6, 5.0, RoundingMode.FLOOR);

        Vector3i v3 = Vector3i(Vector3d(0.0, .6, .7), RoundingMode.FLOOR);
        Vector3i v4 = Vector3i(Vector3d(9.5, 1.6, 5.0), RoundingMode.FLOOR);

        Vector3i v5 = Vector3i(0.0, .6, .7, RoundingMode.CEILING);
        Vector3i v6 = Vector3i(9.5, 1.6, 5.0, RoundingMode.CEILING);

        Vector3i v7 = Vector3i(Vector3d(0.0, .6, .7), RoundingMode.CEILING);
        Vector3i v8 = Vector3i(Vector3d(9.5, 1.6, 5.0), RoundingMode.CEILING);


        assertEquals(v1, Vector3i(0, 0, 0));
        assertEquals(v2, Vector3i(9, 1, 5));

        assertEquals(v3, Vector3i(0, 0, 0));
        assertEquals(v4, Vector3i(9, 1, 5));

        assertEquals(v5, Vector3i(0, 1, 1));
        assertEquals(v6, Vector3i(10, 2, 5));

        assertEquals(v7, Vector3i(0, 1, 1));
        assertEquals(v8, Vector3i(10, 2, 5));
    }

    writeln("PASSED!");

    writeln("TESTING VECTOR3I ROUNDING VECTOR2D");

    {
        Vector3i v1 = Vector3i(Vector2d(0.0, .6), .7, RoundingMode.FLOOR);
        Vector3i v2 = Vector3i(Vector2d(9.5, 1.6), 5.0, RoundingMode.FLOOR);

        Vector3i v3 = Vector3i(Vector2d(0.0, .6), .7, RoundingMode.FLOOR);
        Vector3i v4 = Vector3i(Vector2d(9.5, 1.6), 5.0, RoundingMode.FLOOR);

        Vector3i v5 = Vector3i(Vector2d(0.0, .6), .7, RoundingMode.CEILING);
        Vector3i v6 = Vector3i(Vector2d(9.5, 1.6), 5.0, RoundingMode.CEILING);


        assertEquals(v1, Vector3i(0, 0, 0));
        assertEquals(v2, Vector3i(9, 1, 5));

        assertEquals(v3, Vector3i(0, 0, 0));
        assertEquals(v4, Vector3i(9, 1, 5));

        assertEquals(v5, Vector3i(0, 1, 1));
        assertEquals(v6, Vector3i(10, 2, 5));
    }

    writeln("PASSED!");

    writeln("TESTING OF EMPTY CONSTRUCTOR");

    {

        Vector3i v = Vector3i();
        assertEquals(0, v.x);
        assertEquals(0, v.y);
        assertEquals(0, v.z);
    }

    writeln("PASSED!");

    writeln("TESTING TRIPLE CONSTRUCTOR");

    {
        Vector3i v = Vector3i(1, 2, 3);
        assertEquals(1, v.x);
        assertEquals(2, v.y);
        assertEquals(3, v.z);
    }

    writeln("PASSED!");

    writeln("\nINITIALIZING SCOPED TEST VARIABLES\n");

    Vector3i v1 = Vector3i(1, 3, 7);
    Vector3i v2 = Vector3i(2, 6, 14);
    Vector3i v3 = Vector3i(3, 9, 21);

    writeln("TESTING COPY CONSTRUCTOR");

    {
        Vector3i copy = Vector3i(v1);
        assertEquals(v1.x, copy.x);
        assertEquals(v1.y, copy.y);
        assertEquals(v1.z, copy.z);
    }

    writeln("PASSED!");

    writeln("TESTING EQUALS");

    {
        assertFalse(v1.equals(v2));
        assertTrue(v1.equals(Vector3i(v1.x, v1.y, v1.z)));
        assertFalse(v1.equals(Vector3i()));
    }

    writeln("PASSED!");

    writeln("TESTING ADD TRIPLE");

    {
        Vector3i v = Vector3i(v1);
        v.add(v2.x, v2.y, v2.z);
        assertEquals(v3, v);

        v = Vector3i(v1);
        v.add(v2);
        assertEquals(v3, v);
    }

    writeln("PASSED!");

    writeln("TESTING ADD TO SELF");

    {
        Vector3i v = Vector3i(v1);
        v.add(v);
        assertEquals(Vector3i(2, 6, 14), v);
    }

    writeln("PASSED!");

    writeln("TESTING MIN");

    {
        Vector3i v = Vector3i(v1);
        v.min(Vector3i(v1.z, v1.y, v1.x));
        assertEquals(Math.min(v1.x, v1.z), v.x);
        assertEquals(v1.y, v.y);
        assertEquals(Math.min(v1.x, v1.z), v.z);
    }

    writeln("PASSED!");

    writeln("TESTING MAX");
    

    {
        Vector3i v = Vector3i(v1);
        v.max(Vector3i(v1.z, v1.y, v1.x));
        assertEquals(Math.max(v1.x, v1.z), v.x);
        assertEquals(v1.y, v.y);
        assertEquals(Math.max(v1.x, v1.z), v.z);
    }

    writeln("PASSED!");

    writeln("TESTING MANHATTAN DISTANCE");

    {
        assertEquals(0, Vector3i().gridDistance(Vector3i()));
        assertEquals(1, Vector3i().gridDistance(Vector3i(1, 0, 0)));
        assertEquals(1, Vector3i().gridDistance(Vector3i(0, 0, 1)));
        assertEquals(1, Vector3i().gridDistance(Vector3i(0, 1, 0)));
        assertEquals(3, Vector3i().gridDistance(Vector3i(1, 1, 1)));
        assertEquals(3, Vector3i().gridDistance(Vector3i(1, -1, 1)));
    }

    writeln("PASSED!");
}
