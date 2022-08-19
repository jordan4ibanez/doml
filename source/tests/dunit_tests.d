module tests.dunit_tests;

import std.stdio;

import Math = math;

import matrix_2d;
import matrix_3d;
import matrix_3x2d;
import matrix_4d;
import matrix_4x3d;
import vector_2d;
import vector_2i;
import vector_3d;
import vector_3i;
import vector_4d;
import vector_4i;
import axis_angle_4d;
import quaternion_d;


// This was written SPECIFICALLY to get the precision capabilities of JUNIT

// I'll call it, DUNIT-mini

private bool verbose = false;

void setTestVerbose(bool newValue) {
    verbose = newValue;
}

void assertEquals(AxisAngle4d a, AxisAngle4d b) {
    assert(a.equals(b));
}

/*
void assertEquals(AxisAngle4d a, AxisAngle4d b) {
    writeln("M1: ", a, " | M2: ", b)
    assert(a.equals(b));
}*/

void assertEquals(Vector3d a, Vector3d b) {
    if (verbose) {
        writeln("X1 = ", a.x, " | X2 = ", b.x);
        writeln("Y1 = ", a.y, " | Y2 = ", b.y);
        writeln("Z1 = ", a.z, " | Z2 = ", b.z);
        writeln("");
    }
    assert(a.equals(b));
}

void assertEquals(Vector3i a, Vector3i b) {
    if (verbose) {
        writeln("X1 = ", a.x, " | X2 = ", b.x);
        writeln("Y1 = ", a.y, " | Y2 = ", b.y);
        writeln("Z1 = ", a.z, " | Z2 = ", b.z);
        writeln("");
    }
    assert(a.equals(b));
}

void assertEquals(Vector4d a, Vector4d b) {
    if (verbose) {
        writeln("X1 = ", a.x, " | X2 = ", b.x);
        writeln("Y1 = ", a.y, " | Y2 = ", b.y);
        writeln("Z1 = ", a.z, " | Z2 = ", b.z);
        writeln("W1 = ", a.z, " | W2 = ", b.z);
        writeln("");
    }
    assert(a.equals(b));
}

void assertEquals(Vector4i a, Vector4i b) {
    if (verbose) {
        writeln("X1 = ", a.x, " | X2 = ", b.x);
        writeln("Y1 = ", a.y, " | Y2 = ", b.y);
        writeln("Z1 = ", a.z, " | Z2 = ", b.z);
        writeln("W1 = ", a.z, " | W2 = ", b.z);
        writeln("");
    }
    assert(a.equals(b));
}


void assertEquals(double a, double b, long precision) {
    long c = cast(long)(a * precision);
    long d = cast(long)(b * precision);
    if (verbose) {
        writeln("Value1: ", a, " | Value2: ", b);
    }
    assert(c == d);
}

void assertEquals(double a, double b, double precision) {
    long MAX_PRECISION = cast(long)(1 / precision);
    long c = cast(long)(a * MAX_PRECISION);
    long d = cast(long)(b * MAX_PRECISION);
    if (verbose) {
        writeln("Value1: ", a, " | Value2: ", b);
    }
    assert(c == d);
}

void assertEquals(double a, double b) {
    if (verbose) {
        writeln("Value1: ", a, " | Value2: ", b);
    }
    assert(a == b);
}

void assertFalse(bool value) {
    assert(value == false);
}

void assertTrue(bool value) {
    assert(value == true);
}


/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 JOML.
 $#^&^ Translated by jordan4ibanez
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
 * Utilities for testing.
 * @author Sebastian Fellner
 */

/**
    * Precision for methods that do many operations calculating with a magnitude around zero, giving less accuracy.
    */
immutable float MANY_OPS_AROUND_ZERO_PRECISION_FLOAT = 0.001f;
/**
    * Precision for methods that do basic operations calculating with a magnitude around zero.
    */
