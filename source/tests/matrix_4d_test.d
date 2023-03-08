module tests.matrix_4d_test;

import std.stdio;
import tests.dunit_tests;
import matrix_4d;
import Math = math;

import vector_3d;
import vector_4d;

import matrix_3d;

/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 JOML.
 ^%$# Translated by jordan4ibanez
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
 * Tests for the {@link Matrix4d} class.
 * 
 * @author Kai Burjack
 */
unittest {

    writeln("\nTESTING MATRIX4D\n");

    /**
     * Test that project and unproject are each other's inverse operations.
     */
    // testProjectUnproject
    {
        /* Build some arbitrary viewport. */
        int[] viewport = [0, 0, 800, 800];

        vector3 expected = vector3(1.0f, 2.0f, -3.0f);
        vector3 actual = vector3();

        /* Build a perspective projection and then project and unproject. */
        Matrix4d m = Matrix4d()
        .perspective(cast(double) Math.toRadians(45.0f), 1.0f, 0.01f, 100.0f);
        m.project(expected, viewport, actual);
        m.unproject(actual, viewport, actual);

        /* Check for equality of the components */
        assertEquals(expected.x, actual.x, MANY_OPS_AROUND_ZERO_PRECISION_double);
        assertEquals(expected.y, actual.y, MANY_OPS_AROUND_ZERO_PRECISION_double);
        assertEquals(expected.z, actual.z, MANY_OPS_AROUND_ZERO_PRECISION_double);
    }

    // testLookAt
    {
        Matrix4d m1 = Matrix4d();
        Matrix4d m2 = Matrix4d();

        writeln(m1 == m2);

        m1 = Matrix4d().lookAt(0, 2, 3, 0, 0, 0, 0, 1, 0);
        m2 = Matrix4d().translate(0, 0, -Math.sqrt(2 * 2 + 3 * 3)).rotateX(Math.atan2(2, 3));
        
        writeln(m1);
        writeln(m2);

        assertMatrix4dEquals(m1, m2, 1E-2f);

        m1 = Matrix4d().lookAt(3, 2, 0, 0, 0, 0, 0, 1, 0);
        m2 = Matrix4d().translate(0, 0, -cast(double) Math.sqrt(2 * 2 + 3 * 3))
                .rotateX(cast(double) Math.atan2(2, 3)).rotateY(cast(double) Math.toRadians(-90));
        assertMatrix4dEquals(m1, m2, 1E-2f);
    }

    /**
     * Test computing the frustum planes with a combined view-projection matrix with translation.
     */
    // testFrustumPlanePerspectiveRotateTranslate
    {
        Vector4d left = Vector4d();
        Vector4d right = Vector4d();
        Vector4d top = Vector4d();
        Vector4d bottom = Vector4d();
        Vector4d near = Vector4d();
        Vector4d far = Vector4d();

        /*
         * Build a perspective transformation and
         * move the camera 5 units "up" and rotate it clock-wise 90 degrees around Y.
         */
        Matrix4d m = Matrix4d()
        .perspective(cast(double) Math.toRadians(90), 1.0f, 0.1f, 100.0f)
        .rotateY(cast(double) Math.toRadians(90))
        .translate(0, -5, 0);
        m.frustumPlane(Matrix4d.PLANE_NX, left);
        m.frustumPlane(Matrix4d.PLANE_PX, right);
        m.frustumPlane(Matrix4d.PLANE_NY, bottom);
        m.frustumPlane(Matrix4d.PLANE_PY, top);
        m.frustumPlane(Matrix4d.PLANE_NZ, near);
        m.frustumPlane(Matrix4d.PLANE_PZ, far);

        Vector4d expectedLeft = Vector4d(1, 0, 1, 0).normalize3();
        Vector4d expectedRight = Vector4d(1, 0, -1, 0).normalize3();
        Vector4d expectedTop = Vector4d(1, -1, 0, 5).normalize3();
        Vector4d expectedBottom = Vector4d(1, 1, 0, -5).normalize3();
        Vector4d expectedNear = Vector4d(1, 0, 0, -0.1f).normalize3();
        Vector4d expectedFar = Vector4d(-1, 0, 0, 100.0f).normalize3();

        assertVector4dEquals(expectedLeft, left, 1E-5f);
        assertVector4dEquals(expectedRight, right, 1E-5f);
        assertVector4dEquals(expectedTop, top, 1E-5f);
        assertVector4dEquals(expectedBottom, bottom, 1E-5f);
        assertVector4dEquals(expectedNear, near, 1E-5f);
        assertVector4dEquals(expectedFar, far, 1E-4f);
    }

    // testFrustumRay
    {
        vector3 dir = vector3();
        Matrix4d m = Matrix4d()
                .perspective(cast(double) Math.toRadians(90), 1.0f, 0.1f, 100.0f)
                .rotateY(cast(double) Math.toRadians(90));
        vector3 expectedDir;
        m.frustumRayDir(0, 0, dir);
        expectedDir = vector3(1, -1, -1).normalize();
        assertvector3Equals(expectedDir, dir, 1E-5f);
        m.frustumRayDir(1, 0, dir);
        expectedDir = vector3(1, -1, 1).normalize();
        assertvector3Equals(expectedDir, dir, 1E-5f);
        m.frustumRayDir(0, 1, dir);
        expectedDir = vector3(1, 1, -1).normalize();
        assertvector3Equals(expectedDir, dir, 1E-5f);
        m.frustumRayDir(1, 1, dir);
        expectedDir = vector3(1, 1, 1).normalize();
        assertvector3Equals(expectedDir, dir, 1E-5f);
    }

    // testFrustumRay2
    {
        vector3 dir = vector3();
        Matrix4d m = Matrix4d()
                .perspective(cast(double) Math.toRadians(90), 1.0f, 0.1f, 100.0f)
                .rotateZ(cast(double) Math.toRadians(45));
        vector3 expectedDir;
        m.frustumRayDir(0, 0, dir);
        expectedDir = vector3(-cast(double)Math.sqrt(2), 0, -1).normalize();
        assertvector3Equals(expectedDir, dir, 1E-5f);
        m.frustumRayDir(1, 0, dir);
        expectedDir = vector3(0, -cast(double)Math.sqrt(2), -1).normalize();
        assertvector3Equals(expectedDir, dir, 1E-5f);
        m.frustumRayDir(0, 1, dir);
        expectedDir = vector3(0, cast(double)Math.sqrt(2), -1).normalize();
        assertvector3Equals(expectedDir, dir, 1E-5f);
        m.frustumRayDir(1, 1, dir);
        expectedDir = vector3(cast(double)Math.sqrt(2), 0, -1).normalize();
        assertvector3Equals(expectedDir, dir, 1E-5f);
    }

    // testMatrix4dTranspose
    {
        double m00 = 1, m01 = 2, m02 = 3, m03 = 4;
        double m10 = 5, m11 = 6, m12 = 7, m13 = 8;
        double m20 = 9, m21 = 10, m22 = 11, m23 = 12;
        double m30 = 13, m31 = 14, m32 = 15, m33 = 16;

        Matrix4d m = Matrix4d(m00,m01,m02,m03,m10,m11,m12,m13,m20,m21,m22,m23,m30,m31,m32,m33);
        Matrix4d expect = Matrix4d(m00,m10,m20,m30,m01,m11,m21,m31,m02,m12,m22,m32,m03,m13,m23,m33);
        assertMatrix4dEquals(Matrix4d(m).transpose(),expect, 1E-5f);
        Matrix4d testUnit = Matrix4d();
        assertMatrix4dEquals(Matrix4d(m).transpose(testUnit),expect, 1E-5f);
    }

    // testMatrix4d3fTranspose
    {
        double m00 = 1, m01 = 2, m02 = 3, m03 = 4;
        double m10 = 5, m11 = 6, m12 = 7, m13 = 8;
        double m20 = 9, m21 = 10, m22 = 11, m23 = 12;
        double m30 = 13, m31 = 14, m32 = 15, m33 = 16;

        Matrix4d m = Matrix4d(m00,m01,m02,m03,m10,m11,m12,m13,m20,m21,m22,m23,m30,m31,m32,m33);
        Matrix4d expect = Matrix4d(m00,m10,m20,m03,m01,m11,m21,m13,m02,m12,m22,m23,m30,m31,m32,m33);

        Matrix4d testUnit3 = Matrix4d(m).transpose3x3();

        assertMatrix4dEquals(testUnit3,expect, 1E-5f);
        Matrix3d expect1 = Matrix3d(m00,m10,m20,m01,m11,m21,m02,m12,m22);
        Matrix4d expect2 = Matrix4d(expect1);
        Matrix4d testUnit1 = Matrix4d();
        assertMatrix4dEquals(Matrix4d(m).transpose3x3(testUnit1),expect2, 1E-5f);
        Matrix3d testUnit2 = Matrix3d();
        assertMatrix3dEquals(Matrix4d(m).transpose3x3(testUnit2),expect1, 1E-5f);
    }

    // testPositiveXRotateY
    {
        vector3 dir = vector3();
        Matrix4d m = Matrix4d();
        m.rotateY(Math.toRadians(90));
        m.positiveX(dir);
        vector3 testUnit = vector3(0, 0, 1);
        assertvector3Equals(testUnit, dir, 1E-7f);
    }

    // testPositiveYRotateX
    {
        vector3 dir = vector3();
        Matrix4d m = Matrix4d()
                .rotateX(cast(double) Math.toRadians(90));
        m.positiveY(dir);
        assertvector3Equals(vector3(0, 0, -1), dir, 1E-7f);
    }

    // testPositiveZRotateX
    {
        vector3 dir = vector3();
        Matrix4d m = Matrix4d()
                .rotateX(cast(double) Math.toRadians(90));
        m.positiveZ(dir);
        assertvector3Equals(vector3(0, 1, 0), dir, 1E-7f);
    }

    // testPositiveXRotateXY
    {
        vector3 dir = vector3();
        Matrix4d m = Matrix4d()
                .rotateY(cast(double) Math.toRadians(90)).rotateX(cast(double) Math.toRadians(45));
        m.positiveX(dir);
        assertvector3Equals(vector3(0, 1, 1).normalize(), dir, 1E-7f);
    }

    // testPositiveXPerspectiveRotateY
    {
        vector3 dir = vector3();
        Matrix4d m = Matrix4d()
                .perspective(cast(double) Math.toRadians(90), 1.0f, 0.1f, 100.0f)
                .rotateY(cast(double) Math.toRadians(90));
        m.positiveX(dir);
        assertvector3Equals(vector3(0, 0, -1), dir, 1E-7f);
    }

    // testPositiveXPerspectiveRotateXY
    {
        vector3 dir = vector3();
        Matrix4d m = Matrix4d()
                .perspective(cast(double) Math.toRadians(90), 1.0f, 0.1f, 100.0f)
                .rotateY(cast(double) Math.toRadians(90)).rotateX(cast(double) Math.toRadians(45));
        m.positiveX(dir);
        assertvector3Equals(vector3(0, -1, -1).normalize(), dir, 1E-7f);
    }

    // testPositiveXYZLookAt
    {
        vector3 dir = vector3();
        Matrix4d m = Matrix4d()
                .lookAt(0, 0, 0, -1, 0, 0, 0, 1, 0);
        m.positiveX(dir);
        assertvector3Equals(vector3(0, 0, -1).normalize(), dir, 1E-7f);
        m.positiveY(dir);
        assertvector3Equals(vector3(0, 1, 0).normalize(), dir, 1E-7f);
        m.positiveZ(dir);
        assertvector3Equals(vector3(1, 0, 0).normalize(), dir, 1E-7f);
    }

    // testPositiveXYZSameAsInvert
    {
        vector3 dir = vector3();
        vector3 dir2 = vector3();
        Matrix4d m = Matrix4d().rotateXYZ(0.12f, 1.25f, -2.56f);
        Matrix4d inv = Matrix4d(m).invert();
        m.positiveX(dir);
        dir2.set(1, 0, 0);
        inv.transformDirection(dir2);
        assertvector3Equals(dir2, dir, 1E-6f);
        m.positiveY(dir);
        dir2.set(0, 1, 0);
        inv.transformDirection(dir2);
        assertvector3Equals(dir2, dir, 1E-6f);
        m.positiveZ(dir);
        dir2.set(0, 0, 1);
        inv.transformDirection(dir2);
        assertvector3Equals(dir2, dir, 1E-6f);
    }

    // testFrustumCornerIdentity
    {
        Matrix4d m = Matrix4d();
        vector3 corner = vector3();
        m.frustumCorner(Matrix4d.CORNER_NXNYNZ, corner); // left, bottom, near
        assertvector3Equals(vector3(-1, -1, -1), corner, 1E-6f);
        m.frustumCorner(Matrix4d.CORNER_PXNYNZ, corner); // right, bottom, near
        assertvector3Equals(vector3(1, -1, -1), corner, 1E-6f);
        m.frustumCorner(Matrix4d.CORNER_PXNYPZ, corner); // right, bottom, far
        assertvector3Equals(vector3(1, -1, 1), corner, 1E-6f);
        m.frustumCorner(Matrix4d.CORNER_NXPYPZ, corner); // left, top, far
        assertvector3Equals(vector3(-1, 1, 1), corner, 1E-6f);
    }

    // testFrustumCornerOrthoWide
    {
        Matrix4d m = Matrix4d().ortho2D(-2, 2, -1, 1);
        vector3 corner = vector3();
        m.frustumCorner(Matrix4d.CORNER_NXNYNZ, corner); // left, bottom, near
        assertvector3Equals(vector3(-2, -1, 1), corner, 1E-6f);
        m.frustumCorner(Matrix4d.CORNER_PXNYNZ, corner); // right, bottom, near
        assertvector3Equals(vector3(2, -1, 1), corner, 1E-6f);
        m.frustumCorner(Matrix4d.CORNER_PXNYPZ, corner); // right, bottom, far
        assertvector3Equals(vector3(2, -1, -1), corner, 1E-6f);
        m.frustumCorner(Matrix4d.CORNER_NXPYPZ, corner); // left, top, far
        assertvector3Equals(vector3(-2, 1, -1), corner, 1E-6f);
    }

    // testFrustumCorner
    {
        Matrix4d m = Matrix4d()
        .perspective(cast(double) Math.toRadians(90), 1.0f, 0.1f, 100.0f)
        .lookAt(0, 0, 10,
                0, 0,  0, 
                0, 1,  0);
        vector3 corner = vector3();
        m.frustumCorner(Matrix4d.CORNER_NXNYNZ, corner); // left, bottom, near
        assertvector3Equals(vector3(-0.1f, -0.1f, 10 - 0.1f), corner, 1E-6f);
        m.frustumCorner(Matrix4d.CORNER_PXNYNZ, corner); // right, bottom, near
        assertvector3Equals(vector3(0.1f, -0.1f, 10 - 0.1f), corner, 1E-6f);
        m.frustumCorner(Matrix4d.CORNER_PXNYPZ, corner); // right, bottom, far
        assertvector3Equals(vector3(100.0f, -100, 10 - 100f), corner, 1E-3f);
    }

    // testFrustumCornerWide
    {
        Matrix4d m = Matrix4d()
        .perspective(cast(double) Math.toRadians(90), 2.0f, 0.1f, 100.0f)
        .lookAt(0, 0, 10,
                0, 0,  0, 
                0, 1,  0);
        vector3 corner = vector3();
        m.frustumCorner(Matrix4d.CORNER_NXNYNZ, corner); // left, bottom, near
        assertvector3Equals(vector3(-0.2f, -0.1f, 10 - 0.1f), corner, 1E-5f);
        m.frustumCorner(Matrix4d.CORNER_PXNYNZ, corner); // right, bottom, near
        assertvector3Equals(vector3(0.2f, -0.1f, 10 - 0.1f), corner, 1E-5f);
        m.frustumCorner(Matrix4d.CORNER_PXNYPZ, corner); // right, bottom, far
        assertvector3Equals(vector3(200.0f, -100, 10 - 100f), corner, 1E-3f);
    }

    // testFrustumCornerRotate
    {
        Matrix4d m = Matrix4d()
        .perspective(cast(double) Math.toRadians(90), 1.0f, 0.1f, 100.0f)
        .lookAt(10, 0, 0, 
                 0, 0, 0, 
                 0, 1, 0);
        vector3 corner = vector3();
        m.frustumCorner(Matrix4d.CORNER_NXNYNZ, corner); // left, bottom, near
        assertvector3Equals(vector3(10 - 0.1f, -0.1f, 0.1f), corner, 1E-6f);
        m.frustumCorner(Matrix4d.CORNER_PXNYNZ, corner); // right, bottom, near
        assertvector3Equals(vector3(10 - 0.1f, -0.1f, -0.1f), corner, 1E-6f);
        m.frustumCorner(Matrix4d.CORNER_PXNYPZ, corner); // right, bottom, far
        assertvector3Equals(vector3(-100.0f + 10, -100, -100f), corner, 1E-3f);
    }

    // testPerspectiveOrigin
    {
        Matrix4d m = Matrix4d()
        // test symmetric frustum with some modelview translation and rotation
        .perspective(cast(double) Math.toRadians(90), 1.0f, 0.1f, 100.0f)
        .lookAt(6, 0, 1, 
                0, 0, 0, 
                0, 1, 0);
        vector3 origin = vector3();
        m.perspectiveOrigin(origin);
        assertvector3Equals(vector3(6, 0, 1), origin, 1E-5f);

        // test symmetric frustum with some modelview translation and rotation
        m = Matrix4d()
        .perspective(cast(double) Math.toRadians(90), 1.0f, 0.1f, 100.0f)
        .lookAt(-5, 2, 1, 
                0, 1, 0, 
                0, 1, 0);
        m.perspectiveOrigin(origin);
        assertvector3Equals(vector3(-5, 2, 1), origin, 1E-5f);

        // test asymmetric frustum
        m = Matrix4d()
        .frustum(-0.1f, 0.5f, -0.1f, 0.1f, 0.1f, 100.0f)
        .lookAt(-5, 2, 1, 
                0, 1, 0, 
                0, 1, 0);
        m.perspectiveOrigin(origin);
        assertvector3Equals(vector3(-5, 2, 1), origin, 1E-5f);
    }

    // testPerspectiveFov
    {
        Matrix4d m = Matrix4d()
        .perspective(cast(double) Math.toRadians(45), 1.0f, 0.1f, 100.0f);
        double fov = m.perspectiveFov();
        assertEquals(Math.toRadians(45), fov, 1E-5);

        m = Matrix4d()
        .perspective(cast(double) Math.toRadians(90), 1.0f, 0.1f, 100.0f)
        .lookAt(6, 0, 1, 
                0, 0, 0, 
                0, 1, 0);
        fov = m.perspectiveFov();
        assertEquals(Math.toRadians(90), fov, 1E-5);
    }

    // testNormal
    {
        Matrix4d r = Matrix4d().rotateY(cast(double) Math.PI / 2);
        Matrix4d s = Matrix4d(r).scale(0.2f);
        Matrix4d n = Matrix4d();
        s.normal(n);
        n.normalize3x3();
        assertMatrix4dEquals(r, n, 1E-8f);
    }

    // testInvertAffine
    {
        Matrix4d invm = Matrix4d();
        Matrix4d m = Matrix4d();
        m.rotateX(1.2f).rotateY(0.2f).rotateZ(0.1f).translate(1, 2, 3).invertAffine(invm);
        vector3 orig = vector3(4, -6, 8);
        vector3 v = vector3();
        vector3 w = vector3();
        m.transformPosition(orig, v);
        invm.transformPosition(v, w);
        assertvector3Equals(orig, w, 1E-6f);
        invm.invertAffine();
        assertMatrix4dEquals(m, invm, 1E-6f);
    }

    // testInvert
    {
        Matrix4d invm = Matrix4d();
        Matrix4d m = Matrix4d();
        m.perspective(0.1123f, 0.5f, 0.1f, 100.0f).rotateX(1.2f).rotateY(0.2f).rotateZ(0.1f).translate(1, 2, 3).invert(invm);
        Vector4d orig = Vector4d(4, -6, 8, 1);
        Vector4d v = Vector4d();
        Vector4d w = Vector4d();
        m.transform(orig, v);
        invm.transform(v, w);
        assertVector4dEquals(orig, w, 1E-4f);
        invm.invert();
        assertMatrix4dEquals(m, invm, 1E-3f);
    }

    // testRotateXYZ
    {
        Matrix4d m = Matrix4d().rotateX(0.12f).rotateY(0.0623f).rotateZ(0.95f);
        Matrix4d n = Matrix4d().rotateXYZ(0.12f, 0.0623f, 0.95f);
        assertMatrix4dEquals(m, n, 1E-6f);
    }

    // testRotateZYX
    {
        Matrix4d m = Matrix4d().rotateZ(1.12f).rotateY(0.0623f).rotateX(0.95f);
        Matrix4d n = Matrix4d().rotateZYX(1.12f, 0.0623f, 0.95f);
        assertMatrix4dEquals(m, n, 1E-6f);
    }

    // testRotateYXZ
    {
        Matrix4d m = Matrix4d().rotateY(1.12f).rotateX(0.0623f).rotateZ(0.95f);
        Matrix4d n = Matrix4d().rotateYXZ(1.12f, 0.0623f, 0.95f);
        assertMatrix4dEquals(m, n, 1E-6f);
    }

    // testRotateAffineXYZ
    {
        Matrix4d m = Matrix4d().rotateX(0.12f).rotateY(0.0623f).rotateZ(0.95f);
        Matrix4d n = Matrix4d().rotateAffineXYZ(0.12f, 0.0623f, 0.95f);
        assertMatrix4dEquals(m, n, 1E-6f);
    }

    // testRotateAffineZYX
    {
        Matrix4d m = Matrix4d().rotateZ(1.12f).rotateY(0.0623f).rotateX(0.95f);
        Matrix4d n = Matrix4d().rotateAffineZYX(1.12f, 0.0623f, 0.95f);
        assertMatrix4dEquals(m, n, 1E-6f);
    }

    // testRotateAffineYXZ
    {
        Matrix4d m = Matrix4d().rotateY(1.12f).rotateX(0.0623f).rotateZ(0.95f);
        Matrix4d n = Matrix4d().rotateAffineYXZ(1.12f, 0.0623f, 0.95f);
        assertMatrix4dEquals(m, n, 1E-6f);
    }

    // testRotationXYZ
    {
        Matrix4d m = Matrix4d().rotationX(0.32f).rotateY(0.5623f).rotateZ(0.95f);
        Matrix4d n = Matrix4d().rotationXYZ(0.32f, 0.5623f, 0.95f);
        assertMatrix4dEquals(m, n, 1E-6f);
    }

    // testRotationZYX
    {
        Matrix4d m = Matrix4d().rotationZ(0.12f).rotateY(0.0623f).rotateX(0.95f);
        Matrix4d n = Matrix4d().rotationZYX(0.12f, 0.0623f, 0.95f);
        assertMatrix4dEquals(m, n, 1E-6f);
    }

    // testRotationYXZ
    {
        Matrix4d m = Matrix4d().rotationY(0.12f).rotateX(0.0623f).rotateZ(0.95f);
        Matrix4d n = Matrix4d().rotationYXZ(0.12f, 0.0623f, 0.95f);
        assertMatrix4dEquals(m, n, 1E-6f);
    }

    // testOrthoCrop
    {
        Matrix4d lightView = Matrix4d()
                .lookAt(0, 5, 0,
                        0, 0, 0,
                       -1, 0, 0);
        Matrix4d crop = Matrix4d();
        Matrix4d fin = Matrix4d();
        Matrix4d().ortho2D(-1, 1, -1, 1).invertAffine().orthoCrop(lightView, crop).mulOrthoAffine(lightView, fin);
        vector3 p = vector3();
        fin.transformProject(p.set(1, -1, -1));
        assertEquals(+1.0f, p.x, 1E-6f);
        assertEquals(-1.0f, p.y, 1E-6f);
        assertEquals(+1.0f, p.z, 1E-6f);
        fin.transformProject(p.set(-1, -1, -1));
        assertEquals(+1.0f, p.x, 1E-6f);
        assertEquals(+1.0f, p.y, 1E-6f);
        assertEquals(+1.0f, p.z, 1E-6f);
    }

    // testOrthoCropWithPerspective
    {
        Matrix4d lightView = Matrix4d()
                .lookAt(0, 5, 0,
                        0, 0, 0,
                        0, 0, -1);
        Matrix4d crop = Matrix4d();
        Matrix4d fin = Matrix4d();
        Matrix4d().perspective(cast(double) Math.toRadians(90), 1.0f, 5, 10).invertPerspective().orthoCrop(lightView, crop).mulOrthoAffine(lightView, fin);
        vector3 p = vector3();
        fin.transformProject(p.set(0, 0, -5));
        assertEquals(+0.0f, p.x, 1E-6f);
        assertEquals(-1.0f, p.y, 1E-6f);
        assertEquals(+0.0f, p.z, 1E-6f);
        fin.transformProject(p.set(0, 0, -10));
        assertEquals(+0.0f, p.x, 1E-6f);
        assertEquals(+1.0f, p.y, 1E-6f);
        assertEquals(+0.0f, p.z, 1E-6f);
        fin.transformProject(p.set(-10, 10, -10));
        assertEquals(-1.0f, p.x, 1E-6f);
        assertEquals(+1.0f, p.y, 1E-6f);
        assertEquals(-1.0f, p.z, 1E-6f);
    }

    // testRotateTowardsXY
    {
        vector3 v = vector3(1, 1, 0).normalize();
        Matrix4d testUnit = Matrix4d();
        Matrix4d m1 = Matrix4d().rotateZ(v.angle(vector3(1, 0, 0)), testUnit);
        Matrix4d testUnit2 = Matrix4d();
        Matrix4d m2 = Matrix4d().rotateTowardsXY(v.x, v.y, testUnit2);
        assertMatrix4dEquals(m1, m2, 1E-13);
        vector3 testUnit3 = vector3(0, 1, 0);
        vector3 t = m1.transformDirection(testUnit3);
        vector3 testUnit4 = vector3(-1, 1, 0).normalize();
        assertvector3Equals(testUnit4, t, 1E-6f);
    }

    // testTestPoint
    {
        Matrix4d m = Matrix4d().perspective(cast(double)Math.toRadians(90), 1.0f, 0.1f, 10.0f).lookAt(0, 0, 10, 0, 0, 0, 0, 1, 0).scale(2);
        assertTrue(m.testPoint(0, 0, 0));
        assertTrue(m.testPoint(9.999f*0.5f, 0, 0));
        assertFalse(m.testPoint(10.001f*0.5f, 0, 0));
    }

    // testTestAab
    {
        Matrix4d m = Matrix4d().perspective(cast(double)Math.toRadians(90), 1.0f, 0.1f, 10.0f).lookAt(0, 0, 10, 0, 0, 0, 0, 1, 0).scale(2);
        assertTrue(m.testAab(-1, -1, -1, 1, 1, 1));
        assertTrue(m.testAab(9.999f*0.5f, 0, 0, 10, 1, 1));
        assertFalse(m.testAab(10.001f*0.5f, 0, 0, 10, 1, 1));
    }

    // testTransformTranspose
    {
        Matrix4d m = Matrix4d(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);
        Matrix4d testUnit = Matrix4d();
        Vector4d testUnit2 = Vector4d(4, 5, 6, 7);
        Vector4d testUnit3 = Vector4d(4, 5, 6, 7);
        assertVector4dEquals(
                m.transformTranspose(testUnit2), 
                m.transpose(testUnit).transform(testUnit3),
                1E-6f);
    }

    // testGet
    {
        Matrix4d m = Matrix4d(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16);
        for (int c = 0; c < 4; c++)
            for (int r = 0; r < 4; r++)
                assertEquals(c*4+r+1, m.get(c, r), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
    }

    // testSet
    {
        assertMatrix4dEquals(Matrix4d().zero().set(0, 0, 3), Matrix4d(3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
        assertMatrix4dEquals(Matrix4d().zero().set(0, 1, 3), Matrix4d(0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
        assertMatrix4dEquals(Matrix4d().zero().set(0, 2, 3), Matrix4d(0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
        assertMatrix4dEquals(Matrix4d().zero().set(0, 3, 3), Matrix4d(0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
        assertMatrix4dEquals(Matrix4d().zero().set(1, 0, 3), Matrix4d(0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
        assertMatrix4dEquals(Matrix4d().zero().set(1, 1, 3), Matrix4d(0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
        assertMatrix4dEquals(Matrix4d().zero().set(1, 2, 3), Matrix4d(0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
        assertMatrix4dEquals(Matrix4d().zero().set(1, 3, 3), Matrix4d(0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
        assertMatrix4dEquals(Matrix4d().zero().set(2, 0, 3), Matrix4d(0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
        assertMatrix4dEquals(Matrix4d().zero().set(2, 1, 3), Matrix4d(0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
        assertMatrix4dEquals(Matrix4d().zero().set(2, 2, 3), Matrix4d(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
        assertMatrix4dEquals(Matrix4d().zero().set(2, 3, 3), Matrix4d(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
        assertMatrix4dEquals(Matrix4d().zero().set(3, 0, 3), Matrix4d(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
        assertMatrix4dEquals(Matrix4d().zero().set(3, 1, 3), Matrix4d(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
        assertMatrix4dEquals(Matrix4d().zero().set(3, 2, 3), Matrix4d(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
        assertMatrix4dEquals(Matrix4d().zero().set(3, 3, 3), Matrix4d(0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3), STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
    }

    /**
     * https://github.com/JOML-CI/JOML/issues/266
     */
    // testMulPerspectiveAffine
    {
        Matrix4d t = Matrix4d().lookAt(2, 3, 4, 5, 6, 7, 8, 9, 11);
        Matrix4d p = Matrix4d().perspective(60.0f * cast(double)Math.PI / 180.0f, 4.0f/3.0f, 0.1f, 1000.0f);
        Matrix4d testUnit1 = Matrix4d();
        Matrix4d result1 = t.invertAffine(testUnit1);
        Matrix4d testUnit2 = Matrix4d();
        Matrix4d result2 = t.invertAffine(testUnit2);
        p.mul(result1, result1);
        p.mul0(result2, result2);
        assertMatrix4dEquals(result1, result2, STANDARD_AROUND_ZERO_PRECISION_DOUBLE);
    }

    // testSetPerspectiveOffCenterFov
    {
        Matrix4d m1 = Matrix4d().setPerspective(
                Math.toRadians(45),
                1,
                0.01,
                10.0);
        Matrix4d m2 = Matrix4d().setPerspectiveOffCenterFov(
                -Math.toRadians(45/2.),
                Math.toRadians(45/2.),
                -Math.toRadians(45/2.),
                Math.toRadians(45/2.),
                0.01,
                10.0);
        assertMatrix4dEquals(m1, m2, 1E-6);
    }

    // testPerspectiveOffCenterFov
    {
        Matrix4d m1 = Matrix4d().perspective(
                Math.toRadians(45),
                1,
                0.01,
                10.0);
        Matrix4d m2 = Matrix4d().perspectiveOffCenterFov(
                -Math.toRadians(45/2.),
                Math.toRadians(45/2.),
                -Math.toRadians(45/2.),
                Math.toRadians(45/2.),
                0.01,
                10.0);
        assertMatrix4dEquals(m1, m2, 1E-6);
    }

    writeln("PASSED!");

}
