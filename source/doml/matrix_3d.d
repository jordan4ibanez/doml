/**
 * Contains the definition of a 3x3 matrix of doubles, and associated functions to transform
 * it. The matrix is column-major to match OpenGL's interpretation, and it looks like this:
 * <p>
 *      m00  m10  m20<br>
 *      m01  m11  m21<br>
 *      m02  m12  m22<br>
 * 
 * @author Richard Greenlees
 * @author Kai Burjack
 */
module doml.matrix_3d;

import Math = doml.math;
import MemUtil = doml.mem_util;

import doml.matrix_2d;
import doml.matrix_4d;
import doml.matrix_4x3d;

import doml.vector_3d;

import doml.axis_angle_4d;
import doml.quaternion_d;

/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 Richard Greenlees
 #$@$!$ Translated by jordan4ibanez
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
 * Contains the definition of a 3x3 matrix of doubles, and associated functions to transform
 * it. The matrix is column-major to match OpenGL's interpretation, and it looks like this:
 * <p>
 *      m00  m10  m20<br>
 *      m01  m11  m21<br>
 *      m02  m12  m22<br>
 * 
 * @author Richard Greenlees
 * @author Kai Burjack
 */
struct Matrix3d {

    double m00 = 1.0;
    double m01 = 0.0;
    double m02 = 0.0;

    double m10 = 0.0;
    double m11 = 1.0;
    double m12 = 0.0;

    double m20 = 0.0;
    double m21 = 0.0;
    double m22 = 1.0;

    /**
     * Create a new {@link Matrix3d} by setting its uppper left 2x2 submatrix to the values of the given {@link Matrix2d}
     * and the rest to identity.
     *
     * @param mat
     *          the {@link Matrix2d}
     */
    this(Matrix2d mat) {
        set(mat);
    }


    /**
     * Create a new {@link Matrix3d} and initialize it with the values from the given matrix.
     * 
     * @param mat
     *          the matrix to initialize this matrix with
     */
    this(Matrix3d mat) {
        set(mat);
    }


    /**
     * Create a new {@link Matrix3d} and make it a copy of the upper left 3x3 of the given {@link Matrix4d}.
     *
     * @param mat
     *          the {@link Matrix4d} to copy the values from
     */
    this(Matrix4d mat) {
        set(mat);
    }

    /**
     * Create a new {@link Matrix3d} and initialize its elements with the given values.
     * 
     * @param m00
     *          the value of m00
     * @param m01
     *          the value of m01
     * @param m02
     *          the value of m02
     * @param m10
     *          the value of m10
     * @param m11
     *          the value of m11
     * @param m12
     *          the value of m12
     * @param m20
     *          the value of m20
     * @param m21
     *          the value of m21
     * @param m22
     *          the value of m22
     */
    this(double m00, double m01, double m02,
                    double m10, double m11, double m12, 
                    double m20, double m21, double m22) {
        this.m00 = m00;
        this.m01 = m01;
        this.m02 = m02;
        this.m10 = m10;
        this.m11 = m11;
        this.m12 = m12;
        this.m20 = m20;
        this.m21 = m21;
        this.m22 = m22;
    }


    /**
     * Create a new {@link Matrix3d} and initialize its three columns using the supplied vectors.
     * 
     * @param col0
     *          the first column
     * @param col1
     *          the second column
     * @param col2
     *          the third column
     */
    this(Vector3d col0, Vector3d col1, Vector3d col2) {
        set(col0, col1, col2);
    }

    /**
     * Set the value of the matrix element at column 0 and row 0.
     * 
     * @param m00
     *          the new value
     * @return this
     */
    ref public Matrix3d setm00(double m00) return {
        this.m00 = m00;
        return this;
    }
    /**
     * Set the value of the matrix element at column 0 and row 1.
     * 
     * @param m01
     *          the new value
     * @return this
     */
    ref public Matrix3d setm01(double m01) return {
        this.m01 = m01;
        return this;
    }
    /**
     * Set the value of the matrix element at column 0 and row 2.
     * 
     * @param m02
     *          the new value
     * @return this
     */
    ref public Matrix3d setm02(double m02) return {
        this.m02 = m02;
        return this;
    }
    /**
     * Set the value of the matrix element at column 1 and row 0.
     * 
     * @param m10
     *          the new value
     * @return this
     */
    ref public Matrix3d setm10(double m10) return {
        this.m10 = m10;
        return this;
    }
    /**
     * Set the value of the matrix element at column 1 and row 1.
     * 
     * @param m11
     *          the new value
     * @return this
     */
    ref public Matrix3d setm11(double m11) return {
        this.m11 = m11;
        return this;
    }
    /**
     * Set the value of the matrix element at column 1 and row 2.
     * 
     * @param m12
     *          the new value
     * @return this
     */
    ref public Matrix3d setm12(double m12) return {
        this.m12 = m12;
        return this;
    }
    /**
     * Set the value of the matrix element at column 2 and row 0.
     * 
     * @param m20
     *          the new value
     * @return this
     */
    ref public Matrix3d setm20(double m20) return {
        this.m20 = m20;
        return this;
    }
    /**
     * Set the value of the matrix element at column 2 and row 1.
     * 
     * @param m21
     *          the new value
     * @return this
     */
    ref public Matrix3d setm21(double m21) return {
        this.m21 = m21;
        return this;
    }
    /**
     * Set the value of the matrix element at column 2 and row 2.
     * 
     * @param m22
     *          the new value
     * @return this
     */
    ref public Matrix3d setm22(double m22) return {
        this.m22 = m22;
        return this;
    }

    /**
     * Set the value of the matrix element at column 0 and row 0.
     * 
     * @param m00
     *          the new value
     * @return this
     */
    ref Matrix3d _m00(double m00) return {
        this.m00 = m00;
        return this;
    }
    /**
     * Set the value of the matrix element at column 0 and row 1.
     * 
     * @param m01
     *          the new value
     * @return this
     */
    ref Matrix3d _m01(double m01) return {
        this.m01 = m01;
        return this;
    }
    /**
     * Set the value of the matrix element at column 0 and row 2.
     * 
     * @param m02
     *          the new value
     * @return this
     */
    ref Matrix3d _m02(double m02) return {
        this.m02 = m02;
        return this;
    }
    /**
     * Set the value of the matrix element at column 1 and row 0.
     * 
     * @param m10
     *          the new value
     * @return this
     */
    ref Matrix3d _m10(double m10) return {
        this.m10 = m10;
        return this;
    }
    /**
     * Set the value of the matrix element at column 1 and row 1.
     * 
     * @param m11
     *          the new value
     * @return this
     */
    ref Matrix3d _m11(double m11) return {
        this.m11 = m11;
        return this;
    }
    /**
     * Set the value of the matrix element at column 1 and row 2.
     * 
     * @param m12
     *          the new value
     * @return this
     */
    ref Matrix3d _m12(double m12) return {
        this.m12 = m12;
        return this;
    }
    /**
     * Set the value of the matrix element at column 2 and row 0.
     * 
     * @param m20
     *          the new value
     * @return this
     */
    ref Matrix3d _m20(double m20) return {
        this.m20 = m20;
        return this;
    }
    /**
     * Set the value of the matrix element at column 2 and row 1.
     * 
     * @param m21
     *          the new value
     * @return this
     */
    ref Matrix3d _m21(double m21) return {
        this.m21 = m21;
        return this;
    }
    /**
     * Set the value of the matrix element at column 2 and row 2.
     * 
     * @param m22
     *          the new value
     * @return this
     */
    ref Matrix3d _m22(double m22) return {
        this.m22 = m22;
        return this;
    }

    /**
     * Set the values in this matrix to the ones in m.
     * 
     * @param m
     *          the matrix whose values will be copied
     * @return this
     */
    ref public Matrix3d set(Matrix3d m) return {
        m00 = m.m00;
        m01 = m.m01;
        m02 = m.m02;
        m10 = m.m10;
        m11 = m.m11;
        m12 = m.m12;
        m20 = m.m20;
        m21 = m.m21;
        m22 = m.m22;
        return this;
    }

    /**
     * Store the values of the transpose of the given matrix <code>m</code> into <code>this</code> matrix.
     * 
     * @param m
     *          the matrix to copy the transposed values from
     * @return this
     */
    ref public Matrix3d setTransposed(Matrix3d m) return {
        double nm10 = m.m01, nm12 = m.m21;
        double nm20 = m.m02, nm21 = m.m12;
        return this
        ._m00(m.m00)._m01(m.m10)._m02(m.m20)
        ._m10(nm10)._m11(m.m11)._m12(nm12)
        ._m20(nm20)._m21(nm21)._m22(m.m22);
    }


    /**
     * Set the elements of this matrix to the left 3x3 submatrix of <code>m</code>.
     * 
     * @param m
     *          the matrix to copy the elements from
     * @return this
     */
    ref public Matrix3d set(Matrix4x3d m) return {
        m00 = m.m00;
        m01 = m.m01;
        m02 = m.m02;
        m10 = m.m10;
        m11 = m.m11;
        m12 = m.m12;
        m20 = m.m20;
        m21 = m.m21;
        m22 = m.m22;
        return this;
    }


    /**
     * Set the elements of this matrix to the upper left 3x3 of the given {@link Matrix4d}.
     *
     * @param mat
     *          the {@link Matrix4d} to copy the values from
     * @return this
     */
    ref public Matrix3d set(Matrix4d mat) return {
        m00 = mat.m00;
        m01 = mat.m01;
        m02 = mat.m02;
        m10 = mat.m10;
        m11 = mat.m11;
        m12 = mat.m12;
        m20 = mat.m20;
        m21 = mat.m21;
        m22 = mat.m22;
        return this;
    }


    /**
     * Set the upper left 2x2 submatrix of this {@link Matrix3d} to the given {@link Matrix2d}
     * and the rest to identity.
     *
     * @see #Matrix3d(Matrix2d)
     *
     * @param mat
     *          the {@link Matrix2d}
     * @return this
     */
    ref public Matrix3d set(Matrix2d mat) return {
        m00 = mat.m00;
        m01 = mat.m01;
        m02 = 0.0;
        m10 = mat.m10;
        m11 = mat.m11;
        m12 = 0.0;
        m20 = 0.0;
        m21 = 0.0;
        m22 = 1.0;
        return this;
    }

    
    /**
     * Set this matrix to be equivalent to the rotation specified by the given {@link AxisAngle4d}.
     * 
     * @param axisAngle
     *          the {@link AxisAngle4d}
     * @return this
     */
    ref public Matrix3d set(AxisAngle4d axisAngle) return {
        double x = axisAngle.x;
        double y = axisAngle.y;
        double z = axisAngle.z;
        double angle = axisAngle.angle;
        double invLength = Math.invsqrt(x*x + y*y + z*z);
        x *= invLength;
        y *= invLength;
        z *= invLength;
        double s = Math.sin(angle);
        double c = Math.cosFromSin(s, angle);
        double omc = 1.0 - c;
        m00 = c + x*x*omc;
        m11 = c + y*y*omc;
        m22 = c + z*z*omc;
        double tmp1 = x*y*omc;
        double tmp2 = z*s;
        m10 = tmp1 - tmp2;
        m01 = tmp1 + tmp2;
        tmp1 = x*z*omc;
        tmp2 = y*s;
        m20 = tmp1 + tmp2;
        m02 = tmp1 - tmp2;
        tmp1 = y*z*omc;
        tmp2 = x*s;
        m21 = tmp1 - tmp2;
        m12 = tmp1 + tmp2;
        return this;
    }

    /**
     * Set this matrix to a rotation - and possibly scaling - equivalent to the given quaternion.
     * <p>
     * This method is equivalent to calling: <code>rotation(q)</code>
     * <p>
     * Reference: <a href="http://www.euclideanspace.com/maths/geometry/rotations/conversions/quaternionToMatrix/">http://www.euclideanspace.com/</a>
     * 
     * @see #rotation(Quaterniond)
     * 
     * @param q
     *          the quaternion
     * @return this
     */
    ref public Matrix3d set(Quaterniond q) return {
        return rotation(q);
    }

    /**
     * Multiply this matrix by the supplied matrix.
     * This matrix will be the left one.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the <code>right</code> matrix,
     * then the new matrix will be <code>M * R</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * R * v</code>, the
     * transformation of the right matrix will be applied first!
     * 
     * @param right
     *          the right operand
     * @return this
     */
    ref public Matrix3d mul(Matrix3d right) return {
        mul(right, this);
        return this;
    }

    public Matrix3d mul(Matrix3d right, ref Matrix3d dest) {
        double nm00 = Math.fma(m00, right.m00, Math.fma(m10, right.m01, m20 * right.m02));
        double nm01 = Math.fma(m01, right.m00, Math.fma(m11, right.m01, m21 * right.m02));
        double nm02 = Math.fma(m02, right.m00, Math.fma(m12, right.m01, m22 * right.m02));
        double nm10 = Math.fma(m00, right.m10, Math.fma(m10, right.m11, m20 * right.m12));
        double nm11 = Math.fma(m01, right.m10, Math.fma(m11, right.m11, m21 * right.m12));
        double nm12 = Math.fma(m02, right.m10, Math.fma(m12, right.m11, m22 * right.m12));
        double nm20 = Math.fma(m00, right.m20, Math.fma(m10, right.m21, m20 * right.m22));
        double nm21 = Math.fma(m01, right.m20, Math.fma(m11, right.m21, m21 * right.m22));
        double nm22 = Math.fma(m02, right.m20, Math.fma(m12, right.m21, m22 * right.m22));
        dest.m00 = nm00;
        dest.m01 = nm01;
        dest.m02 = nm02;
        dest.m10 = nm10;
        dest.m11 = nm11;
        dest.m12 = nm12;
        dest.m20 = nm20;
        dest.m21 = nm21;
        dest.m22 = nm22;
        return dest;
    }

    /**
     * Pre-multiply this matrix by the supplied <code>left</code> matrix and store the result in <code>this</code>.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>L</code> the <code>left</code> matrix,
     * then the new matrix will be <code>L * M</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>L * M * v</code>, the
     * transformation of <code>this</code> matrix will be applied first!
     *
     * @param left
     *          the left operand of the matrix multiplication
     * @return this
     */
    ref public Matrix3d mulLocal(Matrix3d left) return {
       mulLocal(left, this);
       return this;
    }

    public Matrix3d mulLocal(Matrix3d left, ref Matrix3d dest) {
        double nm00 = left.m00 * m00 + left.m10 * m01 + left.m20 * m02;
        double nm01 = left.m01 * m00 + left.m11 * m01 + left.m21 * m02;
        double nm02 = left.m02 * m00 + left.m12 * m01 + left.m22 * m02;
        double nm10 = left.m00 * m10 + left.m10 * m11 + left.m20 * m12;
        double nm11 = left.m01 * m10 + left.m11 * m11 + left.m21 * m12;
        double nm12 = left.m02 * m10 + left.m12 * m11 + left.m22 * m12;
        double nm20 = left.m00 * m20 + left.m10 * m21 + left.m20 * m22;
        double nm21 = left.m01 * m20 + left.m11 * m21 + left.m21 * m22;
        double nm22 = left.m02 * m20 + left.m12 * m21 + left.m22 * m22;
        dest.m00 = nm00;
        dest.m01 = nm01;
        dest.m02 = nm02;
        dest.m10 = nm10;
        dest.m11 = nm11;
        dest.m12 = nm12;
        dest.m20 = nm20;
        dest.m21 = nm21;
        dest.m22 = nm22;
        return dest;
    }


    /**
     * Set the values within this matrix to the supplied double values. The result looks like this:
     * <p>
     * m00, m10, m20<br>
     * m01, m11, m21<br>
     * m02, m12, m22<br>
     * 
     * @param m00
     *          the new value of m00
     * @param m01
     *          the new value of m01
     * @param m02
     *          the new value of m02
     * @param m10
     *          the new value of m10
     * @param m11
     *          the new value of m11
     * @param m12
     *          the new value of m12
     * @param m20
     *          the new value of m20
     * @param m21
     *          the new value of m21
     * @param m22
     *          the new value of m22
     * @return this
     */
    ref public Matrix3d set(double m00, double m01, double m02, 
                        double m10, double m11, double m12, 
                        double m20, double m21, double m22) return {
        this.m00 = m00;
        this.m01 = m01;
        this.m02 = m02;
        this.m10 = m10;
        this.m11 = m11;
        this.m12 = m12;
        this.m20 = m20;
        this.m21 = m21;
        this.m22 = m22;
        return this;
    }

    /**
     * Set the values in this matrix based on the supplied double array. The result looks like this:
     * <p>
     * 0, 3, 6<br>
     * 1, 4, 7<br>
     * 2, 5, 8<br>
     * <p>
     * Only uses the first 9 values, all others are ignored.
     * 
     * @param m
     *          the array to read the matrix values from
     * @return this
     */
    ref public Matrix3d set(double[] m) return {
        m00 = m[0];
        m01 = m[1];
        m02 = m[2];
        m10 = m[3];
        m11 = m[4];
        m12 = m[5];
        m20 = m[6];
        m21 = m[7];
        m22 = m[8];
        return this;
    }


    public double determinant() {
        return (m00 * m11 - m01 * m10) * m22
             + (m02 * m10 - m00 * m12) * m21
             + (m01 * m12 - m02 * m11) * m20;
    }

    /**
     * Invert this matrix.
     * 
     * @return this
     */
    ref public Matrix3d invert() return {
        invert(this);
        return this;
    }