immutable float STANDARD_AROUND_ZERO_PRECISION_FLOAT = 0.000000000000000001f;

/**
    * Precision for methods that do many operations calculating with values with a magnitude around zero, giving less accuracy.
    */
immutable double MANY_OPS_AROUND_ZERO_PRECISION_DOUBLE = 0.00001;
/**
    * Precision for methods that do basic operations calculating with a magnitude around zero.
    */
immutable double STANDARD_AROUND_ZERO_PRECISION_DOUBLE = 0.000000000000000000001;

/**
    * Return whether two floating point numbers are equal. They are considered equal when their difference is less than or equal to the precision.
    * @param a the first number
    * @param b the second number
    * @param precision if abs(a - b) <= precision, a and b are considered equal
    * @return whether a and b are equal
    * @see #floatCompare(float, float, float)
    */
bool floatEqual(float a, float b, float precision) {
    return Math.abs(a - b) <= precision;
}

/**
    * Compare two floating point numbers. They are considered equal when their difference is less than or equal to the precision.
    * @param a the first number
    * @param b the second number
    * @param precision if abs(a - b) <= precision, a and b are considered equal
    * @return 0 if a == b, 1 if a > b, -1 if a < b
    * @see #floatEqual(float, float, float)
    */
public static int floatCompare(float a, float b, float precision) {
    if (Math.abs(a - b) <= precision)
        return 0;
    else if (a > b)
        return 1;
    else
        return -1;
}

/**
    * Return whether two double-precision floating point numbers are equal. They are considered equal when their difference is 
    * less than or equal to the precision.
    * @param a the first number
    * @param b the second number
    * @param precision if abs(a - b) <= precision, a and b are considered equal
    * @return whether a and b are equal
    * @see #floatCompare(double, double, double)
    */
public static bool doubleEqual(double a, double b, double precision) {
    return Math.abs(a - b) <= precision;
}

/**
    * Compare two double-precision floating point numbers. They are considered equal when their difference is 
    * less than or equal to the precision.
    * @param a the first number
    * @param b the second number
    * @param precision if abs(a - b) <= precision, a and b are considered equal
    * @return 0 if a == b, 1 if a > b, -1 if a < b
    * @see #floatEqual(double, double, double)
    */
public static int doubleCompare(double a, double b, double precision) {
    if (Math.abs(a - b) <= precision)
        return 0;
    else if (a > b)
        return 1;
    else
        return -1;
}


/**
    * Return whether two quaternions are equal. They are considered equal when their difference is 
    * less than or equal to the precision.
    * @param a the first quaternion
    * @param b the second quaternion
    * @param precision if abs(a.[comp] - b.[comp]) <= precision for every component comp (x, y, z, w), a and b are considered equal
    * @return whether a and b are equal
    */
public static bool quatEqual(Quaterniond a, Quaterniond b, double precision) {
    return doubleEqual(a.x, b.x, precision)
        && doubleEqual(a.y, b.y, precision)
        && doubleEqual(a.z, b.z, precision)
        && doubleEqual(a.w, b.w, precision);
}


/**
    * Assert that both quaternions are equal with respect to the given delta.
    *
    * @param expected
    * @param actual
    * @param delta
    */
public static void assertQuaterniondEquals(Quaterniond expected, Quaterniond actual, double delta) {
    assertEquals(expected.x, actual.x, delta);
    assertEquals(expected.y, actual.y, delta);
    assertEquals(expected.z, actual.z, delta);
    assertEquals(expected.w, actual.w, delta);
}


/**
    * Assert that both matrices are equal with respect to the given delta.
    * 
    * @param m1
    * @param m2
    * @param delta
    */
