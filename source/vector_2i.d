module vector_2i;

import Math = math;

import vector_2d;


/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 Richard Greenlees
 @#$@#!$ Translated by jordan4ibanez
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
 * Represents a 2D vector with single-precision.
 *
 * @author RGreenlees
 * @author Kai Burjack
 * @author Hans Uhlig
 */
struct Vector2i {

    /**
     * The x component of the vector.
     */
    public int x;
    /**
     * The y component of the vector.
     */
    public int y;

    /**
     * Create a new {@link Vector2i} and initialize both of its components with
     * the given value.
     *
     * @param s
     *          the value of both components
     */
    this(int s) {
        this.x = s;
        this.y = s;
    }

    /**
     * Create a new {@link Vector2i} and initialize its components to the given values.
     *
     * @param x
     *          the x component
     * @param y
     *          the y component
     */
    this(int x, int y) {
        this.x = x;
        this.y = y;
    }

    /**
     * Create a new {@link Vector2i} and initialize its component values and
     * round using the given {@link RoundingMode}.
     * @param x
     *          the x component
     * @param y
     *          the y component
     * @param mode
     *          the {@link RoundingMode} to use
     */
    this(double x, double y, int mode) {
        this.x = Math.roundUsing(x, mode);
        this.y = Math.roundUsing(y, mode);
    }

    /**
     * Create a new {@link Vector2i} and initialize its components to the one of
     * the given vector.
     *
     * @param v
     *          the {@link Vector2i} to copy the values from
     */
    this(Vector2i v) {
        x = v.x;
        y = v.y;
    }

    /**
     * Create a new {@link Vector2i} and initialize its components to the rounded value of
     * the given vector.
     *
     * @param v
     *          the {@link Vector2d} to round and copy the values from
     * @param mode
     *          the {@link RoundingMode} to use
     */
    this(Vector2d v, int mode) {
        x = Math.roundUsing(v.x, mode);
        y = Math.roundUsing(v.y, mode);
    }

    /**
     * Create a new {@link Vector2i} and initialize its two components from the first
     * two elements of the given array.
     * 
     * @param xy
     *          the array containing at least three elements
     */
    this(int[] xy) {
        this.x = xy[0];
        this.y = xy[1];
    }

    /**
     * Set the x and y components to the supplied value.
     *
     * @param s
     *          scalar value of both components
     * @return this
     */
    ref public Vector2i set(int s) return {
        this.x = s;
        this.y = s;
        return this;
    }

    /**
     * Set the x and y components to the supplied values.
     *
     * @param x
     *          the x component
     * @param y
     *          the y component
     * @return this
     */
    ref public Vector2i set(int x, int y) return {
        this.x = x;
        this.y = y;
        return this;
    }

    /**
     * Set this {@link Vector2i} to the values of v.
     *
     * @param v
     *          the vector to copy from
     * @return this
     */
    ref public Vector2i set(Vector2i v) return {
        this.x = v.x;
        this.y = v.y;
        return this;
    }

    /**
     * Set this {@link Vector2i} to the values of v using {@link RoundingMode#TRUNCATE} rounding.
     * <p>
     * Note that due to the given vector <code>v</code> storing the components
     * in double-precision, there is the possibility to lose precision.
     *
     * @param v
     *          the vector to copy from
     * @return this
     */
    ref public Vector2i set(ref Vector2d v) return {
        this.x = cast(int) v.x;
        this.y = cast(int) v.y;
        return this;
    }

    /**
     * Set this {@link Vector2i} to the values of v using the given {@link RoundingMode}.
     * <p>
     * Note that due to the given vector <code>v</code> storing the components
     * in double-precision, there is the possibility to lose precision.
     *
     * @param v
     *          the vector to copy from
     * @param mode
     *          the {@link RoundingMode} to use
     * @return this
     */
    ref public Vector2i set(ref Vector2d v, int mode) return {
        this.x = Math.roundUsing(v.x, mode);
        this.y = Math.roundUsing(v.y, mode);
        return this;
    }

    /**
     * Set the two components of this vector to the first two elements of the given array.
     * 
     * @param xy
     *          the array containing at least two elements
     * @return this
     */
    ref public Vector2i set(int[] xy) return {
        this.x = xy[0];
        this.y = xy[1];
        return this;
    }