    public Matrix3d invert(ref Matrix3d dest) {
        double a = Math.fma(m00, m11, -m01 * m10);
        double b = Math.fma(m02, m10, -m00 * m12);
        double c = Math.fma(m01, m12, -m02 * m11);
        double d = Math.fma(a, m22, Math.fma(b, m21, c * m20));
        double s = 1.0 / d;
        double nm00 = Math.fma(m11, m22, -m21 * m12) * s;
        double nm01 = Math.fma(m21, m02, -m01 * m22) * s;
        double nm02 = c * s;
        double nm10 = Math.fma(m20, m12, -m10 * m22) * s;
        double nm11 = Math.fma(m00, m22, -m20 * m02) * s;
        double nm12 = b * s;
        double nm20 = Math.fma(m10, m21, -m20 * m11) * s;
        double nm21 = Math.fma(m20, m01, -m00 * m21) * s;
        double nm22 = a * s;
        dest.m00 = nm00;
        dest.m01 = nm01;
        dest.m02 = nm02;
        dest.m10 = nm10;
        dest.m11 = nm11;
        dest.m12 = nm12;
        dest.m20 = nm20;
        dest.m21 = nm21;
        dest.m22 = nm22;
        return dest;
    }

    /**
     * Transpose this matrix.
     * 
     * @return this
     */
    ref public Matrix3d transpose() return {
        transpose(this);
        return this;
    }

    public Matrix3d transpose(ref Matrix3d dest) {
        dest.set(m00, m10, m20,
                 m01, m11, m21,
                 m02, m12, m22);
        return dest;
    }


    /**
     * Get the current values of <code>this</code> matrix and store them into
     * <code>dest</code>.
     * <p>
     * This is the reverse method of {@link #set(Matrix3d)} and allows to obtain
     * intermediate calculation results when chaining multiple transformations.
     * 
     * @see #set(Matrix3d)
     * 
     * @param dest
     *          the destination matrix
     * @return the passed in destination
     */
    public Matrix3d get(ref Matrix3d dest) {
        return dest.set(this);
    }

    public Quaterniond getUnnormalizedRotation(ref Quaterniond dest) {
        return dest.setFromUnnormalized(this);
    }

    public Quaterniond getNormalizedRotation(ref Quaterniond dest) {
        return dest.setFromNormalized(this);
    }


    public double[] get(double[] arr, int offset) {
        arr[offset+0] = m00;
        arr[offset+1] = m01;
        arr[offset+2] = m02;
        arr[offset+3] = m10;
        arr[offset+4] = m11;
        arr[offset+5] = m12;
        arr[offset+6] = m20;
        arr[offset+7] = m21;
        arr[offset+8] = m22;
        return arr;
    }

    public double[] get(double[] arr) {
        return get(arr, 0);
    }


    /**
     * Set the three columns of this matrix to the supplied vectors, respectively.
     * 
     * @param col0
     *          the first column
     * @param col1
     *          the second column
     * @param col2
     *          the third column
     * @return this
     */
    ref public Matrix3d set(Vector3d col0,
                        Vector3d col1, 
                        Vector3d col2) return {
        this.m00 = col0.x;
        this.m01 = col0.y;
        this.m02 = col0.z;
        this.m10 = col1.x;
        this.m11 = col1.y;
        this.m12 = col1.z;
        this.m20 = col2.x;
        this.m21 = col2.y;
        this.m22 = col2.z;
        return this;
    }

    /**
     * Set all the values within this matrix to 0.
     * 
     * @return this
     */
    ref public Matrix3d zero() return {
        m00 = 0.0;
        m01 = 0.0;
        m02 = 0.0;
        m10 = 0.0;
        m11 = 0.0;
        m12 = 0.0;
        m20 = 0.0;
        m21 = 0.0;
        m22 = 0.0;
        return this;
    }
    
    /**
     * Set this matrix to the identity.
     * 
     * @return this
     */
    ref public Matrix3d identity() return {
        m00 = 1.0;
        m01 = 0.0;
        m02 = 0.0;
        m10 = 0.0;
        m11 = 1.0;
        m12 = 0.0;
        m20 = 0.0;
        m21 = 0.0;
        m22 = 1.0;
        return this;
    }

    /**
     * Set this matrix to be a simple scale matrix, which scales all axes uniformly by the given factor.
     * <p>
     * The resulting matrix can be multiplied against another transformation
     * matrix to obtain an additional scaling.
     * <p>
     * In order to post-multiply a scaling transformation directly to a
     * matrix, use {@link #scale(double) scale()} instead.
     * 
     * @see #scale(double)
     * 
     * @param factor
     *             the scale factor in x, y and z
     * @return this
     */
    ref public Matrix3d scaling(double factor) return {
        m00 = factor;
        m01 = 0.0;
        m02 = 0.0;
        m10 = 0.0;
        m11 = factor;
        m12 = 0.0;
        m20 = 0.0;
        m21 = 0.0;
        m22 = factor;
        return this;
    }

    /**
     * Set this matrix to be a simple scale matrix.
     * 
     * @param x
     *             the scale in x
     * @param y
     *             the scale in y
     * @param z
     *             the scale in z
     * @return this
     */
    ref public Matrix3d scaling(double x, double y, double z) return {
        m00 = x;
        m01 = 0.0;
        m02 = 0.0;
        m10 = 0.0;
        m11 = y;
        m12 = 0.0;
        m20 = 0.0;
        m21 = 0.0;
        m22 = z;
        return this;
    }

    /**
     * Set this matrix to be a simple scale matrix which scales the base axes by <code>xyz.x</code>, <code>xyz.y</code> and <code>xyz.z</code> respectively.
     * <p>
     * The resulting matrix can be multiplied against another transformation
     * matrix to obtain an additional scaling.
     * <p>
     * In order to post-multiply a scaling transformation directly to a
     * matrix use {@link #scale(Vector3d) scale()} instead.
     * 
     * @see #scale(Vector3d)
     * 
     * @param xyz
     *             the scale in x, y and z respectively
     * @return this
     */
    ref public Matrix3d scaling(Vector3d xyz) return {
        m00 = xyz.x;
        m01 = 0.0;
        m02 = 0.0;
        m10 = 0.0;
        m11 = xyz.y;
        m12 = 0.0;
        m20 = 0.0;
        m21 = 0.0;
        m22 = xyz.z;
        return this;
    }

    public Matrix3d scale(Vector3d xyz, ref Matrix3d dest) {
        return scale(xyz.x, xyz.y, xyz.z, dest);
    }

    /**
     * Apply scaling to this matrix by scaling the base axes by the given <code>xyz.x</code>,
     * <code>xyz.y</code> and <code>xyz.z</code> factors, respectively.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>S</code> the scaling matrix,
     * then the new matrix will be <code>M * S</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * S * v</code>, the
     * scaling will be applied first!
     * 
     * @param xyz
     *            the factors of the x, y and z component, respectively
     * @return this
     */
    ref public Matrix3d scale(Vector3d xyz) return {
        scale(xyz.x, xyz.y, xyz.z, this);
        return this;
    }

    public Matrix3d scale(double x, double y, double z, ref Matrix3d dest) {
        // scale matrix elements:
        // m00 = x, m11 = y, m22 = z
        // all others = 0
        dest.m00 = m00 * x;
        dest.m01 = m01 * x;
        dest.m02 = m02 * x;
        dest.m10 = m10 * y;
        dest.m11 = m11 * y;
        dest.m12 = m12 * y;
        dest.m20 = m20 * z;
        dest.m21 = m21 * z;
        dest.m22 = m22 * z;
        return dest;
    }

    /**
     * Apply scaling to this matrix by scaling the base axes by the given x,
     * y and z factors.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>S</code> the scaling matrix,
     * then the new matrix will be <code>M * S</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * S * v</code>
     * , the scaling will be applied first!
     * 
     * @param x
     *            the factor of the x component
     * @param y
     *            the factor of the y component
     * @param z
     *            the factor of the z component
     * @return this
     */
    ref public Matrix3d scale(double x, double y, double z) return {
        scale(x, y, z, this);
        return this;
    }

    public Matrix3d scale(double xyz, ref Matrix3d dest) {
        return scale(xyz, xyz, xyz, dest);
    }

    /**
     * Apply scaling to this matrix by uniformly scaling all base axes by the given <code>xyz</code> factor.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>S</code> the scaling matrix,
     * then the new matrix will be <code>M * S</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * S * v</code>
     * , the scaling will be applied first!
     * 
     * @see #scale(double, double, double)
     * 
     * @param xyz
     *            the factor for all components
     * @return this
     */
    ref public Matrix3d scale(double xyz) return {
        return scale(xyz, xyz, xyz);
    }

    public Matrix3d scaleLocal(double x, double y, double z, ref Matrix3d dest) {
        double nm00 = x * m00;
        double nm01 = y * m01;
        double nm02 = z * m02;
        double nm10 = x * m10;
        double nm11 = y * m11;
        double nm12 = z * m12;
        double nm20 = x * m20;
        double nm21 = y * m21;
        double nm22 = z * m22;
        dest.m00 = nm00;
        dest.m01 = nm01;
        dest.m02 = nm02;
        dest.m10 = nm10;
        dest.m11 = nm11;
        dest.m12 = nm12;
        dest.m20 = nm20;
        dest.m21 = nm21;
        dest.m22 = nm22;
        return dest;
    }

    /**
     * Pre-multiply scaling to this matrix by scaling the base axes by the given x,
     * y and z factors.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>S</code> the scaling matrix,
     * then the new matrix will be <code>S * M</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>S * M * v</code>, the
     * scaling will be applied last!
     * 
     * @param x
     *            the factor of the x component
     * @param y
     *            the factor of the y component
     * @param z
     *            the factor of the z component
     * @return this
     */
    ref public Matrix3d scaleLocal(double x, double y, double z) return {
        scaleLocal(x, y, z, this);
        return this;
    }

    /**
     * Set this matrix to a rotation matrix which rotates the given radians about a given axis.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * The resulting matrix can be multiplied against another transformation
     * matrix to obtain an additional rotation.
     * <p>
     * In order to post-multiply a rotation transformation directly to a
     * matrix, use {@link #rotate(double, Vector3d) rotate()} instead.
     * 
     * @see #rotate(double, Vector3d)
     * 
     * @param angle
     *          the angle in radians
     * @param axis
     *          the axis to rotate about (needs to be {@link Vector3d#normalize() normalized})
     * @return this
     */
    ref public Matrix3d rotation(double angle, Vector3d axis) return {
        return rotation(angle, axis.x, axis.y, axis.z);
    }



    /**
     * Set this matrix to a rotation transformation using the given {@link AxisAngle4d}.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * The resulting matrix can be multiplied against another transformation
     * matrix to obtain an additional rotation.
     * <p>
     * In order to apply the rotation transformation to an existing transformation,
     * use {@link #rotate(AxisAngle4d) rotate()} instead.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Axis_and_angle">http://en.wikipedia.org</a>
     *
     * @see #rotate(AxisAngle4d)
     * 
     * @param axisAngle
     *          the {@link AxisAngle4d} (needs to be {@link AxisAngle4d#normalize() normalized})
     * @return this
     */
    ref public Matrix3d rotation(AxisAngle4d axisAngle) return {
        return rotation(axisAngle.angle, axisAngle.x, axisAngle.y, axisAngle.z);
    }

    /**
     * Set this matrix to a rotation matrix which rotates the given radians about a given axis.
     * <p>
     * The axis described by the three components needs to be a unit vector.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * The resulting matrix can be multiplied against another transformation
     * matrix to obtain an additional rotation.
     * <p>
     * In order to apply the rotation transformation to an existing transformation,
     * use {@link #rotate(double, double, double, double) rotate()} instead.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Rotation_matrix_from_axis_and_angle">http://en.wikipedia.org</a>
     * 
     * @see #rotate(double, double, double, double)
     * 
     * @param angle
     *          the angle in radians
     * @param x
     *          the x-component of the rotation axis
     * @param y
     *          the y-component of the rotation axis
     * @param z
     *          the z-component of the rotation axis
     * @return this
     */
    ref public Matrix3d rotation(double angle, double x, double y, double z) return {
        double sin = Math.sin(angle);
        double cos = Math.cosFromSin(sin, angle);
        double C = 1.0 - cos;
        double xy = x * y, xz = x * z, yz = y * z;
        m00 = cos + x * x * C;
        m10 = xy * C - z * sin;
        m20 = xz * C + y * sin;
        m01 = xy * C + z * sin;
        m11 = cos + y * y * C;
        m21 = yz * C - x * sin;
        m02 = xz * C - y * sin;
        m12 = yz * C + x * sin;
        m22 = cos + z * z * C;
        return this;
    }

    /**
     * Set this matrix to a rotation transformation about the X axis.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Basic_rotations">http://en.wikipedia.org</a>
     * 
     * @param ang
     *            the angle in radians
     * @return this
     */
    ref public Matrix3d rotationX(double ang) return {
        double sin, cos;
        sin = Math.sin(ang);
        cos = Math.cosFromSin(sin, ang);
        m00 = 1.0;
        m01 = 0.0;
        m02 = 0.0;
        m10 = 0.0;
        m11 = cos;
        m12 = sin;
        m20 = 0.0;
        m21 = -sin;
        m22 = cos;
        return this;
    }

    /**
     * Set this matrix to a rotation transformation about the Y axis.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Basic_rotations">http://en.wikipedia.org</a>
     * 
     * @param ang
     *            the angle in radians
     * @return this
     */
    ref public Matrix3d rotationY(double ang) return {
        double sin, cos;
        sin = Math.sin(ang);
        cos = Math.cosFromSin(sin, ang);
        m00 = cos;
        m01 = 0.0;
        m02 = -sin;
        m10 = 0.0;
        m11 = 1.0;
        m12 = 0.0;
        m20 = sin;
        m21 = 0.0;
        m22 = cos;
        return this;
    }

    /**
     * Set this matrix to a rotation transformation about the Z axis.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Basic_rotations">http://en.wikipedia.org</a>
     * 
     * @param ang
     *            the angle in radians
     * @return this
     */
    ref public Matrix3d rotationZ(double ang) return {
        double sin, cos;
        sin = Math.sin(ang);
        cos = Math.cosFromSin(sin, ang);
        m00 = cos;
        m01 = sin;
        m02 = 0.0;
        m10 = -sin;
        m11 = cos;
        m12 = 0.0;
        m20 = 0.0;
        m21 = 0.0;
        m22 = 1.0;
        return this;
    }

    /**
     * Set this matrix to a rotation of <code>angleX</code> radians about the X axis, followed by a rotation
     * of <code>angleY</code> radians about the Y axis and followed by a rotation of <code>angleZ</code> radians about the Z axis.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * This method is equivalent to calling: <code>rotationX(angleX).rotateY(angleY).rotateZ(angleZ)</code>
     * 
     * @param angleX
     *            the angle to rotate about X
     * @param angleY
     *            the angle to rotate about Y
     * @param angleZ
     *            the angle to rotate about Z
     * @return this
     */
    ref public Matrix3d rotationXYZ(double angleX, double angleY, double angleZ) return {
        double sinX = Math.sin(angleX);
        double cosX = Math.cosFromSin(sinX, angleX);
        double sinY = Math.sin(angleY);
        double cosY = Math.cosFromSin(sinY, angleY);
        double sinZ = Math.sin(angleZ);
        double cosZ = Math.cosFromSin(sinZ, angleZ);
        double m_sinX = -sinX;
        double m_sinY = -sinY;
        double m_sinZ = -sinZ;

        // rotateX
        double nm11 = cosX;
        double nm12 = sinX;
        double nm21 = m_sinX;
        double nm22 = cosX;
        // rotateY
        double nm00 = cosY;
        double nm01 = nm21 * m_sinY;
        double nm02 = nm22 * m_sinY;
        m20 = sinY;
        m21 = nm21 * cosY;
        m22 = nm22 * cosY;
        // rotateZ
        m00 = nm00 * cosZ;
        m01 = nm01 * cosZ + nm11 * sinZ;
        m02 = nm02 * cosZ + nm12 * sinZ;
        m10 = nm00 * m_sinZ;
        m11 = nm01 * m_sinZ + nm11 * cosZ;
        m12 = nm02 * m_sinZ + nm12 * cosZ;
        return this;
    }

    /**
     * Set this matrix to a rotation of <code>angleZ</code> radians about the Z axis, followed by a rotation
     * of <code>angleY</code> radians about the Y axis and followed by a rotation of <code>angleX</code> radians about the X axis.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * This method is equivalent to calling: <code>rotationZ(angleZ).rotateY(angleY).rotateX(angleX)</code>
     * 
     * @param angleZ
     *            the angle to rotate about Z
     * @param angleY
     *            the angle to rotate about Y
     * @param angleX
     *            the angle to rotate about X
     * @return this
     */
    ref public Matrix3d rotationZYX(double angleZ, double angleY, double angleX) return {
        double sinX = Math.sin(angleX);
        double cosX = Math.cosFromSin(sinX, angleX);
        double sinY = Math.sin(angleY);
        double cosY = Math.cosFromSin(sinY, angleY);
        double sinZ = Math.sin(angleZ);
        double cosZ = Math.cosFromSin(sinZ, angleZ);
        double m_sinZ = -sinZ;
        double m_sinY = -sinY;
        double m_sinX = -sinX;

        // rotateZ
        double nm00 = cosZ;
        double nm01 = sinZ;
        double nm10 = m_sinZ;
        double nm11 = cosZ;
        // rotateY
        double nm20 = nm00 * sinY;
        double nm21 = nm01 * sinY;
        double nm22 = cosY;
        m00 = nm00 * cosY;
        m01 = nm01 * cosY;
        m02 = m_sinY;
        // rotateX
        m10 = nm10 * cosX + nm20 * sinX;
        m11 = nm11 * cosX + nm21 * sinX;
        m12 = nm22 * sinX;
        m20 = nm10 * m_sinX + nm20 * cosX;
        m21 = nm11 * m_sinX + nm21 * cosX;
        m22 = nm22 * cosX;
        return this;
    }

