module tests.matrix_2d_test;

import std.stdio;
import tests.dunit_tests;
import Math = math;
import matrix_2d;
import vector_2d;

/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 Richard Greenlees
 ^$%# Translated by jordan4ibanez
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

void testMatrix2d() {

    // This is going to be lumped in to one thing, assert tells you what line anyways

    writeln("\nBEGINNING VECTOR2D TESTING\n");
    
    // test mul
    {
        assertTrue(
            Matrix2d(87, 124, 129, 184).equals(Matrix2d(2, 3, 5, 7).mul(Matrix2d(11, 13, 17, 19)), 0.001)
        );
    }

    // test mul local
    {
        assertTrue(
            Matrix2d(87, 124, 129, 184).equals(Matrix2d(11, 13, 17, 19).mulLocal(Matrix2d(2, 3, 5, 7)), 0.001)
        );
    }

    // test determinant
    {
        assertTrue(-1.0 == Matrix2d(2, 3, 5, 7).determinant());
    }

    // test invert
    {
        assertTrue(
            Matrix2d(-19.0/12, 13.0/12, 17.0/12, -11.0/12).equals(Matrix2d(11, 13, 17, 19).invert(), 0.001)
        );
    }

    // test rotation
    {
        immutable double angle = Math.PI / 4.0;
        Matrix2d mat = Matrix2d().rotation(angle);
        immutable double coord = 1 / Math.sqrt(2);
        assertTrue(
            Vector2d(coord, coord).equals(mat.transform(Vector2d(1, 0)), 0.001)
        );
    }

    // test normal
    {
        assertTrue(
            Matrix2d(2, 3, 5, 7).invert().transpose().equals(Matrix2d(2, 3, 5, 7).normal(), 0.001)
        );
    }

    // test positive x
    {
        Matrix2d inv = Matrix2d(2, 3, 5, 7).invert();
        Vector2d expected = inv.transform(Vector2d(1, 0)).normalize();
        assertTrue(
            expected.equals(Matrix2d(2, 3, 5, 7).positiveX(Vector2d()), 0.001)
        );
    }

    // test positive y
    {
        Matrix2d inv = Matrix2d(11, 13, 17, 19).invert();
        Vector2d expected = inv.transform(Vector2d(0, 1)).normalize();
        assertTrue(
            expected.equals(Matrix2d(11, 13, 17, 19).positiveY(Vector2d()), 0.001)
        );
    }

    writeln("PASSED!");
}
