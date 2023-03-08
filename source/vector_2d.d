module vector_2d;

import Math = math;

import vector_2i;
import matrix_2d;
import matrix_3x2d;

/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 Richard Greenlees
 $@#!$@# Translated by jordan4ibanez
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
 * Represents a 2D vector with double-precision.
 *
 * @author RGreenlees
 * @author Kai Burjack
 * @author F. Neurath
 */
struct Vector2d {


    /**
     * The x component of the vector.
     */
    double x = 0.0;
    /**
     * The y component of the vector.
     */
    double y = 0.0;

    /**
     * Create a new {@link Vector2d} and initialize both of its components with the given value.
     * 
     * @param d    
     *          the value of both components
     */
    this(double d) {
        this.x = d;
        this.y = d;
    }

    /**
     * Create a new {@link Vector2d} and initialize its components to the given values.
     * 
     * @param x
     *          the x value
     * @param y
     *          the y value
     */
    this(double x, double y) {
        this.x = x;
        this.y = y;
    }

    /**
     * Create a new {@link Vector2d} and initialize its components to the one of the given vector.
     * 
     * @param v
     *          the {@link Vector2d} to copy the values from
     */
    this(Vector2d v) {
        x = v.x;
        y = v.y;
    }

    /**
     * Create a new {@link Vector2d} and initialize its components to the one of the given vector.
     * 
     * @param v
     *          the {@link Vector2i} to copy the values from
     */
    this(Vector2i v) {
        x = v.x;
        y = v.y;
    }

    /**
     * Create a new {@link Vector2d} and initialize its two components from the first
     * two elements of the given array.
     * 
     * @param xy
     *          the array containing at least three elements
     */
    this(double[] xy) {
        this.x = xy[0];
        this.y = xy[1];
    }

    /**
     * Set the x and y components to the supplied value.
     *
     * @param d
     *          the value of both components
     * @return this
     */
    ref public Vector2d set(double d) return {
        this.x = d;
        this.y = d;
        return this;
    }

    /**
     * Set the x and y components to the supplied values.
     * 
     * @param x
     *          the x value
     * @param y
     *          the y value
     * @return this
     */
    ref public Vector2d set(double x, double y) return {
        this.x = x;
        this.y = y;
        return this;
    }

    /**
     * Set this {@link Vector2d} to the values of v.
     * 
     * @param v
     *          the vector to copy from
     * @return this
     */
    ref public Vector2d set(Vector2d v) return {
        this.x = v.x;
        this.y = v.y;
        return this;
    }


    /**
     * Set this {@link Vector2d} to be a clone of <code>v</code>.
     * 
     * @param v
     *          the vector to copy from
     * @return this
     */
    ref public Vector2d set(Vector2i v) return {
        this.x = v.x;
        this.y = v.y;
        return this;
    }

    /**
     * Set the two components of this vector to the first two elements of the given array.
     * 
     * @param xy
     *          the array containing at least three elements
     * @return this
     */
    ref public Vector2d set(double[] xy) return {
        this.x = xy[0];
        this.y = xy[1];
        return this;
    }

    /**
     * Set the two components of this vector to the first two elements of the given array.
     * 
     * @param xy
     *          the array containing at least two elements
     * @return this
     */
    ref public Vector2d set(double[] xy) return {
        this.x = xy[0];
        this.y = xy[1];
        return this;
    }

    public double get(int component) {
        switch (component) {
        case 0:
            return x;
        case 1:
            return y;
        default: 
            return 0; // do nothing
        }
    }

    public Vector2i get(int mode, ref Vector2i dest) {
        dest.x = Math.roundUsing(this.x, mode);
        dest.y = Math.roundUsing(this.y, mode);
        return dest;
    }

    public Vector2d get(ref Vector2d dest) {
        dest.x = this.x;
        dest.y = this.y;
        return dest;
    }

    /**
     * Set the value of the specified component of this vector.
     *
     * @param component
     *          the component whose value to set, within <code>[0..1]</code>
     * @param value
     *          the value to set
     * @return this
     * @throws IllegalArgumentException if <code>component</code> is not within <code>[0..1]</code>
     */
    ref public Vector2d setComponent(int component, double value) return {
        switch (component) {
            case 0:
                x = value;
                break;
            case 1:
                y = value;
                break;
            default: {}
        }
        return this;
    }

