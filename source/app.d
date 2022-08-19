module app;

import std.stdio;

import tests.dunit_tests;

import tests.math_test;
import tests.axis_angle_test;
// import tests.frustum_intersect;
// import tests.matrix_4d_test;

// These tests need to be redone
// testFrustumIntersect();
// testMatrix4D();

import tests.vector_2d_test;
import tests.vector_2i_test;
import tests.vector_3d_test;
import tests.vector_3i_test;
import tests.vector_4d_test;
import tests.vector_4i_test;

import tests.matrix_2d_test;
import tests.matrix_3d_test;





void main()
{
    setTestVerbose(true);

	testMath();
    testAxisAngle();

    // Vector
    testVector2d();
    testVector2i();
    testVector3d();
    testVector3i();
    testVector4d();
    testVector4i();

    // Matrix
    testMatrix2d();
    testMatrix3d();
}
