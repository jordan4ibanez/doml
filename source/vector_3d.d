module vector_3d;

import Math = math;

import vector_2i;
import vector_2d;
import vector_3i;
import vector_3d;

import matrix_4d;
import matrix_3d;
import matrix_3x2d;
import matrix_4x3d;

import axis_angle_4d;
import quaternion_d;
/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 Richard Greenlees
 @#$%# Translated by jordan4ibanez
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
 * Contains the definition of a Vector comprising 3 doubles and associated
 * transformations.
 *
 * @author Richard Greenlees
 * @author Kai Burjack
 * @author F. Neurath
 */
struct Vector3d {

    /**
     * The x component of the vector.
     */
    public double x = 0.0;
    /**
     * The y component of the vector.
     */
    public double y = 0.0;
    /**
     * The z component of the vector.
     */
    public double z = 0.0;

    /**
     * Create a new {@link Vector3d} and initialize all three components with the given value.
     *
     * @param d
     *          the value of all three components
     */
    this(double d) {
        this.x = d;
        this.y = d;
        this.z = d;
    }

    /**
     * Create a new {@link Vector3d} with the given component values.
     * 
     * @param x
     *          the value of x
     * @param y
     *          the value of y
     * @param z
     *          the value of z
     */
    this(double x, double y, double z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }


    /**
     * Create a new {@link Vector3d} whose values will be copied from the given vector.
     * 
     * @param v
     *          provides the initial values for the new vector
     */
    this(Vector3i v) {
        this.x = v.x;
        this.y = v.y;
        this.z = v.z;
    }

    /**
     * Create a new {@link Vector3d} with the first two components from the
     * given <code>v</code> and the given <code>z</code>
     *
     * @param v
     *          the {@link Vector2i} to copy the values from
     * @param z
     *          the z component
     */
    this(Vector2i v, double z) {
        this.x = v.x;
        this.y = v.y;
        this.z = z;
    }

    /**
     * Create a new {@link Vector3d} whose values will be copied from the given vector.
     * 
     * @param v
     *          provides the initial values for the new vector
     */
    this(Vector3d v) {
        this.x = v.x;
        this.y = v.y;
        this.z = v.z;
    }

    /**
     * Create a new {@link Vector3d} with the first two components from the
     * given <code>v</code> and the given <code>z</code>
     *
     * @param v
     *          the {@link Vector2d} to copy the values from
     * @param z
     *          the z component
     */
    this(Vector2d v, double z) {
        this.x = v.x;
        this.y = v.y;
        this.z = z;
    }

    /**
     * Create a new {@link Vector3d} and initialize its three components from the first
     * three elements of the given array.
     * 
     * @param xyz
     *          the array containing at least three elements
     */
    this(double[] xyz) {
        this.x = xyz[0];
        this.y = xyz[1];
        this.z = xyz[2];
    }

    /**
     * Create a new {@link Vector3d} and initialize its three components from the first
     * three elements of the given array.
     * 
     * @param xyz
     *          the array containing at least three elements
     */
    this(float[] xyz) {
        this.x = xyz[0];
        this.y = xyz[1];
        this.z = xyz[2];
    }

    /**
     * Set the x, y and z components to match the supplied vector.
     * 
     * @param v
     *          the vector to set this vector's components from
     * @return this
     */
    ref public Vector3d set(Vector3d v) return {
        this.x = v.x;
        this.y = v.y;
        this.z = v.z;
        return this;
    }

    /**
     * Set the x, y and z components to match the supplied vector.
     * 
     * @param v
     *          the vector to set this vector's components from
     * @return this
     */
    ref public Vector3d set(Vector3i v) return {
        this.x = v.x;
        this.y = v.y;
        this.z = v.z;
        return this;
    }

    /**
     * Set the first two components from the given <code>v</code>
     * and the z component from the given <code>z</code>
     *
     * @param v
     *          the {@link Vector2d} to copy the values from
     * @param z
     *          the z component
     * @return this
     */
    ref public Vector3d set(Vector2d v, double z) return {
        this.x = v.x;
        this.y = v.y;
        this.z = z;
        return this;
    }

    /**
     * Set the first two components from the given <code>v</code>
     * and the z component from the given <code>z</code>
     *
     * @param v
     *          the {@link Vector2i} to copy the values from
     * @param z
     *          the z component
     * @return this
     */
    ref public Vector3d set(Vector2i v, double z) return {
        this.x = v.x;
        this.y = v.y;
        this.z = z;
        return this;
    }

    /**
     * Set the x, y, and z components to the supplied value.
     *
     * @param d
     *          the value of all three components
     * @return this
     */
    ref public Vector3d set(double d) return {
        this.x = d;
        this.y = d;
        this.z = d;
        return this;
    }

    /**
     * Set the x, y and z components to the supplied values.
     * 
     * @param x
     *          the x component
     * @param y
     *          the y component
     * @param z
     *          the z component
     * @return this
     */
    ref public Vector3d set(double x, double y, double z) return {
        this.x = x;
        this.y = y;
        this.z = z;
        return this;
    }

    /**
     * Set the three components of this vector to the first three elements of the given array.
     * 
     * @param xyz
     *          the array containing at least three elements
     * @return this
     */
    ref public Vector3d set(double[] xyz) return {
        this.x = xyz[0];
        this.y = xyz[1];
        this.z = xyz[2];
        return this;
    }

    /**
     * Set the three components of this vector to the first three elements of the given array.
     * 
     * @param xyz
     *          the array containing at least three elements
     * @return this
     */
    ref public Vector3d set(float[] xyz) return {
        this.x = xyz[0];
        this.y = xyz[1];
        this.z = xyz[2];
        return this;
    }

    /**
     * Set the value of the specified component of this vector.
     *
     * @param component
     *          the component whose value to set, within <code>[0..2]</code>
     * @param value
     *          the value to set
     * @return this
     * @throws IllegalArgumentException if <code>component</code> is not within <code>[0..2]</code>
     */
    ref public Vector3d setComponent(int component, double value) return {
        switch (component) {
            case 0:
                x = value;
                break;
            case 1:
                y = value;
                break;
            case 2:
                z = value;
                break;
            default: {}
        }
        return this;
    }

    /**
     * Subtract the supplied vector from this one.
     * 
     * @param v
     *          the vector to subtract from this
     * @return this
     */
    ref public Vector3d sub(Vector3d v) return {
        this.x = x - v.x;
        this.y = y - v.y;
        this.z = z - v.z;
        return this;
    }

    public Vector3d sub(Vector3d v, ref Vector3d dest) {
        dest.x = x - v.x;
        dest.y = y - v.y;
        dest.z = z - v.z;
        return dest;
    }


    /**
     * Subtract <code>(x, y, z)</code> from this vector.
     * 
     * @param x
     *          the x component to subtract
     * @param y
     *          the y component to subtract
     * @param z
     *          the z component to subtract
     * @return this
     */
    ref public Vector3d sub(double x, double y, double z) return {
        this.x = this.x - x;
        this.y = this.y - y;
        this.z = this.z - z;
        return this;
    }

