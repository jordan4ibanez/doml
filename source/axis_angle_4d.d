module axis_angle_4d;

import Math = math;

import matrix_3d;
import matrix_4d;


import vector_3d;
import vector_4d;

import quaternion_d;

/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 Kai Burjack
 %$%@^ Translated by jordan4ibanez
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
 * Represents a 3D rotation of a given radians about an axis represented as an
 * unit 3D vector.
 * <p>
 * This class uses double-precision components.
 * 
 * @author Kai Burjack
 */
struct AxisAngle4d {
    /**
     * The angle in radians.
     */
    double angle = 0.0;
    /**
     * The x-component of the rotation axis.
     */
    double x = 0.0;
    /**
     * The y-component of the rotation axis.
     */
    double y = 0.0;
    /**
     * The z-component of the rotation axis.
     */
    double z = 1.0;
    /**
     * Create a new {@link AxisAngle4d} with the same values of <code>a</code>.
     * 
     * @param a
     *            the AngleAxis4d to copy the values from
     */
    this(AxisAngle4d a) {
        x = a.x;
        y = a.y;
        z = a.z;
        angle = (a.angle < 0.0 ? Math.PI + Math.PI + a.angle % (Math.PI + Math.PI) : a.angle) % (Math.PI + Math.PI);
    }

    /**
     * Create a new {@link AxisAngle4d} from the given {@link Quaterniond}.
     * <p>
     * Reference: <a href=
     * "http://www.euclideanspace.com/maths/geometry/rotations/conversions/quaternionToAngle/"
     * >http://www.euclideanspace.com</a>
     * 
     * @param q
     *            the quaternion from which to create the new AngleAxis4d
     */
    this(Quaterniond q) {
        double acos = Math.safeAcos(q.w());
        double invSqrt = Math.invsqrt(1.0 - q.w() * q.w());
        if (Double.isInfinite(invSqrt)) {
            this.x = 0.0;
            this.y = 0.0;
            this.z = 1.0;
        } else {
            this.x = q.x() * invSqrt;
            this.y = q.y() * invSqrt;
            this.z = q.z() * invSqrt;
        }
        this.angle = acos + acos;
    }