    /**
     * Set this matrix to a rotation of <code>angleY</code> radians about the Y axis, followed by a rotation
     * of <code>angleX</code> radians about the X axis and followed by a rotation of <code>angleZ</code> radians about the Z axis.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * This method is equivalent to calling: <code>rotationY(angleY).rotateX(angleX).rotateZ(angleZ)</code>
     * 
     * @param angleY
     *            the angle to rotate about Y
     * @param angleX
     *            the angle to rotate about X
     * @param angleZ
     *            the angle to rotate about Z
     * @return this
     */
    ref public Matrix3d rotationYXZ(double angleY, double angleX, double angleZ) return {
        double sinX = Math.sin(angleX);
        double cosX = Math.cosFromSin(sinX, angleX);
        double sinY = Math.sin(angleY);
        double cosY = Math.cosFromSin(sinY, angleY);
        double sinZ = Math.sin(angleZ);
        double cosZ = Math.cosFromSin(sinZ, angleZ);
        double m_sinY = -sinY;
        double m_sinX = -sinX;
        double m_sinZ = -sinZ;

        // rotateY
        double nm00 = cosY;
        double nm02 = m_sinY;
        double nm20 = sinY;
        double nm22 = cosY;
        // rotateX
        double nm10 = nm20 * sinX;
        double nm11 = cosX;
        double nm12 = nm22 * sinX;
        m20 = nm20 * cosX;
        m21 = m_sinX;
        m22 = nm22 * cosX;
        // rotateZ
        m00 = nm00 * cosZ + nm10 * sinZ;
        m01 = nm11 * sinZ;
        m02 = nm02 * cosZ + nm12 * sinZ;
        m10 = nm00 * m_sinZ + nm10 * cosZ;
        m11 = nm11 * cosZ;
        m12 = nm02 * m_sinZ + nm12 * cosZ;
        return this;
    }

    /**
     * Set this matrix to the rotation - and possibly scaling - transformation of the given {@link Quaterniond}.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * The resulting matrix can be multiplied against another transformation
     * matrix to obtain an additional rotation.
     * <p>
     * In order to apply the rotation transformation to an existing transformation,
     * use {@link #rotate(Quaterniond) rotate()} instead.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Quaternion">http://en.wikipedia.org</a>
     * 
     * @see #rotate(Quaterniond)
     * 
     * @param quat
     *          the {@link Quaterniond}
     * @return this
     */
    ref public Matrix3d rotation(Quaterniond quat) return {
        double w2 = quat.w * quat.w;
        double x2 = quat.x * quat.x;
        double y2 = quat.y * quat.y;
        double z2 = quat.z * quat.z;
        double zw = quat.z * quat.w, dzw = zw + zw;
        double xy = quat.x * quat.y, dxy = xy + xy;
        double xz = quat.x * quat.z, dxz = xz + xz;
        double yw = quat.y * quat.w, dyw = yw + yw;
        double yz = quat.y * quat.z, dyz = yz + yz;
        double xw = quat.x * quat.w, dxw = xw + xw;
        m00 = w2 + x2 - z2 - y2;
        m01 = dxy + dzw;
        m02 = dxz - dyw;
        m10 = -dzw + dxy;
        m11 = y2 - z2 + w2 - x2;
        m12 = dyz + dxw;
        m20 = dyw + dxz;
        m21 = dyz - dxw;
        m22 = z2 - y2 - x2 + w2;
        return this;
    }


    public Vector3d transform(Vector3d v) {
        return v.mul(this);
    }

    public Vector3d transform(Vector3d v, ref Vector3d dest) {
        v.mul(this, dest);
        return dest;
    }


    public Vector3d transform(double x, double y, double z, ref Vector3d dest) {
        return dest.set(Math.fma(m00, x, Math.fma(m10, y, m20 * z)),
                        Math.fma(m01, x, Math.fma(m11, y, m21 * z)),
                        Math.fma(m02, x, Math.fma(m12, y, m22 * z)));
    }

    public Vector3d transformTranspose(Vector3d v) {
        return v.mulTranspose(this);
    }

    public Vector3d transformTranspose(Vector3d v, ref Vector3d dest) {
        return v.mulTranspose(this, dest);
    }

    public Vector3d transformTranspose(double x, double y, double z, ref Vector3d dest) {
        return dest.set(Math.fma(m00, x, Math.fma(m01, y, m02 * z)),
                        Math.fma(m10, x, Math.fma(m11, y, m12 * z)),
                        Math.fma(m20, x, Math.fma(m21, y, m22 * z)));
    }


    public Matrix3d rotateX(double ang, ref Matrix3d dest) {
        double sin, cos;
        sin = Math.sin(ang);
        cos = Math.cosFromSin(sin, ang);
        double rm11 = cos;
        double rm21 = -sin;
        double rm12 = sin;
        double rm22 = cos;

        // add temporaries for dependent values
        double nm10 = m10 * rm11 + m20 * rm12;
        double nm11 = m11 * rm11 + m21 * rm12;
        double nm12 = m12 * rm11 + m22 * rm12;
        // set non-dependent values directly
        dest.m20 = m10 * rm21 + m20 * rm22;
        dest.m21 = m11 * rm21 + m21 * rm22;
        dest.m22 = m12 * rm21 + m22 * rm22;
        // set other values
        dest.m10 = nm10;
        dest.m11 = nm11;
        dest.m12 = nm12;
        dest.m00 = m00;
        dest.m01 = m01;
        dest.m02 = m02;
        return dest;
    }

    /**
     * Apply rotation about the X axis to this matrix by rotating the given amount of radians.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the rotation matrix,
     * then the new matrix will be <code>M * R</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * R * v</code>
     * , the rotation will be applied first!
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Basic_rotations">http://en.wikipedia.org</a>
     * 
     * @param ang
     *            the angle in radians
     * @return this
     */
    ref public Matrix3d rotateX(double ang) return {
        rotateX(ang, this);
        return this;
    }

    public Matrix3d rotateY(double ang, ref Matrix3d dest) {
        double sin, cos;
        sin = Math.sin(ang);
        cos = Math.cosFromSin(sin, ang);
        double rm00 = cos;
        double rm20 = sin;
        double rm02 = -sin;
        double rm22 = cos;

        // add temporaries for dependent values
        double nm00 = m00 * rm00 + m20 * rm02;
        double nm01 = m01 * rm00 + m21 * rm02;
        double nm02 = m02 * rm00 + m22 * rm02;
        // set non-dependent values directly
        dest.m20 = m00 * rm20 + m20 * rm22;
        dest.m21 = m01 * rm20 + m21 * rm22;
        dest.m22 = m02 * rm20 + m22 * rm22;
        // set other values
        dest.m00 = nm00;
        dest.m01 = nm01;
        dest.m02 = nm02;
        dest.m10 = m10;
        dest.m11 = m11;
        dest.m12 = m12;
        return dest;
    }

    /**
     * Apply rotation about the Y axis to this matrix by rotating the given amount of radians.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the rotation matrix,
     * then the new matrix will be <code>M * R</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * R * v</code>
     * , the rotation will be applied first!
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Basic_rotations">http://en.wikipedia.org</a>
     * 
     * @param ang
     *            the angle in radians
     * @return this
     */
    ref public Matrix3d rotateY(double ang) return {
        rotateY(ang, this);
        return this;
    }

    public Matrix3d rotateZ(double ang, ref Matrix3d dest) {
        double sin, cos;
        sin = Math.sin(ang);
        cos = Math.cosFromSin(sin, ang);
        double rm00 = cos;
        double rm10 = -sin;
        double rm01 = sin;
        double rm11 = cos;

        // add temporaries for dependent values
        double nm00 = m00 * rm00 + m10 * rm01;
        double nm01 = m01 * rm00 + m11 * rm01;
        double nm02 = m02 * rm00 + m12 * rm01;
        // set non-dependent values directly
        dest.m10 = m00 * rm10 + m10 * rm11;
        dest.m11 = m01 * rm10 + m11 * rm11;
        dest.m12 = m02 * rm10 + m12 * rm11;
        // set other values
        dest.m00 = nm00;
        dest.m01 = nm01;
        dest.m02 = nm02;
        dest.m20 = m20;
        dest.m21 = m21;
        dest.m22 = m22;
        return dest;
    }

    /**
     * Apply rotation about the Z axis to this matrix by rotating the given amount of radians.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the rotation matrix,
     * then the new matrix will be <code>M * R</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * R * v</code>
     * , the rotation will be applied first!
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Basic_rotations">http://en.wikipedia.org</a>
     * 
     * @param ang
     *            the angle in radians
     * @return this
     */
    ref public Matrix3d rotateZ(double ang) return {
        rotateZ(ang, this);
        return this;
    }

    /**
     * Apply rotation of <code>angleX</code> radians about the X axis, followed by a rotation of <code>angleY</code> radians about the Y axis and
     * followed by a rotation of <code>angleZ</code> radians about the Z axis.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the rotation matrix,
     * then the new matrix will be <code>M * R</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * R * v</code>, the
     * rotation will be applied first!
     * <p>
     * This method is equivalent to calling: <code>rotateX(angleX).rotateY(angleY).rotateZ(angleZ)</code>
     * 
     * @param angleX
     *            the angle to rotate about X
     * @param angleY
     *            the angle to rotate about Y
     * @param angleZ
     *            the angle to rotate about Z
     * @return this
     */
    ref public Matrix3d rotateXYZ(double angleX, double angleY, double angleZ) return {
        rotateXYZ(angleX, angleY, angleZ, this);
        return this;
    }

    public Matrix3d rotateXYZ(double angleX, double angleY, double angleZ, ref Matrix3d dest) {
        double sinX = Math.sin(angleX);
        double cosX = Math.cosFromSin(sinX, angleX);
        double sinY = Math.sin(angleY);
        double cosY = Math.cosFromSin(sinY, angleY);
        double sinZ = Math.sin(angleZ);
        double cosZ = Math.cosFromSin(sinZ, angleZ);
        double m_sinX = -sinX;
        double m_sinY = -sinY;
        double m_sinZ = -sinZ;

        // rotateX
        double nm10 = m10 * cosX + m20 * sinX;
        double nm11 = m11 * cosX + m21 * sinX;
        double nm12 = m12 * cosX + m22 * sinX;
        double nm20 = m10 * m_sinX + m20 * cosX;
        double nm21 = m11 * m_sinX + m21 * cosX;
        double nm22 = m12 * m_sinX + m22 * cosX;
        // rotateY
        double nm00 = m00 * cosY + nm20 * m_sinY;
        double nm01 = m01 * cosY + nm21 * m_sinY;
        double nm02 = m02 * cosY + nm22 * m_sinY;
        dest.m20 = m00 * sinY + nm20 * cosY;
        dest.m21 = m01 * sinY + nm21 * cosY;
        dest.m22 = m02 * sinY + nm22 * cosY;
        // rotateZ
        dest.m00 = nm00 * cosZ + nm10 * sinZ;
        dest.m01 = nm01 * cosZ + nm11 * sinZ;
        dest.m02 = nm02 * cosZ + nm12 * sinZ;
        dest.m10 = nm00 * m_sinZ + nm10 * cosZ;
        dest.m11 = nm01 * m_sinZ + nm11 * cosZ;
        dest.m12 = nm02 * m_sinZ + nm12 * cosZ;
        return dest;
    }

    /**
     * Apply rotation of <code>angleZ</code> radians about the Z axis, followed by a rotation of <code>angleY</code> radians about the Y axis and
     * followed by a rotation of <code>angleX</code> radians about the X axis.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the rotation matrix,
     * then the new matrix will be <code>M * R</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * R * v</code>, the
     * rotation will be applied first!
     * <p>
     * This method is equivalent to calling: <code>rotateZ(angleZ).rotateY(angleY).rotateX(angleX)</code>
     * 
     * @param angleZ
     *            the angle to rotate about Z
     * @param angleY
     *            the angle to rotate about Y
     * @param angleX
     *            the angle to rotate about X
     * @return this
     */
    ref public Matrix3d rotateZYX(double angleZ, double angleY, double angleX) return {
        rotateZYX(angleZ, angleY, angleX, this);
        return this;
    }

    public Matrix3d rotateZYX(double angleZ, double angleY, double angleX, ref Matrix3d dest) {
        double sinX = Math.sin(angleX);
        double cosX = Math.cosFromSin(sinX, angleX);
        double sinY = Math.sin(angleY);
        double cosY = Math.cosFromSin(sinY, angleY);
        double sinZ = Math.sin(angleZ);
        double cosZ = Math.cosFromSin(sinZ, angleZ);
        double m_sinZ = -sinZ;
        double m_sinY = -sinY;
        double m_sinX = -sinX;

        // rotateZ
        double nm00 = m00 * cosZ + m10 * sinZ;
        double nm01 = m01 * cosZ + m11 * sinZ;
        double nm02 = m02 * cosZ + m12 * sinZ;
        double nm10 = m00 * m_sinZ + m10 * cosZ;
        double nm11 = m01 * m_sinZ + m11 * cosZ;
        double nm12 = m02 * m_sinZ + m12 * cosZ;
        // rotateY
        double nm20 = nm00 * sinY + m20 * cosY;
        double nm21 = nm01 * sinY + m21 * cosY;
        double nm22 = nm02 * sinY + m22 * cosY;
        dest.m00 = nm00 * cosY + m20 * m_sinY;
        dest.m01 = nm01 * cosY + m21 * m_sinY;
        dest.m02 = nm02 * cosY + m22 * m_sinY;
        // rotateX
        dest.m10 = nm10 * cosX + nm20 * sinX;
        dest.m11 = nm11 * cosX + nm21 * sinX;
        dest.m12 = nm12 * cosX + nm22 * sinX;
        dest.m20 = nm10 * m_sinX + nm20 * cosX;
        dest.m21 = nm11 * m_sinX + nm21 * cosX;
        dest.m22 = nm12 * m_sinX + nm22 * cosX;
        return dest;
    }

    /**
     * Apply rotation of <code>angles.y</code> radians about the Y axis, followed by a rotation of <code>angles.x</code> radians about the X axis and
     * followed by a rotation of <code>angles.z</code> radians about the Z axis.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the rotation matrix,
     * then the new matrix will be <code>M * R</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * R * v</code>, the
     * rotation will be applied first!
     * <p>
     * This method is equivalent to calling: <code>rotateY(angles.y).rotateX(angles.x).rotateZ(angles.z)</code>
     * 
     * @param angles
     *            the Euler angles
     * @return this
     */
    ref public Matrix3d rotateYXZ(Vector3d angles) return {
        return rotateYXZ(angles.y, angles.x, angles.z);
    }

    /**
     * Apply rotation of <code>angleY</code> radians about the Y axis, followed by a rotation of <code>angleX</code> radians about the X axis and
     * followed by a rotation of <code>angleZ</code> radians about the Z axis.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the rotation matrix,
     * then the new matrix will be <code>M * R</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * R * v</code>, the
     * rotation will be applied first!
     * <p>
     * This method is equivalent to calling: <code>rotateY(angleY).rotateX(angleX).rotateZ(angleZ)</code>
     * 
     * @param angleY
     *            the angle to rotate about Y
     * @param angleX
     *            the angle to rotate about X
     * @param angleZ
     *            the angle to rotate about Z
     * @return this
     */
    ref public Matrix3d rotateYXZ(double angleY, double angleX, double angleZ) return {
        rotateYXZ(angleY, angleX, angleZ, this);
        return this;
    }

    public Matrix3d rotateYXZ(double angleY, double angleX, double angleZ, ref Matrix3d dest) {
        double sinX = Math.sin(angleX);
        double cosX = Math.cosFromSin(sinX, angleX);
        double sinY = Math.sin(angleY);
        double cosY = Math.cosFromSin(sinY, angleY);
        double sinZ = Math.sin(angleZ);
        double cosZ = Math.cosFromSin(sinZ, angleZ);
        double m_sinY = -sinY;
        double m_sinX = -sinX;
        double m_sinZ = -sinZ;

        // rotateY
        double nm20 = m00 * sinY + m20 * cosY;
        double nm21 = m01 * sinY + m21 * cosY;
        double nm22 = m02 * sinY + m22 * cosY;
        double nm00 = m00 * cosY + m20 * m_sinY;
        double nm01 = m01 * cosY + m21 * m_sinY;
        double nm02 = m02 * cosY + m22 * m_sinY;
        // rotateX
        double nm10 = m10 * cosX + nm20 * sinX;
        double nm11 = m11 * cosX + nm21 * sinX;
        double nm12 = m12 * cosX + nm22 * sinX;
        dest.m20 = m10 * m_sinX + nm20 * cosX;
        dest.m21 = m11 * m_sinX + nm21 * cosX;
        dest.m22 = m12 * m_sinX + nm22 * cosX;
        // rotateZ
        dest.m00 = nm00 * cosZ + nm10 * sinZ;
        dest.m01 = nm01 * cosZ + nm11 * sinZ;
        dest.m02 = nm02 * cosZ + nm12 * sinZ;
        dest.m10 = nm00 * m_sinZ + nm10 * cosZ;
        dest.m11 = nm01 * m_sinZ + nm11 * cosZ;
        dest.m12 = nm02 * m_sinZ + nm12 * cosZ;
        return dest;
    }

    /**
     * Apply rotation to this matrix by rotating the given amount of radians
     * about the given axis specified as x, y and z components.
     * <p>
     * The axis described by the three components needs to be a unit vector.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the rotation matrix,
     * then the new matrix will be <code>M * R</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * R * v</code>
     * , the rotation will be applied first!
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Rotation_matrix_from_axis_and_angle">http://en.wikipedia.org</a>
     * 
     * @param ang
     *            the angle in radians
     * @param x
     *            the x component of the axis
     * @param y
     *            the y component of the axis
     * @param z
     *            the z component of the axis
     * @return this
     */
    ref public Matrix3d rotate(double ang, double x, double y, double z) return {
        rotate(ang, x, y, z, this);
        return this;
    }

