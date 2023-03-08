module tests.quaterniond_test;

import Math = math;
import quaternion_d;
import matrix_4d;
import vector_3d;
import tests.dunit_tests;
import std.stdio;

/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 JOML.
 %$#% Translated by jordan4ibanez
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
 * Test class for {@link Quaterniond}.
 * @author Sebastian Fellner
 */
unittest {
    
    writeln("\nSTARING QUATERNIOND TESTING\n");

    // testMulQuaternionDQuaternionDQuaternionD
    {
        // Multiplication with the identity quaternion should change nothing
        Quaterniond testQuat = Quaterniond(1, 23.3, -7.57, 2.1);
        Quaterniond identityQuat = Quaterniond().identity();
        Quaterniond resultQuat = Quaterniond();
        
        testQuat.mul(identityQuat, resultQuat);
        assertTrue(quatEqual(testQuat, resultQuat, MANY_OPS_AROUND_ZERO_PRECISION_DOUBLE));
        
        identityQuat.mul(testQuat, resultQuat);
        assertTrue(quatEqual(testQuat, resultQuat, STANDARD_AROUND_ZERO_PRECISION_DOUBLE));
        
        // Multiplication with conjugate should give (0, 0, 0, dot(this, this))
        Quaterniond conjugate = Quaterniond();
        testQuat.conjugate(conjugate);
        testQuat.mul(conjugate, resultQuat);
        
        Quaterniond wantedResultQuat = Quaterniond(0, 0, 0, testQuat.dot(testQuat));
        assertTrue(quatEqual(resultQuat, wantedResultQuat, MANY_OPS_AROUND_ZERO_PRECISION_DOUBLE));
    }

    // testRotationXYZ
    {
        Quaterniond v = Quaterniond().rotationXYZ(0.12f, 0.521f, 0.951f);
        Matrix4d m = Matrix4d().rotateXYZ(0.12f, 0.521f, 0.951f);
        Matrix4d n = Matrix4d().set(v);
        assertMatrix4dEquals(m, n, 1E-6f);
    }

    // testRotationZYX
    {
        Quaterniond v = Quaterniond().rotationZYX(0.12f, 0.521f, 0.951f);
        Matrix4d m = Matrix4d().rotateZYX(0.12f, 0.521f, 0.951f);
        Matrix4d n = Matrix4d().set(v);
        assertMatrix4dEquals(m, n, 1E-6f);
    }

    // testRotationYXZ
    {
        Quaterniond v = Quaterniond().rotationYXZ(0.12f, 0.521f, 0.951f);
        Matrix4d m = Matrix4d().rotationYXZ(0.12f, 0.521f, 0.951f);
        Matrix4d n = Matrix4d().set(v);
        assertMatrix4dEquals(m, n, 1E-6f);
    }

    // testRotateXYZ
    {
        Quaterniond v = Quaterniond().rotateXYZ(0.12f, 0.521f, 0.951f);
        Matrix4d m = Matrix4d().rotateXYZ(0.12f, 0.521f, 0.951f);
        Matrix4d n = Matrix4d().set(v);
        assertMatrix4dEquals(m, n, 1E-6f);
    }

    // testRotateXYZ
    {
        Quaterniond v = Quaterniond().rotateZYX(0.12f, 0.521f, 0.951f);
        Matrix4d m = Matrix4d().rotateZYX(0.12f, 0.521f, 0.951f);
        Matrix4d n = Matrix4d().set(v);
        assertMatrix4dEquals(m, n, 1E-6f);
    }

    // testRotateYXZ
    {
        Quaterniond v = Quaterniond().rotateYXZ(0.12f, 0.521f, 0.951f);
        Matrix4d m = Matrix4d().rotateYXZ(0.12f, 0.521f, 0.951f);
        Matrix4d n = Matrix4d().set(v);
        assertMatrix4dEquals(m, n, 1E-6f);
    }

    // testRotateToReturnsDestination
    {
        Quaterniond rotation = Quaterniond();
        Quaterniond destination = Quaterniond();
        Quaterniond result = rotation.rotateTo(0, 1, 0, 0, 1, 0, destination);
        assertEquals(destination, result); // Assert same?
    }

    // testFromAxisAngle
    {
        vector3 axis = vector3(1.0, 0.0, 0.0);
        double angleDeg = 45.0;
        double angleRad = Math.toRadians(angleDeg);
        Quaterniond fromRad1 = Quaterniond().fromAxisAngleRad(axis, angleRad);
        Quaterniond fromRad2 = Quaterniond().fromAxisAngleRad(axis.x, axis.y, axis.z, angleRad);
        Quaterniond fromDeg = Quaterniond().fromAxisAngleDeg(axis, angleDeg);
        assertEquals(fromRad1, fromRad2);
        assertEquals(fromRad2, fromDeg);
    }

    // testGetEulerAnglesXYZ
    {        
        int failure = 0;
        int N = 3_000_000;
        for (int i = 0; i <= N; i++) {
            if (i % 100_000  == 0) {
                // This is here because it takes a long time
                writeln("Batch test: ", (cast(double)i / 3_000_000.0) * 100, "%" );
            }
            double x = (Math.random() * 2.0 - 1.0) * Math.PI;
            double y = (Math.random() * 2.0 - 1.0) * Math.PI;
            double z = (Math.random() * 2.0 - 1.0) * Math.PI;
            Quaterniond p = Quaterniond().rotateXYZ(x, y, z);
            vector3 a = p.getEulerAnglesXYZ(vector3());
            Quaterniond q = Quaterniond().rotateX(a.x).rotateY(a.y).rotateZ(a.z);
            vector3 v = vector3(Math.random()*2-1, Math.random()*2-1, Math.random()*2-1);
            vector3 testunit = vector3();
            vector3 t1 = p.transform(v, testunit);
            vector3 t2 = q.transform(v, testunit);
            if (!t1.equals(t2, 1E-10f))
                failure++;
        }
        if (cast(double)failure / N > 0.0001f) // <- allow for a failure rate of 0.01%
            assert(true == false);
    }

    writeln("PASSED!");

    // testGetEulerAnglesZXY
    {
        int failure = 0;
        int N = 3_000_000;
        for (int i = 0; i <= N; i++) {
            if (i % 100_000  == 0) {
                // This is here because it takes a long time
                writeln("Batch test: ", (cast(double)i / 3_000_000.0) * 100, "%" );
            }
            double x = (Math.random() * 2.0 - 1.0) * Math.PI;
            double y = (Math.random() * 2.0 - 1.0) * Math.PI;
            double z = (Math.random() * 2.0 - 1.0) * Math.PI;
            Quaterniond p = Quaterniond().rotateZ(z).rotateX(x).rotateY(y);
            vector3 a = p.getEulerAnglesZXY(vector3());
            Quaterniond q = Quaterniond().rotateZ(a.z).rotateX(a.x).rotateY(a.y);
            vector3 v = vector3(Math.random()*2-1, Math.random()*2-1, Math.random()*2-1);
            vector3 testunit = vector3();
            vector3 t1 = p.transform(v, testunit);
            vector3 t2 = q.transform(v, testunit);
            if (!t1.equals(t2, 1E-10f))
                failure++;
        }
        if (cast(double)failure / N > 0.0001f) // <- allow for a failure rate of 0.01%
            assert(true == false);
    }

    writeln("PASSED!");

    // testGetEulerAnglesYXZ
    {
        int failure = 0;
        int N = 3_000_000;
        for (int i = 0; i <= N; i++) {
            if (i % 100_000  == 0) {
                // This is here because it takes a long time
                writeln("Batch test: ", (cast(double)i / 3_000_000.0) * 100, "%" );
            }
            double x = (Math.random() * 2.0 - 1.0) * Math.PI;
            double y = (Math.random() * 2.0 - 1.0) * Math.PI;
            double z = (Math.random() * 2.0 - 1.0) * Math.PI;

            vector3 testunit = vector3();
            Quaterniond p = Quaterniond().rotateY(y).rotateX(x).rotateZ(z);
            vector3 a = p.getEulerAnglesYXZ(vector3());
            Quaterniond q = Quaterniond().rotateY(a.y).rotateX(a.x).rotateZ(a.z);
            vector3 v = vector3(Math.random()*2-1, Math.random()*2-1, Math.random()*2-1);
            vector3 t1 = p.transform(v, testunit);
            vector3 t2 = q.transform(v, testunit);
            if (!t1.equals(t2, 1E-10f))
                failure++;
        }
        if (cast(double)failure / N > 0.0001f) // <- allow for a failure rate of 0.01%
            assert(true == false);
    }

    writeln("PASSED!");
}