    /**
     * Set this vector to be one of its perpendicular vectors.
     * 
     * @return this
     */
    ref public Vector2d perpendicular() return {
        double xTemp = y;
        this.y = x * -1;
        this.x = xTemp;
        return this;
    }

    /**
     * Subtract <code>v</code> from this vector.
     * 
     * @param v
     *          the vector to subtract
     * @return this
     */
    ref public Vector2d sub(Vector2d v) return {
        this.x = x - v.x;
        this.y = y - v.y;
        return this;
    }

    /**
     * Subtract <code>(x, y)</code> from this vector.
     * 
     * @param x
     *          the x component to subtract
     * @param y
     *          the y component to subtract
     * @return this
     */
    ref public Vector2d sub(double x, double y) return {
        this.x = this.x - x;
        this.y = this.y - y;
        return this;
    }

    public Vector2d sub(double x, double y, ref Vector2d dest) {
        dest.x = this.x - x;
        dest.y = this.y - y;
        return dest;
    }


    public Vector2d sub(Vector2d v, ref Vector2d dest) {
        dest.x = x - v.x;
        dest.y = y - v.y;
        return dest;
    }


    /**
     * Multiply the components of this vector by the given scalar.
     * 
     * @param scalar
     *        the value to multiply this vector's components by
     * @return this
     */
    ref public Vector2d mul(double scalar) return {
        this.x = x * scalar;
        this.y = y * scalar;
        return this;
    }

    public Vector2d mul(double scalar, ref Vector2d dest) {
        dest.x = x * scalar;
        dest.y = y * scalar;
        return dest;
    }

    /**
     * Multiply the components of this Vector2d by the given scalar values and store the result in <code>this</code>.
     * 
     * @param x
     *          the x component to multiply this vector by
     * @param y
     *          the y component to multiply this vector by
     * @return this
     */
    ref public Vector2d mul(double x, double y) return {
        this.x = this.x * x;
        this.y = this.y * y;
        return this;
    }

    public Vector2d mul(double x, double y, ref Vector2d dest) {
        dest.x = this.x * x;
        dest.y = this.y * y;
        return dest;
    }

    /**
     * Multiply this Vector2d component-wise by another Vector2d.
     * 
     * @param v
     *          the vector to multiply by
     * @return this
     */
    ref public Vector2d mul(Vector2d v) return {
        this.x = x * v.x;
        this.y = y * v.y;
        return this;
    }

    public Vector2d mul(Vector2d v, ref Vector2d dest) {
        dest.x = x * v.x;
        dest.y = y * v.y;
        return dest;
    }

    /**
     * Divide this Vector2d by the given scalar value.
     * 
     * @param scalar
     *          the scalar to divide this vector by
     * @return this
     */
    ref public Vector2d div(double scalar) return {
        double inv = 1.0 / scalar;
        this.x = x * inv;
        this.y = y * inv;
        return this;
    }

    public Vector2d div(double scalar, ref Vector2d dest) {
        double inv = 1.0 / scalar;
        dest.x = x * inv;
        dest.y = y * inv;
        return dest;
    }

    /**
     * Divide the components of this Vector2d by the given scalar values and store the result in <code>this</code>.
     * 
     * @param x
     *          the x component to divide this vector by
     * @param y
     *          the y component to divide this vector by
     * @return this
     */
    ref public Vector2d div(double x, double y) return {
        this.x = this.x / x;
        this.y = this.y / y;
        return this;
    }

    public Vector2d div(double x, double y, ref Vector2d dest) {
        dest.x = this.x / x;
        dest.y = this.y / y;
        return dest;
    }

    /**
     * Divide this Vector2d component-wise by another Vector2d.
     * 
     * @param v
     *          the vector to divide by
     * @return this
     */
    ref public Vector2d div(Vector2d v) return {
        this.x = x / v.x;
        this.y = y / v.y;
        return this;
    }


    public Vector2d div(Vector2d v, ref Vector2d dest) {
        dest.x = x / v.x;
        dest.y = y / v.y;
        return dest;
    }