    /**
     * Create a new {@link AxisAngle4d} with the given values.
     *
     * @param angle
     *            the angle in radians
     * @param x
     *            the x-coordinate of the rotation axis
     * @param y
     *            the y-coordinate of the rotation axis
     * @param z
     *            the z-coordinate of the rotation axis
     */
    this(double angle, double x, double y, double z) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.angle = (angle < 0.0 ? Math.PI + Math.PI + angle % (Math.PI + Math.PI) : angle) % (Math.PI + Math.PI);
    }

    /**
     * Create a new {@link AxisAngle4d} with the given values.
     *
     * @param angle the angle in radians
     * @param v     the rotation axis as a {@link Vector3d}
     */
    this(double angle, Vector3d v) {
        this(angle, v.x(), v.y(), v.z());
    }


    /**
     * Set this {@link AxisAngle4d} to the given values.
     * 
     * @param angle
     *            the angle in radians
     * @param x
     *            the x-coordinate of the rotation axis
     * @param y
     *            the y-coordinate of the rotation axis
     * @param z
     *            the z-coordinate of the rotation axis
     * @return this
     */
    public AxisAngle4d set(double angle, double x, double y, double z) {
        this.x = x;
        this.y = y;
        this.z = z;
        this.angle = (angle < 0.0 ? Math.PI + Math.PI + angle % (Math.PI + Math.PI) : angle) % (Math.PI + Math.PI);
        return this;
    }

    /**
     * Set this {@link AxisAngle4d} to the given values.
     *
     * @param angle
     *            the angle in radians
     * @param v    
     *            the rotation axis as a {@link Vector3d}
     * @return this
     */
    public AxisAngle4d set(double angle, Vector3d v) {
        return set(angle, v.x(), v.y(), v.z());
    }

    /**
     * Set this {@link AxisAngle4d} to be equivalent to the given
     * {@link Quaterniond}.
     * 
     * @param q
     *            the quaternion to set this AngleAxis4d from
     * @return this
     */
    public AxisAngle4d set(Quaterniond q) {
        double acos = Math.safeAcos(q.w());
        double invSqrt = Math.invsqrt(1.0f - q.w() * q.w());
        if (Double.isInfinite(invSqrt)) {
            this.x = 0.0;
            this.y = 0.0;
            this.z = 1.0;
        } else {
            this.x = q.x() * invSqrt;
            this.y = q.y() * invSqrt;
            this.z = q.z() * invSqrt;
        }
        this.angle = acos + acos;
        return this;
    }

    /**
     * Set this {@link AxisAngle4d} to be equivalent to the rotation 
     * of the given {@link Matrix3d}.
     * <p>
     * Reference: <a href="http://www.euclideanspace.com/maths/geometry/rotations/conversions/matrixToAngle/">http://www.euclideanspace.com</a>
     * 
     * @param m
     *            the Matrix3d to set this AngleAxis4d from
     * @return this
     */
    public AxisAngle4d set(Matrix3d m) {
        double nm00 = m.m00(), nm01 = m.m01(), nm02 = m.m02();
        double nm10 = m.m10(), nm11 = m.m11(), nm12 = m.m12();
        double nm20 = m.m20(), nm21 = m.m21(), nm22 = m.m22();
        double lenX = Math.invsqrt(m.m00() * m.m00() + m.m01() * m.m01() + m.m02() * m.m02());
        double lenY = Math.invsqrt(m.m10() * m.m10() + m.m11() * m.m11() + m.m12() * m.m12());
        double lenZ = Math.invsqrt(m.m20() * m.m20() + m.m21() * m.m21() + m.m22() * m.m22());
        nm00 *= lenX; nm01 *= lenX; nm02 *= lenX;
        nm10 *= lenY; nm11 *= lenY; nm12 *= lenY;
        nm20 *= lenZ; nm21 *= lenZ; nm22 *= lenZ;
        double epsilon = 1E-4, epsilon2 = 1E-3;
        if (Math.abs(nm10 - nm01) < epsilon && Math.abs(nm20 - nm02) < epsilon && Math.abs(nm21 - nm12) < epsilon) {
            if (Math.abs(nm10 + nm01) < epsilon2 && Math.abs(nm20 + nm02) < epsilon2 && Math.abs(nm21 + nm12) < epsilon2
                    && Math.abs(nm00 + nm11 + nm22 - 3) < epsilon2) {
                x = 0;
                y = 0;
                z = 1;
                angle = 0;
                return this;
            }
            angle = Math.PI;
            double xx = (nm00 + 1) / 2;
            double yy = (nm11 + 1) / 2;
            double zz = (nm22 + 1) / 2;
            double xy = (nm10 + nm01) / 4;
            double xz = (nm20 + nm02) / 4;
            double yz = (nm21 + nm12) / 4;
            if ((xx > yy) && (xx > zz)) {
                x = Math.sqrt(xx);
                y = xy / x;
                z = xz / x;
            } else if (yy > zz) {
                y = Math.sqrt(yy);
                x = xy / y;
                z = yz / y;
            } else {
                z = Math.sqrt(zz);
                x = xz / z;
                y = yz / z;
            }
            return this;
        }
        double s = Math.sqrt((nm12 - nm21) * (nm12 - nm21) + (nm20 - nm02) * (nm20 - nm02) + (nm01 - nm10) * (nm01 - nm10));
        angle = Math.safeAcos((nm00 + nm11 + nm22 - 1) / 2);
        x = (nm12 - nm21) / s;
        y = (nm20 - nm02) / s;
        z = (nm01 - nm10) / s;
        return this;
    }

    /**
     * Set this {@link AxisAngle4d} to be equivalent to the rotational component 
     * of the given {@link Matrix4d}.
     * <p>
     * Reference: <a href="http://www.euclideanspace.com/maths/geometry/rotations/conversions/matrixToAngle/">http://www.euclideanspace.com</a>
     * 
     * @param m
     *            the Matrix4d to set this AngleAxis4d from
     * @return this
     */
    public AxisAngle4d set(Matrix4d m) {
        double nm00 = m.m00(), nm01 = m.m01(), nm02 = m.m02();
        double nm10 = m.m10(), nm11 = m.m11(), nm12 = m.m12();
        double nm20 = m.m20(), nm21 = m.m21(), nm22 = m.m22();
        double lenX = Math.invsqrt(m.m00() * m.m00() + m.m01() * m.m01() + m.m02() * m.m02());
        double lenY = Math.invsqrt(m.m10() * m.m10() + m.m11() * m.m11() + m.m12() * m.m12());
        double lenZ = Math.invsqrt(m.m20() * m.m20() + m.m21() * m.m21() + m.m22() * m.m22());
        nm00 *= lenX; nm01 *= lenX; nm02 *= lenX;
        nm10 *= lenY; nm11 *= lenY; nm12 *= lenY;
        nm20 *= lenZ; nm21 *= lenZ; nm22 *= lenZ;
        double epsilon = 1E-4, epsilon2 = 1E-3;
        if (Math.abs(nm10 - nm01) < epsilon && Math.abs(nm20 - nm02) < epsilon && Math.abs(nm21 - nm12) < epsilon) {
            if (Math.abs(nm10 + nm01) < epsilon2 && Math.abs(nm20 + nm02) < epsilon2 && Math.abs(nm21 + nm12) < epsilon2
                    && Math.abs(nm00 + nm11 + nm22 - 3) < epsilon2) {
                x = 0;
                y = 0;
                z = 1;
                angle = 0;
                return this;
            }
            angle = Math.PI;
            double xx = (nm00 + 1) / 2;
            double yy = (nm11 + 1) / 2;
            double zz = (nm22 + 1) / 2;
            double xy = (nm10 + nm01) / 4;
            double xz = (nm20 + nm02) / 4;
            double yz = (nm21 + nm12) / 4;
            if ((xx > yy) && (xx > zz)) {
                x = Math.sqrt(xx);
                y = xy / x;
                z = xz / x;
            } else if (yy > zz) {
                y = Math.sqrt(yy);
                x = xy / y;
                z = yz / y;
            } else {
                z = Math.sqrt(zz);
                x = xz / z;
                y = yz / z;
            }
            return this;
        }
        double s = Math.sqrt((nm12 - nm21) * (nm12 - nm21) + (nm20 - nm02) * (nm20 - nm02) + (nm01 - nm10) * (nm01 - nm10));
        angle = Math.safeAcos((nm00 + nm11 + nm22 - 1) / 2);
        x = (nm12 - nm21) / s;
        y = (nm20 - nm02) / s;
        z = (nm01 - nm10) / s;
        return this;
    }

    /**
     * Set the given {@link Quaterniond} to be equivalent to this {@link AxisAngle4d} rotation.
     * 
     * @see Quaterniond#set(AxisAngle4d)
     * 
     * @param q
     *          the quaternion to set
     * @return q
     */
    public Quaterniond get(Quaterniond q) {
        return q.set(this);
    }

    /**
     * Set the given {@link Matrix4d} to a rotation transformation equivalent to this {@link AxisAngle4d}.
     * 
     * @see Matrix4f#set(AxisAngle4d)
     * 
     * @param m
     *          the matrix to set
     * @return m
     */
    public Matrix4d get(Matrix4d m) {
        return m.set(this);
    }

    /**
     * Set the given {@link Matrix3d} to a rotation transformation equivalent to this {@link AxisAngle4d}.
     * 
     * @see Matrix3f#set(AxisAngle4d)
     * 
     * @param m
     *          the matrix to set
     * @return m
     */
    public Matrix3d get(Matrix3d m) {
        return m.set(this);
    }

    /**
     * Set the given {@link AxisAngle4d} to this {@link AxisAngle4d}.
     * 
     * @param dest
     *          will hold the result
     * @return dest
     */
    public AxisAngle4d get(AxisAngle4d dest) {
        return dest.set(this);
    }

    /**
     * Normalize the axis vector.
     * 
     * @return this
     */
    public AxisAngle4d normalize() {
        double invLength = Math.invsqrt(x * x + y * y + z * z);
        x *= invLength;
        y *= invLength;
        z *= invLength;
        return this;
    }

    /**
     * Increase the rotation angle by the given amount.
     * <p>
     * This method also takes care of wrapping around.
     * 
     * @param ang
     *          the angle increase
     * @return this
     */
    public AxisAngle4d rotate(double ang) {
        angle += ang;
        angle = (angle < 0.0 ? Math.PI + Math.PI + angle % (Math.PI + Math.PI) : angle) % (Math.PI + Math.PI);
        return this;
    }

    /**
     * Transform the given vector by the rotation transformation described by this {@link AxisAngle4d}.
     * 
     * @param v
     *          the vector to transform
     * @return v
     */
    public Vector3d transform(Vector3d v) {
        return transform(v, v);
    }

    /**
     * Transform the given vector by the rotation transformation described by this {@link AxisAngle4d}
     * and store the result in <code>dest</code>.
     * 
     * @param v
     *          the vector to transform
     * @param dest
     *          will hold the result
     * @return dest
     */
    public Vector3d transform(Vector3d v, Vector3d dest) {
        double sin = Math.sin(angle);
        double cos = Math.cosFromSin(sin, angle);
        double dot = x * v.x() + y * v.y() + z * v.z();
        dest.set(v.x() * cos + sin * (y * v.z() - z * v.y()) + (1.0 - cos) * dot * x,
                 v.y() * cos + sin * (z * v.x() - x * v.z()) + (1.0 - cos) * dot * y,
                 v.z() * cos + sin * (x * v.y() - y * v.x()) + (1.0 - cos) * dot * z);
        return dest;
    }

    /**
     * Transform the given vector by the rotation transformation described by this {@link AxisAngle4d}.
     * 
     * @param v
     *          the vector to transform
     * @return v
     */
    public Vector4d transform(Vector4d v) {
        return transform(v, v);
    }

    /**
     * Transform the given vector by the rotation transformation described by this {@link AxisAngle4d}
     * and store the result in <code>dest</code>.
     * 
     * @param v
     *          the vector to transform
     * @param dest
     *          will hold the result
     * @return dest
     */
    public Vector4d transform(Vector4d v, Vector4d dest) {
        double sin = Math.sin(angle);
        double cos = Math.cosFromSin(sin, angle);
        double dot = x * v.x() + y * v.y() + z * v.z();
        dest.set(v.x() * cos + sin * (y * v.z() - z * v.y()) + (1.0 - cos) * dot * x,
                 v.y() * cos + sin * (z * v.x() - x * v.z()) + (1.0 - cos) * dot * y,
                 v.z() * cos + sin * (x * v.y() - y * v.x()) + (1.0 - cos) * dot * z,
                 dest.w);
        return dest;
    }

    public int hashCode() {
        final int prime = 31;
        int result = 1;
        long temp;
        temp = Double.doubleToLongBits((angle < 0.0 ? Math.PI + Math.PI + angle % (Math.PI + Math.PI) : angle) % (Math.PI + Math.PI));
        result = prime * result + cast(int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(x);
        result = prime * result + cast(int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(y);
        result = prime * result + cast(int) (temp ^ (temp >>> 32));
        temp = Double.doubleToLongBits(z);
        result = prime * result + cast(int) (temp ^ (temp >>> 32));
        return result;
    }

    public bool equals(AxisAngle4d obj) {
        if (this == obj)
            return true;
        if (Double.doubleToLongBits((angle < 0.0 ? Math.PI + Math.PI + angle % (Math.PI + Math.PI) : angle) % (Math.PI + Math.PI)) != 
                Double.doubleToLongBits((other.angle < 0.0 ? Math.PI + Math.PI + other.angle % (Math.PI + Math.PI) : other.angle) % (Math.PI + Math.PI)))
            return false;
        if (Double.doubleToLongBits(x) != Double.doubleToLongBits(other.x))
            return false;
        if (Double.doubleToLongBits(y) != Double.doubleToLongBits(other.y))
            return false;
        if (Double.doubleToLongBits(z) != Double.doubleToLongBits(other.z))
            return false;
        return true;
    }
}
