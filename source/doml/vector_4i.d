/**
 * Contains the definition of a Vector comprising 4 ints and associated
 * transformations.
 *
 * @author Richard Greenlees
 * @author Kai Burjack
 * @author Hans Uhlig
 */
module doml.vector_4i;

import Math = doml.math;

import doml.vector_3i;
import doml.vector_2i;
import doml.vector_4d;


/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 Richard Greenlees
 $@$ Translated by jordan4ibanez
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
 * Contains the definition of a Vector comprising 4 ints and associated
 * transformations.
 *
 * @author Richard Greenlees
 * @author Kai Burjack
 * @author Hans Uhlig
 */
struct Vector4i {

    /**
     * The x component of the vector.
     */
    int x = 0;
    /**
     * The y component of the vector.
     */
    int y = 0;
    /**
     * The z component of the vector.
     */
    int z = 0;
    /**
     * The w component of the vector.
     */
    int w = 1;

    /**
     * Create a new {@link Vector4i} with the same values as <code>v</code>.
     *
     * @param v
     *          the {@link Vector4i} to copy the values from
     */
    this(Vector4i v) {
        this.x = v.x;
        this.y = v.y;
        this.z = v.z;
        this.w = v.w;
    }

    /**
     * Create a new {@link Vector4i} with the first three components from the
     * given <code>v</code> and the given <code>w</code>.
     *
     * @param v
     *          the {@link Vector3i}
     * @param w
     *          the w component
     */
    this(Vector3i v, int w) {
        this.x = v.x;
        this.y = v.y;
        this.z = v.z;
        this.w = w;
    }

    /**
     * Create a new {@link Vector4i} with the first two components from the
     * given <code>v</code> and the given <code>z</code>, and <code>w</code>.
     *
     * @param v
     *          the {@link Vector2i}
     * @param z
     *          the z component
     * @param w
     *          the w component
     */
    this(Vector2i v, int z, int w) {
        this.x = v.x;
        this.y = v.y;
        this.z = z;
        this.w = w;
    }

    /**
     * Create a new {@link Vector4i} and initialize its components to the rounded value of
     * the given vector.
     *
     * @param v
     *          the {@link Vector4d} to round and copy the values from
     * @param mode
     *          the {@link RoundingMode} to use
     */
    this(Vector4d v, int mode) {
        x = Math.roundUsing(v.x, mode);
        y = Math.roundUsing(v.y, mode);
        z = Math.roundUsing(v.z, mode);
        w = Math.roundUsing(v.w, mode);
    }

    /**
     * Create a new {@link Vector4i} and initialize all four components with the
     * given value.
     *
     * @param s
     *          scalar value of all four components
     */
    this(int s) {
        this.x = s;
        this.y = s;
        this.z = s;
        this.w = s;
    }

