module tests.matrix_4x3d_test;


import tests.dunit_tests;
import matrix_4x3d;
import vector_3d;
import Math = math;
import std.stdio;

/*
 * The MIT License
 *
 * Copyright (c) 2016-2021 JOML.
 %$#%#$% Translated by jordan4ibanez
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
 * Tests for the {@link Matrix4x3d} class.
 * 
 * @author Kai Burjack
 */
unittest {

    writeln("\nBEGINNING MATRIX4X3D TESTING\n");

    // testLookAt
    {
        Matrix4x3d m1, m2;
        m1 = Matrix4x3d().lookAt(0, 2, 3, 0, 0, 0, 0, 1, 0);
        m2 = Matrix4x3d().translate(0, 0, -cast(double) Math.sqrt(2 * 2 + 3 * 3)).rotateX(
                cast(double) Math.atan2(2, 3));
        assertMatrix4x3dEquals(m1, m2, 1E-5f);
        m1 = Matrix4x3d().lookAt(3, 2, 0, 0, 0, 0, 0, 1, 0);
        m2 = Matrix4x3d().translate(0, 0, -cast(double) Math.sqrt(2 * 2 + 3 * 3))
                .rotateX(cast(double) Math.atan2(2, 3)).rotateY(cast(double) Math.toRadians(-90));
        assertMatrix4x3dEquals(m1, m2, 1E-4f);
    }

    // testPositiveXRotateY
    {
        Vector3d dir = Vector3d();
        Matrix4x3d m = Matrix4x3d()
                .rotateY(cast(double) Math.toRadians(90));
        m.positiveX(dir);
        assertVector3dEquals(Vector3d(0, 0, 1), dir, 1E-7f);
    }

    // testPositiveYRotateX
    {
        Vector3d dir = Vector3d();
        Matrix4x3d m = Matrix4x3d()
                .rotateX(cast(double) Math.toRadians(90));
        m.positiveY(dir);
        assertVector3dEquals(Vector3d(0, 0, -1), dir, 1E-7f);
    }

    // testPositiveZRotateX
    {
        Vector3d dir = Vector3d();
        Matrix4x3d m = Matrix4x3d()
                .rotateX(cast(double) Math.toRadians(90));
        m.positiveZ(dir);
        assertVector3dEquals(Vector3d(0, 1, 0), dir, 1E-7f);
    }

    // testPositiveXRotateXY
    {
        Vector3d dir = Vector3d();
        Matrix4x3d m = Matrix4x3d()
                .rotateY(cast(double) Math.toRadians(90)).rotateX(cast(double) Math.toRadians(45));
        m.positiveX(dir);
        assertVector3dEquals(Vector3d(0, 1, 1).normalize(), dir, 1E-7f);
    }

    // testPositiveXYZLookAt
    {
        Vector3d dir = Vector3d();
        Matrix4x3d m = Matrix4x3d()
                .lookAt(0, 0, 0, -1, 0, 0, 0, 1, 0);
        m.positiveX(dir);
        assertVector3dEquals(Vector3d(0, 0, -1).normalize(), dir, 1E-7f);
        m.positiveY(dir);
        assertVector3dEquals(Vector3d(0, 1, 0).normalize(), dir, 1E-7f);
        m.positiveZ(dir);
        assertVector3dEquals(Vector3d(1, 0, 0).normalize(), dir, 1E-7f);
    }

    // testPositiveXYZSameAsInvert
    {
        Vector3d dir = Vector3d();
        Vector3d dir2 = Vector3d();
        Matrix4x3d m = Matrix4x3d().rotateXYZ(0.12f, 1.25f, -2.56f);
        Matrix4x3d inv = Matrix4x3d(m).invert();
        m.positiveX(dir);
        inv.transformDirection(dir2.set(1, 0, 0));
        assertVector3dEquals(dir2, dir, 1E-6f);
        m.positiveY(dir);
        inv.transformDirection(dir2.set(0, 1, 0));
        assertVector3dEquals(dir2, dir, 1E-6f);
        m.positiveZ(dir);
        inv.transformDirection(dir2.set(0, 0, 1));
        assertVector3dEquals(dir2, dir, 1E-6f);
    }

    // testNormal
    {
        Matrix4x3d r = Matrix4x3d().rotateY(cast(double) Math.PI / 2);
        Matrix4x3d s = Matrix4x3d(r).scale(0.2f);
        Matrix4x3d n = Matrix4x3d();
        s.normal(n);
        n.normalize3x3();
        assertMatrix4x3dEquals(r, n, 1E-8f);
    }

    // testInvert
    {
        Matrix4x3d invm = Matrix4x3d();
        Matrix4x3d m = Matrix4x3d();
        m.rotateX(1.2f).rotateY(0.2f).rotateZ(0.1f).translate(1, 2, 3).invert(invm);
        Vector3d orig = Vector3d(4, -6, 8);
        Vector3d v = Vector3d();
        Vector3d w = Vector3d();
        m.transformPosition(orig, v);
        invm.transformPosition(v, w);
        assertVector3dEquals(orig, w, 1E-6f);
        invm.invert();
        assertMatrix4x3dEquals(m, invm, 1E-6f);
    }

    // testRotateXYZ
    {
        Matrix4x3d m = Matrix4x3d().rotateX(0.12f).rotateY(0.0623f).rotateZ(0.95f);
        Matrix4x3d n = Matrix4x3d().rotateXYZ(0.12f, 0.0623f, 0.95f);
        assertMatrix4x3dEquals(m, n, 1E-6f);
    }

    // testRotateZYX
    {
        Matrix4x3d m = Matrix4x3d().rotateZ(1.12f).rotateY(0.0623f).rotateX(0.95f);
        Matrix4x3d n = Matrix4x3d().rotateZYX(1.12f, 0.0623f, 0.95f);
        assertMatrix4x3dEquals(m, n, 1E-6f);
    }

    // testRotateYXZ
    {
        Matrix4x3d m = Matrix4x3d().rotateY(1.12f).rotateX(0.0623f).rotateZ(0.95f);
        Matrix4x3d n = Matrix4x3d().rotateYXZ(1.12f, 0.0623f, 0.95f);
        assertMatrix4x3dEquals(m, n, 1E-6f);
    }

    // testRotateAffineXYZ
    {
        Matrix4x3d m = Matrix4x3d().rotateX(0.12f).rotateY(0.0623f).rotateZ(0.95f);
        Matrix4x3d n = Matrix4x3d().rotateXYZ(0.12f, 0.0623f, 0.95f);
        assertMatrix4x3dEquals(m, n, 1E-6f);
    }

    // testRotateAffineZYX
    {
        Matrix4x3d m = Matrix4x3d().rotateZ(1.12f).rotateY(0.0623f).rotateX(0.95f);
        Matrix4x3d n = Matrix4x3d().rotateZYX(1.12f, 0.0623f, 0.95f);
        assertMatrix4x3dEquals(m, n, 1E-6f);
    }

    // testRotateAffineYXZ
    {
        Matrix4x3d m = Matrix4x3d().rotateY(1.12f).rotateX(0.0623f).rotateZ(0.95f);
        Matrix4x3d n = Matrix4x3d().rotateYXZ(1.12f, 0.0623f, 0.95f);
        assertMatrix4x3dEquals(m, n, 1E-6f);
    }

    // testRotationXYZ
    {
        Matrix4x3d m = Matrix4x3d().rotationX(0.32f).rotateY(0.5623f).rotateZ(0.95f);
        Matrix4x3d n = Matrix4x3d().rotationXYZ(0.32f, 0.5623f, 0.95f);
        assertMatrix4x3dEquals(m, n, 1E-6f);
    }

    // testRotationZYX
    {
        Matrix4x3d m = Matrix4x3d().rotationZ(0.12f).rotateY(0.0623f).rotateX(0.95f);
        Matrix4x3d n = Matrix4x3d().rotationZYX(0.12f, 0.0623f, 0.95f);
        assertMatrix4x3dEquals(m, n, 1E-6f);
    }

    // testRotationYXZ
    {
        Matrix4x3d m = Matrix4x3d().rotationY(0.12f).rotateX(0.0623f).rotateZ(0.95f);
        Matrix4x3d n = Matrix4x3d().rotationYXZ(0.12f, 0.0623f, 0.95f);
        assertMatrix4x3dEquals(m, n, 1E-6f);
    }

    writeln("PASSED!");

}