    public Matrix3d rotate(double ang, double x, double y, double z, ref Matrix3d dest) {
        double s = Math.sin(ang);
        double c = Math.cosFromSin(s, ang);
        double C = 1.0 - c;

        // rotation matrix elements:
        // m30, m31, m32, m03, m13, m23 = 0
        double xx = x * x, xy = x * y, xz = x * z;
        double yy = y * y, yz = y * z;
        double zz = z * z;
        double rm00 = xx * C + c;
        double rm01 = xy * C + z * s;
        double rm02 = xz * C - y * s;
        double rm10 = xy * C - z * s;
        double rm11 = yy * C + c;
        double rm12 = yz * C + x * s;
        double rm20 = xz * C + y * s;
        double rm21 = yz * C - x * s;
        double rm22 = zz * C + c;

        // add temporaries for dependent values
        double nm00 = m00 * rm00 + m10 * rm01 + m20 * rm02;
        double nm01 = m01 * rm00 + m11 * rm01 + m21 * rm02;
        double nm02 = m02 * rm00 + m12 * rm01 + m22 * rm02;
        double nm10 = m00 * rm10 + m10 * rm11 + m20 * rm12;
        double nm11 = m01 * rm10 + m11 * rm11 + m21 * rm12;
        double nm12 = m02 * rm10 + m12 * rm11 + m22 * rm12;
        // set non-dependent values directly
        dest.m20 = m00 * rm20 + m10 * rm21 + m20 * rm22;
        dest.m21 = m01 * rm20 + m11 * rm21 + m21 * rm22;
        dest.m22 = m02 * rm20 + m12 * rm21 + m22 * rm22;
        // set other values
        dest.m00 = nm00;
        dest.m01 = nm01;
        dest.m02 = nm02;
        dest.m10 = nm10;
        dest.m11 = nm11;
        dest.m12 = nm12;
        return dest;
    }

    /**
     * Pre-multiply a rotation to this matrix by rotating the given amount of radians
     * about the specified <code>(x, y, z)</code> axis and store the result in <code>dest</code>.
     * <p>
     * The axis described by the three components needs to be a unit vector.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the rotation matrix,
     * then the new matrix will be <code>R * M</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>R * M * v</code>, the
     * rotation will be applied last!
     * <p>
     * In order to set the matrix to a rotation matrix without pre-multiplying the rotation
     * transformation, use {@link #rotation(double, double, double, double) rotation()}.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Rotation_matrix_from_axis_and_angle">http://en.wikipedia.org</a>
     * 
     * @see #rotation(double, double, double, double)
     * 
     * @param ang
     *            the angle in radians
     * @param x
     *            the x component of the axis
     * @param y
     *            the y component of the axis
     * @param z
     *            the z component of the axis
     * @param dest
     *            will hold the result
     * @return dest
     */
    public Matrix3d rotateLocal(double ang, double x, double y, double z, ref Matrix3d dest) {
        double s = Math.sin(ang);
        double c = Math.cosFromSin(s, ang);
        double C = 1.0 - c;
        double xx = x * x, xy = x * y, xz = x * z;
        double yy = y * y, yz = y * z;
        double zz = z * z;
        double lm00 = xx * C + c;
        double lm01 = xy * C + z * s;
        double lm02 = xz * C - y * s;
        double lm10 = xy * C - z * s;
        double lm11 = yy * C + c;
        double lm12 = yz * C + x * s;
        double lm20 = xz * C + y * s;
        double lm21 = yz * C - x * s;
        double lm22 = zz * C + c;
        double nm00 = lm00 * m00 + lm10 * m01 + lm20 * m02;
        double nm01 = lm01 * m00 + lm11 * m01 + lm21 * m02;
        double nm02 = lm02 * m00 + lm12 * m01 + lm22 * m02;
        double nm10 = lm00 * m10 + lm10 * m11 + lm20 * m12;
        double nm11 = lm01 * m10 + lm11 * m11 + lm21 * m12;
        double nm12 = lm02 * m10 + lm12 * m11 + lm22 * m12;
        double nm20 = lm00 * m20 + lm10 * m21 + lm20 * m22;
        double nm21 = lm01 * m20 + lm11 * m21 + lm21 * m22;
        double nm22 = lm02 * m20 + lm12 * m21 + lm22 * m22;
        dest.m00 = nm00;
        dest.m01 = nm01;
        dest.m02 = nm02;
        dest.m10 = nm10;
        dest.m11 = nm11;
        dest.m12 = nm12;
        dest.m20 = nm20;
        dest.m21 = nm21;
        dest.m22 = nm22;
        return dest;
    }

    /**
     * Pre-multiply a rotation to this matrix by rotating the given amount of radians
     * about the specified <code>(x, y, z)</code> axis.
     * <p>
     * The axis described by the three components needs to be a unit vector.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the rotation matrix,
     * then the new matrix will be <code>R * M</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>R * M * v</code>, the
     * rotation will be applied last!
     * <p>
     * In order to set the matrix to a rotation matrix without pre-multiplying the rotation
     * transformation, use {@link #rotation(double, double, double, double) rotation()}.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Rotation_matrix_from_axis_and_angle">http://en.wikipedia.org</a>
     * 
     * @see #rotation(double, double, double, double)
     * 
     * @param ang
     *            the angle in radians
     * @param x
     *            the x component of the axis
     * @param y
     *            the y component of the axis
     * @param z
     *            the z component of the axis
     * @return this
     */
    ref public Matrix3d rotateLocal(double ang, double x, double y, double z) return {
        rotateLocal(ang, x, y, z, this);
        return this;
    }

    /**
     * Pre-multiply a rotation around the X axis to this matrix by rotating the given amount of radians
     * about the X axis and store the result in <code>dest</code>.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the rotation matrix,
     * then the new matrix will be <code>R * M</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>R * M * v</code>, the
     * rotation will be applied last!
     * <p>
     * In order to set the matrix to a rotation matrix without pre-multiplying the rotation
     * transformation, use {@link #rotationX(double) rotationx}.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Rotation_matrix_from_axis_and_angle">http://en.wikipedia.org</a>
     * 
     * @see #rotationX(double)
     * 
     * @param ang
     *            the angle in radians to rotate about the X axis
     * @param dest
     *            will hold the result
     * @return dest
     */
    public Matrix3d rotateLocalX(double ang, ref Matrix3d dest) {
        double sin = Math.sin(ang);
        double cos = Math.cosFromSin(sin, ang);
        double nm01 = cos * m01 - sin * m02;
        double nm02 = sin * m01 + cos * m02;
        double nm11 = cos * m11 - sin * m12;
        double nm12 = sin * m11 + cos * m12;
        double nm21 = cos * m21 - sin * m22;
        double nm22 = sin * m21 + cos * m22;
        dest.m00 = m00;
        dest.m01 = nm01;
        dest.m02 = nm02;
        dest.m10 = m10;
        dest.m11 = nm11;
        dest.m12 = nm12;
        dest.m20 = m20;
        dest.m21 = nm21;
        dest.m22 = nm22;
        return dest;
    }

    /**
     * Pre-multiply a rotation to this matrix by rotating the given amount of radians about the X axis.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the rotation matrix,
     * then the new matrix will be <code>R * M</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>R * M * v</code>, the
     * rotation will be applied last!
     * <p>
     * In order to set the matrix to a rotation matrix without pre-multiplying the rotation
     * transformation, use {@link #rotationX(double) rotationx}.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Rotation_matrix_from_axis_and_angle">http://en.wikipedia.org</a>
     * 
     * @see #rotationX(double)
     * 
     * @param ang
     *            the angle in radians to rotate about the X axis
     * @return this
     */
    ref public Matrix3d rotateLocalX(double ang) return {
        rotateLocalX(ang, this);
        return this;
    }

    /**
     * Pre-multiply a rotation around the Y axis to this matrix by rotating the given amount of radians
     * about the Y axis and store the result in <code>dest</code>.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the rotation matrix,
     * then the new matrix will be <code>R * M</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>R * M * v</code>, the
     * rotation will be applied last!
     * <p>
     * In order to set the matrix to a rotation matrix without pre-multiplying the rotation
     * transformation, use {@link #rotationY(double) rotationy}.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Rotation_matrix_from_axis_and_angle">http://en.wikipedia.org</a>
     * 
     * @see #rotationY(double)
     * 
     * @param ang
     *            the angle in radians to rotate about the Y axis
     * @param dest
     *            will hold the result
     * @return dest
     */
    public Matrix3d rotateLocalY(double ang, ref Matrix3d dest) {
        double sin = Math.sin(ang);
        double cos = Math.cosFromSin(sin, ang);
        double nm00 =  cos * m00 + sin * m02;
        double nm02 = -sin * m00 + cos * m02;
        double nm10 =  cos * m10 + sin * m12;
        double nm12 = -sin * m10 + cos * m12;
        double nm20 =  cos * m20 + sin * m22;
        double nm22 = -sin * m20 + cos * m22;
        dest.m00 = nm00;
        dest.m01 = m01;
        dest.m02 = nm02;
        dest.m10 = nm10;
        dest.m11 = m11;
        dest.m12 = nm12;
        dest.m20 = nm20;
        dest.m21 = m21;
        dest.m22 = nm22;
        return dest;
    }

    /**
     * Pre-multiply a rotation to this matrix by rotating the given amount of radians about the Y axis.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the rotation matrix,
     * then the new matrix will be <code>R * M</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>R * M * v</code>, the
     * rotation will be applied last!
     * <p>
     * In order to set the matrix to a rotation matrix without pre-multiplying the rotation
     * transformation, use {@link #rotationY(double) rotationy}.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Rotation_matrix_from_axis_and_angle">http://en.wikipedia.org</a>
     * 
     * @see #rotationY(double)
     * 
     * @param ang
     *            the angle in radians to rotate about the Y axis
     * @return this
     */
    ref public Matrix3d rotateLocalY(double ang) return {
        rotateLocalY(ang, this);
        return this;
    }

    /**
     * Pre-multiply a rotation around the Z axis to this matrix by rotating the given amount of radians
     * about the Z axis and store the result in <code>dest</code>.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the rotation matrix,
     * then the new matrix will be <code>R * M</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>R * M * v</code>, the
     * rotation will be applied last!
     * <p>
     * In order to set the matrix to a rotation matrix without pre-multiplying the rotation
     * transformation, use {@link #rotationZ(double) rotationz}.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Rotation_matrix_from_axis_and_angle">http://en.wikipedia.org</a>
     * 
     * @see #rotationZ(double)
     * 
     * @param ang
     *            the angle in radians to rotate about the Z axis
     * @param dest
     *            will hold the result
     * @return dest
     */
    public Matrix3d rotateLocalZ(double ang, ref Matrix3d dest) {
        double sin = Math.sin(ang);
        double cos = Math.cosFromSin(sin, ang);
        double nm00 = cos * m00 - sin * m01;
        double nm01 = sin * m00 + cos * m01;
        double nm10 = cos * m10 - sin * m11;
        double nm11 = sin * m10 + cos * m11;
        double nm20 = cos * m20 - sin * m21;
        double nm21 = sin * m20 + cos * m21;
        dest.m00 = nm00;
        dest.m01 = nm01;
        dest.m02 = m02;
        dest.m10 = nm10;
        dest.m11 = nm11;
        dest.m12 = m12;
        dest.m20 = nm20;
        dest.m21 = nm21;
        dest.m22 = m22;
        return dest;
    }

    /**
     * Pre-multiply a rotation to this matrix by rotating the given amount of radians about the Z axis.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the rotation matrix,
     * then the new matrix will be <code>R * M</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>R * M * v</code>, the
     * rotation will be applied last!
     * <p>
     * In order to set the matrix to a rotation matrix without pre-multiplying the rotation
     * transformation, use {@link #rotationZ(double) rotationy}.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Rotation_matrix_from_axis_and_angle">http://en.wikipedia.org</a>
     * 
     * @see #rotationY(double)
     * 
     * @param ang
     *            the angle in radians to rotate about the Z axis
     * @return this
     */
    ref public Matrix3d rotateLocalZ(double ang) return {
        rotateLocalZ(ang, this);
        return this;
    }

    /**
     * Pre-multiply the rotation - and possibly scaling - transformation of the given {@link Quaterniond} to this matrix and store
     * the result in <code>dest</code>.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>Q</code> the rotation matrix obtained from the given quaternion,
     * then the new matrix will be <code>Q * M</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>Q * M * v</code>,
     * the quaternion rotation will be applied last!
     * <p>
     * In order to set the matrix to a rotation transformation without pre-multiplying,
     * use {@link #rotation(Quaterniond)}.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Quaternion">http://en.wikipedia.org</a>
     * 
     * @see #rotation(Quaterniond)
     * 
     * @param quat
     *          the {@link Quaterniond}
     * @param dest
     *          will hold the result
     * @return dest
     */
    public Matrix3d rotateLocal(Quaterniond quat, ref Matrix3d dest) {
        double w2 = quat.w * quat.w, x2 = quat.x * quat.x;
        double y2 = quat.y * quat.y, z2 = quat.z * quat.z;
        double zw = quat.z * quat.w, dzw = zw + zw, xy = quat.x * quat.y, dxy = xy + xy;
        double xz = quat.x * quat.z, dxz = xz + xz, yw = quat.y * quat.w, dyw = yw + yw;
        double yz = quat.y * quat.z, dyz = yz + yz, xw = quat.x * quat.w, dxw = xw + xw;
        double lm00 = w2 + x2 - z2 - y2;
        double lm01 = dxy + dzw;
        double lm02 = dxz - dyw;
        double lm10 = dxy - dzw;
        double lm11 = y2 - z2 + w2 - x2;
        double lm12 = dyz + dxw;
        double lm20 = dyw + dxz;
        double lm21 = dyz - dxw;
        double lm22 = z2 - y2 - x2 + w2;
        double nm00 = lm00 * m00 + lm10 * m01 + lm20 * m02;
        double nm01 = lm01 * m00 + lm11 * m01 + lm21 * m02;
        double nm02 = lm02 * m00 + lm12 * m01 + lm22 * m02;
        double nm10 = lm00 * m10 + lm10 * m11 + lm20 * m12;
        double nm11 = lm01 * m10 + lm11 * m11 + lm21 * m12;
        double nm12 = lm02 * m10 + lm12 * m11 + lm22 * m12;
        double nm20 = lm00 * m20 + lm10 * m21 + lm20 * m22;
        double nm21 = lm01 * m20 + lm11 * m21 + lm21 * m22;
        double nm22 = lm02 * m20 + lm12 * m21 + lm22 * m22;
        dest.m00 = nm00;
        dest.m01 = nm01;
        dest.m02 = nm02;
        dest.m10 = nm10;
        dest.m11 = nm11;
        dest.m12 = nm12;
        dest.m20 = nm20;
        dest.m21 = nm21;
        dest.m22 = nm22;
        return dest;
    }

    /**
     * Pre-multiply the rotation - and possibly scaling - transformation of the given {@link Quaterniond} to this matrix.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>Q</code> the rotation matrix obtained from the given quaternion,
     * then the new matrix will be <code>Q * M</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>Q * M * v</code>,
     * the quaternion rotation will be applied last!
     * <p>
     * In order to set the matrix to a rotation transformation without pre-multiplying,
     * use {@link #rotation(Quaterniond)}.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Quaternion">http://en.wikipedia.org</a>
     * 
     * @see #rotation(Quaterniond)
     * 
     * @param quat
     *          the {@link Quaterniond}
     * @return this
     */
    ref public Matrix3d rotateLocal(Quaterniond quat) return {
        rotateLocal(quat, this);
        return this;
    }


    /**
     * Apply the rotation - and possibly scaling - transformation of the given {@link Quaterniond} to this matrix.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>Q</code> the rotation matrix obtained from the given quaternion,
     * then the new matrix will be <code>M * Q</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * Q * v</code>,
     * the quaternion rotation will be applied first!
     * <p>
     * In order to set the matrix to a rotation transformation without post-multiplying,
     * use {@link #rotation(Quaterniond)}.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Quaternion">http://en.wikipedia.org</a>
     * 
     * @see #rotation(Quaterniond)
     * 
     * @param quat
     *          the {@link Quaterniond}
     * @return this
     */
    ref public Matrix3d rotate(Quaterniond quat) return {
        rotate(quat, this);
        return this;
    }

