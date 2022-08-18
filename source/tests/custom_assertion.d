module tests.custom_assertion;

// This was written SPECIFICALLY to get the precision capabilities of JUNIT

// I'll call it, DUNIT-mini

void assertEquals(double a, double b, int precision) {
    int c = cast(int)(a * precision);
    int d = cast(int)(b * precision);
    assert(c == d);
}

void assertEquals(double a, double b) {
    assert(a == b);
}

void assertFalse(bool value) {
    assert(value == false);
}

void assertTrue(bool value) {
    assert(value == true);
}