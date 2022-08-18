module tests.vector_4i_test;


/*
This is just a little test to make sure everything is working okay out of the box

There was no JOML test written for this so this is just a simple double check
*/

import vector_4i;
import std.stdio;
import tests.dunit_tests;


void testVector4i() {
    writeln("\nBEGINNING VECTOR4I TESTING\n");

    writeln("TESTING VECTOR4I CONSTRUCTORS");
    {
        Vector4i a = Vector4i(0,0,0,1);
        Vector4i b = Vector4i();
        assertEquals(a,b);

        Vector4i c = Vector4i(1,3,4,0);
        Vector4i d = Vector4i(a);

        assert(c.equals(d) == false);
    }

    writeln("PASSED!");
}