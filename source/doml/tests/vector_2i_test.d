module doml.tests.vector_2i_test;

import std.stdio;
import doml.tests.dunit_tests;
import doml.vector_2i;
import doml.vector_2d;
import doml.rounding_mode;

/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 JOML.
 ^%$^%$^ Translated by jordan4ibanez
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
 * Test class for {@link Vector2i}.
 */
unittest {

    writeln("\nBEGINNING GENERAL VECTOR2I TEST\n");

    Vector2i v1 = Vector2i(0.0,.6, RoundingMode.FLOOR);
    Vector2i v2 = Vector2i(9.5,1.6, RoundingMode.FLOOR);

    Vector2i v3 = Vector2i(Vector2d(0.0,.6), RoundingMode.FLOOR);
    Vector2i v4 = Vector2i(Vector2d(9.5,1.6), RoundingMode.FLOOR);

    Vector2i v5 = Vector2i(0.0,.6, RoundingMode.CEILING);
    Vector2i v6 = Vector2i(9.5,1.6, RoundingMode.CEILING);

    Vector2i v7 = Vector2i(Vector2d(0.0,.6), RoundingMode.CEILING);
    Vector2i v8 = Vector2i(Vector2d(9.5,1.6), RoundingMode.CEILING);

    assertEquals(v1, Vector2i(0,0));
    assertEquals(v2, Vector2i(9,1));

    assertEquals(v3, Vector2i(0,0));
    assertEquals(v4, Vector2i(9,1));

    assertEquals(v5, Vector2i(0,1));
    assertEquals(v6, Vector2i(10,2));

    assertEquals(v7, Vector2i(0,1));
    assertEquals(v8, Vector2i(10,2));

    writeln("PASSED!");
}
