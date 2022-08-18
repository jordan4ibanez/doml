module tests.custom_assertion;

// This was written SPECIFICALLY to get the precision capabilities of JUNIT


void assertEquals(double a, double b, int precision) {
    int c = cast(int)(a * precision);
    int d = cast(int)(b * precision);

    assert(c == d);
}