    /**
     * Apply the rotation - and possibly scaling - transformation of the given {@link Quaterniond} to this matrix and store
     * the result in <code>dest</code>.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>Q</code> the rotation matrix obtained from the given quaternion,
     * then the new matrix will be <code>M * Q</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * Q * v</code>,
     * the quaternion rotation will be applied first!
     * <p>
     * In order to set the matrix to a rotation transformation without post-multiplying,
     * use {@link #rotation(Quaterniond)}.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Quaternion">http://en.wikipedia.org</a>
     * 
     * @see #rotation(Quaterniond)
     * 
     * @param quat
     *          the {@link Quaterniond}
     * @param dest
     *          will hold the result
     * @return dest
     */
    public Matrix3d rotate(Quaterniond quat, ref Matrix3d dest) {
        double w2 = quat.w * quat.w, x2 = quat.x * quat.x;
        double y2 = quat.y * quat.y, z2 = quat.z * quat.z;
        double zw = quat.z * quat.w, dzw = zw + zw, xy = quat.x * quat.y, dxy = xy + xy;
        double xz = quat.x * quat.z, dxz = xz + xz, yw = quat.y * quat.w, dyw = yw + yw;
        double yz = quat.y * quat.z, dyz = yz + yz, xw = quat.x * quat.w, dxw = xw + xw;
        double rm00 = w2 + x2 - z2 - y2;
        double rm01 = dxy + dzw;
        double rm02 = dxz - dyw;
        double rm10 = dxy - dzw;
        double rm11 = y2 - z2 + w2 - x2;
        double rm12 = dyz + dxw;
        double rm20 = dyw + dxz;
        double rm21 = dyz - dxw;
        double rm22 = z2 - y2 - x2 + w2;
        double nm00 = m00 * rm00 + m10 * rm01 + m20 * rm02;
        double nm01 = m01 * rm00 + m11 * rm01 + m21 * rm02;
        double nm02 = m02 * rm00 + m12 * rm01 + m22 * rm02;
        double nm10 = m00 * rm10 + m10 * rm11 + m20 * rm12;
        double nm11 = m01 * rm10 + m11 * rm11 + m21 * rm12;
        double nm12 = m02 * rm10 + m12 * rm11 + m22 * rm12;
        dest.m20 = m00 * rm20 + m10 * rm21 + m20 * rm22;
        dest.m21 = m01 * rm20 + m11 * rm21 + m21 * rm22;
        dest.m22 = m02 * rm20 + m12 * rm21 + m22 * rm22;
        dest.m00 = nm00;
        dest.m01 = nm01;
        dest.m02 = nm02;
        dest.m10 = nm10;
        dest.m11 = nm11;
        dest.m12 = nm12;
        return dest;
    }

    /**
     * Apply a rotation transformation, rotating about the given {@link AxisAngle4d}, to this matrix.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>A</code> the rotation matrix obtained from the given {@link AxisAngle4d},
     * then the new matrix will be <code>M * A</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * A * v</code>,
     * the {@link AxisAngle4d} rotation will be applied first!
     * <p>
     * In order to set the matrix to a rotation transformation without post-multiplying,
     * use {@link #rotation(AxisAngle4d)}.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Axis_and_angle">http://en.wikipedia.org</a>
     * 
     * @see #rotate(double, double, double, double)
     * @see #rotation(AxisAngle4d)
     * 
     * @param axisAngle
     *          the {@link AxisAngle4d} (needs to be {@link AxisAngle4d#normalize() normalized})
     * @return this
     */
    ref public Matrix3d rotate(AxisAngle4d axisAngle) return {
        return rotate(axisAngle.angle, axisAngle.x, axisAngle.y, axisAngle.z);
    }

    /**
     * Apply a rotation transformation, rotating about the given {@link AxisAngle4d} and store the result in <code>dest</code>.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>A</code> the rotation matrix obtained from the given {@link AxisAngle4d},
     * then the new matrix will be <code>M * A</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * A * v</code>,
     * the {@link AxisAngle4d} rotation will be applied first!
     * <p>
     * In order to set the matrix to a rotation transformation without post-multiplying,
     * use {@link #rotation(AxisAngle4d)}.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Axis_and_angle">http://en.wikipedia.org</a>
     * 
     * @see #rotate(double, double, double, double)
     * @see #rotation(AxisAngle4d)
     * 
     * @param axisAngle
     *          the {@link AxisAngle4d} (needs to be {@link AxisAngle4d#normalize() normalized})
     * @param dest
     *          will hold the result
     * @return dest
     */
    public Matrix3d rotate(AxisAngle4d axisAngle, ref Matrix3d dest) {
        return rotate(axisAngle.angle, axisAngle.x, axisAngle.y, axisAngle.z, dest);
    }

    /**
     * Apply a rotation transformation, rotating the given radians about the specified axis, to this matrix.
     * <p>
     * The axis described by the <code>axis</code> vector needs to be a unit vector.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>A</code> the rotation matrix obtained from the given angle and axis,
     * then the new matrix will be <code>M * A</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * A * v</code>,
     * the axis-angle rotation will be applied first!
     * <p>
     * In order to set the matrix to a rotation transformation without post-multiplying,
     * use {@link #rotation(double, Vector3d)}.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Axis_and_angle">http://en.wikipedia.org</a>
     * 
     * @see #rotate(double, double, double, double)
     * @see #rotation(double, Vector3d)
     * 
     * @param angle
     *          the angle in radians
     * @param axis
     *          the rotation axis (needs to be {@link Vector3d#normalize() normalized})
     * @return this
     */
    ref public Matrix3d rotate(double angle, Vector3d axis) return {
        return rotate(angle, axis.x, axis.y, axis.z);
    }

    /**
     * Apply a rotation transformation, rotating the given radians about the specified axis and store the result in <code>dest</code>.
     * <p>
     * The axis described by the <code>axis</code> vector needs to be a unit vector.
     * <p>
     * When used with a right-handed coordinate system, the produced rotation will rotate a vector 
     * counter-clockwise around the rotation axis, when viewing along the negative axis direction towards the origin.
     * When used with a left-handed coordinate system, the rotation is clockwise.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>A</code> the rotation matrix obtained from the given axis and angle,
     * then the new matrix will be <code>M * A</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * A * v</code>,
     * the axis-angle rotation will be applied first!
     * <p>
     * In order to set the matrix to a rotation transformation without post-multiplying,
     * use {@link #rotation(double, Vector3d)}.
     * <p>
     * Reference: <a href="http://en.wikipedia.org/wiki/Rotation_matrix#Axis_and_angle">http://en.wikipedia.org</a>
     * 
     * @see #rotate(double, double, double, double)
     * @see #rotation(double, Vector3d)
     * 
     * @param angle
     *          the angle in radians
     * @param axis
     *          the rotation axis (needs to be {@link Vector3d#normalize() normalized})
     * @param dest
     *          will hold the result
     * @return dest
     */
    public Matrix3d rotate(double angle, Vector3d axis, ref Matrix3d dest) {
        return rotate(angle, axis.x, axis.y, axis.z, dest);
    }

    public Vector3d getRow(int row, ref Vector3d dest) {
        switch (row) {
        case 0:
            return dest.set(m00, m10, m20);
        case 1:
            return dest.set(m01, m11, m21);
        case 2:
            return dest.set(m02, m12, m22);
        default:
            return dest;
        }
    }

    /**
     * Set the row at the given <code>row</code> index, starting with <code>0</code>.
     * 
     * @param row
     *          the row index in <code>[0..2]</code>
     * @param src
     *          the row components to set
     * @return this
     * @throws IndexOutOfBoundsException if <code>row</code> is not in <code>[0..2]</code>
     */
    ref public Matrix3d setRow(int row, Vector3d src) return {
        return setRow(row, src.x, src.y, src.z);
    }

    /**
     * Set the row at the given <code>row</code> index, starting with <code>0</code>.
     * 
     * @param row
     *          the column index in <code>[0..2]</code>
     * @param x
     *          the first element in the row
     * @param y
     *          the second element in the row
     * @param z
     *          the third element in the row
     * @return this
     * @throws IndexOutOfBoundsException if <code>row</code> is not in <code>[0..2]</code>
     */
    ref public Matrix3d setRow(int row, double x, double y, double z) return {
        switch (row) {
        case 0:
            this.m00 = x;
            this.m10 = y;
            this.m20 = z;
            break;
        case 1:
            this.m01 = x;
            this.m11 = y;
            this.m21 = z;
            break;
        case 2:
            this.m02 = x;
            this.m12 = y;
            this.m22 = z;
            break;
        default: {}
        }
        return this;
    }

    public Vector3d getColumn(int column, ref Vector3d dest){
        switch (column) {
        case 0:
            return dest.set(m00, m01, m02);
        case 1:
            return dest.set(m10, m11, m12);
        case 2:
            return dest.set(m20, m21, m22);
        default:
            return dest;
        }
    }

    /**
     * Set the column at the given <code>column</code> index, starting with <code>0</code>.
     * 
     * @param column
     *          the column index in <code>[0..2]</code>
     * @param src
     *          the column components to set
     * @return this
     * @throws IndexOutOfBoundsException if <code>column</code> is not in <code>[0..2]</code>
     */
    ref public Matrix3d setColumn(int column, Vector3d src) return {
        return setColumn(column, src.x, src.y, src.z);
    }

    /**
     * Set the column at the given <code>column</code> index, starting with <code>0</code>.
     * 
     * @param column
     *          the column index in <code>[0..2]</code>
     * @param x
     *          the first element in the column
     * @param y
     *          the second element in the column
     * @param z
     *          the third element in the column
     * @return this
     * @throws IndexOutOfBoundsException if <code>column</code> is not in <code>[0..2]</code>
     */
    ref public Matrix3d setColumn(int column, double x, double y, double z) return {
        switch (column) {
        case 0:
            this.m00 = x;
            this.m01 = y;
            this.m02 = z;
            break;
        case 1:
            this.m10 = x;
            this.m11 = y;
            this.m12 = z;
            break;
        case 2:
            this.m20 = x;
            this.m21 = y;
            this.m22 = z;
            break;
        default: {}
        }
        return this;
    }

    public double get(int column, int row) {
        return MemUtil.get(this, column, row);
    }

    /**
     * Set the matrix element at the given column and row to the specified value.
     * 
     * @param column
     *          the colum index in <code>[0..2]</code>
     * @param row
     *          the row index in <code>[0..2]</code>
     * @param value
     *          the value
     * @return this
     */
    ref public Matrix3d set(int column, int row, double value) return {
        MemUtil.set(this, column, row, value);
        return this;
        
    }

    public double getRowColumn(int row, int column) {
        return MemUtil.get(this, column, row);
    }

    /**
     * Set the matrix element at the given row and column to the specified value.
     * 
     * @param row
     *          the row index in <code>[0..2]</code>
     * @param column
     *          the colum index in <code>[0..2]</code>
     * @param value
     *          the value
     * @return this
     */
    ref public Matrix3d setRowColumn(int row, int column, double value) return {
        MemUtil.set(this, column, row, value);
        return this;
    }

    /**
     * Set <code>this</code> matrix to its own normal matrix.
     * <p>
     * The normal matrix of <code>m</code> is the transpose of the inverse of <code>m</code>.
     * <p>
     * Please note that, if <code>this</code> is an orthogonal matrix or a matrix whose columns are orthogonal vectors, 
     * then this method <i>need not</i> be invoked, since in that case <code>this</code> itself is its normal matrix.
     * In this case, use {@link #set(Matrix3d)} to set a given Matrix3f to this matrix.
     * 
     * @see #set(Matrix3d)
     * 
     * @return this
     */
    ref public Matrix3d normal() return {
        normal(this);
        return this;
    }

    /**
     * Compute a normal matrix from <code>this</code> matrix and store it into <code>dest</code>.
     * <p>
     * The normal matrix of <code>m</code> is the transpose of the inverse of <code>m</code>.
     * <p>
     * Please note that, if <code>this</code> is an orthogonal matrix or a matrix whose columns are orthogonal vectors, 
     * then this method <i>need not</i> be invoked, since in that case <code>this</code> itself is its normal matrix.
     * In this case, use {@link #set(Matrix3d)} to set a given Matrix3d to this matrix.
     * 
     * @see #set(Matrix3d)
     * 
     * @param dest
     *             will hold the result
     * @return dest
     */
    public Matrix3d normal(ref Matrix3d dest) {
        double m00m11 = m00 * m11;
        double m01m10 = m01 * m10;
        double m02m10 = m02 * m10;
        double m00m12 = m00 * m12;
        double m01m12 = m01 * m12;
        double m02m11 = m02 * m11;
        double det = (m00m11 - m01m10) * m22 + (m02m10 - m00m12) * m21 + (m01m12 - m02m11) * m20;
        double s = 1.0 / det;
        /* Invert and transpose in one go */
        double nm00 = (m11 * m22 - m21 * m12) * s;
        double nm01 = (m20 * m12 - m10 * m22) * s;
        double nm02 = (m10 * m21 - m20 * m11) * s;
        double nm10 = (m21 * m02 - m01 * m22) * s;
        double nm11 = (m00 * m22 - m20 * m02) * s;
        double nm12 = (m20 * m01 - m00 * m21) * s;
        double nm20 = (m01m12 - m02m11) * s;
        double nm21 = (m02m10 - m00m12) * s;
        double nm22 = (m00m11 - m01m10) * s;
        dest.m00 = nm00;
        dest.m01 = nm01;
        dest.m02 = nm02;
        dest.m10 = nm10;
        dest.m11 = nm11;
        dest.m12 = nm12;
        dest.m20 = nm20;
        dest.m21 = nm21;
        dest.m22 = nm22;
        return dest;
    }

    /**
     * Compute the cofactor matrix of <code>this</code>.
     * <p>
     * The cofactor matrix can be used instead of {@link #normal()} to transform normals
     * when the orientation of the normals with respect to the surface should be preserved.
     * 
     * @return this
     */
    ref public Matrix3d cofactor() return {
        cofactor(this);
        return this;
    }

    /**
     * Compute the cofactor matrix of <code>this</code> and store it into <code>dest</code>.
     * <p>
     * The cofactor matrix can be used instead of {@link #normal(Matrix3d)} to transform normals
     * when the orientation of the normals with respect to the surface should be preserved.
     * 
     * @param dest
     *             will hold the result
     * @return dest
     */
    public Matrix3d cofactor(ref Matrix3d dest) {
        double nm00 = m11 * m22 - m21 * m12;
        double nm01 = m20 * m12 - m10 * m22;
        double nm02 = m10 * m21 - m20 * m11;
        double nm10 = m21 * m02 - m01 * m22;
        double nm11 = m00 * m22 - m20 * m02;
        double nm12 = m20 * m01 - m00 * m21;
        double nm20 = m01 * m12 - m11 * m02;
        double nm21 = m02 * m10 - m12 * m00;
        double nm22 = m00 * m11 - m10 * m01;
        dest.m00 = nm00;
        dest.m01 = nm01;
        dest.m02 = nm02;
        dest.m10 = nm10;
        dest.m11 = nm11;
        dest.m12 = nm12;
        dest.m20 = nm20;
        dest.m21 = nm21;
        dest.m22 = nm22;
        return dest;
    }

    /**
     * Apply a rotation transformation to this matrix to make <code>-z</code> point along <code>dir</code>. 
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>L</code> the lookalong rotation matrix,
     * then the new matrix will be <code>M * L</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * L * v</code>, the
     * lookalong rotation transformation will be applied first!
     * <p>
     * In order to set the matrix to a lookalong transformation without post-multiplying it,
     * use {@link #setLookAlong(Vector3d, Vector3d) setLookAlong()}.
     * 
     * @see #lookAlong(double, double, double, double, double, double)
     * @see #setLookAlong(Vector3d, Vector3d)
     * 
     * @param dir
     *            the direction in space to look along
     * @param up
     *            the direction of 'up'
     * @return this
     */
    ref public Matrix3d lookAlong(Vector3d dir, Vector3d up) return {
        lookAlong(dir.x, dir.y, dir.z, up.x, up.y, up.z, this);
        return this;
    }

    /**
     * Apply a rotation transformation to this matrix to make <code>-z</code> point along <code>dir</code>
     * and store the result in <code>dest</code>. 
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>L</code> the lookalong rotation matrix,
     * then the new matrix will be <code>M * L</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * L * v</code>, the
     * lookalong rotation transformation will be applied first!
     * <p>
     * In order to set the matrix to a lookalong transformation without post-multiplying it,
     * use {@link #setLookAlong(Vector3d, Vector3d) setLookAlong()}.
     * 
     * @see #lookAlong(double, double, double, double, double, double)
     * @see #setLookAlong(Vector3d, Vector3d)
     * 
     * @param dir
     *            the direction in space to look along
     * @param up
     *            the direction of 'up'
     * @param dest
     *            will hold the result
     * @return dest
     */
    public Matrix3d lookAlong(Vector3d dir, Vector3d up, ref Matrix3d dest) {
        return lookAlong(dir.x, dir.y, dir.z, up.x, up.y, up.z, dest);
    }

    /**
     * Apply a rotation transformation to this matrix to make <code>-z</code> point along <code>dir</code>
     * and store the result in <code>dest</code>. 
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>L</code> the lookalong rotation matrix,
     * then the new matrix will be <code>M * L</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * L * v</code>, the
     * lookalong rotation transformation will be applied first!
     * <p>
     * In order to set the matrix to a lookalong transformation without post-multiplying it,
     * use {@link #setLookAlong(double, double, double, double, double, double) setLookAlong()}
     * 
     * @see #setLookAlong(double, double, double, double, double, double)
     * 
     * @param dirX
     *              the x-coordinate of the direction to look along
     * @param dirY
     *              the y-coordinate of the direction to look along
     * @param dirZ
     *              the z-coordinate of the direction to look along
     * @param upX
     *              the x-coordinate of the up vector
     * @param upY
     *              the y-coordinate of the up vector
     * @param upZ
     *              the z-coordinate of the up vector
     * @param dest
     *              will hold the result
     * @return dest
     */
    public Matrix3d lookAlong(double dirX, double dirY, double dirZ,
                              double upX, double upY, double upZ, ref Matrix3d dest) {
        // Normalize direction
        double invDirLength = Math.invsqrt(dirX * dirX + dirY * dirY + dirZ * dirZ);
        dirX *= -invDirLength;
        dirY *= -invDirLength;
        dirZ *= -invDirLength;
        // left = up x direction
        double leftX, leftY, leftZ;
        leftX = upY * dirZ - upZ * dirY;
        leftY = upZ * dirX - upX * dirZ;
        leftZ = upX * dirY - upY * dirX;
        // normalize left
        double invLeftLength = Math.invsqrt(leftX * leftX + leftY * leftY + leftZ * leftZ);
        leftX *= invLeftLength;
        leftY *= invLeftLength;
        leftZ *= invLeftLength;
        // up = direction x left
        double upnX = dirY * leftZ - dirZ * leftY;
        double upnY = dirZ * leftX - dirX * leftZ;
        double upnZ = dirX * leftY - dirY * leftX;

        // calculate right matrix elements
        double rm00 = leftX;
        double rm01 = upnX;
        double rm02 = dirX;
        double rm10 = leftY;
        double rm11 = upnY;
        double rm12 = dirY;
        double rm20 = leftZ;
        double rm21 = upnZ;
        double rm22 = dirZ;

        // perform optimized matrix multiplication
        // introduce temporaries for dependent results
        double nm00 = m00 * rm00 + m10 * rm01 + m20 * rm02;
        double nm01 = m01 * rm00 + m11 * rm01 + m21 * rm02;
        double nm02 = m02 * rm00 + m12 * rm01 + m22 * rm02;
        double nm10 = m00 * rm10 + m10 * rm11 + m20 * rm12;
        double nm11 = m01 * rm10 + m11 * rm11 + m21 * rm12;
        double nm12 = m02 * rm10 + m12 * rm11 + m22 * rm12;
        dest.m20 = m00 * rm20 + m10 * rm21 + m20 * rm22;
        dest.m21 = m01 * rm20 + m11 * rm21 + m21 * rm22;
        dest.m22 = m02 * rm20 + m12 * rm21 + m22 * rm22;
        // set the rest of the matrix elements
        dest.m00 = nm00;
        dest.m01 = nm01;
        dest.m02 = nm02;
        dest.m10 = nm10;
        dest.m11 = nm11;
        dest.m12 = nm12;
        return dest;
    }