public static void assertMatrix4dEquals(Matrix4d m1, Matrix4d m2, double delta) {
    assertEquals(m1.m00, m2.m00, delta);
    assertEquals(m1.m01, m2.m01, delta);
    assertEquals(m1.m02, m2.m02, delta);
    assertEquals(m1.m03, m2.m03, delta);
    assertEquals(m1.m10, m2.m10, delta);
    assertEquals(m1.m11, m2.m11, delta);
    assertEquals(m1.m12, m2.m12, delta);
    assertEquals(m1.m13, m2.m13, delta);
    assertEquals(m1.m20, m2.m20, delta);
    assertEquals(m1.m21, m2.m21, delta);
    assertEquals(m1.m22, m2.m22, delta);
    assertEquals(m1.m23, m2.m23, delta);
    assertEquals(m1.m30, m2.m30, delta);
    assertEquals(m1.m31, m2.m31, delta);
    assertEquals(m1.m32, m2.m32, delta);
    assertEquals(m1.m33, m2.m33, delta);
}

void assertEquals(Vector2i a, Vector2i b) {
    if (verbose) {
        writeln("X1 = ", a.x, " | X2 = ", b.x);
        writeln("Y1 = ", a.y, " | Y2 = ", b.y);
        writeln("");
    }
    assert(a.equals(b));
}


/**
    * Assert that both matrices are equal with respect to the given delta.
    * 
    * @param m1
    * @param m2
    * @param delta
    */
public static void assertMatrix3dEquals(Matrix3d m1, Matrix3d m2, double delta) {
    assertEquals(m1.m00, m2.m00, delta);
    assertEquals(m1.m01, m2.m01, delta);
    assertEquals(m1.m02, m2.m02, delta);
    assertEquals(m1.m10, m2.m10, delta);
    assertEquals(m1.m11, m2.m11, delta);
    assertEquals(m1.m12, m2.m12, delta);
    assertEquals(m1.m20, m2.m20, delta);
    assertEquals(m1.m21, m2.m21, delta);
    assertEquals(m1.m22, m2.m22, delta);
}

/**
    * Assert that both matrices are equal with respect to the given delta.
    * 
    * @param m1
    * @param m2
    * @param delta
    */
public static void assertMatrix4x3dEquals(Matrix4x3d m1, Matrix4x3d m2, double delta) {
    assertEquals(m1.m00, m2.m00, delta);
    assertEquals(m1.m01, m2.m01, delta);
    assertEquals(m1.m02, m2.m02, delta);
    assertEquals(m1.m10, m2.m10, delta);
    assertEquals(m1.m11, m2.m11, delta);
    assertEquals(m1.m12, m2.m12, delta);
    assertEquals(m1.m20, m2.m20, delta);
    assertEquals(m1.m21, m2.m21, delta);
    assertEquals(m1.m22, m2.m22, delta);
    assertEquals(m1.m30, m2.m30, delta);
    assertEquals(m1.m31, m2.m31, delta);
    assertEquals(m1.m32, m2.m32, delta);
}


/**
    * Assert that both vectors are equal with respect to the given delta.
    * 
    * @param expected
    * @param actual
    * @param delta
    */
public static void assertVector4dEquals(Vector4d expected, Vector4d actual, double delta) {
    assertEquals(expected.x, actual.x, delta);
    assertEquals(expected.y, actual.y, delta);
    assertEquals(expected.z, actual.z, delta);
    assertEquals(expected.w, actual.w, delta);
}


/**
    * Assert that both quaternions are equal with respect to the given delta.
    * 
    * @param expected
    * @param actual
    * @param delta
    */
public static void assertVector3dEquals(Vector3d expected, Vector3d actual, double delta) {
    assertEquals(expected.x, actual.x, delta);
    assertEquals(expected.y, actual.y, delta);
    assertEquals(expected.z, actual.z, delta);
}


/**
    * Assert that both vectors are equal with respect to the given delta.
    *
    * @param expected
    * @param actual
    * @param delta
    */
public static void assertVector2dEquals(Vector2d expected, Vector2d actual, double delta) {
    assertEquals(expected.x, actual.x, delta);
    assertEquals(expected.y, actual.y, delta);
}
