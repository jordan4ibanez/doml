module tests.axis_angle_test;


import std.stdio;
import tests.dunit_tests;

import axis_angle_4d;
import quaternion_d;

import Math = math;


/*
 * The MIT License
 *
 * Copyright (c) 2015-2022 JOML.
 @#$@# Translated by jordan4ibanez
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

void testAxisAngle() {

    writeln("\nBEGIN AXIS ANGLE\n");

    
    writeln("TESTING ANGLE IDETINTY QUATERNION");

    AxisAngle4d a = AxisAngle4d().set(Quaterniond());
    assertEquals(AxisAngle4d(0, 0, 0, 1), a);
    a = AxisAngle4d().set(Quaterniond(2.035E-9,4.715E-10,-9.166E-11,1.000E+0));
    assertEquals(AxisAngle4d(0, 0, 0, 1), a);

    writeln("PASSED!");
    writeln("TESTING ANGLE NORMALIZATION");

    AxisAngle4d a1 = AxisAngle4d(Math.toRadians(20), 1.0, 0.0, 0.0);
    AxisAngle4d a2 = AxisAngle4d(Math.toRadians(380), 1.0, 0.0, 0.0);
    assertEquals(a1.angle, a2.angle, 100_000); // 0.00001 (1E-5f)

    a1 = AxisAngle4d( Math.toRadians(-20), 1.0, 0.0, 0.0);
    a2 = AxisAngle4d( Math.toRadians(-380.0), 1.0, 0.0, 0.0);
    assertEquals(a1.angle, a2.angle, 100_000); // 0.00001 (1E-5f)

    a1 = AxisAngle4d( Math.toRadians(-20.0f) * 10.0, 1.0, 0.0, 0.0);
    a2 = AxisAngle4d( Math.toRadians(-380.0f) * 10.0, 1.0, 0.0, 0.0);

    assertEquals(a1.angle, a2.angle, 100_000); // 0.00001 (1E-5f)
    writeln("PASSED!");
}