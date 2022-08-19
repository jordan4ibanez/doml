module tests.ray_aabb_intersect_test;

import ray_aabb_intersection;
import tests.dunit_tests;
import std.stdio;

/*
 * The MIT License
 *
 * Copyright (c) 2016-2021 JOML.
 &^^%$ Translated by jordan4ibanez
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
 * Tests for the {@link RayAabIntersection}.
 * 
 * @author Kai Burjack
 */
void testRayAABBIntersect() {

    writeln("\nTESTING RAY AABB INTERSECT\n");

    // testPX
    {
        RayAabIntersection r = RayAabIntersection();
        r.set(-1, 0, 0, 1, 0, 0);
        assertTrue(r.test(-0.5f, -0.5f, -0.5f, 0.5f, 0.5f, 0.5f));
    }

    // testPY
    {
        RayAabIntersection r = RayAabIntersection();
        r.set(0, -1, 0, 0, 1, 0);
        assertTrue(r.test(-0.5f, -0.5f, -0.5f, 0.5f, 0.5f, 0.5f));
    }

    // testPZ
    {
        RayAabIntersection r = RayAabIntersection();
        r.set(0, 0, -1, 0, 0, 1);
        assertTrue(r.test(-0.5f, -0.5f, -0.5f, 0.5f, 0.5f, 0.5f));
    }

    // testNX
    {
        RayAabIntersection r = RayAabIntersection();
        r.set(1, 0, 0, -1, 0, 0);
        assertTrue(r.test(-0.5f, -0.5f, -0.5f, 0.5f, 0.5f, 0.5f));
    }

    // testNY
    {
        RayAabIntersection r = RayAabIntersection();
        r.set(0, 1, 0, 0, -1, 0);
        assertTrue(r.test(-0.5f, -0.5f, -0.5f, 0.5f, 0.5f, 0.5f));
    }

    // testNZ
    {
        RayAabIntersection r = RayAabIntersection();
        r.set(0, 0, 1, 0, 0, -1);
        assertTrue(r.test(-0.5f, -0.5f, -0.5f, 0.5f, 0.5f, 0.5f));
    }

    // testPXPY
    {
        RayAabIntersection r = RayAabIntersection();
        r.set(-1, -1, 0, 1, 1, 0);
        assertTrue(r.test(-0.5f, -0.5f, -0.5f, 0.5f, 0.5f, 0.5f));
    }

    // testPXEdge
    {
        RayAabIntersection r = RayAabIntersection();
        r.set(-1, 0.5f, 0, 1, 0, 0);
        assertTrue(r.test(-0.5f, -0.5f, -0.5f, 0.5f, 0.5f, 0.5f));
    }

    // testPXEdgeDelta
    {
        RayAabIntersection r = RayAabIntersection();
        r.set(-1, 0.500001f, 0, 1, 0, 0);
        assertFalse(r.test(-0.5f, -0.5f, -0.5f, 0.5f, 0.5f, 0.5f));
    }

    // testNXEdge
    {
        RayAabIntersection r = RayAabIntersection();
        r.set(-1, -0.5f, 0, 1, 0, 0);
        assertTrue(r.test(-0.5f, -0.5f, -0.5f, 0.5f, 0.5f, 0.5f));
    }

    // testNXEdgeDelta
    {
        RayAabIntersection r = RayAabIntersection();
        r.set(-1, -0.500001f, 0, 1, 0, 0);
        assertFalse(r.test(-0.5f, -0.5f, -0.5f, 0.5f, 0.5f, 0.5f));
    }
    writeln("PASSED!");
}