    /**
     * Multiply the given matrix <code>mat</code> with this Vector2d.
     *
     * @param mat
     *          the matrix to multiply this vector by
     * @return this
     */
    ref public Vector2d mul(Matrix2d mat) return {
        double rx = mat.m00 * x + mat.m10 * y;
        double ry = mat.m01 * x + mat.m11 * y;
        this.x = rx;
        this.y = ry;
        return this;
    }

    public Vector2d mul(Matrix2d mat, ref Vector2d dest) {
        double rx = mat.m00 * x + mat.m10 * y;
        double ry = mat.m01 * x + mat.m11 * y;
        dest.x = rx;
        dest.y = ry;
        return dest;
    }
    /**
     * Multiply the transpose of the given matrix with this Vector2d and store the result in <code>this</code>.
     *
     * @param mat
     *          the matrix
     * @return this
     */
    ref public Vector2d mulTranspose(Matrix2d mat) return {
        double rx = mat.m00 * x + mat.m01 * y;
        double ry = mat.m10 * x + mat.m11 * y;
        this.x = rx;
        this.y = ry;
        return this;
    }

    public Vector2d mulTranspose(Matrix2d mat, ref Vector2d dest) {
        double rx = mat.m00 * x + mat.m01 * y;
        double ry = mat.m10 * x + mat.m11 * y;
        dest.x = rx;
        dest.y = ry;
        return dest;
    }

    /**
     * Multiply the given 3x2 matrix <code>mat</code> with <code>this</code>.
     * <p>
     * This method assumes the <code>z</code> component of <code>this</code> to be <code>1.0</code>.
     * 
     * @param mat
     *          the matrix to multiply this vector by
     * @return this
     */
    ref public Vector2d mulPosition(Matrix3x2d mat) return {
        double rx = mat.m00 * x + mat.m10 * y + mat.m20;
        double ry = mat.m01 * x + mat.m11 * y + mat.m21;
        this.x = rx;
        this.y = ry;
        return this;
    }

    public Vector2d mulPosition(Matrix3x2d mat, ref Vector2d dest) {
        double rx = mat.m00 * x + mat.m10 * y + mat.m20;
        double ry = mat.m01 * x + mat.m11 * y + mat.m21;
        dest.x = rx;
        dest.y = ry;
        return dest;
    }

    /**
     * Multiply the given 3x2 matrix <code>mat</code> with <code>this</code>.
     * <p>
     * This method assumes the <code>z</code> component of <code>this</code> to be <code>0.0</code>.
     * 
     * @param mat
     *          the matrix to multiply this vector by
     * @return this
     */
    ref public Vector2d mulDirection(Matrix3x2d mat) return {
        double rx = mat.m00 * x + mat.m10 * y;
        double ry = mat.m01 * x + mat.m11 * y;
        this.x = rx;
        this.y = ry;
        return this;
    }

    public Vector2d mulDirection(Matrix3x2d mat, ref Vector2d dest) {
        double rx = mat.m00 * x + mat.m10 * y;
        double ry = mat.m01 * x + mat.m11 * y;
        dest.x = rx;
        dest.y = ry;
        return dest;
    }

    public double dot(Vector2d v) {
        return x * v.x + y * v.y;
    }

    public double angle(Vector2d v) {
        double dot = x*v.x + y*v.y;
        double det = x*v.y - y*v.x;
        return Math.atan2(det, dot);
    }

    public double lengthSquared() {
        return x * x + y * y;
    }

    /**
     * Get the length squared of a 2-dimensional double-precision vector.
     *
     * @param x The vector's x component
     * @param y The vector's y component
     *
     * @return the length squared of the given vector
     *
     * @author F. Neurath
     */
    public static double lengthSquared(double x, double y) {
        return x * x + y * y;
    }

    public double length() {
        return Math.sqrt(x * x + y * y);
    }

    /**
     * Get the length of a 2-dimensional double-precision vector.
     *
     * @param x The vector's x component
     * @param y The vector's y component
     *
     * @return the length of the given vector
     *
     * @author F. Neurath
     */
    public static double length(double x, double y) {
        return Math.sqrt(x * x + y * y);
    }

    public double distance(Vector2d v) {
        double dx = this.x - v.x;
        double dy = this.y - v.y;
        return Math.sqrt(dx * dx + dy * dy);
    }

    public double distanceSquared(Vector2d v) {
        double dx = this.x - v.x;
        double dy = this.y - v.y;
        return dx * dx + dy * dy;
    }

