module mem_util;

import vector_2d;
import vector_2i;
import vector_3d;
import vector_3i;
import vector_4d;
import vector_4i;

import matrix_2d;
import matrix_3d;
import matrix_3x2d;
import matrix_4d;
import matrix_4x3d;





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

public static  struct INSTANCE {

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

        return 0;
    }

    public Matrix4d set(Matrix4d m, int column, int row, double value) {
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
        
        return 0;
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

        return 0;
    }

    public Matrix3d set(Matrix3d m, int column, int row, double value) {
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
        
        return 0;
    }


    public void copy(Matrix3x2d src, ref Matrix3x2d dest) {
        dest._m00 = src.m00;
        dest._m01 = src.m01;
        dest._m10 = src.m10;
        dest._m11 = src.m11;
        dest._m20 = src.m20;
        dest._m21 = src.m21;
    }

    public void copy(Matrix2d src, ref Matrix2d dest) {
        dest._m00 = src.m00;
        dest._m01 = src.m01;
        dest._m10 = src.m10;
        dest._m11 = src.m11;
    }

    public void copy(Matrix2d src, ref Matrix3d dest) {
        dest._m00 = src.m00;
        dest._m01 = src.m01;
        dest._m02 = 0.0;
        dest._m10 = src.m10;
        dest._m11 = src.m11;
        dest._m12 = 0.0;
        dest._m20 = 0.0;
        dest._m21 = 0.0;
        dest._m22 = 1.0;
    }

    public void copy(Matrix3d src, ref Matrix2d dest) {
        dest._m00 = src.m00;
        dest._m01 = src.m01;
        dest._m10 = src.m10;
        dest._m11 = src.m11;
    }

    public void copy(Matrix2d src, ref Matrix3x2d dest) {
        dest._m00 = src.m00;
        dest._m01 = src.m01;
        dest._m10 = src.m10;
        dest._m11 = src.m11;
        dest._m20 = 0.0;
        dest._m21 = 0.0;
    }

    public void copy(Matrix3x2d src, ref Matrix2d dest) {
        dest._m00 = src.m00;
        dest._m01 = src.m01;
        dest._m10 = src.m10;
        dest._m11 = src.m11;
    }

    public void copy(double[] arr, int off, ref Matrix3x2d dest) {
        dest._m00 = arr[off+0];
        dest._m01 = arr[off+1];
        dest._m10 = arr[off+2];
        dest._m11 = arr[off+3];
        dest._m20 = arr[off+4];
        dest._m21 = arr[off+5];
    }

    public void copy(double[] arr, int off, ref Matrix2d dest) {
        dest._m00 = arr[off+0];
        dest._m01 = arr[off+1];
        dest._m10 = arr[off+2];
        dest._m11 = arr[off+3];
    }

    public void copy(Matrix3x2d src, ref double[] dest, int off) {
        dest[off+0] = src.m00;
        dest[off+1] = src.m01;
        dest[off+2] = src.m10;
        dest[off+3] = src.m11;
        dest[off+4] = src.m20;
        dest[off+5] = src.m21;
    }

    public void copy(Matrix2d src, ref double[] dest, int off) {
        dest[off+0] = src.m00;
        dest[off+1] = src.m01;
        dest[off+2] = src.m10;
        dest[off+3] = src.m11;
    }

    public void copy4x4(Matrix4x3d src, ref double[] dest, int off) {
        dest[off+0]  = src.m00;
        dest[off+1]  = src.m01;
        dest[off+2]  = src.m02;
        dest[off+3]  = 0.0;
        dest[off+4]  = src.m10;
        dest[off+5]  = src.m11;
        dest[off+6]  = src.m12;
        dest[off+7]  = 0.0;
        dest[off+8]  = src.m20;
        dest[off+9]  = src.m21;
        dest[off+10] = src.m22;
        dest[off+11] = 0.0;
        dest[off+12] = src.m30;
        dest[off+13] = src.m31;
        dest[off+14] = src.m32;
        dest[off+15] = 1.0;
    }

    public void copy3x3(Matrix3x2d src, ref double[] dest, int off) {
        dest[off+0] = src.m00;
        dest[off+1] = src.m01;
        dest[off+2] = 0.0;
        dest[off+3] = src.m10;
        dest[off+4] = src.m11;
        dest[off+5] = 0.0;
        dest[off+6] = src.m20;
        dest[off+7] = src.m21;
        dest[off+8] = 1.0;
    }

    public void copy4x4(Matrix3x2d src, ref double[] dest, int off) {
        dest[off+0]  = src.m00;
        dest[off+1]  = src.m01;
        dest[off+2]  = 0.0;
        dest[off+3]  = 0.0;
        dest[off+4]  = src.m10;
        dest[off+5]  = src.m11;
        dest[off+6]  = 0.0;
        dest[off+7]  = 0.0;
        dest[off+8]  = 0.0;
        dest[off+9]  = 0.0;
        dest[off+10] = 1.0;
        dest[off+11] = 0.0;
        dest[off+12] = src.m20;
        dest[off+13] = src.m21;
        dest[off+14] = 0.0;
        dest[off+15] = 1.0;
    }

    public void identity(ref Matrix3x2d dest) {
        dest._m00 = 1.0;
        dest._m01 = 0.0;
        dest._m10 = 0.0;
        dest._m11 = 1.0;
        dest._m20 = 0.0;
        dest._m21 = 0.0;
    }

    public void swap(ref Matrix2d m1, ref Matrix2d m2) {
        double tmp;

        tmp = m1.m00;
        m1._m00 = m2.m00;
        m2._m00 = tmp;

        tmp = m1.m01;
        m1._m00 = m2.m01;
        m2._m01 = tmp;

        tmp = m1.m10;
        m1._m00 = m2.m10;
        m2._m10 = tmp;

        tmp = m1.m11;
        m1._m00 = m2.m11;
        m2._m11 = tmp;
    }

    public void zero(ref Matrix3x2d dest) {
        dest._m00 = 0.0;
        dest._m01 = 0.0;
        dest._m10 = 0.0;
        dest._m11 = 0.0;
        dest._m20 = 0.0;
        dest._m21 = 0.0;
    }

    public void zero(ref Matrix2d dest) {
        dest._m00 = 0.0;
        dest._m01 = 0.0;
        dest._m10 = 0.0;
        dest._m11 = 0.0;
    }
}