    /**
     * Apply a rotation transformation to this matrix to make <code>-z</code> point along <code>dir</code>. 
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>L</code> the lookalong rotation matrix,
     * then the new matrix will be <code>M * L</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * L * v</code>, the
     * lookalong rotation transformation will be applied first!
     * <p>
     * In order to set the matrix to a lookalong transformation without post-multiplying it,
     * use {@link #setLookAlong(double, double, double, double, double, double) setLookAlong()}
     * 
     * @see #setLookAlong(double, double, double, double, double, double)
     * 
     * @param dirX
     *              the x-coordinate of the direction to look along
     * @param dirY
     *              the y-coordinate of the direction to look along
     * @param dirZ
     *              the z-coordinate of the direction to look along
     * @param upX
     *              the x-coordinate of the up vector
     * @param upY
     *              the y-coordinate of the up vector
     * @param upZ
     *              the z-coordinate of the up vector
     * @return this
     */
    ref public Matrix3d lookAlong(double dirX, double dirY, double dirZ,
                              double upX, double upY, double upZ) return {
        lookAlong(dirX, dirY, dirZ, upX, upY, upZ, this);
        return this;
    }

    /**
     * Set this matrix to a rotation transformation to make <code>-z</code>
     * point along <code>dir</code>.
     * <p>
     * In order to apply the lookalong transformation to any previous existing transformation,
     * use {@link #lookAlong(Vector3d, Vector3d)}.
     * 
     * @see #setLookAlong(Vector3d, Vector3d)
     * @see #lookAlong(Vector3d, Vector3d)
     * 
     * @param dir
     *            the direction in space to look along
     * @param up
     *            the direction of 'up'
     * @return this
     */
    ref public Matrix3d setLookAlong(Vector3d dir, Vector3d up) return {
        return setLookAlong(dir.x, dir.y, dir.z, up.x, up.y, up.z);
    }

    /**
     * Set this matrix to a rotation transformation to make <code>-z</code>
     * point along <code>dir</code>.
     * <p>
     * In order to apply the lookalong transformation to any previous existing transformation,
     * use {@link #lookAlong(double, double, double, double, double, double) lookAlong()}
     * 
     * @see #setLookAlong(double, double, double, double, double, double)
     * @see #lookAlong(double, double, double, double, double, double)
     * 
     * @param dirX
     *              the x-coordinate of the direction to look along
     * @param dirY
     *              the y-coordinate of the direction to look along
     * @param dirZ
     *              the z-coordinate of the direction to look along
     * @param upX
     *              the x-coordinate of the up vector
     * @param upY
     *              the y-coordinate of the up vector
     * @param upZ
     *              the z-coordinate of the up vector
     * @return this
     */
    ref public Matrix3d setLookAlong(double dirX, double dirY, double dirZ,
                                 double upX, double upY, double upZ) return {
        // Normalize direction
        double invDirLength = Math.invsqrt(dirX * dirX + dirY * dirY + dirZ * dirZ);
        dirX *= -invDirLength;
        dirY *= -invDirLength;
        dirZ *= -invDirLength;
        // left = up x direction
        double leftX, leftY, leftZ;
        leftX = upY * dirZ - upZ * dirY;
        leftY = upZ * dirX - upX * dirZ;
        leftZ = upX * dirY - upY * dirX;
        // normalize left
        double invLeftLength = Math.invsqrt(leftX * leftX + leftY * leftY + leftZ * leftZ);
        leftX *= invLeftLength;
        leftY *= invLeftLength;
        leftZ *= invLeftLength;
        // up = direction x left
        double upnX = dirY * leftZ - dirZ * leftY;
        double upnY = dirZ * leftX - dirX * leftZ;
        double upnZ = dirX * leftY - dirY * leftX;

        m00 = leftX;
        m01 = upnX;
        m02 = dirX;
        m10 = leftY;
        m11 = upnY;
        m12 = dirY;
        m20 = leftZ;
        m21 = upnZ;
        m22 = dirZ;

        return this;
    }

    public Vector3d getScale(ref Vector3d dest) {
        dest.x = Math.sqrt(m00 * m00 + m01 * m01 + m02 * m02);
        dest.y = Math.sqrt(m10 * m10 + m11 * m11 + m12 * m12);
        dest.z = Math.sqrt(m20 * m20 + m21 * m21 + m22 * m22);
        return dest;
    }

    public Vector3d positiveZ(Vector3d dir) {
        dir.x = m10 * m21 - m11 * m20;
        dir.y = m20 * m01 - m21 * m00;
        dir.z = m00 * m11 - m01 * m10;
        return dir.normalize(dir);
    }

    public Vector3d normalizedPositiveZ(Vector3d dir) {
        dir.x = m02;
        dir.y = m12;
        dir.z = m22;
        return dir;
    }

    public Vector3d positiveX(Vector3d dir) {
        dir.x = m11 * m22 - m12 * m21;
        dir.y = m02 * m21 - m01 * m22;
        dir.z = m01 * m12 - m02 * m11;
        return dir.normalize(dir);
    }

    public Vector3d normalizedPositiveX(Vector3d dir) {
        dir.x = m00;
        dir.y = m10;
        dir.z = m20;
        return dir;
    }

    public Vector3d positiveY(Vector3d dir) {
        dir.x = m12 * m20 - m10 * m22;
        dir.y = m00 * m22 - m02 * m20;
        dir.z = m02 * m10 - m00 * m12;
        return dir.normalize(dir);
    }

    public Vector3d normalizedPositiveY(Vector3d dir) {
        dir.x = m01;
        dir.y = m11;
        dir.z = m21;
        return dir;
    }

    public int hashCode() {
        immutable int prime = 31;
        int result = 1;
        long temp;
        temp = Math.doubleToLongBits(m00);
        result = prime * result + cast(int) (temp ^ (temp >>> 32));
        temp = Math.doubleToLongBits(m01);
        result = prime * result + cast(int) (temp ^ (temp >>> 32));
        temp = Math.doubleToLongBits(m02);
        result = prime * result + cast(int) (temp ^ (temp >>> 32));
        temp = Math.doubleToLongBits(m10);
        result = prime * result + cast(int) (temp ^ (temp >>> 32));
        temp = Math.doubleToLongBits(m11);
        result = prime * result + cast(int) (temp ^ (temp >>> 32));
        temp = Math.doubleToLongBits(m12);
        result = prime * result + cast(int) (temp ^ (temp >>> 32));
        temp = Math.doubleToLongBits(m20);
        result = prime * result + cast(int) (temp ^ (temp >>> 32));
        temp = Math.doubleToLongBits(m21);
        result = prime * result + cast(int) (temp ^ (temp >>> 32));
        temp = Math.doubleToLongBits(m22);
        result = prime * result + cast(int) (temp ^ (temp >>> 32));
        return result;
    }

    public bool equals(Matrix3d m, double delta) {
        if (this == m)
            return true;
        if (!Math.equals(m00, m.m00, delta))
            return false;
        if (!Math.equals(m01, m.m01, delta))
            return false;
        if (!Math.equals(m02, m.m02, delta))
            return false;
        if (!Math.equals(m10, m.m10, delta))
            return false;
        if (!Math.equals(m11, m.m11, delta))
            return false;
        if (!Math.equals(m12, m.m12, delta))
            return false;
        if (!Math.equals(m20, m.m20, delta))
            return false;
        if (!Math.equals(m21, m.m21, delta))
            return false;
        if (!Math.equals(m22, m.m22, delta))
            return false;
        return true;
    }

    /**
     * Exchange the values of <code>this</code> matrix with the given <code>other</code> matrix.
     * 
     * @param other
     *          the other matrix to exchange the values with
     * @return this
     */
    ref public Matrix3d swap(ref Matrix3d other) return {
        double tmp;
        tmp = m00; m00 = other.m00; other.m00 = tmp;
        tmp = m01; m01 = other.m01; other.m01 = tmp;
        tmp = m02; m02 = other.m02; other.m02 = tmp;
        tmp = m10; m10 = other.m10; other.m10 = tmp;
        tmp = m11; m11 = other.m11; other.m11 = tmp;
        tmp = m12; m12 = other.m12; other.m12 = tmp;
        tmp = m20; m20 = other.m20; other.m20 = tmp;
        tmp = m21; m21 = other.m21; other.m21 = tmp;
        tmp = m22; m22 = other.m22; other.m22 = tmp;
        return this;
    }

    /**
     * Component-wise add <code>this</code> and <code>other</code>.
     * 
     * @param other
     *          the other addend 
     * @return this
     */
    ref public Matrix3d add(Matrix3d other) return {
        add(other, this);
        return this;
    }

    public Matrix3d add(Matrix3d other, ref Matrix3d dest) {
        dest.m00 = m00 + other.m00;
        dest.m01 = m01 + other.m01;
        dest.m02 = m02 + other.m02;
        dest.m10 = m10 + other.m10;
        dest.m11 = m11 + other.m11;
        dest.m12 = m12 + other.m12;
        dest.m20 = m20 + other.m20;
        dest.m21 = m21 + other.m21;
        dest.m22 = m22 + other.m22;
        return dest;
    }

    /**
     * Component-wise subtract <code>subtrahend</code> from <code>this</code>.
     * 
     * @param subtrahend
     *          the subtrahend
     * @return this
     */
    ref public Matrix3d sub(Matrix3d subtrahend) return {
        sub(subtrahend, this);
        return this;
    }

    public Matrix3d sub(Matrix3d subtrahend, ref Matrix3d dest) {
        dest.m00 = m00 - subtrahend.m00;
        dest.m01 = m01 - subtrahend.m01;
        dest.m02 = m02 - subtrahend.m02;
        dest.m10 = m10 - subtrahend.m10;
        dest.m11 = m11 - subtrahend.m11;
        dest.m12 = m12 - subtrahend.m12;
        dest.m20 = m20 - subtrahend.m20;
        dest.m21 = m21 - subtrahend.m21;
        dest.m22 = m22 - subtrahend.m22;
        return dest;
    }

    /**
     * Component-wise multiply <code>this</code> by <code>other</code>.
     * 
     * @param other
     *          the other matrix
     * @return this
     */
    ref public Matrix3d mulComponentWise(Matrix3d other) return {
        mulComponentWise(other, this);
        return this;
    }

    public Matrix3d mulComponentWise(Matrix3d other, ref Matrix3d dest) {
        dest.m00 = m00 * other.m00;
        dest.m01 = m01 * other.m01;
        dest.m02 = m02 * other.m02;
        dest.m10 = m10 * other.m10;
        dest.m11 = m11 * other.m11;
        dest.m12 = m12 * other.m12;
        dest.m20 = m20 * other.m20;
        dest.m21 = m21 * other.m21;
        dest.m22 = m22 * other.m22;
        return dest;
    }

    /**
     * Set this matrix to a skew-symmetric matrix using the following layout:
     * <pre>
     *  0,  a, -b
     * -a,  0,  c
     *  b, -c,  0
     * </pre>
     * 
     * Reference: <a href="https://en.wikipedia.org/wiki/Skew-symmetric_matrix">https://en.wikipedia.org</a>
     * 
     * @param a
     *          the value used for the matrix elements m01 and m10
     * @param b
     *          the value used for the matrix elements m02 and m20
     * @param c
     *          the value used for the matrix elements m12 and m21
     * @return this
     */
    ref public Matrix3d setSkewSymmetric(double a, double b, double c) return {
        m00 = m11 = m22 = 0;
        m01 = -a;
        m02 = b;
        m10 = a;
        m12 = -c;
        m20 = -b;
        m21 = c;
        return this;
    }

    /**
     * Linearly interpolate <code>this</code> and <code>other</code> using the given interpolation factor <code>t</code>
     * and store the result in <code>this</code>.
     * <p>
     * If <code>t</code> is <code>0.0</code> then the result is <code>this</code>. If the interpolation factor is <code>1.0</code>
     * then the result is <code>other</code>.
     *
     * @param other
     *          the other matrix
     * @param t
     *          the interpolation factor between 0.0 and 1.0
     * @return this
     */
    ref public Matrix3d lerp(Matrix3d other, double t) return {
        lerp(other, t, this);
        return this;
    }

    public Matrix3d lerp(Matrix3d other, double t, ref Matrix3d dest) {
        dest.m00 = Math.fma(other.m00 - m00, t, m00);
        dest.m01 = Math.fma(other.m01 - m01, t, m01);
        dest.m02 = Math.fma(other.m02 - m02, t, m02);
        dest.m10 = Math.fma(other.m10 - m10, t, m10);
        dest.m11 = Math.fma(other.m11 - m11, t, m11);
        dest.m12 = Math.fma(other.m12 - m12, t, m12);
        dest.m20 = Math.fma(other.m20 - m20, t, m20);
        dest.m21 = Math.fma(other.m21 - m21, t, m21);
        dest.m22 = Math.fma(other.m22 - m22, t, m22);
        return dest;
    }

    /**
     * Apply a model transformation to this matrix for a right-handed coordinate system, 
     * that aligns the local <code>+Z</code> axis with <code>direction</code>
     * and store the result in <code>dest</code>.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>L</code> the lookat matrix,
     * then the new matrix will be <code>M * L</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * L * v</code>,
     * the lookat transformation will be applied first!
     * <p>
     * In order to set the matrix to a rotation transformation without post-multiplying it,
     * use {@link #rotationTowards(Vector3d, Vector3d) rotationTowards()}.
     * <p>
     * This method is equivalent to calling: <code>mul(new Matrix3d().lookAlong(new Vector3d(dir).negate(), up).invert(), dest)</code>
     * 
     * @see #rotateTowards(double, double, double, double, double, double, Matrix3d)
     * @see #rotationTowards(Vector3d, Vector3d)
     * 
     * @param direction
     *              the direction to rotate towards
     * @param up
     *              the model's up vector
     * @param dest
     *              will hold the result
     * @return dest
     */
    public Matrix3d rotateTowards(Vector3d direction, Vector3d up, ref Matrix3d dest) {
        return rotateTowards(direction.x, direction.y, direction.z, up.x, up.y, up.z, dest);
    }

    /**
     * Apply a model transformation to this matrix for a right-handed coordinate system, 
     * that aligns the local <code>+Z</code> axis with <code>direction</code>.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>L</code> the lookat matrix,
     * then the new matrix will be <code>M * L</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * L * v</code>,
     * the lookat transformation will be applied first!
     * <p>
     * In order to set the matrix to a rotation transformation without post-multiplying it,
     * use {@link #rotationTowards(Vector3d, Vector3d) rotationTowards()}.
     * <p>
     * This method is equivalent to calling: <code>mul(new Matrix3d().lookAlong(new Vector3d(dir).negate(), up).invert())</code>
     * 
     * @see #rotateTowards(double, double, double, double, double, double)
     * @see #rotationTowards(Vector3d, Vector3d)
     * 
     * @param direction
     *              the direction to orient towards
     * @param up
     *              the up vector
     * @return this
     */
    ref public Matrix3d rotateTowards(Vector3d direction, Vector3d up) return {
        rotateTowards(direction.x, direction.y, direction.z, up.x, up.y, up.z, this);
        return this;
    }

    /**
     * Apply a model transformation to this matrix for a right-handed coordinate system, 
     * that aligns the local <code>+Z</code> axis with <code>direction</code>.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>L</code> the lookat matrix,
     * then the new matrix will be <code>M * L</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * L * v</code>,
     * the lookat transformation will be applied first!
     * <p>
     * In order to set the matrix to a rotation transformation without post-multiplying it,
     * use {@link #rotationTowards(double, double, double, double, double, double) rotationTowards()}.
     * <p>
     * This method is equivalent to calling: <code>mul(new Matrix3d().lookAlong(-dirX, -dirY, -dirZ, upX, upY, upZ).invert())</code>
     * 
     * @see #rotateTowards(Vector3d, Vector3d)
     * @see #rotationTowards(double, double, double, double, double, double)
     * 
     * @param dirX
     *              the x-coordinate of the direction to rotate towards
     * @param dirY
     *              the y-coordinate of the direction to rotate towards
     * @param dirZ
     *              the z-coordinate of the direction to rotate towards
     * @param upX
     *              the x-coordinate of the up vector
     * @param upY
     *              the y-coordinate of the up vector
     * @param upZ
     *              the z-coordinate of the up vector
     * @return this
     */
    ref public Matrix3d rotateTowards(double dirX, double dirY, double dirZ, double upX, double upY, double upZ) return {
        rotateTowards(dirX, dirY, dirZ, upX, upY, upZ, this);
        return this;
    }

