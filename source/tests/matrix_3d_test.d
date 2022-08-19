module tests.matrix_3d_test;

import std.stdio;
import Math = math;
import tests.dunit_tests;
import matrix_3d;
import vector_3d;

/*
 * The MIT License
 *
 * Copyright (c) 2020-2021 JOML.
 ^%$#$% Translated by jordan4ibanez
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
 *
 * @author mhameed
 */
void testMatrix3d() {

    writeln("\nBEGINNING TEST OF MATRIX3D\n");

    /**
     * Test of setRow method, of class Matrix3d.
     */
    {
        int row = 0;
        double x = 0.0;
        double y = 1.0;
        double z = 2.0;

        Matrix3d instance = Matrix3d();
        Matrix3d result = instance.setRow(row, x, y, z);

        Vector3d inRow = Vector3d(x, y, z);
        Vector3d outRow = Vector3d();
        
        result.getRow(row, outRow);
        assertEquals(inRow, outRow);
    }

    // testGet
    {
        Matrix3d m = Matrix3d(1, 2, 3, 4, 5, 6, 7, 8, 9);
        for (int c = 0; c < 3; c++)
            for (int r = 0; r < 3; r++)
                assertEquals(c*3+r+1, m.get(c, r), 0);
    }

    // testSet
    {
        assertMatrix3dEquals(Matrix3d().zero().set(0, 0, 3), Matrix3d(3, 0, 0, 0, 0, 0, 0, 0, 0), 0);
        assertMatrix3dEquals(Matrix3d().zero().set(0, 1, 3), Matrix3d(0, 3, 0, 0, 0, 0, 0, 0, 0), 0);
        assertMatrix3dEquals(Matrix3d().zero().set(0, 2, 3), Matrix3d(0, 0, 3, 0, 0, 0, 0, 0, 0), 0);
        assertMatrix3dEquals(Matrix3d().zero().set(1, 0, 3), Matrix3d(0, 0, 0, 3, 0, 0, 0, 0, 0), 0);
        assertMatrix3dEquals(Matrix3d().zero().set(1, 1, 3), Matrix3d(0, 0, 0, 0, 3, 0, 0, 0, 0), 0);
        assertMatrix3dEquals(Matrix3d().zero().set(1, 2, 3), Matrix3d(0, 0, 0, 0, 0, 3, 0, 0, 0), 0);
        assertMatrix3dEquals(Matrix3d().zero().set(2, 0, 3), Matrix3d(0, 0, 0, 0, 0, 0, 3, 0, 0), 0);
        assertMatrix3dEquals(Matrix3d().zero().set(2, 1, 3), Matrix3d(0, 0, 0, 0, 0, 0, 0, 3, 0), 0);
        assertMatrix3dEquals(Matrix3d().zero().set(2, 2, 3), Matrix3d(0, 0, 0, 0, 0, 0, 0, 0, 3), 0);
    }



    // From here below was Matrix3d

    /**
    *
    * @author mhameed
    */


    /**
     * Test of setRow method, of class Matrix3d.
     */
     // testSetRow_4args
    {
        int row = 0;
        double x = 0.0;
        double y = 1.0;
        double z = 2.0;
        Matrix3d instance = Matrix3d();
        Vector3d inRow = Vector3d(x, y, z);
        Vector3d outRow = Vector3d();
        Matrix3d result = instance.setRow(row, x, y, z);
        result.getRow(row, outRow);
        assertEquals(inRow, outRow);
    }

    // testMatrix3dTranspose
    {
        double m00 = 1, m01 = 2, m02 = 3;
        double m10 = 5, m11 = 6, m12 = 7;
        double m20 = 9, m21 = 10, m22 = 11;

        Matrix3d m = Matrix3d(m00, m01, m02, m10, m11, m12, m20, m21, m22);
        Matrix3d expect = Matrix3d(m00, m10, m20, m01, m11, m21, m02, m12, m22);
        assertMatrix3dEquals(Matrix3d(m).transpose(), expect, 1E-5);
        // This test originally constructed a new object using Java's weak memory management
        // Fixed by creating a temporary structure here, uses default constructor
        Matrix3d testUnit = Matrix3d();
        assertMatrix3dEquals(Matrix3d(m).transpose(testUnit/*new Matrix3d()*/), expect, 1E-5);
    } // *Poof* testUnit is gone

    // testInvert
    {
        Matrix3d invm = Matrix3d();
        Matrix3d m = Matrix3d();

        m.rotateXYZ(0.23, 1.523, -0.7234).invert(invm);

        Vector3d orig = Vector3d(4, -6, 8);

        Vector3d v = Vector3d();
        Vector3d w = Vector3d();

        m.transform(orig, v);
        invm.transform(v, w);

        // Precision was too low for this test, raised up
        assertVector3dEquals(orig, w, STANDARD_AROUND_ZERO_PRECISION_DOUBLE);

        invm.invert();
        assertMatrix3dEquals(m, invm, 1E-3);
    }

    // testGet
    {
        Matrix3d m = Matrix3d(1, 2, 3, 4, 5, 6, 7, 8, 9);
        for (int c = 0; c < 3; c++)
            for (int r = 0; r < 3; r++)
                assertEquals(c*3+r+1, m.get(c, r), 0);
    }

    // testSet
    {
        assertMatrix3dEquals(Matrix3d().zero().set(0, 0, 3), Matrix3d(3, 0, 0, 0, 0, 0, 0, 0, 0), 0);
        assertMatrix3dEquals(Matrix3d().zero().set(0, 1, 3), Matrix3d(0, 3, 0, 0, 0, 0, 0, 0, 0), 0);
        assertMatrix3dEquals(Matrix3d().zero().set(0, 2, 3), Matrix3d(0, 0, 3, 0, 0, 0, 0, 0, 0), 0);
        assertMatrix3dEquals(Matrix3d().zero().set(1, 0, 3), Matrix3d(0, 0, 0, 3, 0, 0, 0, 0, 0), 0);
        assertMatrix3dEquals(Matrix3d().zero().set(1, 1, 3), Matrix3d(0, 0, 0, 0, 3, 0, 0, 0, 0), 0);
        assertMatrix3dEquals(Matrix3d().zero().set(1, 2, 3), Matrix3d(0, 0, 0, 0, 0, 3, 0, 0, 0), 0);
        assertMatrix3dEquals(Matrix3d().zero().set(2, 0, 3), Matrix3d(0, 0, 0, 0, 0, 0, 3, 0, 0), 0);
        assertMatrix3dEquals(Matrix3d().zero().set(2, 1, 3), Matrix3d(0, 0, 0, 0, 0, 0, 0, 3, 0), 0);
        assertMatrix3dEquals(Matrix3d().zero().set(2, 2, 3), Matrix3d(0, 0, 0, 0, 0, 0, 0, 0, 3), 0);
    }

    writeln("PASSED!");
}