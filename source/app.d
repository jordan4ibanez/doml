module app;

import std.stdio;

import tests.dunit_tests;

import tests.math_test;
import tests.axis_angle_test;
// import tests.frustum_intersect;
import tests.matrix_4d_test;


void main()
{
    setTestVerbose(true);
	testMath();
    testAxisAngle();
    // testFrustumIntersect();
    testMatrix4D();
}
