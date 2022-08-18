module vector_3i;

import Math = math;

import vector_2i;
import vector_2d;
import vector_3d;

/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 Richard Greenlees
 $&%$^$ Translated by jordan4ibanez
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
 * Contains the definition of a Vector comprising 3 ints and associated
 * transformations.
 *
 * @author Richard Greenlees
 * @author Kai Burjack
 * @author Hans Uhlig
 */
struct Vector3i {

    /**
     * The x component of the vector.
     */
    public int x;
    /**
     * The y component of the vector.
     */
    public int y;
    /**
     * The z component of the vector.
     */
    public int z;

    /**
     * Create a new {@link Vector3i} and initialize all three components with
     * the given value.
     *
     * @param d
     *          the value of all three components
     */
    this(int d) {
        this.x = d;
        this.y = d;
        this.z = d;
    }

    /**
     * Create a new {@link Vector3i} with the given component values.
     *
     * @param x
     *          the value of x
     * @param y
     *          the value of y
     * @param z
     *          the value of z
     */
    this(int x, int y, int z) {
        this.x = x;
        this.y = y;
        this.z = z;
    }

    /**
     * Create a new {@link Vector3i} with the same values as <code>v</code>.
     *
     * @param v
     *          the {@link Vector3i} to copy the values from
     */
    this(Vector3i v) {
        this.x = v.x;
        this.y = v.y;
        this.z = v.z;
    }

    /**
     * Create a new {@link Vector3i} with the first two components from the
     * given <code>v</code> and the given <code>z</code>
     *
     * @param v
     *          the {@link Vector2i} to copy the values from
     * @param z
     *          the z component
     */
    this(Vector2i v, int z) {
        this.x = v.x;
        this.y = v.y;
        this.z = z;
    }

    /**
     * Create a new {@link Vector3i} with the given component values and
     * round using the given {@link RoundingMode}.
     *
     * @param x
     *          the value of x
     * @param y
     *          the value of y
     * @param z
     *          the value of z
     * @param mode
     *          the {@link RoundingMode} to use
     */
    this(double x, double y, double z, int mode) {
        this.x = Math.roundUsing(x, mode);
        this.y = Math.roundUsing(y, mode);
        this.z = Math.roundUsing(z, mode);
    }

    /**
     * Create a new {@link Vector3i} with the first two components from the
     * given <code>v</code> and the given <code>z</code> and round using the given {@link RoundingMode}.
     *
     * @param v
     *          the {@link Vector2d} to copy the values from
     * @param z
     *          the z component
     * @param mode
     *          the {@link RoundingMode} to use
     */
    this(Vector2d v, float z, int mode) {
        this.x = Math.roundUsing(v.x, mode);
        this.y = Math.roundUsing(v.y, mode);
        this.z = Math.roundUsing(z, mode);
    }

    /**
     * Create a new {@link Vector3i} and initialize its components to the rounded value of
     * the given vector.
     *
     * @param v
     *          the {@link Vector3d} to round and copy the values from
     * @param mode
     *          the {@link RoundingMode} to use
     */
    this(Vector3d v, int mode) {
        this.x = Math.roundUsing(v.x, mode);
        this.y = Math.roundUsing(v.y, mode);
        this.z = Math.roundUsing(v.z, mode);
    }

    /**
     * Create a new {@link Vector3i} and initialize its three components from the first
     * three elements of the given array.
     * 
     * @param xyz
     *          the array containing at least three elements
     */
    this(int[] xyz) {
        this.x = xyz[0];
        this.y = xyz[1];
        this.z = xyz[2];
    }

    /**
     * Set the x, y and z components to match the supplied vector.
     *
     * @param v
     *          contains the values of x, y and z to set
     * @return this
     */
    public Vector3i set(Vector3i v) {
        x = v.x;
        y = v.y;
        z = v.z;
        return this;
    }

    /**
     * Set this {@link Vector3i} to the values of v using {@link RoundingMode#TRUNCATE} rounding.
     * <p>
     * Note that due to the given vector <code>v</code> storing the components
     * in double-precision, there is the possibility to lose precision.
     *
     * @param v
     *          the vector to copy from
     * @return this
     */
    public Vector3i set(Vector3d v) {
        this.x = cast(int) v.x;
        this.y = cast(int) v.y;
        this.z = cast(int) v.z;
        return this;
    }