    /**
     * Apply a model transformation to this matrix for a right-handed coordinate system, 
     * that aligns the local <code>+Z</code> axis with <code>dir</code>
     * and store the result in <code>dest</code>.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>L</code> the lookat matrix,
     * then the new matrix will be <code>M * L</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * L * v</code>,
     * the lookat transformation will be applied first!
     * <p>
     * In order to set the matrix to a rotation transformation without post-multiplying it,
     * use {@link #rotationTowards(double, double, double, double, double, double) rotationTowards()}.
     * <p>
     * This method is equivalent to calling: <code>mul(new Matrix3d().lookAlong(-dirX, -dirY, -dirZ, upX, upY, upZ).invert(), dest)</code>
     * 
     * @see #rotateTowards(Vector3d, Vector3d)
     * @see #rotationTowards(double, double, double, double, double, double)
     * 
     * @param dirX
     *              the x-coordinate of the direction to rotate towards
     * @param dirY
     *              the y-coordinate of the direction to rotate towards
     * @param dirZ
     *              the z-coordinate of the direction to rotate towards
     * @param upX
     *              the x-coordinate of the up vector
     * @param upY
     *              the y-coordinate of the up vector
     * @param upZ
     *              the z-coordinate of the up vector
     * @param dest
     *              will hold the result
     * @return dest
     */
    public Matrix3d rotateTowards(double dirX, double dirY, double dirZ, double upX, double upY, double upZ, ref Matrix3d dest) {
        // Normalize direction
        double invDirLength = Math.invsqrt(dirX * dirX + dirY * dirY + dirZ * dirZ);
        double ndirX = dirX * invDirLength;
        double ndirY = dirY * invDirLength;
        double ndirZ = dirZ * invDirLength;
        // left = up x direction
        double leftX, leftY, leftZ;
        leftX = upY * ndirZ - upZ * ndirY;
        leftY = upZ * ndirX - upX * ndirZ;
        leftZ = upX * ndirY - upY * ndirX;
        // normalize left
        double invLeftLength = Math.invsqrt(leftX * leftX + leftY * leftY + leftZ * leftZ);
        leftX *= invLeftLength;
        leftY *= invLeftLength;
        leftZ *= invLeftLength;
        // up = direction x left
        double upnX = ndirY * leftZ - ndirZ * leftY;
        double upnY = ndirZ * leftX - ndirX * leftZ;
        double upnZ = ndirX * leftY - ndirY * leftX;
        double rm00 = leftX;
        double rm01 = leftY;
        double rm02 = leftZ;
        double rm10 = upnX;
        double rm11 = upnY;
        double rm12 = upnZ;
        double rm20 = ndirX;
        double rm21 = ndirY;
        double rm22 = ndirZ;
        double nm00 = m00 * rm00 + m10 * rm01 + m20 * rm02;
        double nm01 = m01 * rm00 + m11 * rm01 + m21 * rm02;
        double nm02 = m02 * rm00 + m12 * rm01 + m22 * rm02;
        double nm10 = m00 * rm10 + m10 * rm11 + m20 * rm12;
        double nm11 = m01 * rm10 + m11 * rm11 + m21 * rm12;
        double nm12 = m02 * rm10 + m12 * rm11 + m22 * rm12;
        dest.m20 = m00 * rm20 + m10 * rm21 + m20 * rm22;
        dest.m21 = m01 * rm20 + m11 * rm21 + m21 * rm22;
        dest.m22 = m02 * rm20 + m12 * rm21 + m22 * rm22;
        dest.m00 = nm00;
        dest.m01 = nm01;
        dest.m02 = nm02;
        dest.m10 = nm10;
        dest.m11 = nm11;
        dest.m12 = nm12;
        return dest;
    }

    /**
     * Set this matrix to a model transformation for a right-handed coordinate system, 
     * that aligns the local <code>-z</code> axis with <code>center - eye</code>.
     * <p>
     * In order to apply the rotation transformation to a previous existing transformation,
     * use {@link #rotateTowards(double, double, double, double, double, double) rotateTowards}.
     * <p>
     * This method is equivalent to calling: <code>setLookAlong(new Vector3d(dir).negate(), up).invert()</code>
     * 
     * @see #rotationTowards(Vector3d, Vector3d)
     * @see #rotateTowards(double, double, double, double, double, double)
     * 
     * @param dir
     *              the direction to orient the local -z axis towards
     * @param up
     *              the up vector
     * @return this
     */
    ref public Matrix3d rotationTowards(Vector3d dir, Vector3d up) return {
        return rotationTowards(dir.x, dir.y, dir.z, up.x, up.y, up.z);
    }

    /**
     * Set this matrix to a model transformation for a right-handed coordinate system, 
     * that aligns the local <code>-z</code> axis with <code>center - eye</code>.
     * <p>
     * In order to apply the rotation transformation to a previous existing transformation,
     * use {@link #rotateTowards(double, double, double, double, double, double) rotateTowards}.
     * <p>
     * This method is equivalent to calling: <code>setLookAlong(-dirX, -dirY, -dirZ, upX, upY, upZ).invert()</code>
     * 
     * @see #rotateTowards(Vector3d, Vector3d)
     * @see #rotationTowards(double, double, double, double, double, double)
     * 
     * @param dirX
     *              the x-coordinate of the direction to rotate towards
     * @param dirY
     *              the y-coordinate of the direction to rotate towards
     * @param dirZ
     *              the z-coordinate of the direction to rotate towards
     * @param upX
     *              the x-coordinate of the up vector
     * @param upY
     *              the y-coordinate of the up vector
     * @param upZ
     *              the z-coordinate of the up vector
     * @return this
     */
    ref public Matrix3d rotationTowards(double dirX, double dirY, double dirZ, double upX, double upY, double upZ) return {
        // Normalize direction
        double invDirLength = Math.invsqrt(dirX * dirX + dirY * dirY + dirZ * dirZ);
        double ndirX = dirX * invDirLength;
        double ndirY = dirY * invDirLength;
        double ndirZ = dirZ * invDirLength;
        // left = up x direction
        double leftX, leftY, leftZ;
        leftX = upY * ndirZ - upZ * ndirY;
        leftY = upZ * ndirX - upX * ndirZ;
        leftZ = upX * ndirY - upY * ndirX;
        // normalize left
        double invLeftLength = Math.invsqrt(leftX * leftX + leftY * leftY + leftZ * leftZ);
        leftX *= invLeftLength;
        leftY *= invLeftLength;
        leftZ *= invLeftLength;
        // up = direction x left
        double upnX = ndirY * leftZ - ndirZ * leftY;
        double upnY = ndirZ * leftX - ndirX * leftZ;
        double upnZ = ndirX * leftY - ndirY * leftX;
        this.m00 = leftX;
        this.m01 = leftY;
        this.m02 = leftZ;
        this.m10 = upnX;
        this.m11 = upnY;
        this.m12 = upnZ;
        this.m20 = ndirX;
        this.m21 = ndirY;
        this.m22 = ndirZ;
        return this;
    }

    public Vector3d getEulerAnglesZYX(ref Vector3d dest) {
        dest.x = Math.atan2(m12, m22);
        dest.y = Math.atan2(-m02, Math.sqrt(1.0 - m02 * m02));
        dest.z = Math.atan2(m01, m00);
        return dest;
    }

    public Vector3d getEulerAnglesXYZ(ref Vector3d dest) {
        dest.x = Math.atan2(-m21, m22);
        dest.y = Math.atan2(m20, Math.sqrt(1.0 - m20 * m20));
        dest.z = Math.atan2(-m10, m00);
        return dest;
    }

    /**
     * Apply an oblique projection transformation to this matrix with the given values for <code>a</code> and
     * <code>b</code>.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>O</code> the oblique transformation matrix,
     * then the new matrix will be <code>M * O</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * O * v</code>, the
     * oblique transformation will be applied first!
     * <p>
     * The oblique transformation is defined as:
     * <pre>
     * x' = x + a*z
     * y' = y + a*z
     * z' = z
     * </pre>
     * or in matrix form:
     * <pre>
     * 1 0 a
     * 0 1 b
     * 0 0 1
     * </pre>
     * 
     * @param a
     *            the value for the z factor that applies to x
     * @param b
     *            the value for the z factor that applies to y
     * @return this
     */
    ref public Matrix3d obliqueZ(double a, double b) return {
        this.m20 = m00 * a + m10 * b + m20;
        this.m21 = m01 * a + m11 * b + m21;
        this.m22 = m02 * a + m12 * b + m22;
        return this;
    }

    /**
     * Apply an oblique projection transformation to this matrix with the given values for <code>a</code> and
     * <code>b</code> and store the result in <code>dest</code>.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>O</code> the oblique transformation matrix,
     * then the new matrix will be <code>M * O</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * O * v</code>, the
     * oblique transformation will be applied first!
     * <p>
     * The oblique transformation is defined as:
     * <pre>
     * x' = x + a*z
     * y' = y + a*z
     * z' = z
     * </pre>
     * or in matrix form:
     * <pre>
     * 1 0 a
     * 0 1 b
     * 0 0 1
     * </pre>
     * 
     * @param a
     *            the value for the z factor that applies to x
     * @param b
     *            the value for the z factor that applies to y
     * @param dest
     *            will hold the result
     * @return dest
     */
    public Matrix3d obliqueZ(double a, double b, ref Matrix3d dest) {
        dest.m00 = m00;
        dest.m01 = m01;
        dest.m02 = m02;
        dest.m10 = m10;
        dest.m11 = m11;
        dest.m12 = m12;
        dest.m20 = m00 * a + m10 * b + m20;
        dest.m21 = m01 * a + m11 * b + m21;
        dest.m22 = m02 * a + m12 * b + m22;
        return dest;
    }

    public Matrix3d reflect(double nx, double ny, double nz, ref Matrix3d dest) {
        double da = nx + nx, db = ny + ny, d = nz + nz;
        double rm00 = 1.0 - da * nx;
        double rm01 = -da * ny;
        double rm02 = -da * nz;
        double rm10 = -db * nx;
        double rm11 = 1.0 - db * ny;
        double rm12 = -db * nz;
        double rm20 = -d * nx;
        double rm21 = -d * ny;
        double rm22 = 1.0 - d * nz;
        double nm00 = m00 * rm00 + m10 * rm01 + m20 * rm02;
        double nm01 = m01 * rm00 + m11 * rm01 + m21 * rm02;
        double nm02 = m02 * rm00 + m12 * rm01 + m22 * rm02;
        double nm10 = m00 * rm10 + m10 * rm11 + m20 * rm12;
        double nm11 = m01 * rm10 + m11 * rm11 + m21 * rm12;
        double nm12 = m02 * rm10 + m12 * rm11 + m22 * rm12;
        return dest
        ._m20(m00 * rm20 + m10 * rm21 + m20 * rm22)
        ._m21(m01 * rm20 + m11 * rm21 + m21 * rm22)
        ._m22(m02 * rm20 + m12 * rm21 + m22 * rm22)
        ._m00(nm00)
        ._m01(nm01)
        ._m02(nm02)
        ._m10(nm10)
        ._m11(nm11)
        ._m12(nm12);
    }

    /**
     * Apply a mirror/reflection transformation to this matrix that reflects through the given plane
     * specified via the plane normal.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the reflection matrix,
     * then the new matrix will be <code>M * R</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * R * v</code>, the
     * reflection will be applied first!
     * 
     * @param nx
     *          the x-coordinate of the plane normal
     * @param ny
     *          the y-coordinate of the plane normal
     * @param nz
     *          the z-coordinate of the plane normal
     * @return this
     */
    ref public Matrix3d reflect(double nx, double ny, double nz) return {
        reflect(nx, ny, nz, this);
        return this;
    }

    /**
     * Apply a mirror/reflection transformation to this matrix that reflects through the given plane
     * specified via the plane normal.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the reflection matrix,
     * then the new matrix will be <code>M * R</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * R * v</code>, the
     * reflection will be applied first!
     * 
     * @param normal
     *          the plane normal
     * @return this
     */
    ref public Matrix3d reflect(Vector3d normal) return {
        return reflect(normal.x, normal.y, normal.z);
    }

    /**
     * Apply a mirror/reflection transformation to this matrix that reflects about a plane
     * specified via the plane orientation.
     * <p>
     * This method can be used to build a reflection transformation based on the orientation of a mirror object in the scene.
     * It is assumed that the default mirror plane's normal is <code>(0, 0, 1)</code>. So, if the given {@link Quaterniond} is
     * the identity (does not apply any additional rotation), the reflection plane will be <code>z=0</code>.
     * <p>
     * If <code>M</code> is <code>this</code> matrix and <code>R</code> the reflection matrix,
     * then the new matrix will be <code>M * R</code>. So when transforming a
     * vector <code>v</code> with the new matrix by using <code>M * R * v</code>, the
     * reflection will be applied first!
     * 
     * @param orientation
     *          the plane orientation
     * @return this
     */
    ref public Matrix3d reflect(Quaterniond orientation) return {
        reflect(orientation, this);
        return this;
    }

    public Matrix3d reflect(Quaterniond orientation, ref Matrix3d dest) {
        double num1 = orientation.x + orientation.x;
        double num2 = orientation.y + orientation.y;
        double num3 = orientation.z + orientation.z;
        double normalX = cast(double) (orientation.x * num3 + orientation.w * num2);
        double normalY = cast(double) (orientation.y * num3 - orientation.w * num1);
        double normalZ = cast(double) (1.0 - (orientation.x * num1 + orientation.y * num2));
        return reflect(normalX, normalY, normalZ, dest);
    }

    public Matrix3d reflect(Vector3d normal, ref Matrix3d dest) {
        return reflect(normal.x, normal.y, normal.z, dest);
    }

    /**
     * Set this matrix to a mirror/reflection transformation that reflects through the given plane
     * specified via the plane normal.
     * 
     * @param nx
     *          the x-coordinate of the plane normal
     * @param ny
     *          the y-coordinate of the plane normal
     * @param nz
     *          the z-coordinate of the plane normal
     * @return this
     */
    ref public Matrix3d reflection(double nx, double ny, double nz) return {
        double da = nx + nx, db = ny + ny, d = nz + nz;
        this._m00(1.0 - da * nx);
        this._m01(-da * ny);
        this._m02(-da * nz);
        this._m10(-db * nx);
        this._m11(1.0 - db * ny);
        this._m12(-db * nz);
        this._m20(-d * nx);
        this._m21(-d * ny);
        this._m22(1.0 - d * nz);
        return this;
    }

    /**
     * Set this matrix to a mirror/reflection transformation that reflects through the given plane
     * specified via the plane normal.
     * 
     * @param normal
     *          the plane normal
     * @return this
     */
    ref public Matrix3d reflection(Vector3d normal) return {
        return reflection(normal.x, normal.y, normal.z);
    }

    /**
     * Set this matrix to a mirror/reflection transformation that reflects through a plane
     * specified via the plane orientation.
     * <p>
     * This method can be used to build a reflection transformation based on the orientation of a mirror object in the scene.
     * It is assumed that the default mirror plane's normal is <code>(0, 0, 1)</code>. So, if the given {@link Quaterniond} is
     * the identity (does not apply any additional rotation), the reflection plane will be <code>z=0</code>, offset by the given <code>point</code>.
     * 
     * @param orientation
     *          the plane orientation
     * @return this
     */
    ref public Matrix3d reflection(Quaterniond orientation) return {
        double num1 = orientation.x + orientation.x;
        double num2 = orientation.y + orientation.y;
        double num3 = orientation.z + orientation.z;
        double normalX = orientation.x * num3 + orientation.w * num2;
        double normalY = orientation.y * num3 - orientation.w * num1;
        double normalZ = 1.0 - (orientation.x * num1 + orientation.y * num2);
        return reflection(normalX, normalY, normalZ);
    }

    public bool isFinite() {
        return Math.isFinite(m00) && Math.isFinite(m01) && Math.isFinite(m02) &&
               Math.isFinite(m10) && Math.isFinite(m11) && Math.isFinite(m12) &&
               Math.isFinite(m20) && Math.isFinite(m21) && Math.isFinite(m22);
    }

    public double quadraticFormProduct(double x, double y, double z) {
        double Axx = m00 * x + m10 * y + m20 * z;
        double Axy = m01 * x + m11 * y + m21 * z;
        double Axz = m02 * x + m12 * y + m22 * z;
        return x * Axx + y * Axy + z * Axz; 
    }