    public Vector3d sub(double x, double y, double z, ref Vector3d dest) {
        dest.x = this.x - x;
        dest.y = this.y - y;
        dest.z = this.z - z;
        return dest;
    }

    /**
     * Add the supplied vector to this one.
     * 
     * @param v
     *          the vector to add
     * @return this
     */
    ref public Vector3d add(Vector3d v) return {
        this.x = x + v.x;
        this.y = y + v.y;
        this.z = z + v.z;
        return this;
    }

    public Vector3d add(Vector3d v, ref Vector3d dest) {
        dest.x = x + v.x;
        dest.y = y + v.y;
        dest.z = z + v.z;
        return dest;
    }


    /**
     * Increment the components of this vector by the given values.
     * 
     * @param x
     *          the x component to add
     * @param y
     *          the y component to add
     * @param z
     *          the z component to add
     * @return this
     */
    ref public Vector3d add(double x, double y, double z) return {
        this.x = this.x + x;
        this.y = this.y + y;
        this.z = this.z + z;
        return this;
    }

    public Vector3d add(double x, double y, double z, ref Vector3d dest) {
        dest.x = this.x + x;
        dest.y = this.y + y;
        dest.z = this.z + z;
        return dest;
    }

    /**
     * Add the component-wise multiplication of <code>a * b</code> to this vector.
     * 
     * @param a
     *          the first multiplicand
     * @param b
     *          the second multiplicand
     * @return this
     */
    ref public Vector3d fma(Vector3d a, Vector3d b) return {
        this.x = Math.fma(a.x, b.x, x);
        this.y = Math.fma(a.y, b.y, y);
        this.z = Math.fma(a.z, b.z, z);
        return this;
    }

    /**
     * Add the component-wise multiplication of <code>a * b</code> to this vector.
     * 
     * @param a
     *          the first multiplicand
     * @param b
     *          the second multiplicand
     * @return this
     */
    ref public Vector3d fma(double a, Vector3d b) return {
        this.x = Math.fma(a, b.x, x);
        this.y = Math.fma(a, b.y, y);
        this.z = Math.fma(a, b.z, z);
        return this;
    }

    public Vector3d fma(Vector3d a, Vector3d b, ref Vector3d dest) {
        dest.x = Math.fma(a.x, b.x, x);
        dest.y = Math.fma(a.y, b.y, y);
        dest.z = Math.fma(a.z, b.z, z);
        return dest;
    }

    public Vector3d fma(double a, Vector3d b, ref Vector3d dest) {
        dest.x = Math.fma(a, b.x, x);
        dest.y = Math.fma(a, b.y, y);
        dest.z = Math.fma(a, b.z, z);
        return dest;
    }

    /**
     * Add the component-wise multiplication of <code>this * a</code> to <code>b</code>
     * and store the result in <code>this</code>.
     * 
     * @param a
     *          the multiplicand
     * @param b
     *          the addend
     * @return this
     */
    ref public Vector3d mulAdd(Vector3d a, Vector3d b) return {
        this.x = Math.fma(x, a.x, b.x);
        this.y = Math.fma(y, a.y, b.y);
        this.z = Math.fma(z, a.z, b.z);
        return this;
    }

    /**
     * Add the component-wise multiplication of <code>this * a</code> to <code>b</code>
     * and store the result in <code>this</code>.
     * 
     * @param a
     *          the multiplicand
     * @param b
     *          the addend
     * @return this
     */
    ref public Vector3d mulAdd(double a, Vector3d b) return {
        this.x = Math.fma(x, a, b.x);
        this.y = Math.fma(y, a, b.y);
        this.z = Math.fma(z, a, b.z);
        return this;
    }

    public Vector3d mulAdd(Vector3d a, Vector3d b, ref Vector3d dest) {
        dest.x = Math.fma(x, a.x, b.x);
        dest.y = Math.fma(y, a.y, b.y);
        dest.z = Math.fma(z, a.z, b.z);
        return dest;
    }

    public Vector3d mulAdd(double a, Vector3d b, ref Vector3d dest) {
        dest.x = Math.fma(x, a, b.x);
        dest.y = Math.fma(y, a, b.y);
        dest.z = Math.fma(z, a, b.z);
        return dest;
    }

    /**
     * Multiply this Vector3d component-wise by another Vector3d.
     * 
     * @param v
     *          the vector to multiply by
     * @return this
     */
    ref public Vector3d mul(Vector3d v) return {
        this.x = x * v.x;
        this.y = y * v.y;
        this.z = z * v.z;
        return this;
    }

    public Vector3d mul(Vector3d v, ref Vector3d dest) {
        dest.x = x * v.x;
        dest.y = y * v.y;
        dest.z = z * v.z;
        return dest;
    }

    /**
     * Divide this Vector3d component-wise by another Vector3d.
     * 
     * @param v
     *          the vector to divide by
     * @return this
     */
    ref public Vector3d div(Vector3d v) return {
        this.x = x / v.x;
        this.y = y / v.y;
        this.z = z / v.z;
        return this;
    }


    public Vector3d div(Vector3d v, ref Vector3d dest) {
        dest.x = x / v.x;
        dest.y = y / v.y;
        dest.z = z / v.z;
        return dest;
    }