    public double distance(double x, double y) {
        double dx = this.x - x;
        double dy = this.y - y;
        return Math.sqrt(dx * dx + dy * dy);
    }

    public double distanceSquared(double x, double y) {
        double dx = this.x - x;
        double dy = this.y - y;
        return dx * dx + dy * dy;
    }

    /**
     * Return the distance between <code>(x1, y1)</code> and <code>(x2, y2)</code>.
     *
     * @param x1
     *          the x component of the first vector
     * @param y1
     *          the y component of the first vector
     * @param x2
     *          the x component of the second vector
     * @param y2
     *          the y component of the second vector
     * @return the euclidean distance
     */
    public static double distance(double x1, double y1, double x2, double y2) {
        double dx = x1 - x2;
        double dy = y1 - y2;
        return Math.sqrt(dx * dx + dy * dy);
    }

    /**
     * Return the squared distance between <code>(x1, y1)</code> and <code>(x2, y2)</code>.
     *
     * @param x1
     *          the x component of the first vector
     * @param y1
     *          the y component of the first vector
     * @param x2
     *          the x component of the second vector
     * @param y2
     *          the y component of the second vector
     * @return the euclidean distance squared
     */
    public static double distanceSquared(double x1, double y1, double x2, double y2) {
        double dx = x1 - x2;
        double dy = y1 - y2;
        return dx * dx + dy * dy;
    }

    /**
     * Normalize this vector.
     * 
     * @return this
     */
    ref public Vector2d normalize() return {
        double invLength = Math.invsqrt(x * x + y * y);
        this.x = x * invLength;
        this.y = y * invLength;
        return this;
    }

    public Vector2d normalize(ref Vector2d dest) {
        double invLength = Math.invsqrt(x * x + y * y);
        dest.x = x * invLength;
        dest.y = y * invLength;
        return dest;
    }

    /**
     * Scale this vector to have the given length.
     * 
     * @param length
     *          the desired length
     * @return this
     */
    ref public Vector2d normalize(double length) return {
        double invLength = Math.invsqrt(x * x + y * y) * length;
        this.x = x * invLength;
        this.y = y * invLength;
        return this;
    }

    public Vector2d normalize(double length, ref Vector2d dest) {
        double invLength = Math.invsqrt(x * x + y * y) * length;
        dest.x = x * invLength;
        dest.y = y * invLength;
        return dest;
    }

    /**
     * Add <code>v</code> to this vector.
     * 
     * @param v
     *          the vector to add
     * @return this
     */
    ref public Vector2d add(Vector2d v) return {
        this.x = x + v.x;
        this.y = y + v.y;
        return this;
    }

    /**
     * Add <code>(x, y)</code> to this vector.
     * 
     * @param x
     *          the x component to add
     * @param y
     *          the y component to add
     * @return this
     */
    ref public Vector2d add(double x, double y) return {
        this.x = this.x + x;
        this.y = this.y + y;
        return this;
    }

    public Vector2d add(double x, double y, ref Vector2d dest) {
        dest.x = this.x + x;
        dest.y = this.y + y;
        return dest;
    }


    public Vector2d add(Vector2d v, ref Vector2d dest) {
        dest.x = x + v.x;
        dest.y = y + v.y;
        return dest;
    }

    /**
     * Set all components to zero.
     * 
     * @return this
     */
    ref public Vector2d zero() return {
        this.x = 0;
        this.y = 0;
        return this;
    }

    /**
     * Negate this vector.
     * 
     * @return this
     */
    ref public Vector2d negate() return {
        this.x = -x;
        this.y = -y;
        return this;
    }