    public int get(int component) {
        switch (component) {
        case 0:
            return x;
        case 1:
            return y;
        default:
            return 0; // do nothing
        }
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
    ref public Vector2i setComponent(int component, int value) return {
        switch (component) {
            case 0:
                x = value;
                break;
            case 1:
                y = value;
                break;
            default:{}
        }
        return this;
    }

    /**
     * Subtract the supplied vector from this one and store the result in
     * <code>this</code>.
     *
     * @param v
     *          the vector to subtract
     * @return this
     */
    ref public Vector2i sub(Vector2i v) return {
        this.x = x - v.x;
        this.y = y - v.y;
        return this;
    }

    public Vector2i sub(Vector2i v, ref Vector2i dest) {
        dest.x = x - v.x;
        dest.y = y - v.y;
        return dest;
    }

    /**
     * Decrement the components of this vector by the given values.
     *
     * @param x
     *          the x component to subtract
     * @param y
     *          the y component to subtract
     * @return this
     */
    ref public Vector2i sub(int x, int y) return {
        this.x = this.x - x;
        this.y = this.y - y;
        return this;
    }

    public Vector2i sub(int x, int y, ref Vector2i dest) {
        dest.x = this.x - x;
        dest.y = this.y - y;
        return dest;
    }

    public long lengthSquared() {
        return x * x + y * y;
    }

    /**
     * Get the length squared of a 2-dimensional single-precision vector.
     *
     * @param x The vector's x component
     * @param y The vector's y component
     *
     * @return the length squared of the given vector
     */
    public static long lengthSquared(int x, int y) {
        return x * x + y * y;
    }

    public double length() {
        return Math.sqrt(x * x + y * y);
    }

    /**
     * Get the length of a 2-dimensional single-precision vector.
     *
     * @param x The vector's x component
     * @param y The vector's y component
     *
     * @return the length squared of the given vector
     */
    public static double length(int x, int y) {
        return Math.sqrt(x * x + y * y);
    }

    public double distance(Vector2i v) {
        int dx = this.x - v.x;
        int dy = this.y - v.y;
        return Math.sqrt(dx * dx + dy * dy);
    }

    public double distance(int x, int y) {
        int dx = this.x - x;
        int dy = this.y - y;
        return Math.sqrt(dx * dx + dy * dy);
    }

    public long distanceSquared(Vector2i v) {
        int dx = this.x - v.x;
        int dy = this.y - v.y;
        return dx * dx + dy * dy;
    }

    public long distanceSquared(int x, int y) {
        int dx = this.x - x;
        int dy = this.y - y;
        return dx * dx + dy * dy;
    }

    public long gridDistance(Vector2i v) {
        return Math.abs(v.x - x) + Math.abs(v.y - y);
    }

    public long gridDistance(int x, int y) {
        return Math.abs(x - this.x) + Math.abs(y - this.y);
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
    public static double distance(int x1, int y1, int x2, int y2) {
        int dx = x1 - x2;
        int dy = y1 - y2;
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
    public static long distanceSquared(int x1, int y1, int x2, int y2) {
        int dx = x1 - x2;
        int dy = y1 - y2;
        return dx * dx + dy * dy;
    }
    
    /**
     * Add <code>v</code> to this vector.
     *
     * @param v
     *          the vector to add
     * @return this
     */
    ref public Vector2i add(Vector2i v) return {
        this.x = x + v.x;
        this.y = y + v.y;
        return this;
    }

    public Vector2i add(Vector2i v, ref Vector2i dest) {
        dest.x = x + v.x;
        dest.y = y + v.y;
        return dest;
    }

    /**
     * Increment the components of this vector by the given values.
     *
     * @param x
     *          the x component to add
     * @param y
     *          the y component to add
     * @return this
     */
    ref public Vector2i add(int x, int y) return {
        this.x = this.x + x;
        this.y = this.y + y;
        return this;
    }

    public Vector2i add(int x, int y, ref Vector2i dest) {
        dest.x = this.x + x;
        dest.y = this.y + y;
        return dest;
    }

    /**
     * Multiply all components of this {@link Vector2i} by the given scalar
     * value.
     * 
     * @param scalar
     *          the scalar to multiply this vector by
     * @return this
     */
    ref public Vector2i mul(int scalar) return {
        this.x = x * scalar;
        this.y = y * scalar;
        return this;
    }

    public Vector2i mul(int scalar, ref Vector2i dest) {
        dest.x = x * scalar;
        dest.y = y * scalar;
        return dest;
    }

    /**
     * Add the supplied vector by this one.
     *
     * @param v
     *          the vector to multiply
     * @return this
     */
    ref public Vector2i mul(Vector2i v) return {
        this.x = x * v.x;
        this.y = y * v.y;
        return this;
    }

    public Vector2i mul(Vector2i v, ref Vector2i dest) {
        dest.x = x * v.x;
        dest.y = y * v.y;
        return dest;
    }

    /**
     * Multiply the components of this vector by the given values.
     *
     * @param x
     *          the x component to multiply
     * @param y
     *          the y component to multiply
     * @return this
     */
    ref public Vector2i mul(int x, int y) return {
        this.x = this.x * x;
        this.y = this.y * y;
        return this;
    }

    public Vector2i mul(int x, int y, ref Vector2i dest) {
        dest.x = this.x * x;
        dest.y = this.y * y;
        return dest;
    }

    /**
     * Divide all components of this {@link Vector2i} by the given scalar value.
     *
     * @param scalar
     *          the scalar to divide by
     * @return a vector holding the result
     */
    public Vector2i div(float scalar) {
        float invscalar = 1.0f / scalar;
        this.x = cast(int) (x * invscalar);
        this.y = cast(int) (y * invscalar);
        return this;
    }

    public Vector2i div(float scalar, ref Vector2i dest) {
        float invscalar = 1.0f / scalar;
        dest.x = cast(int) (x * invscalar);
        dest.y = cast(int) (y * invscalar);
        return dest;
    }

    /**
     * Divide all components of this {@link Vector2i} by the given scalar value.
     *
     * @param scalar
     *          the scalar to divide by
     * @return a vector holding the result
     */
    public Vector2i div(int scalar) {
        this.x = x / scalar;
        this.y = y / scalar;
        return this;
    }

    public Vector2i div(int scalar, ref Vector2i dest) {
        dest.x = x / scalar;
        dest.y = y / scalar;
        return dest;
    }
    
    /**
     * Set all components to zero.
     *
     * @return this
     */
    ref public Vector2i zero() return {
        this.x = 0;
        this.y = 0;
        return this;
    }


    /**
     * Negate this vector.
     *
     * @return this
     */
    ref public Vector2i negate() return {
        this.x = -x;
        this.y = -y;
        return this;
    }

    public Vector2i negate(ref Vector2i dest) {
        dest.x = -x;
        dest.y = -y;
        return dest;
    }

    /**
     * Set the components of this vector to be the component-wise minimum of this and the other vector.
     *
     * @param v
     *          the other vector
     * @return this
     */
    ref public Vector2i min(Vector2i v) return {
        this.x = x < v.x ? x : v.x;
        this.y = y < v.y ? y : v.y;
        return this;
    }

    public Vector2i min(Vector2i v, ref Vector2i dest) {
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
    ref public Vector2i max(Vector2i v) return {
        this.x = x > v.x ? x : v.x;
        this.y = y > v.y ? y : v.y;
        return this;
    }

    public Vector2i max(Vector2i v, ref Vector2i dest) {
        dest.x = x > v.x ? x : v.x;
        dest.y = y > v.y ? y : v.y;
        return dest;
    }

    public int maxComponent() {
        int absX = Math.abs(x);
        int absY = Math.abs(y);
        if (absX >= absY)
            return 0;
        return 1;
    }

    public int minComponent() {
        int absX = Math.abs(x);
        int absY = Math.abs(y);
        if (absX < absY)
            return 0;
        return 1;
    }

    /**
     * Set <code>this</code> vector's components to their respective absolute values.
     * 
     * @return this
     */
    ref public Vector2i absolute() return {
        this.x = Math.abs(this.x);
        this.y = Math.abs(this.y);
        return this;
    }

    public Vector2i absolute(ref Vector2i dest) {
        dest.x = Math.abs(this.x);
        dest.y = Math.abs(this.y);
        return dest;
    }

    public int hashCode() {
        immutable int prime = 31;
        int result = 1;
        result = prime * result + x;
        result = prime * result + y;
        return result;
    }


    public bool equals(int x, int y) {
        if (this.x != x)
            return false;
        if (this.y != y)
            return false;
        return true;
    }

    public bool equals(Vector2i other) {
        if (this.x != other.x)
            return false;
        if (this.y != other.y)
            return false;
        return true;
    }

}
