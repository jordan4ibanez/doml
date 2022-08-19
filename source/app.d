module app;

import std.stdio;

import tests.dunit_tests;

import tests.math_test;
import tests.axis_angle_test;
import tests.frustum_intersect_test;

import tests.vector_2d_test;
import tests.vector_2i_test;
import tests.vector_3d_test;
import tests.vector_3i_test;
import tests.vector_4d_test;
import tests.vector_4i_test;

import tests.matrix_2d_test;
import tests.matrix_3d_test;
import tests.matrix_3x2d_test;
import tests.matrix_4d_test;
import tests.matrix_4x3d_test;

import tests.geometry_utils_test;
import tests.quaterniond_test;
import tests.ray_aabb_intersect_test;





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
    testMatrix3x2d();
    testMatrix4d();
    testMatrix4x3d();

    testGeometryUtils();
    testFrustumIntersect();

    // testQuaterniond();
    testRayAABBIntersect();

}