    /**
     * Create a new {@link Vector4i} with the given component values.
     *
     * @param x
     *          the x component
     * @param y
     *          the y component
     * @param z
     *          the z component
     * @param w
     *          the w component
     */
    this(int x, int y, int z, int w) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = w;
    }

    /**
     * Create a new {@link Vector4i} and initialize its four components from the first
     * four elements of the given array.
     * 
     * @param xyzw
     *          the array containing at least four elements
     */
    this(int[] xyzw) {
        this.x = xyzw[0];
        this.y = xyzw[1];
        this.z = xyzw[2];
        this.w = xyzw[3];
    }

    /**
     * Set this {@link Vector4i} to the values of the given <code>v</code>.
     *
     * @param v
     *          the vector whose values will be copied into this
     * @return this
     */
    ref public Vector4i set(Vector4i v) return {
        this.x = v.x;
        this.y = v.y;
        this.z = v.z;
        this.w = v.w;
        return this;
    }

    /**
     * Set this {@link Vector4i} to the values of v using {@link RoundingMode#TRUNCATE} rounding.
     * <p>
     * Note that due to the given vector <code>v</code> storing the components
     * in double-precision, there is the possibility to lose precision.
     *
     * @param v
     *          the vector to copy from
     * @return this
     */
    ref public Vector4i set(Vector4d v) return {
        this.x = cast(int) v.x;
        this.y = cast(int) v.y;
        this.z = cast(int) v.z;
        this.w = cast(int) v.w;
        return this;
    }

    /**
     * Set this {@link Vector4i} to the values of v using the given {@link RoundingMode}.
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
    ref public Vector4i set(Vector4d v, int mode) return {
        this.x = Math.roundUsing(v.x, mode);
        this.y = Math.roundUsing(v.y, mode);
        this.z = Math.roundUsing(v.z, mode);
        this.w = Math.roundUsing(v.w, mode);
        return this;
    }

    /**
     * Set the first three components of this to the components of
     * <code>v</code> and the last component to <code>w</code>.
     *
     * @param v
     *          the {@link Vector3i} to copy
     * @param w
     *          the w component
     * @return this
     */
    ref public Vector4i set(Vector3i v, int w) return {
        this.x = v.x;
        this.y = v.y;
        this.z = v.z;
        this.w = w;
        return this;
    }

    /**
     * Sets the first two components of this to the components of given
     * <code>v</code> and last two components to the given <code>z</code>, and
     * <code>w</code>.
     *
     * @param v
     *          the {@link Vector2i}
     * @param z
     *          the z component
     * @param w
     *          the w component
     * @return this
     */
    ref public Vector4i set(Vector2i v, int z, int w) return {
        this.x = v.x;
        this.y = v.y;
        this.z = z;
        this.w = w;
        return this;
    }

    /**
     * Set the x, y, z, and w components to the supplied value.
     *
     * @param s
     *          the value of all four components
     * @return this
     */
    ref public Vector4i set(int s) return {
        this.x = s;
        this.y = s;
        this.z = s;
        this.w = s;
        return this;
    }

    /**
     * Set the x, y, z, and w components to the supplied values.
     *
     * @param x
     *          the x component
     * @param y
     *          the y component
     * @param z
     *          the z component
     * @param w
     *          the w component
     * @return this
     */
    ref public Vector4i set(int x, int y, int z, int w) return {
        this.x = x;
        this.y = y;
        this.z = z;
        this.w = w;
        return this;
    }

    /**
     * Set the four components of this vector to the first four elements of the given array.
     * 
     * @param xyzw
     *          the array containing at least four elements
     * @return this
     */
    ref public Vector4i set(int[] xyzw) return {
        this.x = xyzw[0];
        this.y = xyzw[1];
        this.z = xyzw[2];
        this.w = xyzw[3];
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
        case 3:
            return w;
        default:
            return 0; // do nothing
        }
    }

    public int maxComponent() {
        int absX = Math.abs(x);
        int absY = Math.abs(y);
        int absZ = Math.abs(z);
        int absW = Math.abs(w);
        if (absX >= absY && absX >= absZ && absX >= absW) {
            return 0;
        } else if (absY >= absZ && absY >= absW) {
            return 1;
        } else if (absZ >= absW) {
            return 2;
        }
        return 3;
    }

    public int minComponent() {
        int absX = Math.abs(x);
        int absY = Math.abs(y);
        int absZ = Math.abs(z);
        int absW = Math.abs(w);
        if (absX < absY && absX < absZ && absX < absW) {
            return 0;
        } else if (absY < absZ && absY < absW) {
            return 1;
        } else if (absZ < absW) {
            return 2;
        }
        return 3;
    }

    /**
     * Set the value of the specified component of this vector.
     *
     * @param component
     *          the component whose value to set, within <code>[0..3]</code>
     * @param value
     *          the value to set
     * @return this
     * @throws IllegalArgumentException if <code>component</code> is not within <code>[0..3]</code>
     */
    ref public Vector4i setComponent(int component, int value) return {
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
            case 3:
                w = value;
                break;
            default: {}
        }
        return this;
    }

    /**
     * Subtract the supplied vector from this one.
     *
     * @param v
     *          the vector to subtract
     * @return this
     */
    ref public Vector4i sub(Vector4i v) return {
        this.x = this.x - v.x;
        this.y = this.y - v.y;
        this.z = this.z - v.z;
        this.w = this.w - v.w;
        return this;
    }

    /**
     * Subtract <code>(x, y, z, w)</code> from this.
     *
     * @param x
     *          the x component to subtract
     * @param y
     *          the y component to subtract
     * @param z
     *          the z component to subtract
     * @param w
     *          the w component to subtract
     * @return this
     */
    ref public Vector4i sub(int x, int y, int z, int w) return {
        this.x = this.x - x;
        this.y = this.y - y;
        this.z = this.z - z;
        this.w = this.w - w;
        return this;
    }

    public Vector4i sub(Vector4i v, ref Vector4i dest) {
        dest.x = this.x - v.x;
        dest.y = this.y - v.y;
        dest.z = this.z - v.z;
        dest.w = this.w - v.w;
        return dest;
    }

    public Vector4i sub(int x, int y, int z, int w, ref Vector4i dest) {
        dest.x = this.x - x;
        dest.y = this.y - y;
        dest.z = this.z - z;
        dest.w = this.w - w;
        return dest;
    }

    /**
     * Add the supplied vector to this one.
     *
     * @param v
     *          the vector to add
     * @return this
     */
    ref public Vector4i add(Vector4i v) return {
        this.x = this.x + v.x;
        this.y = this.y + v.y;
        this.z = this.z + v.z;
        this.w = this.w + v.w;
        return this;
    }

    public Vector4i add(Vector4i v, ref Vector4i dest) {
        dest.x = this.x + v.x;
        dest.y = this.y + v.y;
        dest.z = this.z + v.z;
        dest.w = this.w + v.w;
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
     * @param w
     *          the w component to add
     * @return this
     */
    ref public Vector4i add(int x, int y, int z, int w) return {
        this.x = this.x + x;
        this.y = this.y + y;
        this.z = this.z + z;
        this.w = this.w + w;
        return this;
    }

    public Vector4i add(int x, int y, int z, int w, ref Vector4i dest) {
        dest.x = this.x + x;
        dest.y = this.y + y;
        dest.z = this.z + z;
        dest.w = this.w + w;
        return dest;
    }

    /**
     * Multiply this Vector4i component-wise by another Vector4i.
     *
     * @param v
     *          the other vector
     * @return this
     */
    ref public Vector4i mul(Vector4i v) return {
        this.x = x * v.x;
        this.y = y * v.y;
        this.z = z * v.z;
        this.w = w * v.w;
        return this;
    }

    public Vector4i mul(Vector4i v, ref Vector4i dest) {
        dest.x = x * v.x;
        dest.y = y * v.y;
        dest.z = z * v.z;
        dest.w = w * v.w;
        return dest;
    }

    /**
     * Divide this Vector4i component-wise by another Vector4i.
     *
     * @param v
     *          the vector to divide by
     * @return this
     */
    ref public Vector4i div(Vector4i v) return {
        this.x = x / v.x;
        this.y = y / v.y;
        this.z = z / v.z;
        this.w = w / v.w;
        return this;
    }

    public Vector4i div(Vector4i v, ref Vector4i dest) {
        dest.x = x / v.x;
        dest.y = y / v.y;
        dest.z = z / v.z;
        dest.w = w / v.w;
        return dest;
    }

    /**
     * Multiply all components of this {@link Vector4i} by the given scalar
     * value.
     *
     * @param scalar
     *          the scalar to multiply by
     * @return this
     */
    ref public Vector4i mul(int scalar) return {
        this.x = x * scalar;
        this.y = y * scalar;
        this.z = z * scalar;
        this.w = w * scalar;
        return this;
    }

    public Vector4i mul(int scalar, ref Vector4i dest) {
        dest.x = x * scalar;
        dest.y = y * scalar;
        dest.z = z * scalar;
        dest.w = w * scalar;
        return dest;
    }

    /**
     * Divide all components of this {@link Vector3i} by the given scalar value.
     *
     * @param scalar
     *          the scalar to divide by
     * @return this
     */
    ref public Vector4i div(double scalar) return {
        double invscalar = 1.0f / scalar;
        this.x = cast(int) (x * invscalar);
        this.y = cast(int) (y * invscalar);
        this.z = cast(int) (z * invscalar);
        this.w = cast(int) (w * invscalar);
        return this;
    }

    public Vector4i div(double scalar, ref Vector4i dest) {
        double invscalar = 1.0f / scalar;
        dest.x = cast(int) (x * invscalar);
        dest.y = cast(int) (y * invscalar);
        dest.z = cast(int) (z * invscalar);
        dest.w = cast(int) (w * invscalar);
        return dest;
    }

    /**
     * Divide all components of this {@link Vector4i} by the given scalar value.
     *
     * @param scalar
     *          the scalar to divide by
     * @return this
     */
    ref public Vector4i div(int scalar) return {
        this.x = x / scalar;
        this.y = y / scalar;
        this.z = z / scalar;
        this.w = w / scalar;
        return this;
    }

    public Vector4i div(int scalar, ref Vector4i dest) {
        dest.x = x / scalar;
        dest.y = y / scalar;
        dest.z = z / scalar;
        dest.w = w / scalar;
        return dest;
    }

    public long lengthSquared() {
        return x * x + y * y + z * z + w * w;
    }

    /**
     * Get the length squared of a 4-dimensional single-precision vector.
     *
     * @param x The vector's x component
     * @param y The vector's y component
     * @param z The vector's z component
     * @param w The vector's w component
     *
     * @return the length squared of the given vector
     */
    public static long lengthSquared(int x, int y, int z, int w) {
        return x * x + y * y + z * z + w * w;
    }

    public double length() {
        return Math.sqrt(x * x + y * y + z * z + w * w);
    }

    /**
     * Get the length of a 4-dimensional single-precision vector.
     *
     * @param x The vector's x component
     * @param y The vector's y component
     * @param z The vector's z component
     * @param w The vector's w component
     *
     * @return the length squared of the given vector
     */
    public static double length(int x, int y, int z, int w) {
        return Math.sqrt(x * x + y * y + z * z + w * w);
    }

    public double distance(Vector4i v) {
        int dx = this.x - v.x;
        int dy = this.y - v.y;
        int dz = this.z - v.z;
        int dw = this.w - v.w;
        return Math.sqrt(Math.fma(dx, dx, Math.fma(dy, dy, Math.fma(dz, dz, dw * dw))));
    }

    public double distance(int x, int y, int z, int w) {
        int dx = this.x - x;
        int dy = this.y - y;
        int dz = this.z - z;
        int dw = this.w - w;
        return Math.sqrt(Math.fma(dx, dx, Math.fma(dy, dy, Math.fma(dz, dz, dw * dw))));
    }

    public long gridDistance(Vector4i v) {
        return Math.abs(v.x - this.x) + Math.abs(v.y - this.y)  + Math.abs(v.z - this.z)  + Math.abs(v.w - this.w);
    }

    public long gridDistance(int x, int y, int z, int w) {
        return Math.abs(x - this.x) + Math.abs(y - this.y) + Math.abs(z - this.z) + Math.abs(w - this.w);
    }

    public int distanceSquared(Vector4i v) {
        int dx = this.x - v.x;
        int dy = this.y - v.y;
        int dz = this.z - v.z;
        int dw = this.w - v.w;
        return dx * dx + dy * dy + dz * dz + dw * dw;
    }

    public int distanceSquared(int x, int y, int z, int w) {
        int dx = this.x - x;
        int dy = this.y - y;
        int dz = this.z - z;
        int dw = this.w - w;
        return dx * dx + dy * dy + dz * dz + dw * dw;
    }

    /**
     * Return the distance between <code>(x1, y1, z1, w1)</code> and <code>(x2, y2, z2, w2)</code>.
     *
     * @param x1
     *          the x component of the first vector
     * @param y1
     *          the y component of the first vector
     * @param z1
     *          the z component of the first vector
     * @param w1
     *          the w component of the first vector
     * @param x2
     *          the x component of the second vector
     * @param y2
     *          the y component of the second vector
     * @param z2
     *          the z component of the second vector
     * @param w2
     *          the 2 component of the second vector
     * @return the euclidean distance
     */
    public static double distance(int x1, int y1, int z1, int w1, int x2, int y2, int z2, int w2) {
        int dx = x1 - x2;
        int dy = y1 - y2;
        int dz = z1 - z2;
        int dw = w1 - w2;
        return Math.sqrt(dx * dx + dy * dy + dz * dz + dw * dw);
    }

    /**
     * Return the squared distance between <code>(x1, y1, z1, w1)</code> and <code>(x2, y2, z2, w2)</code>.
     *
     * @param x1
     *          the x component of the first vector
     * @param y1
     *          the y component of the first vector
     * @param z1
     *          the z component of the first vector
     * @param w1
     *          the w component of the first vector
     * @param x2
     *          the x component of the second vector
     * @param y2
     *          the y component of the second vector
     * @param z2
     *          the z component of the second vector
     * @param w2
     *          the w component of the second vector
     * @return the euclidean distance squared
     */
    public static long distanceSquared(int x1, int y1, int z1, int w1, int x2, int y2, int z2, int w2) {
        int dx = x1 - x2;
        int dy = y1 - y2;
        int dz = z1 - z2;
        int dw = w1 - w2;
        return dx * dx + dy * dy + dz * dz + dw * dw;
    }

    public int dot(Vector4i v) {
        return x * v.x + y * v.y + z * v.z + w * v.w;
    }

    /**
     * Set all components to zero.
     *
     * @return this
     */
    ref public Vector4i zero() return {
        x = 0;
        y = 0;
        z = 0;
        w = 0;
        return this;
    }

    /**
     * Negate this vector.
     *
     * @return this
     */
    ref public Vector4i negate() return {
        this.x = -x;
        this.y = -y;
        this.z = -z;
        this.w = -w;
        return this;
    }

    public Vector4i negate(ref Vector4i dest) {
        dest.x = -x;
        dest.y = -y;
        dest.z = -z;
        dest.w = -w;
        return dest;
    }

    /**
     * Set the components of this vector to be the component-wise minimum of this and the other vector.
     *
     * @param v
     *          the other vector
     * @return this
     */
    ref public Vector4i min(Vector4i v) return {
        this.x = x < v.x ? x : v.x;
        this.y = y < v.y ? y : v.y;
        this.z = z < v.z ? z : v.z;
        this.w = w < v.w ? w : v.w;
        return this;
    }

    public Vector4i min(Vector4i v, ref Vector4i dest) {
        dest.x = x < v.x ? x : v.x;
        dest.y = y < v.y ? y : v.y;
        dest.z = z < v.z ? z : v.z;
        dest.w = w < v.w ? w : v.w;
        return dest;
    }

    /**
     * Set the components of this vector to be the component-wise maximum of this and the other vector.
     *
     * @param v
     *          the other vector
     * @return this
     */
    ref public Vector4i max(Vector4i v) return {
        this.x = x > v.x ? x : v.x;
        this.y = y > v.y ? y : v.y;
        this.z = z > v.z ? z : v.z;
        this.w = w > v.w ? w : v.w;
        return this;
    }

    public Vector4i max(Vector4i v, ref Vector4i dest) {
        dest.x = x > v.x ? x : v.x;
        dest.y = y > v.y ? y : v.y;
        dest.z = z > v.z ? z : v.z;
        dest.w = w > v.w ? w : v.w;
        return dest;
    }

    /**
     * Compute the absolute of each of this vector's components.
     * 
     * @return this
     */
    ref public Vector4i absolute() return {
        this.x = Math.abs(x);
        this.y = Math.abs(y);
        this.z = Math.abs(z);
        this.w = Math.abs(w);
        return this;
    }

    public Vector4i absolute(ref Vector4i dest) {
        dest.x = Math.abs(x);
        dest.y = Math.abs(y);
        dest.z = Math.abs(z);
        dest.w = Math.abs(w);
        return dest;
    }

    public int hashCode() {
        immutable int prime = 31;
        int result = 1;
        result = prime * result + x;
        result = prime * result + y;
        result = prime * result + z;
        result = prime * result + w;
        return result;
    }

    public bool equals(int x, int y, int z, int w) {
        if (this.x != x)
            return false;
        if (this.y != y)
            return false;
        if (this.z != z)
            return false;
        if (this.w != w)
            return false;
        return true;
    }

    public bool equals(Vector4i other) {
        if (this.x != other.x)
            return false;
        if (this.y != other.y)
            return false;
        if (this.z != other.z)
            return false;
        if (this.w != other.w)
            return false;
        return true;
    }

}