    public Vector2d negate(ref Vector2d dest) {
        dest.x = -x;
        dest.y = -y;
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
    ref public Vector2d lerp(Vector2d other, double t) return {
        this.x = x + (other.x - x) * t;
        this.y = y + (other.y - y) * t;
        return this;
    }

    public Vector2d lerp(Vector2d other, double t, ref Vector2d dest) {
        dest.x = x + (other.x - x) * t;
        dest.y = y + (other.y - y) * t;
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
        return result;
    }

    public bool equals(Vector2d v, double delta) {
        if (this == v)
            return true;
        if (!Math.equals(x, v.x, delta))
            return false;
        if (!Math.equals(y, v.y, delta))
            return false;
        return true;
    }

    public bool equals(double x, double y) {
        if (Math.doubleToLongBits(this.x) != Math.doubleToLongBits(x))
            return false;
        if (Math.doubleToLongBits(this.y) != Math.doubleToLongBits(y))
            return false;
        return true;
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
    ref public Vector2d fma(Vector2d a, Vector2d b) return {
        this.x = x + a.x * b.x;
        this.y = y + a.y * b.y;
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
    ref public Vector2d fma(double a, Vector2d b) return {
        this.x = x + a * b.x;
        this.y = y + a * b.y;
        return this;
    }

    public Vector2d fma(Vector2d a, Vector2d b, ref Vector2d dest) {
        dest.x = x + a.x * b.x;
        dest.y = y + a.y * b.y;
        return dest;
    }

    public Vector2d fma(double a, Vector2d b, ref Vector2d dest) {
        dest.x = x + a * b.x;
        dest.y = y + a * b.y;
        return dest;
    }

    /**
     * Set the components of this vector to be the component-wise minimum of this and the other vector.
     *
     * @param v
     *          the other vector
     * @return this
     */
    ref public Vector2d min(Vector2d v) return {
        this.x = x < v.x ? x : v.x;
        this.y = y < v.y ? y : v.y;
        return this;
    }

    public Vector2d min(Vector2d v, ref Vector2d dest) {
        dest.x = x < v.x ? x : v.x;
        dest.y = y < v.y ? y : v.y;
        return dest;
    }

    /**
     * Set the components of this vector to be the component-wise maximum of this and the other vector.
     *
     * @param v
     *          the other vector
     * @return this
     */
    ref public Vector2d max(Vector2d v) return {
        this.x = x > v.x ? x : v.x;
        this.y = y > v.y ? y : v.y;
        return this;
    }

    public Vector2d max(Vector2d v, ref Vector2d dest) {
        dest.x = x > v.x ? x : v.x;
        dest.y = y > v.y ? y : v.y;
        return dest;
    }

    public int maxComponent() {
        double absX = Math.abs(x);
        double absY = Math.abs(y);
        if (absX >= absY)
            return 0;
        return 1;
    }

    public int minComponent() {
        double absX = Math.abs(x);
        double absY = Math.abs(y);
        if (absX < absY)
            return 0;
        return 1;
    }

    /**
     * Set each component of this vector to the largest (closest to positive
     * infinity) {@code double} value that is less than or equal to that
     * component and is equal to a mathematical integer.
     *
     * @return this
     */
    ref public Vector2d floor() return {
        this.x = Math.floor(x);
        this.y = Math.floor(y);
        return this;
    }

    public Vector2d floor(ref Vector2d dest) {
        dest.x = Math.floor(x);
        dest.y = Math.floor(y);
        return dest;
    }

    /**
     * Set each component of this vector to the smallest (closest to negative
     * infinity) {@code double} value that is greater than or equal to that
     * component and is equal to a mathematical integer.
     *
     * @return this
     */
    ref public Vector2d ceil() return {
        this.x = Math.ceil(x);
        this.y = Math.ceil(y);
        return this;
    }

    public Vector2d ceil(ref Vector2d dest) {
        dest.x = Math.ceil(x);
        dest.y = Math.ceil(y);
        return dest;
    }

    /**
     * Set each component of this vector to the closest double that is equal to
     * a mathematical integer, with ties rounding to positive infinity.
     *
     * @return this
     */
    ref public Vector2d round() return {
        this.x = Math.round(x);
        this.y = Math.round(y);
        return this;
    }

    public Vector2d round(ref Vector2d dest) {
        dest.x = Math.round(x);
        dest.y = Math.round(y);
        return dest;
    }

    public bool isFinite() {
        return Math.isFinite(x) && Math.isFinite(y);
    }

    /**
     * Set <code>this</code> vector's components to their respective absolute values.
     * 
     * @return this
     */
    ref public Vector2d absolute() return {
        this.x = Math.abs(this.x);
        this.y = Math.abs(this.y);
        return this;
    }

    public Vector2d absolute(ref Vector2d dest) {
        dest.x = Math.abs(this.x);
        dest.y = Math.abs(this.y);
        return dest;
    }

}