    public double quadraticFormProduct(Vector3d v) {
        return quadraticFormProduct(v.x, v.y, v.z); 
    }

    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 1 0 0
     * 0 0 1
     * 0 1 0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapXZy() return {
        mapXZY(this);
        return this;
    }
    public Matrix3d mapXZY(ref Matrix3d dest) {
        double __m10 = this.m10, __m11 = this.m11, __m12 = this.m12;
        return dest._m00(m00)._m01(m01)._m02(m02)._m10(m20)._m11(m21)._m12(m22)._m20(__m10)._m21(__m11)._m22(__m12);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 1 0  0
     * 0 0 -1
     * 0 1  0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapXZny() return {
        mapXZnY(this);
        return this;
    }
    public Matrix3d mapXZnY(ref Matrix3d dest) {
        double __m10 = this.m10, __m11 = this.m11, __m12 = this.m12;
        return dest._m00(m00)._m01(m01)._m02(m02)._m10(m20)._m11(m21)._m12(m22)._m20(-__m10)._m21(-__m11)._m22(-__m12);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 1  0  0
     * 0 -1  0
     * 0  0 -1
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapXnYnz() return {
        mapXnYnZ(this);
        return this;
    }
    public Matrix3d mapXnYnZ(ref Matrix3d dest) {
        return dest._m00(m00)._m01(m01)._m02(m02)._m10(-m10)._m11(-m11)._m12(-m12)._m20(-m20)._m21(-m21)._m22(-m22);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 1  0 0
     * 0  0 1
     * 0 -1 0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapXnZy() return {
        mapXnZY(this);
        return this;
    }
    public Matrix3d mapXnZY(ref Matrix3d dest) {
        double __m10 = this.m10, __m11 = this.m11, __m12 = this.m12;
        return dest._m00(m00)._m01(m01)._m02(m02)._m10(-m20)._m11(-m21)._m12(-m22)._m20(__m10)._m21(__m11)._m22(__m12);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 1  0  0
     * 0  0 -1
     * 0 -1  0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapXnZny() return {
        mapXnZnY(this);
        return this;
    }
    public Matrix3d mapXnZnY(ref Matrix3d dest) {
        double __m10 = this.m10, __m11 = this.m11, __m12 = this.m12;
        return dest._m00(m00)._m01(m01)._m02(m02)._m10(-m20)._m11(-m21)._m12(-m22)._m20(-__m10)._m21(-__m11)._m22(-__m12);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 0 1 0
     * 1 0 0
     * 0 0 1
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapYXz() return {
        mapYXZ(this);
        return this;
    }
    public Matrix3d mapYXZ(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(m10)._m01(m11)._m02(m12)._m10(__m00)._m11(__m01)._m12(__m02)._m20(m20)._m21(m21)._m22(m22);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 0 1  0
     * 1 0  0
     * 0 0 -1
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapYXnz() return {
        mapYXnZ(this);
        return this;
    }
    public Matrix3d mapYXnZ(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(m10)._m01(m11)._m02(m12)._m10(__m00)._m11(__m01)._m12(__m02)._m20(-m20)._m21(-m21)._m22(-m22);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 0 0 1
     * 1 0 0
     * 0 1 0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapYZx() return {
        mapYZX(this);
        return this;
    }
    public Matrix3d mapYZX(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(m10)._m01(m11)._m02(m12)._m10(m20)._m11(m21)._m12(m22)._m20(__m00)._m21(__m01)._m22(__m02);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 0 0 -1
     * 1 0  0
     * 0 1  0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapYZnx() return {
        mapYZnX(this);
        return this;
    }
    public Matrix3d mapYZnX(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(m10)._m01(m11)._m02(m12)._m10(m20)._m11(m21)._m12(m22)._m20(-__m00)._m21(-__m01)._m22(-__m02);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 0 -1 0
     * 1  0 0
     * 0  0 1
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapYnXz() return {
        mapYnXZ(this);
        return this;
    }
    public Matrix3d mapYnXZ(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(m10)._m01(m11)._m02(m12)._m10(-__m00)._m11(-__m01)._m12(-__m02)._m20(m20)._m21(m21)._m22(m22);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 0 -1  0
     * 1  0  0
     * 0  0 -1
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapYnXnz() return {
        mapYnXnZ(this);
        return this;
    }
    public Matrix3d mapYnXnZ(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(m10)._m01(m11)._m02(m12)._m10(-__m00)._m11(-__m01)._m12(-__m02)._m20(-m20)._m21(-m21)._m22(-m22);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 0  0 1
     * 1  0 0
     * 0 -1 0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapYnZx() return {
        mapYnZX(this);
        return this;
    }
    public Matrix3d mapYnZX(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(m10)._m01(m11)._m02(m12)._m10(-m20)._m11(-m21)._m12(-m22)._m20(__m00)._m21(__m01)._m22(__m02);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 0  0 -1
     * 1  0  0
     * 0 -1  0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapYnZnx() return {
        mapYnZnX(this);
        return this;
    }
    public Matrix3d mapYnZnX(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(m10)._m01(m11)._m02(m12)._m10(-m20)._m11(-m21)._m12(-m22)._m20(-__m00)._m21(-__m01)._m22(-__m02);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 0 1 0
     * 0 0 1
     * 1 0 0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapZXy() return {
        mapZXY(this);
        return this;
    }
    public Matrix3d mapZXY(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        double __m10 = this.m10, __m11 = this.m11, __m12 = this.m12;
        return dest._m00(m20)._m01(m21)._m02(m22)._m10(__m00)._m11(__m01)._m12(__m02)._m20(__m10)._m21(__m11)._m22(__m12);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 0 1  0
     * 0 0 -1
     * 1 0  0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapZXny() return {
        mapZXnY(this);
        return this;
    }
    public Matrix3d mapZXnY(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        double __m10 = this.m10, __m11 = this.m11, __m12 = this.m12;
        return dest._m00(m20)._m01(m21)._m02(m22)._m10(__m00)._m11(__m01)._m12(__m02)._m20(-__m10)._m21(-__m11)._m22(-__m12);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 0 0 1
     * 0 1 0
     * 1 0 0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapZYx() return {
        mapZYX(this);
        return this;
    }
    public Matrix3d mapZYX(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(m20)._m01(m21)._m02(m22)._m10(m10)._m11(m11)._m12(m12)._m20(__m00)._m21(__m01)._m22(__m02);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 0 0 -1
     * 0 1  0
     * 1 0  0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapZYnx() return {
        mapZYnX(this);
        return this;
    }
    public Matrix3d mapZYnX(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(m20)._m01(m21)._m02(m22)._m10(m10)._m11(m11)._m12(m12)._m20(-__m00)._m21(-__m01)._m22(-__m02);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 0 -1 0
     * 0  0 1
     * 1  0 0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapZnXy() return {
        mapZnXY(this);
        return this;
    }
    public Matrix3d mapZnXY(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        double __m10 = this.m10, __m11 = this.m11, __m12 = this.m12;
        return dest._m00(m20)._m01(m21)._m02(m22)._m10(-__m00)._m11(-__m01)._m12(-__m02)._m20(__m10)._m21(__m11)._m22(__m12);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 0 -1  0
     * 0  0 -1
     * 1  0  0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapZnXny() return {
        mapZnXnY(this);
        return this;
    }
    public Matrix3d mapZnXnY(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        double __m10 = this.m10, __m11 = this.m11, __m12 = this.m12;
        return dest._m00(m20)._m01(m21)._m02(m22)._m10(-__m00)._m11(-__m01)._m12(-__m02)._m20(-__m10)._m21(-__m11)._m22(-__m12);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 0  0 1
     * 0 -1 0
     * 1  0 0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapZnYx() return {
        mapZnYX(this);
        return this;
    }
    public Matrix3d mapZnYX(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(m20)._m01(m21)._m02(m22)._m10(-m10)._m11(-m11)._m12(-m12)._m20(__m00)._m21(__m01)._m22(__m02);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 0  0 -1
     * 0 -1  0
     * 1  0  0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapZnYnx() return {
        mapZnYnX(this);
        return this;
    }
    public Matrix3d mapZnYnX(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(m20)._m01(m21)._m02(m22)._m10(-m10)._m11(-m11)._m12(-m12)._m20(-__m00)._m21(-__m01)._m22(-__m02);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * -1 0  0
     *  0 1  0
     *  0 0 -1
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnXYnz() return {
        mapnXYnZ(this);
        return this;
    }
    public Matrix3d mapnXYnZ(ref Matrix3d dest) {
        return dest._m00(-m00)._m01(-m01)._m02(-m02)._m10(m10)._m11(m11)._m12(m12)._m20(-m20)._m21(-m21)._m22(-m22);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * -1 0 0
     *  0 0 1
     *  0 1 0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnXZy() return {
        mapnXZY(this);
        return this;
    }
    public Matrix3d mapnXZY(ref Matrix3d dest) {
        double __m10 = this.m10, __m11 = this.m11, __m12 = this.m12;
        return dest._m00(-m00)._m01(-m01)._m02(-m02)._m10(m20)._m11(m21)._m12(m22)._m20(__m10)._m21(__m11)._m22(__m12);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * -1 0  0
     *  0 0 -1
     *  0 1  0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnXZny() return {
        mapnXZnY(this);
        return this;
    }
    public Matrix3d mapnXZnY(ref Matrix3d dest) {
        double __m10 = this.m10, __m11 = this.m11, __m12 = this.m12;
        return dest._m00(-m00)._m01(-m01)._m02(-m02)._m10(m20)._m11(m21)._m12(m22)._m20(-__m10)._m21(-__m11)._m22(-__m12);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * -1  0 0
     *  0 -1 0
     *  0  0 1
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnXnYz() return {
        mapnXnYZ(this);
        return this;
    }
    public Matrix3d mapnXnYZ(ref Matrix3d dest) {
        return dest._m00(-m00)._m01(-m01)._m02(-m02)._m10(-m10)._m11(-m11)._m12(-m12)._m20(m20)._m21(m21)._m22(m22);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * -1  0  0
     *  0 -1  0
     *  0  0 -1
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnXnYnz() return {
        mapnXnYnZ(this);
        return this;
    }
    public Matrix3d mapnXnYnZ(ref Matrix3d dest) {
        return dest._m00(-m00)._m01(-m01)._m02(-m02)._m10(-m10)._m11(-m11)._m12(-m12)._m20(-m20)._m21(-m21)._m22(-m22);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * -1  0 0
     *  0  0 1
     *  0 -1 0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnXnZy() return {
        mapnXnZY(this);
        return this;
    }
    public Matrix3d mapnXnZY(ref Matrix3d dest) {
        double __m10 = this.m10, __m11 = this.m11, __m12 = this.m12;
        return dest._m00(-m00)._m01(-m01)._m02(-m02)._m10(-m20)._m11(-m21)._m12(-m22)._m20(__m10)._m21(__m11)._m22(__m12);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * -1  0  0
     *  0  0 -1
     *  0 -1  0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnXnZny() return {
        mapnXnZnY(this);
        return this;
    }
    public Matrix3d mapnXnZnY(ref Matrix3d dest) {
        double __m10 = this.m10, __m11 = this.m11, __m12 = this.m12;
        return dest._m00(-m00)._m01(-m01)._m02(-m02)._m10(-m20)._m11(-m21)._m12(-m22)._m20(-__m10)._m21(-__m11)._m22(-__m12);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     *  0 1 0
     * -1 0 0
     *  0 0 1
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnYXz() return {
        mapnYXZ(this);
        return this;
    }
    public Matrix3d mapnYXZ(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(-m10)._m01(-m11)._m02(-m12)._m10(__m00)._m11(__m01)._m12(__m02)._m20(m20)._m21(m21)._m22(m22);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     *  0 1  0
     * -1 0  0
     *  0 0 -1
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnYXnz() return {
        mapnYXnZ(this);
        return this;
    }
    public Matrix3d mapnYXnZ(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(-m10)._m01(-m11)._m02(-m12)._m10(__m00)._m11(__m01)._m12(__m02)._m20(-m20)._m21(-m21)._m22(-m22);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     *  0 0 1
     * -1 0 0
     *  0 1 0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnYZx() return {
        mapnYZX(this);
        return this;
    }
    public Matrix3d mapnYZX(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(-m10)._m01(-m11)._m02(-m12)._m10(m20)._m11(m21)._m12(m22)._m20(__m00)._m21(__m01)._m22(__m02);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     *  0 0 -1
     * -1 0  0
     *  0 1  0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnYZnx() return {
        mapnYZnX(this);
        return this;
    }
    public Matrix3d mapnYZnX(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(-m10)._m01(-m11)._m02(-m12)._m10(m20)._m11(m21)._m12(m22)._m20(-__m00)._m21(-__m01)._m22(-__m02);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     *  0 -1 0
     * -1  0 0
     *  0  0 1
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnYnXz() return {
        mapnYnXZ(this);
        return this;
    }
    public Matrix3d mapnYnXZ(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(-m10)._m01(-m11)._m02(-m12)._m10(-__m00)._m11(-__m01)._m12(-__m02)._m20(m20)._m21(m21)._m22(m22);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     *  0 -1  0
     * -1  0  0
     *  0  0 -1
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnYnXnz() return {
        mapnYnXnZ(this);
        return this;
    }
    public Matrix3d mapnYnXnZ(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(-m10)._m01(-m11)._m02(-m12)._m10(-__m00)._m11(-__m01)._m12(-__m02)._m20(-m20)._m21(-m21)._m22(-m22);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     *  0  0 1
     * -1  0 0
     *  0 -1 0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnYnZx() return {
        mapnYnZX(this);
        return this;
    }
    public Matrix3d mapnYnZX(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(-m10)._m01(-m11)._m02(-m12)._m10(-m20)._m11(-m21)._m12(-m22)._m20(__m00)._m21(__m01)._m22(__m02);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     *  0  0 -1
     * -1  0  0
     *  0 -1  0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnYnZnx() return {
        mapnYnZnX(this);
        return this;
    }
    public Matrix3d mapnYnZnX(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(-m10)._m01(-m11)._m02(-m12)._m10(-m20)._m11(-m21)._m12(-m22)._m20(-__m00)._m21(-__m01)._m22(-__m02);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     *  0 1 0
     *  0 0 1
     * -1 0 0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnZXy() return {
        mapnZXY(this);
        return this;
    }
    public Matrix3d mapnZXY(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        double __m10 = this.m10, __m11 = this.m11, __m12 = this.m12;
        return dest._m00(-m20)._m01(-m21)._m02(-m22)._m10(__m00)._m11(__m01)._m12(__m02)._m20(__m10)._m21(__m11)._m22(__m12);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     *  0 1  0
     *  0 0 -1
     * -1 0  0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnZXny() return {
        mapnZXnY(this);
        return this;
    }
    public Matrix3d mapnZXnY(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        double __m10 = this.m10, __m11 = this.m11, __m12 = this.m12;
        return dest._m00(-m20)._m01(-m21)._m02(-m22)._m10(__m00)._m11(__m01)._m12(__m02)._m20(-__m10)._m21(-__m11)._m22(-__m12);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     *  0 0 1
     *  0 1 0
     * -1 0 0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnZYx() return {
        mapnZYX(this);
        return this;
    }
    public Matrix3d mapnZYX(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(-m20)._m01(-m21)._m02(-m22)._m10(m10)._m11(m11)._m12(m12)._m20(__m00)._m21(__m01)._m22(__m02);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     *  0 0 -1
     *  0 1  0
     * -1 0  0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnZYnx() return {
        mapnZYnX(this);
        return this;
    }
    public Matrix3d mapnZYnX(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(-m20)._m01(-m21)._m02(-m22)._m10(m10)._m11(m11)._m12(m12)._m20(-__m00)._m21(-__m01)._m22(-__m02);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     *  0 -1 0
     *  0  0 1
     * -1  0 0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnZnXy() return {
        mapnZnXY(this);
        return this;
    }
    public Matrix3d mapnZnXY(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        double __m10 = this.m10, __m11 = this.m11, __m12 = this.m12;
        return dest._m00(-m20)._m01(-m21)._m02(-m22)._m10(-__m00)._m11(-__m01)._m12(-__m02)._m20(__m10)._m21(__m11)._m22(__m12);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     *  0 -1  0
     *  0  0 -1
     * -1  0  0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnZnXny() return {
        mapnZnXnY(this);
        return this;
    }
    public Matrix3d mapnZnXnY(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        double __m10 = this.m10, __m11 = this.m11, __m12 = this.m12;
        return dest._m00(-m20)._m01(-m21)._m02(-m22)._m10(-__m00)._m11(-__m01)._m12(-__m02)._m20(-__m10)._m21(-__m11)._m22(-__m12);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     *  0  0 1
     *  0 -1 0
     * -1  0 0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnZnYx() return {
        mapnZnYX(this);
        return this;
    }
    public Matrix3d mapnZnYX(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(-m20)._m01(-m21)._m02(-m22)._m10(-m10)._m11(-m11)._m12(-m12)._m20(__m00)._m21(__m01)._m22(__m02);
    }
    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     *  0  0 -1
     *  0 -1  0
     * -1  0  0
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d mapnZnYnx() return {
        mapnZnYnX(this);
        return this;
    }
    public Matrix3d mapnZnYnX(ref Matrix3d dest) {
        double __m00 = this.m00, __m01 = this.m01, __m02 = this.m02;
        return dest._m00(-m20)._m01(-m21)._m02(-m22)._m10(-m10)._m11(-m11)._m12(-m12)._m20(-__m00)._m21(-__m01)._m22(-__m02);
    }

    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * -1 0 0
     *  0 1 0
     *  0 0 1
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d negatex() return {
        return _m00(-m00)._m01(-m01)._m02(-m02);
    }
    public Matrix3d negateX(ref Matrix3d dest) {
        return dest._m00(-m00)._m01(-m01)._m02(-m02)._m10(m10)._m11(m11)._m12(m12)._m20(m20)._m21(m21)._m22(m22);
    }

    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 1  0 0
     * 0 -1 0
     * 0  0 1
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d negatey() return {
        return _m10(-m10)._m11(-m11)._m12(-m12);
    }
    public Matrix3d negateY(ref Matrix3d dest) {
        return dest._m00(m00)._m01(m01)._m02(m02)._m10(-m10)._m11(-m11)._m12(-m12)._m20(m20)._m21(m21)._m22(m22);
    }

    /**
     * Multiply <code>this</code> by the matrix
     * <pre>
     * 1 0  0
     * 0 1  0
     * 0 0 -1
     * </pre>
     * 
     * @return this
     */
    ref public Matrix3d negatez() return {
        return _m20(-m20)._m21(-m21)._m22(-m22);
    }
    public Matrix3d negateZ(ref Matrix3d dest) {
        return dest._m00(m00)._m01(m01)._m02(m02)._m10(m10)._m11(m11)._m12(m12)._m20(-m20)._m21(-m21)._m22(-m22);
    }
}
