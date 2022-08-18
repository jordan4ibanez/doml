module mem_util;

/*
* The MIT License
*
* Copyright (c) 2016-2021 Kai Burjack
%$%% Translated by jordan4ibanez
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
* Helper class to do efficient memory operations on all DOML objects, NIO buffers and primitive arrays.
* This class is used internally throughout DOML, is undocumented and is subject to change.
* Use with extreme caution!
* 
* @author The LWJGL authors
* @author Kai Burjack
*/

public static final MemUtil INSTANCE = createInstance();

    public float get(Matrix4f m, int column, int row) {
        switch (column) {
        case 0:
            switch (row) {
            case 0:
                return m.m00();
            case 1:
                return m.m01();
            case 2:
                return m.m02();
            case 3:
                return m.m03();
            default:
                break;
            }
            break;
        case 1:
            switch (row) {
            case 0:
                return m.m10();
            case 1:
                return m.m11();
            case 2:
                return m.m12();
            case 3:
                return m.m13();
            default:
                break;
            }
            break;
        case 2:
            switch (row) {
            case 0:
                return m.m20();
            case 1:
                return m.m21();
            case 2:
                return m.m22();
            case 3:
                return m.m23();
            default:
                break;
            }
            break;
        case 3:
            switch (row) {
            case 0:
                return m.m30();
            case 1:
                return m.m31();
            case 2:
                return m.m32();
            case 3:
                return m.m33();
            default:
                break;
            }
            break;
        default:
            break;
        }
        throw new IllegalArgumentException();
    }

    public Matrix4f set(Matrix4f m, int column, int row, float value) {
        switch (column) {
        case 0:
            switch (row) {
            case 0:
                return m.m00(value);
            case 1:
                return m.m01(value);
            case 2:
                return m.m02(value);
            case 3:
                return m.m03(value);
            default:
                break;
            }
            break;
        case 1:
            switch (row) {
            case 0:
                return m.m10(value);
            case 1:
                return m.m11(value);
            case 2:
                return m.m12(value);
            case 3:
                return m.m13(value);
            default:
                break;
            }
            break;
        case 2:
            switch (row) {
            case 0:
                return m.m20(value);
            case 1:
                return m.m21(value);
            case 2:
                return m.m22(value);
            case 3:
                return m.m23(value);
            default:
                break;
            }
            break;
        case 3:
            switch (row) {
            case 0:
                return m.m30(value);
            case 1:
                return m.m31(value);
            case 2:
                return m.m32(value);
            case 3:
                return m.m33(value);
            default:
                break;
            }
            break;
        default:
            break;
        }
        throw new IllegalArgumentException();
    }

    public double get(Matrix4d m, int column, int row) {
        switch (column) {
        case 0:
            switch (row) {
            case 0:
                return m.m00;
            case 1:
                return m.m01;
            case 2:
                return m.m02;
            case 3:
                return m.m03;
            default:
                break;
            }
            break;
        case 1:
            switch (row) {
            case 0:
                return m.m10;
            case 1:
                return m.m11;
            case 2:
                return m.m12;
            case 3:
                return m.m13;
            default:
                break;
            }
            break;
        case 2:
            switch (row) {
            case 0:
                return m.m20;
            case 1:
                return m.m21;
            case 2:
                return m.m22;
            case 3:
                return m.m23;
            default:
                break;
            }
            break;
        case 3:
            switch (row) {
            case 0:
                return m.m30;
            case 1:
                return m.m31;
            case 2:
                return m.m32;
            case 3:
                return m.m33;
            default:
                break;
            }
            break;
        default:
            break;
        }
        throw new IllegalArgumentException();
    }

    public Matrix4d set(Matrix4d m, int column, int row, double value) {
        switch (column) {
        case 0:
            switch (row) {
            case 0:
                return m.m00(value);
            case 1:
                return m.m01(value);
            case 2:
                return m.m02(value);
            case 3:
                return m.m03(value);
            default:
                break;
            }
            break;
        case 1:
            switch (row) {
            case 0:
                return m.m10(value);
            case 1:
                return m.m11(value);
            case 2:
                return m.m12(value);
            case 3:
                return m.m13(value);
            default:
                break;
            }
            break;
        case 2:
            switch (row) {
            case 0:
                return m.m20(value);
            case 1:
                return m.m21(value);
            case 2:
                return m.m22(value);
            case 3:
                return m.m23(value);
            default:
                break;
            }
            break;
        case 3:
            switch (row) {
            case 0:
                return m.m30(value);
            case 1:
                return m.m31(value);
            case 2:
                return m.m32(value);
            case 3:
                return m.m33(value);
            default:
                break;
            }
            break;
        default:
            break;
        }
        throw new IllegalArgumentException();
    }
    
    public float get(Matrix3f m, int column, int row) {
        switch (column) {
        case 0:
            switch (row) {
            case 0:
                return m.m00;
            case 1:
                return m.m01;
            case 2:
                return m.m02;
            default:
                break;
            }
            break;
        case 1:
            switch (row) {
            case 0:
                return m.m10;
            case 1:
                return m.m11;
            case 2:
                return m.m12;
            default:
                break;
            }
            break;
        case 2:
            switch (row) {
            case 0:
                return m.m20;
            case 1:
                return m.m21;
            case 2:
                return m.m22;
            default:
                break;
            }
            break;
        default:
            break;
        }
        throw new IllegalArgumentException();
    }

    public Matrix3f set(Matrix3f m, int column, int row, float value) {
        switch (column) {
        case 0:
            switch (row) {
            case 0:
                return m.m00(value);
            case 1:
                return m.m01(value);
            case 2:
                return m.m02(value);
            default:
                break;
            }
            break;
        case 1:
            switch (row) {
            case 0:
                return m.m10(value);
            case 1:
                return m.m11(value);
            case 2:
                return m.m12(value);
            default:
                break;
            }
            break;
        case 2:
            switch (row) {
            case 0:
                return m.m20(value);
            case 1:
                return m.m21(value);
            case 2:
                return m.m22(value);
            default:
                break;
            }
            break;
        default:
            break;
        }
        throw new IllegalArgumentException();
    }

    public double get(Matrix3d m, int column, int row) {
        switch (column) {
        case 0:
            switch (row) {
            case 0:
                return m.m00;
            case 1:
                return m.m01;
            case 2:
                return m.m02;
            default:
                break;
            }
            break;
        case 1:
            switch (row) {
            case 0:
                return m.m10;
            case 1:
                return m.m11;
            case 2:
                return m.m12;
            default:
                break;
            }
            break;
        case 2:
            switch (row) {
            case 0:
                return m.m20;
            case 1:
                return m.m21;
            case 2:
                return m.m22;
            default:
                break;
            }
            break;
        default:
            break;
        }
        throw new IllegalArgumentException();
    }

    public Matrix3d set(Matrix3d m, int column, int row, double value) {
        switch (column) {
        case 0:
            switch (row) {
            case 0:
                return m.m00(value);
            case 1:
                return m.m01(value);
            case 2:
                return m.m02(value);
            default:
                break;
            }
            break;
        case 1:
            switch (row) {
            case 0:
                return m.m10(value);
            case 1:
                return m.m11(value);
            case 2:
                return m.m12(value);
            default:
                break;
            }
            break;
        case 2:
            switch (row) {
            case 0:
                return m.m20(value);
            case 1:
                return m.m21(value);
            case 2:
                return m.m22(value);
            default:
                break;
            }
            break;
        default:
            break;
        }
        throw new IllegalArgumentException();
    }

    public Vector4f getColumn(Matrix4f m, int column, Vector4f dest) {
        switch (column) {
        case 0:
            return dest.set(m.m00(), m.m01(), m.m02(), m.m03());
        case 1:
            return dest.set(m.m10(), m.m11(), m.m12(), m.m13());
        case 2:
            return dest.set(m.m20(), m.m21(), m.m22(), m.m23());
        case 3:
            return dest.set(m.m30(), m.m31(), m.m32(), m.m33());
        default:
            throw new IndexOutOfBoundsException();
        }
    }

    public Matrix4f setColumn(Vector4f v, int column, Matrix4f dest) {
        switch (column) {
        case 0:
            return dest._m00(v.x)._m01(v.y)._m02(v.z)._m03(v.w);
        case 1:
            return dest._m10(v.x)._m11(v.y)._m12(v.z)._m13(v.w);
        case 2:
            return dest._m20(v.x)._m21(v.y)._m22(v.z)._m23(v.w);
        case 3:
            return dest._m30(v.x)._m31(v.y)._m32(v.z)._m33(v.w);
        default:
            throw new IndexOutOfBoundsException();
        }
    }

    public Matrix4f setColumn(Vector4fc v, int column, Matrix4f dest) {
        switch (column) {
        case 0:
            return dest._m00(v.x())._m01(v.y())._m02(v.z())._m03(v.w());
        case 1:
            return dest._m10(v.x())._m11(v.y())._m12(v.z())._m13(v.w());
        case 2:
            return dest._m20(v.x())._m21(v.y())._m22(v.z())._m23(v.w());
        case 3:
            return dest._m30(v.x())._m31(v.y())._m32(v.z())._m33(v.w());
        default:
            throw new IndexOutOfBoundsException();
        }
    }

    public void copy(Matrix4f src, Matrix4f dest) {
        dest._m00(src.m00()).
        _m01(src.m01()).
        _m02(src.m02()).
        _m03(src.m03()).
        _m10(src.m10()).
        _m11(src.m11()).
        _m12(src.m12()).
        _m13(src.m13()).
        _m20(src.m20()).
        _m21(src.m21()).
        _m22(src.m22()).
        _m23(src.m23()).
        _m30(src.m30()).
        _m31(src.m31()).
        _m32(src.m32()).
        _m33(src.m33());
    }

    public void copy(Matrix3f src, Matrix4f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m02(src.m02())
        ._m03(0.0f)
        ._m10(src.m10())
        ._m11(src.m11())
        ._m12(src.m12())
        ._m13(0.0f)
        ._m20(src.m20())
        ._m21(src.m21())
        ._m22(src.m22())
        ._m23(0.0f)
        ._m30(0.0f)
        ._m31(0.0f)
        ._m32(0.0f)
        ._m33(1.0f);
    }

    public void copy(Matrix4f src, Matrix3f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m02(src.m02())
        ._m10(src.m10())
        ._m11(src.m11())
        ._m12(src.m12())
        ._m20(src.m20())
        ._m21(src.m21())
        ._m22(src.m22());
    }

    public void copy(Matrix3f src, Matrix4x3f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m02(src.m02())
        ._m10(src.m10())
        ._m11(src.m11())
        ._m12(src.m12())
        ._m20(src.m20())
        ._m21(src.m21())
        ._m22(src.m22())
        ._m30(0.0f)
        ._m31(0.0f)
        ._m32(0.0f);
    }

    public void copy(Matrix3x2f src, Matrix3x2f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m10(src.m10())
        ._m11(src.m11())
        ._m20(src.m20())
        ._m21(src.m21());
    }

    public void copy(Matrix3x2d src, Matrix3x2d dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m10(src.m10())
        ._m11(src.m11())
        ._m20(src.m20())
        ._m21(src.m21());
    }

    public void copy(Matrix2f src, Matrix2f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m10(src.m10())
        ._m11(src.m11());
    }

    public void copy(Matrix2d src, Matrix2d dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m10(src.m10())
        ._m11(src.m11());
    }

    public void copy(Matrix2f src, Matrix3f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m02(0.0f)
        ._m10(src.m10())
        ._m11(src.m11())
        ._m12(0.0f)
        ._m20(0.0f)
        ._m21(0.0f)
        ._m22(1.0f);
    }

    public void copy(Matrix3f src, Matrix2f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m10(src.m10())
        ._m11(src.m11());
    }

    public void copy(Matrix2f src, Matrix3x2f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m10(src.m10())
        ._m11(src.m11())
        ._m20(0.0f)
        ._m21(0.0f);
    }

    public void copy(Matrix3x2f src, Matrix2f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m10(src.m10())
        ._m11(src.m11());
    }

    public void copy(Matrix2d src, Matrix3d dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m02(0.0)
        ._m10(src.m10())
        ._m11(src.m11())
        ._m12(0.0)
        ._m20(0.0)
        ._m21(0.0)
        ._m22(1.0);
    }

    public void copy(Matrix3d src, Matrix2d dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m10(src.m10())
        ._m11(src.m11());
    }

    public void copy(Matrix2d src, Matrix3x2d dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m10(src.m10())
        ._m11(src.m11())
        ._m20(0.0)
        ._m21(0.0);
    }

    public void copy(Matrix3x2d src, Matrix2d dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m10(src.m10())
        ._m11(src.m11());
    }

    public void copy3x3(Matrix4f src, Matrix4f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m02(src.m02())
        ._m10(src.m10())
        ._m11(src.m11())
        ._m12(src.m12())
        ._m20(src.m20())
        ._m21(src.m21())
        ._m22(src.m22());
    }

    public void copy3x3(Matrix4x3f src, Matrix4x3f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m02(src.m02())
        ._m10(src.m10())
        ._m11(src.m11())
        ._m12(src.m12())
        ._m20(src.m20())
        ._m21(src.m21())
        ._m22(src.m22());
    }

    public void copy3x3(Matrix3f src, Matrix4x3f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m02(src.m02())
        ._m10(src.m10())
        ._m11(src.m11())
        ._m12(src.m12())
        ._m20(src.m20())
        ._m21(src.m21())
        ._m22(src.m22());
    }

    public void copy3x3(Matrix3f src, Matrix4f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m02(src.m02())
        ._m10(src.m10())
        ._m11(src.m11())
        ._m12(src.m12())
        ._m20(src.m20())
        ._m21(src.m21())
        ._m22(src.m22());
    }

    public void copy4x3(Matrix4x3f src, Matrix4f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m02(src.m02())
        ._m10(src.m10())
        ._m11(src.m11())
        ._m12(src.m12())
        ._m20(src.m20())
        ._m21(src.m21())
        ._m22(src.m22())
        ._m30(src.m30())
        ._m31(src.m31())
        ._m32(src.m32());
    }

    public void copy4x3(Matrix4f src, Matrix4f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m02(src.m02())
        ._m10(src.m10())
        ._m11(src.m11())
        ._m12(src.m12())
        ._m20(src.m20())
        ._m21(src.m21())
        ._m22(src.m22())
        ._m30(src.m30())
        ._m31(src.m31())
        ._m32(src.m32());
    }

    public void copy(Matrix4f src, Matrix4x3f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m02(src.m02())
        ._m10(src.m10())
        ._m11(src.m11())
        ._m12(src.m12())
        ._m20(src.m20())
        ._m21(src.m21())
        ._m22(src.m22())
        ._m30(src.m30())
        ._m31(src.m31())
        ._m32(src.m32());
    }

    public void copy(Matrix4x3f src, Matrix4f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m02(src.m02())
        ._m03(0.0f)
        ._m10(src.m10())
        ._m11(src.m11())
        ._m12(src.m12())
        ._m13(0.0f)
        ._m20(src.m20())
        ._m21(src.m21())
        ._m22(src.m22())
        ._m23(0.0f)
        ._m30(src.m30())
        ._m31(src.m31())
        ._m32(src.m32())
        ._m33(1.0f);
    }

    public void copy(Matrix4x3f src, Matrix4x3f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m02(src.m02())
        ._m10(src.m10())
        ._m11(src.m11())
        ._m12(src.m12())
        ._m20(src.m20())
        ._m21(src.m21())
        ._m22(src.m22())
        ._m30(src.m30())
        ._m31(src.m31())
        ._m32(src.m32());
    }

    public void copy(Matrix3f src, Matrix3f dest) {
        dest._m00(src.m00())
        ._m01(src.m01())
        ._m02(src.m02())
        ._m10(src.m10())
        ._m11(src.m11())
        ._m12(src.m12())
        ._m20(src.m20())
        ._m21(src.m21())
        ._m22(src.m22());
    }

    public void copy(float[] arr, int off, Matrix4f dest) {
        dest._m00(arr[off+0])
        ._m01(arr[off+1])
        ._m02(arr[off+2])
        ._m03(arr[off+3])
        ._m10(arr[off+4])
        ._m11(arr[off+5])
        ._m12(arr[off+6])
        ._m13(arr[off+7])
        ._m20(arr[off+8])
        ._m21(arr[off+9])
        ._m22(arr[off+10])
        ._m23(arr[off+11])
        ._m30(arr[off+12])
        ._m31(arr[off+13])
        ._m32(arr[off+14])
        ._m33(arr[off+15]);
    }

    public void copyTransposed(float[] arr, int off, Matrix4f dest) {
        dest._m00(arr[off+0])
        ._m10(arr[off+1])
        ._m20(arr[off+2])
        ._m30(arr[off+3])
        ._m01(arr[off+4])
        ._m11(arr[off+5])
        ._m21(arr[off+6])
        ._m31(arr[off+7])
        ._m02(arr[off+8])
        ._m12(arr[off+9])
        ._m22(arr[off+10])
        ._m32(arr[off+11])
        ._m03(arr[off+12])
        ._m13(arr[off+13])
        ._m23(arr[off+14])
        ._m33(arr[off+15]);
    }

    public void copy(float[] arr, int off, Matrix3f dest) {
        dest._m00(arr[off+0])
        ._m01(arr[off+1])
        ._m02(arr[off+2])
        ._m10(arr[off+3])
        ._m11(arr[off+4])
        ._m12(arr[off+5])
        ._m20(arr[off+6])
        ._m21(arr[off+7])
        ._m22(arr[off+8]);
    }

    public void copy(float[] arr, int off, Matrix4x3f dest) {
        dest._m00(arr[off+0])
        ._m01(arr[off+1])
        ._m02(arr[off+2])
        ._m10(arr[off+3])
        ._m11(arr[off+4])
        ._m12(arr[off+5])
        ._m20(arr[off+6])
        ._m21(arr[off+7])
        ._m22(arr[off+8])
        ._m30(arr[off+9])
        ._m31(arr[off+10])
        ._m32(arr[off+11]);
    }

    public void copy(float[] arr, int off, Matrix3x2f dest) {
        dest._m00(arr[off+0])
        ._m01(arr[off+1])
        ._m10(arr[off+2])
        ._m11(arr[off+3])
        ._m20(arr[off+4])
        ._m21(arr[off+5]);
    }

    public void copy(double[] arr, int off, Matrix3x2d dest) {
        dest._m00(arr[off+0])
        ._m01(arr[off+1])
        ._m10(arr[off+2])
        ._m11(arr[off+3])
        ._m20(arr[off+4])
        ._m21(arr[off+5]);
    }

    public void copy(float[] arr, int off, Matrix2f dest) {
        dest._m00(arr[off+0])
        ._m01(arr[off+1])
        ._m10(arr[off+2])
        ._m11(arr[off+3]);
    }

    public void copy(double[] arr, int off, Matrix2d dest) {
        dest._m00(arr[off+0])
        ._m01(arr[off+1])
        ._m10(arr[off+2])
        ._m11(arr[off+3]);
    }

    public void copy(Matrix4f src, float[] dest, int off) {
        dest[off+0]  = src.m00();
        dest[off+1]  = src.m01();
        dest[off+2]  = src.m02();
        dest[off+3]  = src.m03();
        dest[off+4]  = src.m10();
        dest[off+5]  = src.m11();
        dest[off+6]  = src.m12();
        dest[off+7]  = src.m13();
        dest[off+8]  = src.m20();
        dest[off+9]  = src.m21();
        dest[off+10] = src.m22();
        dest[off+11] = src.m23();
        dest[off+12] = src.m30();
        dest[off+13] = src.m31();
        dest[off+14] = src.m32();
        dest[off+15] = src.m33();
    }

    public void copy(Matrix3f src, float[] dest, int off) {
        dest[off+0] = src.m00();
        dest[off+1] = src.m01();
        dest[off+2] = src.m02();
        dest[off+3] = src.m10();
        dest[off+4] = src.m11();
        dest[off+5] = src.m12();
        dest[off+6] = src.m20();
        dest[off+7] = src.m21();
        dest[off+8] = src.m22();
    }

    public void copy(Matrix4x3f src, float[] dest, int off) {
        dest[off+0]  = src.m00();
        dest[off+1]  = src.m01();
        dest[off+2]  = src.m02();
        dest[off+3]  = src.m10();
        dest[off+4]  = src.m11();
        dest[off+5]  = src.m12();
        dest[off+6]  = src.m20();
        dest[off+7]  = src.m21();
        dest[off+8]  = src.m22();
        dest[off+9]  = src.m30();
        dest[off+10] = src.m31();
        dest[off+11] = src.m32();
    }

    public void copy(Matrix3x2f src, float[] dest, int off) {
        dest[off+0] = src.m00();
        dest[off+1] = src.m01();
        dest[off+2] = src.m10();
        dest[off+3] = src.m11();
        dest[off+4] = src.m20();
        dest[off+5] = src.m21();
    }

    public void copy(Matrix3x2d src, double[] dest, int off) {
        dest[off+0] = src.m00();
        dest[off+1] = src.m01();
        dest[off+2] = src.m10();
        dest[off+3] = src.m11();
        dest[off+4] = src.m20();
        dest[off+5] = src.m21();
    }

    public void copy(Matrix2f src, float[] dest, int off) {
        dest[off+0] = src.m00();
        dest[off+1] = src.m01();
        dest[off+2] = src.m10();
        dest[off+3] = src.m11();
    }

    public void copy(Matrix2d src, double[] dest, int off) {
        dest[off+0] = src.m00();
        dest[off+1] = src.m01();
        dest[off+2] = src.m10();
        dest[off+3] = src.m11();
    }

    public void copy4x4(Matrix4x3f src, float[] dest, int off) {
        dest[off+0]  = src.m00();
        dest[off+1]  = src.m01();
        dest[off+2]  = src.m02();
        dest[off+3]  = 0.0f;
        dest[off+4]  = src.m10();
        dest[off+5]  = src.m11();
        dest[off+6]  = src.m12();
        dest[off+7]  = 0.0f;
        dest[off+8]  = src.m20();
        dest[off+9]  = src.m21();
        dest[off+10] = src.m22();
        dest[off+11] = 0.0f;
        dest[off+12] = src.m30();
        dest[off+13] = src.m31();
        dest[off+14] = src.m32();
        dest[off+15] = 1.0f;
    }

    public void copy4x4(Matrix4x3d src, float[] dest, int off) {
        dest[off+0]  = (float) src.m00();
        dest[off+1]  = (float) src.m01();
        dest[off+2]  = (float) src.m02();
        dest[off+3]  = 0.0f;
        dest[off+4]  = (float) src.m10();
        dest[off+5]  = (float) src.m11();
        dest[off+6]  = (float) src.m12();
        dest[off+7]  = 0.0f;
        dest[off+8]  = (float) src.m20();
        dest[off+9]  = (float) src.m21();
        dest[off+10] = (float) src.m22();
        dest[off+11] = 0.0f;
        dest[off+12] = (float) src.m30();
        dest[off+13] = (float) src.m31();
        dest[off+14] = (float) src.m32();
        dest[off+15] = 1.0f;
    }

    public void copy4x4(Matrix4x3d src, double[] dest, int off) {
        dest[off+0]  = src.m00();
        dest[off+1]  = src.m01();
        dest[off+2]  = src.m02();
        dest[off+3]  = 0.0;
        dest[off+4]  = src.m10();
        dest[off+5]  = src.m11();
        dest[off+6]  = src.m12();
        dest[off+7]  = 0.0;
        dest[off+8]  = src.m20();
        dest[off+9]  = src.m21();
        dest[off+10] = src.m22();
        dest[off+11] = 0.0;
        dest[off+12] = src.m30();
        dest[off+13] = src.m31();
        dest[off+14] = src.m32();
        dest[off+15] = 1.0;
    }

    public void copy3x3(Matrix3x2f src, float[] dest, int off) {
        dest[off+0] = src.m00();
        dest[off+1] = src.m01();
        dest[off+2] = 0.0f;
        dest[off+3] = src.m10();
        dest[off+4] = src.m11();
        dest[off+5] = 0.0f;
        dest[off+6] = src.m20();
        dest[off+7] = src.m21();
        dest[off+8] = 1.0f;
    }

    public void copy3x3(Matrix3x2d src, double[] dest, int off) {
        dest[off+0] = src.m00();
        dest[off+1] = src.m01();
        dest[off+2] = 0.0;
        dest[off+3] = src.m10();
        dest[off+4] = src.m11();
        dest[off+5] = 0.0;
        dest[off+6] = src.m20();
        dest[off+7] = src.m21();
        dest[off+8] = 1.0;
    }

    public void copy4x4(Matrix3x2f src, float[] dest, int off) {
        dest[off+0]  = src.m00();
        dest[off+1]  = src.m01();
        dest[off+2]  = 0.0f;
        dest[off+3]  = 0.0f;
        dest[off+4]  = src.m10();
        dest[off+5]  = src.m11();
        dest[off+6]  = 0.0f;
        dest[off+7]  = 0.0f;
        dest[off+8]  = 0.0f;
        dest[off+9]  = 0.0f;
        dest[off+10] = 1.0f;
        dest[off+11] = 0.0f;
        dest[off+12] = src.m20();
        dest[off+13] = src.m21();
        dest[off+14] = 0.0f;
        dest[off+15] = 1.0f;
    }

    public void copy4x4(Matrix3x2d src, double[] dest, int off) {
        dest[off+0]  = src.m00();
        dest[off+1]  = src.m01();
        dest[off+2]  = 0.0;
        dest[off+3]  = 0.0;
        dest[off+4]  = src.m10();
        dest[off+5]  = src.m11();
        dest[off+6]  = 0.0;
        dest[off+7]  = 0.0;
        dest[off+8]  = 0.0;
        dest[off+9]  = 0.0;
        dest[off+10] = 1.0;
        dest[off+11] = 0.0;
        dest[off+12] = src.m20();
        dest[off+13] = src.m21();
        dest[off+14] = 0.0;
        dest[off+15] = 1.0;
    }

    public void identity(Matrix4f dest) {
        dest._m00(1.0f)
        ._m01(0.0f)
        ._m02(0.0f)
        ._m03(0.0f)
        ._m10(0.0f)
        ._m11(1.0f)
        ._m12(0.0f)
        ._m13(0.0f)
        ._m20(0.0f)
        ._m21(0.0f)
        ._m22(1.0f)
        ._m23(0.0f)
        ._m30(0.0f)
        ._m31(0.0f)
        ._m32(0.0f)
        ._m33(1.0f);
    }

    public void identity(Matrix4x3f dest) {
        dest._m00(1.0f)
        ._m01(0.0f)
        ._m02(0.0f)
        ._m10(0.0f)
        ._m11(1.0f)
        ._m12(0.0f)
        ._m20(0.0f)
        ._m21(0.0f)
        ._m22(1.0f)
        ._m30(0.0f)
        ._m31(0.0f)
        ._m32(0.0f);
    }

    public void identity(Matrix3f dest) {
        dest._m00(1.0f)
        ._m01(0.0f)
        ._m02(0.0f)
        ._m10(0.0f)
        ._m11(1.0f)
        ._m12(0.0f)
        ._m20(0.0f)
        ._m21(0.0f)
        ._m22(1.0f);
    }

    public void identity(Matrix3x2f dest) {
        dest._m00(1.0f)
        ._m01(0.0f)
        ._m10(0.0f)
        ._m11(1.0f)
        ._m20(0.0f)
        ._m21(0.0f);
    }

    public void identity(Matrix3x2d dest) {
        dest._m00(1.0)
        ._m01(0.0)
        ._m10(0.0)
        ._m11(1.0)
        ._m20(0.0)
        ._m21(0.0);
    }

    public void identity(Matrix2f dest) {
        dest._m00(1.0f)
        ._m01(0.0f)
        ._m10(0.0f)
        ._m11(1.0f);
    }

    public void swap(Matrix4f m1, Matrix4f m2) {
        float tmp;
        tmp = m1.m00(); m1._m00(m2.m00()); m2._m00(tmp);
        tmp = m1.m01(); m1._m01(m2.m01()); m2._m01(tmp);
        tmp = m1.m02(); m1._m02(m2.m02()); m2._m02(tmp);
        tmp = m1.m03(); m1._m03(m2.m03()); m2._m03(tmp);
        tmp = m1.m10(); m1._m10(m2.m10()); m2._m10(tmp);
        tmp = m1.m11(); m1._m11(m2.m11()); m2._m11(tmp);
        tmp = m1.m12(); m1._m12(m2.m12()); m2._m12(tmp);
        tmp = m1.m13(); m1._m13(m2.m13()); m2._m13(tmp);
        tmp = m1.m20(); m1._m20(m2.m20()); m2._m20(tmp);
        tmp = m1.m21(); m1._m21(m2.m21()); m2._m21(tmp);
        tmp = m1.m22(); m1._m22(m2.m22()); m2._m22(tmp);
        tmp = m1.m23(); m1._m23(m2.m23()); m2._m23(tmp);
        tmp = m1.m30(); m1._m30(m2.m30()); m2._m30(tmp);
        tmp = m1.m31(); m1._m31(m2.m31()); m2._m31(tmp);
        tmp = m1.m32(); m1._m32(m2.m32()); m2._m32(tmp);
        tmp = m1.m33(); m1._m33(m2.m33()); m2._m33(tmp);
    }

    public void swap(Matrix4x3f m1, Matrix4x3f m2) {
        float tmp;
        tmp = m1.m00(); m1._m00(m2.m00()); m2._m00(tmp);
        tmp = m1.m01(); m1._m01(m2.m01()); m2._m01(tmp);
        tmp = m1.m02(); m1._m02(m2.m02()); m2._m02(tmp);
        tmp = m1.m10(); m1._m10(m2.m10()); m2._m10(tmp);
        tmp = m1.m11(); m1._m11(m2.m11()); m2._m11(tmp);
        tmp = m1.m12(); m1._m12(m2.m12()); m2._m12(tmp);
        tmp = m1.m20(); m1._m20(m2.m20()); m2._m20(tmp);
        tmp = m1.m21(); m1._m21(m2.m21()); m2._m21(tmp);
        tmp = m1.m22(); m1._m22(m2.m22()); m2._m22(tmp);
        tmp = m1.m30(); m1._m30(m2.m30()); m2._m30(tmp);
        tmp = m1.m31(); m1._m31(m2.m31()); m2._m31(tmp);
        tmp = m1.m32(); m1._m32(m2.m32()); m2._m32(tmp);
    }
    
    public void swap(Matrix3f m1, Matrix3f m2) {
        float tmp;
        tmp = m1.m00(); m1._m00(m2.m00()); m2._m00(tmp);
        tmp = m1.m01(); m1._m01(m2.m01()); m2._m01(tmp);
        tmp = m1.m02(); m1._m02(m2.m02()); m2._m02(tmp);
        tmp = m1.m10(); m1._m10(m2.m10()); m2._m10(tmp);
        tmp = m1.m11(); m1._m11(m2.m11()); m2._m11(tmp);
        tmp = m1.m12(); m1._m12(m2.m12()); m2._m12(tmp);
        tmp = m1.m20(); m1._m20(m2.m20()); m2._m20(tmp);
        tmp = m1.m21(); m1._m21(m2.m21()); m2._m21(tmp);
        tmp = m1.m22(); m1._m22(m2.m22()); m2._m22(tmp);
    }

    public void swap(Matrix2f m1, Matrix2f m2) {
        float tmp;
        tmp = m1.m00(); m1._m00(m2.m00()); m2._m00(tmp);
        tmp = m1.m01(); m1._m00(m2.m01()); m2._m01(tmp);
        tmp = m1.m10(); m1._m00(m2.m10()); m2._m10(tmp);
        tmp = m1.m11(); m1._m00(m2.m11()); m2._m11(tmp);
    }

    public void swap(Matrix2d m1, Matrix2d m2) {
        double tmp;
        tmp = m1.m00(); m1._m00(m2.m00()); m2._m00(tmp);
        tmp = m1.m01(); m1._m00(m2.m01()); m2._m01(tmp);
        tmp = m1.m10(); m1._m00(m2.m10()); m2._m10(tmp);
        tmp = m1.m11(); m1._m00(m2.m11()); m2._m11(tmp);
    }

    public void zero(Matrix4f dest) {
        dest._m00(0.0f)
        ._m01(0.0f)
        ._m02(0.0f)
        ._m03(0.0f)
        ._m10(0.0f)
        ._m11(0.0f)
        ._m12(0.0f)
        ._m13(0.0f)
        ._m20(0.0f)
        ._m21(0.0f)
        ._m22(0.0f)
        ._m23(0.0f)
        ._m30(0.0f)
        ._m31(0.0f)
        ._m32(0.0f)
        ._m33(0.0f);
    }

    public void zero(Matrix4x3f dest) {
        dest._m00(0.0f)
        ._m01(0.0f)
        ._m02(0.0f)
        ._m10(0.0f)
        ._m11(0.0f)
        ._m12(0.0f)
        ._m20(0.0f)
        ._m21(0.0f)
        ._m22(0.0f)
        ._m30(0.0f)
        ._m31(0.0f)
        ._m32(0.0f);
    }

    public void zero(Matrix3f dest) {
        dest._m00(0.0f)
        ._m01(0.0f)
        ._m02(0.0f)
        ._m10(0.0f)
        ._m11(0.0f)
        ._m12(0.0f)
        ._m20(0.0f)
        ._m21(0.0f)
        ._m22(0.0f);
    }

    public void zero(Matrix3x2f dest) {
        dest._m00(0.0f)
        ._m01(0.0f)
        ._m10(0.0f)
        ._m11(0.0f)
        ._m20(0.0f)
        ._m21(0.0f);
    }

    public void zero(Matrix3x2d dest) {
        dest._m00(0.0)
        ._m01(0.0)
        ._m10(0.0)
        ._m11(0.0)
        ._m20(0.0)
        ._m21(0.0);
    }

    public void zero(Matrix2f dest) {
        dest._m00(0.0f)
        ._m01(0.0f)
        ._m10(0.0f)
        ._m11(0.0f);
    }

    public void zero(Matrix2d dest) {
        dest._m00(0.0)
        ._m01(0.0)
        ._m10(0.0)
        ._m11(0.0);
    }
}
