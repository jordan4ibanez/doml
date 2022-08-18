module tests.math_test;

import Math = math;
import std.stdio;
import rounding_mode;
import tests.custom_assertion;

import vector_2d;
import vector_3d;
import vector_4d;

import rounding_mode;

/*
 * The MIT License
 *
 * Copyright (c) 2018-2022 JOML.
 @#$%@$% Translated by jordan4ibanez
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
 * Tests for Math.vecLength - addressing <a href="https://github.com/JOML-CI/JOML/issues/131">Issue #131</a>
 *
 * @author F. Neurath
 */

void test_math() {
    writeln("\nBEGIN MATH LIBRARY\n");

    writeln("BEGINNING CLAMP TEST");
    // Integer value tests
    assert(Math.clamp(10,20,0) == 10);
    assert(Math.clamp(10,20,12) == 12);
    assert(Math.clamp(10,20,30) == 20);

    // float value tests
    assertEquals(Math.clamp(10f,20f,0f),10f, 1000); // .0001f 10000
    assertEquals(Math.clamp(10f,20f,12f),12f, 1000); // .0001f
    assertEquals(Math.clamp(10f,20f,30f),20f, 1000); // .0001f

    // double value tests
    assertEquals(Math.clamp(10.0,20.0,0.0),10.0, 1000);
    assertEquals(Math.clamp(10.0,20.0,12.0),12.0, 1000);
    assertEquals(Math.clamp(10.0,20.0,30.0),20.0, 1000);
    writeln("PASSED!");

    
    writeln("BEGINNING VECTOR LENGTH TEST");
    // Integer value tests
    assertEquals(5., Vector2d.length(4, 3), 1000);
    assertEquals(6., Vector3d.length(2, -4, 4), 1000);
    assertEquals(3., Vector4d.length(2, -1, 0, -2), 1000);

    // Floating point value tests
    assertEquals(Math.sqrt(.41), Vector2d.length(.4, -.5), 1000);
    assertEquals(Math.sqrt(.3), Vector3d.length(.1, -.5, .2), 1000);
    assertEquals(1., Vector4d.length(.5, .5, .5, .5), 1000);

    writeln("PASSED!");
    writeln("BEGINNING VECTOR INFINITE TEST");

    
    // floating point value tests
    assertFalse(Math.isFinite(float.nan));
    assertTrue(Math.isFinite(1.0f));
    assertTrue(Math.isFinite(-1.0f));
    assertFalse(Math.isFinite(float.infinity));
    assertFalse(Math.isFinite(-float.infinity));

    // double point value tests
    assertFalse(Math.isFinite(double.nan));
    assertTrue(Math.isFinite(1.0));
    assertTrue(Math.isFinite(-1.0));
    assertFalse(Math.isFinite(double.infinity));
    assertFalse(Math.isFinite(-double.infinity));

    writeln("PASSED!");
    writeln("BEGINNING ROUNDING TEST");
    
    // TRUNCATE
    assertEquals(0, Math.roundUsing(0.2f, RoundingMode.TRUNCATE));
    assertEquals(0, Math.roundUsing(0.5f, RoundingMode.TRUNCATE));
    assertEquals(0, Math.roundUsing(0.9f, RoundingMode.TRUNCATE));
    assertEquals(1, Math.roundUsing(1.0f, RoundingMode.TRUNCATE));
    assertEquals(0, Math.roundUsing(-0.2f, RoundingMode.TRUNCATE));
    assertEquals(0, Math.roundUsing(-0.5f, RoundingMode.TRUNCATE));
    assertEquals(0, Math.roundUsing(-0.9f, RoundingMode.TRUNCATE));
    assertEquals(-1, Math.roundUsing(-1.0f, RoundingMode.TRUNCATE));
    // CEILING
    assertEquals(1, Math.roundUsing(0.2f, RoundingMode.CEILING));
    assertEquals(1, Math.roundUsing(0.5f, RoundingMode.CEILING));
    assertEquals(1, Math.roundUsing(0.9f, RoundingMode.CEILING));
    assertEquals(1, Math.roundUsing(1.0f, RoundingMode.CEILING));
    assertEquals(0, Math.roundUsing(-0.2f, RoundingMode.CEILING));
    assertEquals(0, Math.roundUsing(-0.5f, RoundingMode.CEILING));
    assertEquals(0, Math.roundUsing(-0.9f, RoundingMode.CEILING));
    assertEquals(-1, Math.roundUsing(-1.0f, RoundingMode.CEILING));
    // FLOOR
    assertEquals(0, Math.roundUsing(0.2f, RoundingMode.FLOOR));
    assertEquals(0, Math.roundUsing(0.5f, RoundingMode.FLOOR));
    assertEquals(0, Math.roundUsing(0.9f, RoundingMode.FLOOR));
    assertEquals(1, Math.roundUsing(1.0f, RoundingMode.FLOOR));
    assertEquals(-1, Math.roundUsing(-0.2f, RoundingMode.FLOOR));
    assertEquals(-1, Math.roundUsing(-0.5f, RoundingMode.FLOOR));
    assertEquals(-1, Math.roundUsing(-0.9f, RoundingMode.FLOOR));
    assertEquals(-1, Math.roundUsing(-1.0f, RoundingMode.FLOOR));
    // HALF_DOWN
    assertEquals(0, Math.roundUsing(0.2f, RoundingMode.HALF_DOWN));
    assertEquals(0, Math.roundUsing(0.5f, RoundingMode.HALF_DOWN));
    assertEquals(1, Math.roundUsing(0.9f, RoundingMode.HALF_DOWN));
    assertEquals(1, Math.roundUsing(1.0f, RoundingMode.HALF_DOWN));
    assertEquals(0, Math.roundUsing(-0.2f, RoundingMode.HALF_DOWN));
    assertEquals(0, Math.roundUsing(-0.5f, RoundingMode.HALF_DOWN));
    assertEquals(-1, Math.roundUsing(-0.9f, RoundingMode.HALF_DOWN));
    assertEquals(-1, Math.roundUsing(-1.0f, RoundingMode.HALF_DOWN));
    // HALF_UP
    assertEquals(0, Math.roundUsing(0.2f, RoundingMode.HALF_UP));
    assertEquals(1, Math.roundUsing(0.5f, RoundingMode.HALF_UP));
    assertEquals(1, Math.roundUsing(0.9f, RoundingMode.HALF_UP));
    assertEquals(1, Math.roundUsing(1.0f, RoundingMode.HALF_UP));
    assertEquals(0, Math.roundUsing(-0.2f, RoundingMode.HALF_UP));
    assertEquals(-1, Math.roundUsing(-0.5f, RoundingMode.HALF_UP));
    assertEquals(-1, Math.roundUsing(-0.9f, RoundingMode.HALF_UP));
    assertEquals(-1, Math.roundUsing(-1.0f, RoundingMode.HALF_UP));
    // HALF_EVEN
    assertEquals(0, Math.roundUsing(0.2f, RoundingMode.HALF_EVEN));
    assertEquals(0, Math.roundUsing(0.5f, RoundingMode.HALF_EVEN));
    assertEquals(1, Math.roundUsing(0.9f, RoundingMode.HALF_EVEN));
    assertEquals(1, Math.roundUsing(1.0f, RoundingMode.HALF_EVEN));
    assertEquals(0, Math.roundUsing(-0.2f, RoundingMode.HALF_EVEN));
    assertEquals(0, Math.roundUsing(-0.5f, RoundingMode.HALF_EVEN));
    assertEquals(-1, Math.roundUsing(-0.9f, RoundingMode.HALF_EVEN));
    assertEquals(-1, Math.roundUsing(-1.0f, RoundingMode.HALF_EVEN));
    writeln("PASSED!");
}