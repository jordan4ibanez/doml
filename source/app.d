module app;

import std.stdio;
import tests.math_test;
import tests.custom_assertion;

void main()
{
    setTestVerbose(false);
	test_math();
}
