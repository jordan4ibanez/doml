module geometry_utils;

import Math = math;

import vector_2d;
import vector_3d;

/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 Kai Burjack
 %$@% Translated by jordan4ibanez
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
 * Useful geometry methods.
 * 
 * @author Kai Burjack
 * @author Richard Greenlees
 */

/**
    * Compute two arbitrary vectors perpendicular to the given normalized vector <code>(x, y, z)</code>, and store them in <code>dest1</code> and <code>dest2</code>,
    * respectively.
    * <p>
    * The computed vectors will themselves be perpendicular to each another and normalized. So the tree vectors <code>(x, y, z)</code>, <code>dest1</code> and
    * <code>dest2</code> form an orthonormal basis.
    * 
    * @param x
    *            the x coordinate of the normalized input vector
    * @param y
    *            the y coordinate of the normalized input vector
    * @param z
    *            the z coordinate of the normalized input vector
    * @param dest1
    *            will hold the first perpendicular vector
    * @param dest2
    *            will hold the second perpendicular vector
    */
public static void perpendicular(double x, double y, double z, ref Vector3d dest1, ref Vector3d dest2) {
    double magX = z * z + y * y;
    double magY = z * z + x * x;
    double magZ = y * y + x * x;
    double mag;
    if (magX > magY && magX > magZ) {
        dest1.x = 0;
        dest1.y = z;
        dest1.z = -y;
        mag = magX;
    } else if (magY > magZ) {
        dest1.x = -z;
        dest1.y = 0;
        dest1.z = x;
        mag = magY;
    } else {
        dest1.x = y;
        dest1.y = -x;
        dest1.z = 0;
        mag = magZ;
    }
    double len = Math.invsqrt(mag);
    dest1.x *= len;
    dest1.y *= len;
    dest1.z *= len;
    dest2.x = y * dest1.z - z * dest1.y;
    dest2.y = z * dest1.x - x * dest1.z;
    dest2.z = x * dest1.y - y * dest1.x;
}

/**
    * Compute two arbitrary vectors perpendicular to the given normalized vector <code>v</code>, and store them in <code>dest1</code> and <code>dest2</code>,
    * respectively.
    * <p>
    * The computed vectors will themselves be perpendicular to each another and normalized. So the tree vectors <code>v</code>, <code>dest1</code> and
    * <code>dest2</code> form an orthonormal basis.
    * 
    * @param v
    *            the {@link Vector3d#normalize() normalized} input vector
    * @param dest1
    *            will hold the first perpendicular vector
    * @param dest2
    *            will hold the second perpendicular vector
    */
public static void perpendicular(ref Vector3d v, ref Vector3d dest1, ref Vector3d dest2) {
    perpendicular(v.x, v.y, v.z, dest1, dest2);
}

/**
    * Calculate the normal of a surface defined by points <code>v1</code>, <code>v2</code> and <code>v3</code> and store it in <code>dest</code>.
    * 
    * @param v0
    *            the first position
    * @param v1
    *            the second position
    * @param v2
    *            the third position
    * @param dest
    *            will hold the result
    */
public static void normal(Vector3d v0, Vector3d v1, Vector3d v2, ref Vector3d dest) {
    normal(v0.x, v0.y, v0.z, v1.x, v1.y, v1.z, v2.x, v2.y, v2.z, dest);
}

/**
    * Calculate the normal of a surface defined by points <code>(v1X, v1Y, v1Z)</code>, <code>(v2X, v2Y, v2Z)</code> and <code>(v3X, v3Y, v3Z)</code>
    * and store it in <code>dest</code>.
    * 
    * @param v0X
    *            the x coordinate of the first position
    * @param v0Y
    *            the y coordinate of the first position
    * @param v0Z
    *            the z coordinate of the first position
    * @param v1X
    *            the x coordinate of the second position
    * @param v1Y
    *            the y coordinate of the second position
    * @param v1Z
    *            the z coordinate of the second position
    * @param v2X
    *            the x coordinate of the third position
    * @param v2Y
    *            the y coordinate of the third position
    * @param v2Z
    *            the z coordinate of the third position
    * @param dest
    *            will hold the result
    */
public static void normal(double v0X, double v0Y, double v0Z, double v1X, double v1Y, double v1Z, double v2X, double v2Y, double v2Z, ref Vector3d dest) {
    dest.x = ((v1Y - v0Y) * (v2Z - v0Z)) - ((v1Z - v0Z) * (v2Y - v0Y));
    dest.y = ((v1Z - v0Z) * (v2X - v0X)) - ((v1X - v0X) * (v2Z - v0Z));
    dest.z = ((v1X - v0X) * (v2Y - v0Y)) - ((v1Y - v0Y) * (v2X - v0X));
    dest.normalize();
}

