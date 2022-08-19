module tests.geometry_utils_test;

import geometry_utils;
import Math = math;
import vector_2d;
import vector_3d;
import tests.dunit_tests;

/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 Richard Greenlees
 #$#$% Translated by jordan4ibanez
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
 * Tests for the {@link GeometryUtils} class.
 *
 * @author Jarosław Piotrowski
 */
void testGeometryUtils() {

    
    Vector3d pos1 = Vector3d(-1.0f,  1.0f, 0.0f);
    Vector3d pos2 = Vector3d( 1.0f, -1.0f, 0.0f);
    Vector3d pos3 = Vector3d( 1.0f,  1.0f, 0.0f);

    Vector2d uv1 = Vector2d(0.0f, 1.0f);
    Vector2d uv2 = Vector2d(1.0f, 0.0f);
    Vector2d uv3 = Vector2d(1.0f, 1.0f);

    Vector3d t = Vector3d(1, 0, 0);
    Vector3d b = Vector3d(0, 1, 0);

    Vector3d vecTangent = Vector3d();
    Vector3d vecBitangent = Vector3d();

    tangent(pos1, uv1, pos2, uv2, pos3, uv3, vecTangent);
    assertEquals(t, vecTangent);

    bitangent(pos1, uv1, pos2, uv2, pos3, uv3, vecBitangent);
    assertEquals(b, vecBitangent);

    tangentBitangent(pos1, uv1, pos2, uv2, pos3, uv3, vecTangent, vecBitangent);
    assertEquals(t, vecTangent);
    assertEquals(b, vecBitangent);    

}