    /**
     * Set this {@link Vector3i} to the values of v using the given {@link RoundingMode}.
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
    public Vector3i set(Vector3d v, int mode) {
        this.x = Math.roundUsing(v.x, mode);
        this.y = Math.roundUsing(v.y, mode);
        this.z = Math.roundUsing(v.z, mode);
        return this;
    }


    /**
     * Set the first two components from the given <code>v</code> and the z
     * component from the given <code>z</code>
     *
     * @param v
     *          the {@link Vector2i} to copy the values from
     * @param z
     *          the z component
     * @return this
     */
    public Vector3i set(Vector2i v, int z) {
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
    public Vector3i set(int d) {
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
    public Vector3i set(int x, int y, int z) {
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
    public Vector3i set(int[] xyz) {
        this.x = xyz[0];
        this.y = xyz[1];
        this.z = xyz[2];
        return this;
    }

    public int get(int component) {
        switch (component) {
        case 0:
            return x;
        case 1:
            return y;
        case 2:
            return z;
        default:
            return 0; // do nothing
        }
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
    public Vector3i setComponent(int component, int value) {
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
     * Subtract the supplied vector from this one and store the result in
     * <code>this</code>.
     *
     * @param v
     *          the vector to subtract
     * @return this
     */
    public Vector3i sub(Vector3i v) {
        this.x = this.x - v.x;
        this.y = this.y - v.y;
        this.z = this.z - v.z;
        return this;
    }

    public Vector3i sub(Vector3i v, ref Vector3i dest) {
        dest.x = x - v.x;
        dest.y = y - v.y;
        dest.z = z - v.z;
        return dest;
    }

    /**
     * Decrement the components of this vector by the given values.
     *
     * @param x
     *          the x component to subtract
     * @param y
     *          the y component to subtract
     * @param z
     *          the z component to subtract
     * @return this
     */
    public Vector3i sub(int x, int y, int z) {
        this.x = this.x - x;
        this.y = this.y - y;
        this.z = this.z - z;
        return this;
    }

    public Vector3i sub(int x, int y, int z, ref Vector3i dest) {
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
    public Vector3i add(Vector3i v) {
        this.x = this.x + v.x;
        this.y = this.y + v.y;
        this.z = this.z + v.z;
        return this;
    }

    public Vector3i add(Vector3i v, ref Vector3i dest) {
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
    public Vector3i add(int x, int y, int z) {
        this.x = this.x + x;
        this.y = this.y + y;
        this.z = this.z + z;
        return this;
    }

    public Vector3i add(int x, int y, int z, ref Vector3i dest) {
        dest.x = this.x + x;
        dest.y = this.y + y;
        dest.z = this.z + z;
        return dest;
    }

    /**
     * Multiply all components of this {@link Vector3i} by the given scalar
     * value.
     * 
     * @param scalar
     *          the scalar to multiply this vector by
     * @return this
     */
    public Vector3i mul(int scalar) {
        this.x = x * scalar;
        this.y = y * scalar;
        this.z = z * scalar;
        return this;
    }

    public Vector3i mul(int scalar, ref Vector3i dest) {
        dest.x = x * scalar;
        dest.y = y * scalar;
        dest.z = z * scalar;
        return dest;
    }

    /**
     * Multiply all components of this {@link Vector3i} by the given vector.
     *
     * @param v
     *          the vector to multiply
     * @return this
     */
    public Vector3i mul(Vector3i v) {
        this.x = this.x * v.x;
        this.y = this.y * v.y;
        this.z = this.z * v.z;
        return this;
    }

    public Vector3i mul(Vector3i v, ref Vector3i dest) {
        dest.x = x * v.x;
        dest.y = y * v.y;
        dest.z = z * v.z;
        return dest;
    }

    /**
     * Multiply the components of this vector by the given values.
     *
     * @param x
     *          the x component to multiply
     * @param y
     *          the y component to multiply
     * @param z
     *          the z component to multiply
     * @return this
     */
    public Vector3i mul(int x, int y, int z) {
        this.x = this.x * x;
        this.y = this.y * y;
        this.z = this.z * z;
        return this;
    }

    public Vector3i mul(int x, int y, int z, ref Vector3i dest) {
        dest.x = this.x * x;
        dest.y = this.y * y;
        dest.z = this.z * z;
        return dest;
    }

    /**
     * Divide all components of this {@link Vector3i} by the given scalar value.
     *
     * @param scalar
     *          the scalar to divide by
     * @return this
     */
    public Vector3i div(float scalar) {
        float invscalar = 1.0f / scalar;
        this.x = cast(int) (x * invscalar);
        this.y = cast(int) (y * invscalar);
        this.z = cast(int) (z * invscalar);
        return this;
    }

    public Vector3i div(float scalar, ref Vector3i dest) {
        float invscalar = 1.0f / scalar;
        dest.x = cast(int) (x * invscalar);
        dest.y = cast(int) (y * invscalar);
        dest.z = cast(int) (z * invscalar);
        return dest;
    }

    /**
     * Divide all components of this {@link Vector3i} by the given scalar value.
     *
     * @param scalar
     *          the scalar to divide by
     * @return this
     */
    public Vector3i div(int scalar) {
        this.x = x / scalar;
        this.y = y / scalar;
        this.z = z / scalar;
        return this;
    }

    public Vector3i div(int scalar, ref Vector3i dest) {
        dest.x = x / scalar;
        dest.y = y / scalar;
        dest.z = z / scalar;
        return dest;
    }

    public long lengthSquared() {
        return x * x + y * y + z * z;
    }

    /**
     * Get the length squared of a 3-dimensional single-precision vector.
     *
     * @param x The vector's x component
     * @param y The vector's y component
     * @param z The vector's z component
     *
     * @return the length squared of the given vector
     */
    public static long lengthSquared(int x, int y, int z) {
        return x * x + y * y + z * z;
    }

    public double length() {
        return Math.sqrt(x * x + y * y + z * z);
    }

    /**
     * Get the length of a 3-dimensional single-precision vector.
     *
     * @param x The vector's x component
     * @param y The vector's y component
     * @param z The vector's z component
     *
     * @return the length squared of the given vector
     */
    public static double length(int x, int y, int z) {
        return Math.sqrt(x * x + y * y + z * z);
    }

    public double distance(Vector3i v) {
        int dx = this.x - v.x;
        int dy = this.y - v.y;
        int dz = this.z - v.z;
        return Math.sqrt(dx * dx + dy * dy + dz * dz);
    }

    public double distance(int x, int y, int z) {
        int dx = this.x - x;
        int dy = this.y - y;
        int dz = this.z - z;
        return Math.sqrt(dx * dx + dy * dy + dz * dz);
    }

    public long gridDistance(Vector3i v) {
        return Math.abs(v.x - this.x) + Math.abs(v.y - this.y)  + Math.abs(v.z - this.z);
    }

    public long gridDistance(int x, int y, int z) {
        return Math.abs(x - this.x) + Math.abs(y - this.y) + Math.abs(z - this.z);
    }

    public long distanceSquared(Vector3i v) {
        int dx = this.x - v.x;
        int dy = this.y - v.y;
        int dz = this.z - v.z;
        return dx * dx + dy * dy + dz * dz;
    }

    public long distanceSquared(int x, int y, int z) {
        int dx = this.x - x;
        int dy = this.y - y;
        int dz = this.z - z;
        return dx * dx + dy * dy + dz * dz;
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
    public static double distance(int x1, int y1, int z1, int x2, int y2, int z2) {
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
    public static long distanceSquared(int x1, int y1, int z1, int x2, int y2, int z2) {
        int dx = x1 - x2;
        int dy = y1 - y2;
        int dz = z1 - z2;
        return dx * dx + dy * dy + dz * dz;
    }

    /**
     * Set all components to zero.
     *
     * @return this
     */
    public Vector3i zero() {
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
    public Vector3i negate() {
        this.x = -x;
        this.y = -y;
        this.z = -z;
        return this;
    }

    public Vector3i negate(ref Vector3i dest) {
        dest.x = -x;
        dest.y = -y;
        dest.z = -z;
        return dest;
    }

    /**
     * Set the components of this vector to be the component-wise minimum of this and the other vector.
     *
     * @param v
     *          the other vector
     * @return this
     */
    public Vector3i min(Vector3i v) {
        this.x = x < v.x ? x : v.x;
        this.y = y < v.y ? y : v.y;
        this.z = z < v.z ? z : v.z;
        return this;
    }

    public Vector3i min(Vector3i v, ref Vector3i dest) {
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
    public Vector3i max(Vector3i v) {
        this.x = x > v.x ? x : v.x;
        this.y = y > v.y ? y : v.y;
        this.z = z > v.z ? z : v.z;
        return this;
    }

    public Vector3i max(Vector3i v, ref Vector3i dest) {
        dest.x = x > v.x ? x : v.x;
        dest.y = y > v.y ? y : v.y;
        dest.z = z > v.z ? z : v.z;
        return dest;
    }

    public int maxComponent() {
        float absX = Math.abs(x);
        float absY = Math.abs(y);
        float absZ = Math.abs(z);
        if (absX >= absY && absX >= absZ) {
            return 0;
        } else if (absY >= absZ) {
            return 1;
        }
        return 2;
    }

    public int minComponent() {
        float absX = Math.abs(x);
        float absY = Math.abs(y);
        float absZ = Math.abs(z);
        if (absX < absY && absX < absZ) {
            return 0;
        } else if (absY < absZ) {
            return 1;
        }
        return 2;
    }

    /**
     * Set <code>this</code> vector's components to their respective absolute values.
     * 
     * @return this
     */
    public Vector3i absolute() {
        this.x = Math.abs(this.x);
        this.y = Math.abs(this.y);
        this.z = Math.abs(this.z);
        return this;
    }

    public Vector3i absolute(ref Vector3i dest) {
        dest.x = Math.abs(this.x);
        dest.y = Math.abs(this.y);
        dest.z = Math.abs(this.z);
        return dest;
    }

    public int hashCode() {
        immutable int prime = 31;
        int result = 1;
        result = prime * result + x;
        result = prime * result + y;
        result = prime * result + z;
        return result;
    }

    public bool equals(int x, int y, int z) {
        if (this.x != x)
            return false;
        if (this.y != y)
            return false;
        if (this.z != z)
            return false;
        return true;
    }

    public bool equals(Vector3i other) {
        if (this.x != other.x)
            return false;
        if (this.y != other.y)
            return false;
        if (this.z != other.z)
            return false;
        return true;
    }


}
