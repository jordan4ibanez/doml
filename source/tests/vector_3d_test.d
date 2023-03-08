module tests.vector_3d_test;

import std.stdio;
import vector_3d;
import tests.dunit_tests;
import Math = math;

/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 JOML.
 *&&$^ Translated by jordan4ibanez
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
 * Test class for {@link vector3}.
 * @author Sebastian Fellner
 */
unittest {

    writeln("\nBEGIN GENERAL vector3 TEST\n");

    vector3 testVec1 = vector3(2, -9.37, 5.892);
    vector3 testVec2 = vector3();
    
    // angle(v, v) should give 0
    double angle = testVec1.angle(testVec1);
    assertEquals(0, angle, MANY_OPS_AROUND_ZERO_PRECISION_DOUBLE);
    
    // angle(v, -v) should give Math.PI
    testVec1.negate(testVec2);
    angle = testVec1.angle(testVec2);
    assertEquals(Math.PI, angle, MANY_OPS_AROUND_ZERO_PRECISION_DOUBLE);

    writeln("PASSED!");
}
