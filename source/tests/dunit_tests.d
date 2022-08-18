module tests.dunit_tests;

import std.stdio;

// This was written SPECIFICALLY to get the precision capabilities of JUNIT

// I'll call it, DUNIT-mini

private bool verbose = false;

void setTestVerbose(bool newValue) {
    verbose = newValue;
}

void assertEquals(double a, double b, int precision) {
    int c = cast(int)(a * precision);
    int d = cast(int)(b * precision);
    if (verbose) {
        writeln("Value1: ", a, " | Value2: ", b);
    }
    assert(c == d);
}

void assertEquals(double a, double b) {
    if (verbose) {
        writeln("Value1: ", a, " | Value2: ", b);
    }
    assert(a == b);
}

void assertFalse(bool value) {
    assert(value == false);
}

void assertTrue(bool value) {
    assert(value == true);
}