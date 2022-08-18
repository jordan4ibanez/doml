module app;

import std.stdio;

import tests.dunit_tests;

import tests.math_test;
import tests.axis_angle_test;


void main()
{
    setTestVerbose(false);
	testMath();
    testAxisAngle();
}