    public Vector3d mulProject(ref Matrix4d mat, double w, ref Vector3d dest) {
        double invW = 1.0 / Math.fma(mat.m03, x, Math.fma(mat.m13, y, Math.fma(mat.m23, z, mat.m33 * w)));
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, Math.fma(mat.m20, z, mat.m30 * w))) * invW;
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, Math.fma(mat.m21, z, mat.m31 * w))) * invW;
        double rz = Math.fma(mat.m02, x, Math.fma(mat.m12, y, Math.fma(mat.m22, z, mat.m32 * w))) * invW;
        dest.x = rx;
        dest.y = ry;
        dest.z = rz;
        return dest;
    }

    public Vector3d mulProject(ref Matrix4d mat, ref Vector3d dest) {
        double invW = 1.0 / Math.fma(mat.m03, x, Math.fma(mat.m13, y, Math.fma(mat.m23, z, mat.m33)));
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, Math.fma(mat.m20, z, mat.m30))) * invW;
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, Math.fma(mat.m21, z, mat.m31))) * invW;
        double rz = Math.fma(mat.m02, x, Math.fma(mat.m12, y, Math.fma(mat.m22, z, mat.m32))) * invW;
        dest.x = rx;
        dest.y = ry;
        dest.z = rz;
        return dest;
    }

    /**
     * Multiply the given matrix <code>mat</code> this Vector3d, perform perspective division.
     * <p>
     * This method uses <code>w=1.0</code> as the fourth vector component.
     * 
     * @param mat
     *          the matrix to multiply this vector by
     * @return this
     */
    ref public Vector3d mulProject(ref Matrix4d mat) return {
        double invW = 1.0 / Math.fma(mat.m03, x, Math.fma(mat.m13, y, Math.fma(mat.m23, z, mat.m33)));
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, Math.fma(mat.m20, z, mat.m30))) * invW;
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, Math.fma(mat.m21, z, mat.m31))) * invW;
        double rz = Math.fma(mat.m02, x, Math.fma(mat.m12, y, Math.fma(mat.m22, z, mat.m32))) * invW;
        this.x = rx;
        this.y = ry;
        this.z = rz;
        return this;
    }


    /**
     * Multiply the given matrix <code>mat</code> with this Vector3d.
     * 
     * @param mat
     *          the matrix to multiply this vector by
     * @return this
     */
    ref public Vector3d mul(ref Matrix3d mat) return {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, mat.m20 * z));
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, mat.m21 * z));
        double rz = Math.fma(mat.m02, x, Math.fma(mat.m12, y, mat.m22 * z));
        this.x = rx;
        this.y = ry;
        this.z = rz;
        return this;
    }

    public Vector3d mul(ref Matrix3d mat, ref Vector3d dest) {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, mat.m20 * z));
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, mat.m21 * z));
        double rz = Math.fma(mat.m02, x, Math.fma(mat.m12, y, mat.m22 * z));
        dest.x = rx;
        dest.y = ry;
        dest.z = rz;
        return dest;
    }

    /**
     * Multiply the given matrix with this Vector3d by assuming a third row in the matrix of <code>(0, 0, 1)</code>
     * and store the result in <code>this</code>.
     * 
     * @param mat
     *          the matrix
     * @return this
     */
    ref public Vector3d mul(ref Matrix3x2d mat) return {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, mat.m20 * z));
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, mat.m21 * z));
        this.x = rx;
        this.y = ry;
        return this;
    }

    public Vector3d mul(ref Matrix3x2d mat, ref Vector3d dest) {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, mat.m20 * z));
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, mat.m21 * z));
        dest.x = rx;
        dest.y = ry;
        dest.z = z;
        return dest;
    }


    /**
     * Multiply the transpose of the given matrix with this Vector3d and store the result in <code>this</code>.
     * 
     * @param mat
     *          the matrix
     * @return this
     */
    ref public Vector3d mulTranspose(ref Matrix3d mat) return {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m01, y, mat.m02 * z));
        double ry = Math.fma(mat.m10, x, Math.fma(mat.m11, y, mat.m12 * z));
        double rz = Math.fma(mat.m20, x, Math.fma(mat.m21, y, mat.m22 * z));
        this.x = rx;
        this.y = ry;
        this.z = rz;
        return this;
    }

    public Vector3d mulTranspose(ref Matrix3d mat, ref Vector3d dest) {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m01, y, mat.m02 * z));
        double ry = Math.fma(mat.m10, x, Math.fma(mat.m11, y, mat.m12 * z));
        double rz = Math.fma(mat.m20, x, Math.fma(mat.m21, y, mat.m22 * z));
        dest.x = rx;
        dest.y = ry;
        dest.z = rz;
        return dest;
    }

    /**
     * Multiply the given 4x4 matrix <code>mat</code> with <code>this</code>.
     * <p>
     * This method assumes the <code>w</code> component of <code>this</code> to be <code>1.0</code>.
     * 
     * @param mat
     *          the matrix to multiply this vector by
     * @return this
     */
    ref public Vector3d mulPosition(ref Matrix4d mat) return {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, Math.fma(mat.m20, z, mat.m30)));
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, Math.fma(mat.m21, z, mat.m31)));
        double rz = Math.fma(mat.m02, x, Math.fma(mat.m12, y, Math.fma(mat.m22, z, mat.m32)));
        this.x = rx;
        this.y = ry;
        this.z = rz;
        return this;
    }

    /**
     * Multiply the given 4x3 matrix <code>mat</code> with <code>this</code>.
     * <p>
     * This method assumes the <code>w</code> component of <code>this</code> to be <code>1.0</code>.
     * 
     * @param mat
     *          the matrix to multiply this vector by
     * @return this
     */
    ref public Vector3d mulPosition(ref Matrix4x3d mat) return {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, Math.fma(mat.m20, z, mat.m30)));
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, Math.fma(mat.m21, z, mat.m31)));
        double rz = Math.fma(mat.m02, x, Math.fma(mat.m12, y, Math.fma(mat.m22, z, mat.m32)));
        this.x = rx;
        this.y = ry;
        this.z = rz;
        return this;
    }


    public Vector3d mulPosition(ref Matrix4d mat, ref Vector3d dest) {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, Math.fma(mat.m20, z, mat.m30)));
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, Math.fma(mat.m21, z, mat.m31)));
        double rz = Math.fma(mat.m02, x, Math.fma(mat.m12, y, Math.fma(mat.m22, z, mat.m32)));
        dest.x = rx;
        dest.y = ry;
        dest.z = rz;
        return dest;
    }

    public Vector3d mulPosition(ref Matrix4x3d mat, ref Vector3d dest) {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, Math.fma(mat.m20, z, mat.m30)));
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, Math.fma(mat.m21, z, mat.m31)));
        double rz = Math.fma(mat.m02, x, Math.fma(mat.m12, y, Math.fma(mat.m22, z, mat.m32)));
        dest.x = rx;
        dest.y = ry;
        dest.z = rz;
        return dest;
    }

    /**
     * Multiply the transpose of the given 4x4 matrix <code>mat</code> with <code>this</code>.
     * <p>
     * This method assumes the <code>w</code> component of <code>this</code> to be <code>1.0</code>.
     * 
     * @param mat
     *          the matrix whose transpose to multiply this vector by
     * @return this
     */
    ref public Vector3d mulTransposePosition(ref Matrix4d mat) return {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m01, y, Math.fma(mat.m02, z, mat.m03)));
        double ry = Math.fma(mat.m10, x, Math.fma(mat.m11, y, Math.fma(mat.m12, z, mat.m13)));
        double rz = Math.fma(mat.m20, x, Math.fma(mat.m21, y, Math.fma(mat.m22, z, mat.m23)));
        this.x = rx;
        this.y = ry;
        this.z = rz;
        return this;
    }

    public Vector3d mulTransposePosition(ref Matrix4d mat, ref Vector3d dest) {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m01, y, Math.fma(mat.m02, z, mat.m03)));
        double ry = Math.fma(mat.m10, x, Math.fma(mat.m11, y, Math.fma(mat.m12, z, mat.m13)));
        double rz = Math.fma(mat.m20, x, Math.fma(mat.m21, y, Math.fma(mat.m22, z, mat.m23)));
        dest.x = rx;
        dest.y = ry;
        dest.z = rz;
        return dest;
    }




    /**
     * Multiply the given 4x4 matrix <code>mat</code> with <code>this</code> and return the <i>w</i> component
     * of the resulting 4D vector.
     * <p>
     * This method assumes the <code>w</code> component of <code>this</code> to be <code>1.0</code>.
     * 
     * @param mat
     *          the matrix to multiply this vector by
     * @return the <i>w</i> component of the resulting 4D vector after multiplication
     */
    public double mulPositionW(ref Matrix4d mat) {
        double w = Math.fma(mat.m03, x, Math.fma(mat.m13, y, Math.fma(mat.m23, z, mat.m33)));
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, Math.fma(mat.m20, z, mat.m30)));
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, Math.fma(mat.m21, z, mat.m31)));
        double rz = Math.fma(mat.m02, x, Math.fma(mat.m12, y, Math.fma(mat.m22, z, mat.m32)));
        this.x = rx;
        this.y = ry;
        this.z = rz;
        return w;
    }

    public double mulPositionW(ref Matrix4d mat, ref Vector3d dest) {
        double w = Math.fma(mat.m03, x, Math.fma(mat.m13, y, Math.fma(mat.m23, z, mat.m33)));
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, Math.fma(mat.m20, z, mat.m30)));
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, Math.fma(mat.m21, z, mat.m31)));
        double rz = Math.fma(mat.m02, x, Math.fma(mat.m12, y, Math.fma(mat.m22, z, mat.m32)));
        dest.x = rx;
        dest.y = ry;
        dest.z = rz;
        return w;
    }


    /**
     * Multiply the given 4x4 matrix <code>mat</code> with <code>this</code>.
     * <p>
     * This method assumes the <code>w</code> component of <code>this</code> to be <code>0.0</code>.
     * 
     * @param mat
     *          the matrix to multiply this vector by
     * @return this
     */
    ref public Vector3d mulDirection(ref Matrix4d mat) return {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, mat.m20 * z));
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, mat.m21 * z));
        double rz = Math.fma(mat.m02, x, Math.fma(mat.m12, y, mat.m22 * z));
        this.x = rx;
        this.y = ry;
        this.z = rz;
        return this;
    }

    /**
     * Multiply the given 4x3 matrix <code>mat</code> with <code>this</code>.
     * <p>
     * This method assumes the <code>w</code> component of <code>this</code> to be <code>0.0</code>.
     * 
     * @param mat
     *          the matrix to multiply this vector by
     * @return this
     */
    ref public Vector3d mulDirection(ref Matrix4x3d mat) return {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, mat.m20 * z));
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, mat.m21 * z));
        double rz = Math.fma(mat.m02, x, Math.fma(mat.m12, y, mat.m22 * z));
        this.x = rx;
        this.y = ry;
        this.z = rz;
        return this;
    }


    public Vector3d mulDirection(ref Matrix4d mat, Vector3d dest) {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, mat.m20 * z));
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, mat.m21 * z));
        double rz = Math.fma(mat.m02, x, Math.fma(mat.m12, y, mat.m22 * z));
        dest.x = rx;
        dest.y = ry;
        dest.z = rz;
        return dest;
    }

    public Vector3d mulDirection(ref Matrix4x3d mat, ref Vector3d dest) {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m10, y, mat.m20 * z));
        double ry = Math.fma(mat.m01, x, Math.fma(mat.m11, y, mat.m21 * z));
        double rz = Math.fma(mat.m02, x, Math.fma(mat.m12, y, mat.m22 * z));
        dest.x = rx;
        dest.y = ry;
        dest.z = rz;
        return dest;
    }


    /**
     * Multiply the transpose of the given 4x4 matrix <code>mat</code> with <code>this</code>.
     * <p>
     * This method assumes the <code>w</code> component of <code>this</code> to be <code>0.0</code>.
     * 
     * @param mat
     *          the matrix whose transpose to multiply this vector by
     * @return this
     */
    ref public Vector3d mulTransposeDirection(ref Matrix4d mat) return {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m01, y, mat.m02 * z));
        double ry = Math.fma(mat.m10, x, Math.fma(mat.m11, y, mat.m12 * z));
        double rz = Math.fma(mat.m20, x, Math.fma(mat.m21, y, mat.m22 * z));
        this.x = rx;
        this.y = ry;
        this.z = rz;
        return this;
    }

    public Vector3d mulTransposeDirection(ref Matrix4d mat, ref Vector3d dest) {
        double rx = Math.fma(mat.m00, x, Math.fma(mat.m01, y, mat.m02 * z));
        double ry = Math.fma(mat.m10, x, Math.fma(mat.m11, y, mat.m12 * z));
        double rz = Math.fma(mat.m20, x, Math.fma(mat.m21, y, mat.m22 * z));
        dest.x = rx;
        dest.y = ry;
        dest.z = rz;
        return dest;
    }

    /**
     * Multiply this Vector3d by the given scalar value.
     * 
     * @param scalar
     *          the scalar to multiply this vector by
     * @return this
     */
    ref public Vector3d mul(double scalar) return {
        this.x = x * scalar;
        this.y = y * scalar;
        this.z = z * scalar;
        return this;
    }

    public Vector3d mul(double scalar, ref Vector3d dest) {
        dest.x = x * scalar;
        dest.y = y * scalar;
        dest.z = z * scalar;
        return dest;
    }

    /**
     * Multiply the components of this Vector3d by the given scalar values and store the result in <code>this</code>.
     * 
     * @param x
     *          the x component to multiply this vector by
     * @param y
     *          the y component to multiply this vector by
     * @param z
     *          the z component to multiply this vector by
     * @return this
     */
    ref public Vector3d mul(double x, double y, double z) return {
        this.x = this.x * x;
        this.y = this.y * y;
        this.z = this.z * z;
        return this;
    }

    public Vector3d mul(double x, double y, double z, ref Vector3d dest) {
        dest.x = this.x * x;
        dest.y = this.y * y;
        dest.z = this.z * z;
        return dest;
    }

    /**
     * Rotate this vector by the given quaternion <code>quat</code> and store the result in <code>this</code>.
     * 
     * @see Quaterniond#transform(Vector3d)
     * 
     * @param quat
     *          the quaternion to rotate this vector
     * @return this
     */
    ref public Vector3d rotate(Quaterniond quat) return {
        quat.transform(this, this);
        return this;
    }

    public Vector3d rotate(Quaterniond quat, ref Vector3d dest) {
        return quat.transform(this, dest);
    }

    public Quaterniond rotationTo(Vector3d toDir, ref Quaterniond dest) {
        return dest.rotationTo(this, toDir);
    }

    public Quaterniond rotationTo(double toDirX, double toDirY, double toDirZ, ref Quaterniond dest) {
        return dest.rotationTo(x, y, z, toDirX, toDirY, toDirZ);
    }

    /**
     * Rotate this vector the specified radians around the given rotation axis.
     * 
     * @param angle
     *          the angle in radians
     * @param x
     *          the x component of the rotation axis
     * @param y
     *          the y component of the rotation axis
     * @param z
     *          the z component of the rotation axis
     * @return this
     */
    ref public Vector3d rotateAxis(double angle, double x, double y, double z) return {
        if (y == 0.0 && z == 0.0 && Math.absEqualsOne(x))
            rotateX(x * angle, this);
        else if (x == 0.0 && z == 0.0 && Math.absEqualsOne(y))
            rotateY(y * angle, this);
        else if (x == 0.0 && y == 0.0 && Math.absEqualsOne(z))
            rotateZ(z * angle, this);
        else
            rotateAxisInternal(angle, x, y, z, this);

        return this;
    }

    public Vector3d rotateAxis(double angle, double aX, double aY, double aZ, ref Vector3d dest) {
        if (aY == 0.0 && aZ == 0.0 && Math.absEqualsOne(aX))
            return rotateX(aX * angle, dest);
        else if (aX == 0.0 && aZ == 0.0 && Math.absEqualsOne(aY))
            return rotateY(aY * angle, dest);
        else if (aX == 0.0 && aY == 0.0 && Math.absEqualsOne(aZ))
            return rotateZ(aZ * angle, dest);
        return rotateAxisInternal(angle, aX, aY, aZ, dest);
    }

    private Vector3d rotateAxisInternal(double angle, double aX, double aY, double aZ, ref Vector3d dest) {
        double hangle = angle * 0.5;
        double sinAngle = Math.sin(hangle);
        double qx = aX * sinAngle, qy = aY * sinAngle, qz = aZ * sinAngle;
        double qw = Math.cosFromSin(sinAngle, hangle);
        double w2 = qw * qw, x2 = qx * qx, y2 = qy * qy, z2 = qz * qz, zw = qz * qw;
        double xy = qx * qy, xz = qx * qz, yw = qy * qw, yz = qy * qz, xw = qx * qw;
        double nx = (w2 + x2 - z2 - y2) * x + (-zw + xy - zw + xy) * y + (yw + xz + xz + yw) * z;
        double ny = (xy + zw + zw + xy) * x + ( y2 - z2 + w2 - x2) * y + (yz + yz - xw - xw) * z;
        double nz = (xz - yw + xz - yw) * x + ( yz + yz + xw + xw) * y + (z2 - y2 - x2 + w2) * z;
        dest.x = nx;
        dest.y = ny;
        dest.z = nz;
        return dest;
    }

    /**
     * Rotate this vector the specified radians around the X axis.
     * 
     * @param angle
     *          the angle in radians
     * @return this
     */
    ref public Vector3d rotateX(double angle) return {
        double sin = Math.sin(angle), cos = Math.cosFromSin(sin, angle);
        double y = this.y * cos - this.z * sin;
        double z = this.y * sin + this.z * cos;
        this.y = y;
        this.z = z;
        return this;
    }

    public Vector3d rotateX(double angle, ref Vector3d dest) {
        double sin = Math.sin(angle), cos = Math.cosFromSin(sin, angle);
        double y = this.y * cos - this.z * sin;
        double z = this.y * sin + this.z * cos;
        dest.x = this.x;
        dest.y = y;
        dest.z = z;
        return dest;
    }

    /**
     * Rotate this vector the specified radians around the Y axis.
     * 
     * @param angle
     *          the angle in radians
     * @return this
     */
    ref public Vector3d rotateY(double angle) return {
        double sin = Math.sin(angle), cos = Math.cosFromSin(sin, angle);
        double x =  this.x * cos + this.z * sin;
        double z = -this.x * sin + this.z * cos;
        this.x = x;
        this.z = z;
        return this;
    }

    public Vector3d rotateY(double angle, ref Vector3d dest) {
        double sin = Math.sin(angle), cos = Math.cosFromSin(sin, angle);
        double x =  this.x * cos + this.z * sin;
        double z = -this.x * sin + this.z * cos;
        dest.x = x;
        dest.y = this.y;
        dest.z = z;
        return dest;
    }

    /**
     * Rotate this vector the specified radians around the Z axis.
     * 
     * @param angle
     *          the angle in radians
     * @return this
     */
    ref public Vector3d rotateZ(double angle) return {
        double sin = Math.sin(angle), cos = Math.cosFromSin(sin, angle);
        double x = this.x * cos - this.y * sin;
        double y = this.x * sin + this.y * cos;
        this.x = x;
        this.y = y;
        return this;
    }

    public Vector3d rotateZ(double angle, ref Vector3d dest) {
        double sin = Math.sin(angle), cos = Math.cosFromSin(sin, angle);
        double x = this.x * cos - this.y * sin;
        double y = this.x * sin + this.y * cos;
        dest.x = x;
        dest.y = y;
        dest.z = this.z;
        return dest;
    }

    /**
     * Divide this Vector3d by the given scalar value.
     * 
     * @param scalar
     *          the scalar to divide this vector by
     * @return this
     */
    ref public Vector3d div(double scalar) return {
        double inv = 1.0 / scalar;
        this.x = x * inv;
        this.y = y * inv;
        this.z = z * inv;
        return this;
    }

    public Vector3d div(double scalar, ref Vector3d dest) {
        double inv = 1.0 / scalar;
        dest.x = x * inv;
        dest.y = y * inv;
        dest.z = z * inv;
        return dest;
    }

    /**
     * Divide the components of this Vector3d by the given scalar values and store the result in <code>this</code>.
     * 
     * @param x
     *          the x component to divide this vector by
     * @param y
     *          the y component to divide this vector by
     * @param z
     *          the z component to divide this vector by
     * @return this
     */
    ref public Vector3d div(double x, double y, double z) return {
        this.x = this.x / x;
        this.y = this.y / y;
        this.z = this.z / z;
        return this;
    }

    public Vector3d div(double x, double y, double z, ref Vector3d dest) {
        dest.x = this.x / x;
        dest.y = this.y / y;
        dest.z = this.z / z;
        return dest;
    }

    public double lengthSquared() {
        return Math.fma(x, x, Math.fma(y, y, z * z));
    }

    /**
     * Get the length squared of a 3-dimensional double-precision vector.
     *
     * @param x The vector's x component
     * @param y The vector's y component
     * @param z The vector's z component
     *
     * @return the length squared of the given vector
     *
     * @author F. Neurath
     */
    public static double lengthSquared(double x, double y, double z) {
        return Math.fma(x, x, Math.fma(y, y, z * z));
    }

    public double length() {
        return Math.sqrt(Math.fma(x, x, Math.fma(y, y, z * z)));
    }

    /**
     * Get the length of a 3-dimensional double-precision vector.
     *
     * @param x The vector's x component
     * @param y The vector's y component
     * @param z The vector's z component
     *
     * @return the length of the given vector
     *
     * @author F. Neurath
     */
    public static double length(double x, double y, double z) {
        return Math.sqrt(Math.fma(x, x, Math.fma(y, y, z * z)));
    }

    /**
     * Normalize this vector.
     * 
     * @return this
     */
    ref public Vector3d normalize() return {
        double invLength = Math.invsqrt(Math.fma(x, x, Math.fma(y, y, z * z)));
        this.x = x * invLength;
        this.y = y * invLength;
        this.z = z * invLength;
        return this;
    }

    public Vector3d normalize(ref Vector3d dest) {
        double invLength = Math.invsqrt(Math.fma(x, x, Math.fma(y, y, z * z)));
        dest.x = x * invLength;
        dest.y = y * invLength;
        dest.z = z * invLength;
        return dest;
    }

    /**
     * Scale this vector to have the given length.
     * 
     * @param length
     *          the desired length
     * @return this
     */
    ref public Vector3d normalize(double length) return {
        double invLength = Math.invsqrt(Math.fma(x, x, Math.fma(y, y, z * z))) * length;
        this.x = x * invLength;
        this.y = y * invLength;
        this.z = z * invLength;
        return this;
    }

    public Vector3d normalize(double length, ref Vector3d dest) {
        double invLength = Math.invsqrt(Math.fma(x, x, Math.fma(y, y, z * z))) * length;
        dest.x = x * invLength;
        dest.y = y * invLength;
        dest.z = z * invLength;
        return dest;
    }

    /**
     * Set this vector to be the cross product of this and v2.
     * 
     * @param v
     *          the other vector
     * @return this
     */
    ref public Vector3d cross(Vector3d v) return {
        double rx = Math.fma(y, v.z, -z * v.y);
        double ry = Math.fma(z, v.x, -x * v.z);
        double rz = Math.fma(x, v.y, -y * v.x);
        this.x = rx;
        this.y = ry;
        this.z = rz;
        return this;
    }

    /**
     * Set this vector to be the cross product of itself and <code>(x, y, z)</code>.
     * 
     * @param x
     *          the x component of the other vector
     * @param y
     *          the y component of the other vector
     * @param z
     *          the z component of the other vector
     * @return this
     */
    ref public Vector3d cross(double x, double y, double z) return {
        double rx = Math.fma(this.y, z, -this.z * y);
        double ry = Math.fma(this.z, x, -this.x * z);
        double rz = Math.fma(this.x, y, -this.y * x);
        this.x = rx;
        this.y = ry;
        this.z = rz;
        return this;
    }

    public Vector3d cross(Vector3d v, ref Vector3d dest) {
        double rx = Math.fma(y, v.z, -z * v.y);
        double ry = Math.fma(z, v.x, -x * v.z);
        double rz = Math.fma(x, v.y, -y * v.x);
        dest.x = rx;
        dest.y = ry;
        dest.z = rz;
        return dest;
    }

    public Vector3d cross(double x, double y, double z, ref Vector3d dest) {
        double rx = Math.fma(this.y, z, -this.z * y);
        double ry = Math.fma(this.z, x, -this.x * z);
        double rz = Math.fma(this.x, y, -this.y * x);
        dest.x = rx;
        dest.y = ry;
        dest.z = rz;
        return dest;
    }

    public double distance(Vector3d v) {
        double dx = this.x - v.x;
        double dy = this.y - v.y;
        double dz = this.z - v.z;
        return Math.sqrt(Math.fma(dx, dx, Math.fma(dy, dy, dz * dz)));
    }

    public double distance(double x, double y, double z) {
        double dx = this.x - x;
        double dy = this.y - y;
        double dz = this.z - z;
        return Math.sqrt(Math.fma(dx, dx, Math.fma(dy, dy, dz * dz)));
    }

    public double distanceSquared(Vector3d v) {
        double dx = this.x - v.x;
        double dy = this.y - v.y;
        double dz = this.z - v.z;
        return Math.fma(dx, dx, Math.fma(dy, dy, dz * dz));
    }

    public double distanceSquared(double x, double y, double z) {
        double dx = this.x - x;
        double dy = this.y - y;
        double dz = this.z - z;
        return Math.fma(dx, dx, Math.fma(dy, dy, dz * dz));
    }

    /**
     * Return the distance between <code>(x1, y1, z1)</code> and <code>(x2, y2, z2)</code>.
     *
     * @param x1
     *          the x component of the first vector
     * @param y1
     *          the y component of the first vector
     * @param z1
     *          the z component of the first vector
     * @param x2
     *          the x component of the second vector
     * @param y2
     *          the y component of the second vector
     * @param z2
     *          the z component of the second vector
     * @return the euclidean distance
     */
    public static double distance(double x1, double y1, double z1, double x2, double y2, double z2) {
        return Math.sqrt(distanceSquared(x1, y1, z1, x2, y2, z2));
    }

    /**
     * Return the squared distance between <code>(x1, y1, z1)</code> and <code>(x2, y2, z2)</code>.
     *
     * @param x1
     *          the x component of the first vector
     * @param y1
     *          the y component of the first vector
     * @param z1
     *          the z component of the first vector
     * @param x2
     *          the x component of the second vector
     * @param y2
     *          the y component of the second vector
     * @param z2
     *          the z component of the second vector
     * @return the euclidean distance squared
     */
    public static double distanceSquared(double x1, double y1, double z1, double x2, double y2, double z2) {
        double dx = x1 - x2;
        double dy = y1 - y2;
        double dz = z1 - z2;
        return Math.fma(dx, dx, Math.fma(dy, dy, dz * dz));
    }

    public double dot(Vector3d v) {
        return Math.fma(this.x, v.x, Math.fma(this.y, v.y, this.z * v.z));
    }

    public double dot(double x, double y, double z) {
        return Math.fma(this.x, x, Math.fma(this.y, y, this.z * z));
    }

    public double angleCos(Vector3d v) {
        double length1Squared = Math.fma(x, x, Math.fma(y, y, z * z));
        double length2Squared = Math.fma(v.x, v.x, Math.fma(v.y, v.y, v.z * v.z));
        double dot = Math.fma(x, v.x, Math.fma(y, v.y, z * v.z));
        return dot / Math.sqrt(length1Squared * length2Squared);
    }

    public double angle(Vector3d v) {
        double cos = angleCos(v);
        // This is because sometimes cos goes above 1 or below -1 because of lost precision
        cos = cos < 1 ? cos : 1;
        cos = cos > -1 ? cos : -1;
        return Math.acos(cos);
    }

    public double angleSigned(Vector3d v, Vector3d n) {
        double x = v.x;
        double y = v.y;
        double z = v.z;
        return Math.atan2(
        (this.y * z - this.z * y) * n.x + (this.z * x - this.x * z) * n.y + (this.x * y - this.y * x) * n.z,
        this.x * x + this.y * y + this.z * z);
    }

    public double angleSigned(double x, double y, double z, double nx, double ny, double nz) {
        return Math.atan2(
                (this.y * z - this.z * y) * nx + (this.z * x - this.x * z) * ny + (this.x * y - this.y * x) * nz,
                this.x * x + this.y * y + this.z * z);
    }

    /**
     * Set the components of this vector to be the component-wise minimum of this and the other vector.
     *
     * @param v
     *          the other vector
     * @return this
     */
    ref public Vector3d min(Vector3d v) return {
        this.x = x < v.x ? x : v.x;
        this.y = y < v.y ? y : v.y;
        this.z = z < v.z ? z : v.z;
        return this;
    }

    public Vector3d min(Vector3d v, ref Vector3d dest) {
        dest.x = x < v.x ? x : v.x;
        dest.y = y < v.y ? y : v.y;
        dest.z = z < v.z ? z : v.z;
        return dest;
    }

    /**
     * Set the components of this vector to be the component-wise maximum of this and the other vector.
     *
     * @param v
     *          the other vector
     * @return this
     */
    ref public Vector3d max(Vector3d v) return {
        this.x = x > v.x ? x : v.x;
        this.y = y > v.y ? y : v.y;
        this.z = z > v.z ? z : v.z;
        return this;
    }

    public Vector3d max(Vector3d v, ref Vector3d dest) {
        dest.x = x > v.x ? x : v.x;
        dest.y = y > v.y ? y : v.y;
        dest.z = z > v.z ? z : v.z;
        return dest;
    }

    /**
     * Set all components to zero.
     * 
     * @return this
     */
    ref public Vector3d zero() return {
        this.x = 0;
        this.y = 0;
        this.z = 0;
        return this;
    }

    /**
     * Negate this vector.
     * 
     * @return this
     */
    ref public Vector3d negate() return {
        this.x = -x;
        this.y = -y;
        this.z = -z;
        return this;
    }

    public Vector3d negate(ref Vector3d dest) {
        dest.x = -x;
        dest.y = -y;
        dest.z = -z;
        return dest;
    }

    /**
     * Set <code>this</code> vector's components to their respective absolute values.
     * 
     * @return this
     */
    ref public Vector3d absolute() return {
        this.x = Math.abs(this.x);
        this.y = Math.abs(this.y);
        this.z = Math.abs(this.z);
        return this;
    }

    public Vector3d absolute(ref Vector3d dest) {
        dest.x = Math.abs(this.x);
        dest.y = Math.abs(this.y);
        dest.z = Math.abs(this.z);
        return dest;
    }

    public int hashCode() {
        immutable int prime = 31;
        int result = 1;
        long temp;
        temp = Math.doubleToLongBits(x);
        result = prime * result + cast(int) (temp ^ (temp >>> 32));
        temp = Math.doubleToLongBits(y);
        result = prime * result + cast(int) (temp ^ (temp >>> 32));
        temp = Math.doubleToLongBits(z);
        result = prime * result + cast(int) (temp ^ (temp >>> 32));
        return result;
    }


    public bool equals(Vector3d v, double delta) {
        if (this == v)
            return true;
        if (!Math.equals(x, v.x, delta))
            return false;
        if (!Math.equals(y, v.y, delta))
            return false;
        if (!Math.equals(z, v.z, delta))
            return false;
        return true;
    }

    public bool equals(double x, double y, double z) {
        if (Math.doubleToLongBits(this.x) != Math.doubleToLongBits(x))
            return false;
        if (Math.doubleToLongBits(this.y) != Math.doubleToLongBits(y))
            return false;
        if (Math.doubleToLongBits(this.z) != Math.doubleToLongBits(z))
            return false;
        return true;
    }

    public bool equals(Vector3d other) {
        if (Math.doubleToLongBits(this.x) != Math.doubleToLongBits(other.x))
            return false;
        if (Math.doubleToLongBits(this.y) != Math.doubleToLongBits(other.y))
            return false;
        if (Math.doubleToLongBits(this.z) != Math.doubleToLongBits(other.z))
            return false;
        return true;
    }

    /**
     * Reflect this vector about the given normal vector.
     * 
     * @param normal
     *          the vector to reflect about
     * @return this
     */
    ref public Vector3d reflect(Vector3d normal) return {
        double x = normal.x;
        double y = normal.y;
        double z = normal.z;
        double dot = Math.fma(this.x, x, Math.fma(this.y, y, this.z * z));
        this.x = this.x - (dot + dot) * x;
        this.y = this.y - (dot + dot) * y;
        this.z = this.z - (dot + dot) * z;
        return this;
    }

    /**
     * Reflect this vector about the given normal vector.
     * 
     * @param x
     *          the x component of the normal
     * @param y
     *          the y component of the normal
     * @param z
     *          the z component of the normal
     * @return this
     */
    ref public Vector3d reflect(double x, double y, double z) return {
        double dot = Math.fma(this.x, x, Math.fma(this.y, y, this.z * z));
        this.x = this.x - (dot + dot) * x;
        this.y = this.y - (dot + dot) * y;
        this.z = this.z - (dot + dot) * z;
        return this;
    }

    public Vector3d reflect(Vector3d normal, ref Vector3d dest) {
        double x = normal.x;
        double y = normal.y;
        double z = normal.z;
        double dot = Math.fma(this.x, x, Math.fma(this.y, y, this.z * z));
        dest.x = this.x - (dot + dot) * x;
        dest.y = this.y - (dot + dot) * y;
        dest.z = this.z - (dot + dot) * z;
        return dest;
    }

    public Vector3d reflect(double x, double y, double z, ref Vector3d dest) {
        double dot = Math.fma(this.x, x, Math.fma(this.y, y, this.z * z));
        dest.x = this.x - (dot + dot) * x;
        dest.y = this.y - (dot + dot) * y;
        dest.z = this.z - (dot + dot) * z;
        return dest;
    }

    /**
     * Compute the half vector between this and the other vector.
     * 
     * @param other
     *          the other vector
     * @return this
     */
    ref public Vector3d half(Vector3d other) return {
        return this.set(this).add(other.x, other.y, other.z).normalize();
    }

    /**
     * Compute the half vector between this and the vector <code>(x, y, z)</code>.
     * 
     * @param x
     *          the x component of the other vector
     * @param y
     *          the y component of the other vector
     * @param z
     *          the z component of the other vector
     * @return this
     */
    ref public Vector3d half(double x, double y, double z) return {
        return this.set(this).add(x, y, z).normalize();
    }

    public Vector3d half(Vector3d other, ref Vector3d dest) {
        return dest.set(this).add(other.x, other.y, other.z).normalize();
    }

    public Vector3d half(double x, double y, double z, ref Vector3d dest) {
        return dest.set(this).add(x, y, z).normalize();
    }

    public Vector3d smoothStep(Vector3d v, double t, ref Vector3d dest) {
        double t2 = t * t;
        double t3 = t2 * t;
        dest.x = (x + x - v.x - v.x) * t3 + (3.0 * v.x - 3.0 * x) * t2 + x * t + x;
        dest.y = (y + y - v.y - v.y) * t3 + (3.0 * v.y - 3.0 * y) * t2 + y * t + y;
        dest.z = (z + z - v.z - v.z) * t3 + (3.0 * v.z - 3.0 * z) * t2 + z * t + z;
        return dest;
    }

    public Vector3d hermite(Vector3d t0, Vector3d v1, Vector3d t1, double t, ref Vector3d dest) {
        double t2 = t * t;
        double t3 = t2 * t;
        dest.x = (x + x - v1.x - v1.x + t1.x + t0.x) * t3 + (3.0 * v1.x - 3.0 * x - t0.x - t0.x - t1.x) * t2 + x * t + x;
        dest.y = (y + y - v1.y - v1.y + t1.y + t0.y) * t3 + (3.0 * v1.y - 3.0 * y - t0.y - t0.y - t1.y) * t2 + y * t + y;
        dest.z = (z + z - v1.z - v1.z + t1.z + t0.z) * t3 + (3.0 * v1.z - 3.0 * z - t0.z - t0.z - t1.z) * t2 + z * t + z;
        return dest;
    }

    /**
     * Linearly interpolate <code>this</code> and <code>other</code> using the given interpolation factor <code>t</code>
     * and store the result in <code>this</code>.
     * <p>
     * If <code>t</code> is <code>0.0</code> then the result is <code>this</code>. If the interpolation factor is <code>1.0</code>
     * then the result is <code>other</code>.
     * 
     * @param other
     *          the other vector
     * @param t
     *          the interpolation factor between 0.0 and 1.0
     * @return this
     */
    ref public Vector3d lerp(Vector3d other, double t) return {
        this.x = Math.fma(other.x - x, t, x);
        this.y = Math.fma(other.y - y, t, y);
        this.z = Math.fma(other.z - z, t, z);
        return this;
    }

    public Vector3d lerp(Vector3d other, double t, ref Vector3d dest) {
        dest.x = Math.fma(other.x - x, t, x);
        dest.y = Math.fma(other.y - y, t, y);
        dest.z = Math.fma(other.z - z, t, z);
        return dest;
    }

    public double get(int component) {
        switch (component) {
        case 0:
            return x;
        case 1:
            return y;
        case 2:
            return z;
        default:
            return 0;
        }
    }

    public Vector3i get(int mode, ref Vector3i dest) {
        dest.x = Math.roundUsing(this.x, mode);
        dest.y = Math.roundUsing(this.y, mode);
        dest.z = Math.roundUsing(this.z, mode);
        return dest;
    }

    public Vector3d get(ref Vector3d dest) {
        dest.x = this.x;
        dest.y = this.y;
        dest.z = this.z;
        return dest;
    }

    public int maxComponent() {
        double absX = Math.abs(x);
        double absY = Math.abs(y);
        double absZ = Math.abs(z);
        if (absX >= absY && absX >= absZ) {
            return 0;
        } else if (absY >= absZ) {
            return 1;
        }
        return 2;
    }

    public int minComponent() {
        double absX = Math.abs(x);
        double absY = Math.abs(y);
        double absZ = Math.abs(z);
        if (absX < absY && absX < absZ) {
            return 0;
        } else if (absY < absZ) {
            return 1;
        }
        return 2;
    }

    public Vector3d orthogonalize(Vector3d v, ref Vector3d dest) {
        /*
         * http://lolengine.net/blog/2013/09/21/picking-orthogonal-vector-combing-coconuts
         */
        double rx, ry, rz;
        if (Math.abs(v.x) > Math.abs(v.z)) {
            rx = -v.y;
            ry = v.x;
            rz = 0.0;
        } else {
            rx = 0.0;
            ry = -v.z;
            rz = v.y;
        }
        double invLen = Math.invsqrt(rx * rx + ry * ry + rz * rz);
        dest.x = rx * invLen;
        dest.y = ry * invLen;
        dest.z = rz * invLen;
        return dest;
    }

    /**
     * Transform <code>this</code> vector so that it is orthogonal to the given vector <code>v</code> and normalize the result.
     * <p>
     * Reference: <a href="https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process">Gram–Schmidt process</a>
     * 
     * @param v
     *          the reference vector which the result should be orthogonal to
     * @return this
     */
    ref public Vector3d orthogonalize(Vector3d v) return {
        orthogonalize(v, this);
        return this;
    }

    public Vector3d orthogonalizeUnit(Vector3d v, ref Vector3d dest) {
        return orthogonalize(v, dest);
    }

    /**
     * Transform <code>this</code> vector so that it is orthogonal to the given unit vector <code>v</code> and normalize the result.
     * <p>
     * The vector <code>v</code> is assumed to be a {@link #normalize() unit} vector.
     * <p>
     * Reference: <a href="https://en.wikipedia.org/wiki/Gram%E2%80%93Schmidt_process">Gram–Schmidt process</a>
     * 
     * @param v
     *          the reference unit vector which the result should be orthogonal to
     * @return this
     */
    ref public Vector3d orthogonalizeUnit(Vector3d v) return {
        orthogonalizeUnit(v, this);
        return this;
    }

    /**
     * Set each component of this vector to the largest (closest to positive
     * infinity) {@code double} value that is less than or equal to that
     * component and is equal to a mathematical integer.
     *
     * @return this
     */
    ref public Vector3d floor() return {
        this.x = Math.floor(x);
        this.y = Math.floor(y);
        this.z = Math.floor(z);
        return this;
    }

    public Vector3d floor(ref Vector3d dest) {
        dest.x = Math.floor(x);
        dest.y = Math.floor(y);
        dest.z = Math.floor(z);
        return dest;
    }

    /**
     * Set each component of this vector to the smallest (closest to negative
     * infinity) {@code double} value that is greater than or equal to that
     * component and is equal to a mathematical integer.
     *
     * @return this
     */
    ref public Vector3d ceil() return {
        this.x = Math.ceil(x);
        this.y = Math.ceil(y);
        this.z = Math.ceil(z);
        return this;
    }

    public Vector3d ceil(ref Vector3d dest) {
        dest.x = Math.ceil(x);
        dest.y = Math.ceil(y);
        dest.z = Math.ceil(z);
        return dest;
    }

    /**
     * Set each component of this vector to the closest double that is equal to
     * a mathematical integer, with ties rounding to positive infinity.
     *
     * @return this
     */
    ref public Vector3d round() return {
        this.x = Math.round(x);
        this.y = Math.round(y);
        this.z = Math.round(z);
        return this;
    }

    public Vector3d round(ref Vector3d dest) {
        dest.x = Math.round(x);
        dest.y = Math.round(y);
        dest.z = Math.round(z);
        return dest;
    }

    public bool isFinite() {
        return Math.isFinite(x) && Math.isFinite(y) && Math.isFinite(z);
    }
}