/**
    * Calculate the surface tangent for the three supplied vertices and UV coordinates and store the result in <code>dest</code>.
    *
    * @param v1
    *            XYZ of first vertex
    * @param uv1
    *            UV of first vertex
    * @param v2
    *            XYZ of second vertex
    * @param uv2
    *            UV of second vertex
    * @param v3
    *            XYZ of third vertex
    * @param uv3
    *            UV of third vertex
    * @param dest
    *            the tangent will be stored here
    */
public static void tangent(ref Vector3d v1, ref Vector2d uv1, ref Vector3d v2, ref Vector2d uv2, ref Vector3d v3, ref Vector2d uv3, ref Vector3d dest) {
    double DeltaV1 = uv2.y - uv1.y;
    double DeltaV2 = uv3.y - uv1.y;

    double f = 1.0f / ((uv2.x - uv1.x) * DeltaV2 - (uv3.x - uv1.x) * DeltaV1);

    dest.x = f * (DeltaV2 * (v2.x - v1.x) - DeltaV1 * (v3.x - v1.x));
    dest.y = f * (DeltaV2 * (v2.y - v1.y) - DeltaV1 * (v3.y - v1.y));
    dest.z = f * (DeltaV2 * (v2.z - v1.z) - DeltaV1 * (v3.z - v1.z));
    dest.normalize();
}

/**
    * Calculate the surface bitangent for the three supplied vertices and UV coordinates and store the result in <code>dest</code>.
    *
    * @param v1
    *            XYZ of first vertex
    * @param uv1
    *            UV of first vertex
    * @param v2
    *            XYZ of second vertex
    * @param uv2
    *            UV of second vertex
    * @param v3
    *            XYZ of third vertex
    * @param uv3
    *            UV of third vertex
    * @param dest
    *            the binormal will be stored here
    */
public static void bitangent(ref Vector3d v1, ref Vector2d uv1, ref Vector3d v2, ref Vector2d uv2, ref Vector3d v3, ref Vector2d uv3, ref Vector3d dest) {
    double DeltaU1 = uv2.x - uv1.x;
    double DeltaU2 = uv3.x - uv1.x;

    double f = 1.0f / (DeltaU1 * (uv3.y - uv1.y) - DeltaU2 * (uv2.y - uv1.y));

    dest.x = f * (-DeltaU2 * (v2.x - v1.x) + DeltaU1 * (v3.x - v1.x));
    dest.y = f * (-DeltaU2 * (v2.y - v1.y) + DeltaU1 * (v3.y - v1.y));
    dest.z = f * (-DeltaU2 * (v2.z - v1.z) + DeltaU1 * (v3.z - v1.z));
    dest.normalize();
}

/**
    * Calculate the surface tangent and bitangent for the three supplied vertices and UV coordinates and store the result in <code>dest</code>.
    *
    * @param v1
    *            XYZ of first vertex
    * @param uv1
    *            UV of first vertex
    * @param v2
    *            XYZ of second vertex
    * @param uv2
    *            UV of second vertex
    * @param v3
    *            XYZ of third vertex
    * @param uv3
    *            UV of third vertex
    * @param destTangent
    *            the tangent will be stored here
    * @param destBitangent
    *            the bitangent will be stored here
    */
public static void tangentBitangent(ref Vector3d v1, ref Vector2d uv1, ref Vector3d v2, ref Vector2d uv2, ref Vector3d v3, ref Vector2d uv3, ref Vector3d destTangent, ref Vector3d destBitangent) {
    double DeltaV1 = uv2.y - uv1.y;
    double DeltaV2 = uv3.y - uv1.y;
    double DeltaU1 = uv2.x - uv1.x;
    double DeltaU2 = uv3.x - uv1.x;

    double f = 1.0f / (DeltaU1 * DeltaV2 - DeltaU2 * DeltaV1);

    destTangent.x = f * (DeltaV2 * (v2.x - v1.x) - DeltaV1 * (v3.x - v1.x));
    destTangent.y = f * (DeltaV2 * (v2.y - v1.y) - DeltaV1 * (v3.y - v1.y));
    destTangent.z = f * (DeltaV2 * (v2.z - v1.z) - DeltaV1 * (v3.z - v1.z));
    destTangent.normalize();

    destBitangent.x = f * (-DeltaU2 * (v2.x - v1.x) + DeltaU1 * (v3.x - v1.x));
    destBitangent.y = f * (-DeltaU2 * (v2.y - v1.y) + DeltaU1 * (v3.y - v1.y));
    destBitangent.z = f * (-DeltaU2 * (v2.z - v1.z) + DeltaU1 * (v3.z - v1.z));
    destBitangent.normalize();
}
