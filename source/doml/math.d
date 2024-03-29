/**
 * Contains fast approximations of some {@link java.lang.Math} operations.
 * <p>
 * By default, {@link java.lang.Math} methods will be used by all other DOML classes. In order to use the approximations in this class, start the JVM with the parameter <code>-DDOML.fastmath</code>.
 * <p>
 * There are two algorithms for approximating sin/cos:
 * <ol>
 * <li>arithmetic <a href="http://www.java-gaming.org/topics/DOML-1-8-0-release/37491/msg/361815/view.html#msg361815">polynomial approximation</a> contributed by roquendm 
 * <li>theagentd's <a href="http://www.java-gaming.org/topics/extremely-fast-sine-cosine/36469/msg/346213/view.html#msg346213">linear interpolation</a> variant of Riven's algorithm from
 * <a href="http://www.java-gaming.org/topics/extremely-fast-sine-cosine/36469/view.html">http://www.java-gaming.org/</a>
 * </ol>
 * By default, the first algorithm is being used. In order to use the second one, start the JVM with <code>-DDOML.sinLookup</code>. The lookup table bit length of the second algorithm can also be adjusted
 * for improved accuracy via <code>-DDOML.sinLookup.bits=&lt;n&gt;</code>, where &lt;n&gt; is the number of bits of the lookup table.
 * 
 * @author Kai Burjack
 */
module doml.math;

import doml.options;

import std.traits: Select, isFloatingPoint, isIntegral;

import std.math: 
math_pi    = PI, 
math_sin   = sin, 
math_rint  = rint, 
math_floor = floor, 
math_cos   = cos,
math_acos  = acos, 
math_sqrt  = sqrt, 
math_atan2 = atan2, 
math_tan   = tan, 
math_asin  = asin, 
math_abs   = abs,
math_ceil  = ceil, 
math_round = round, 
math_exp   = exp, 
math_fma   = fma,
math_pow   = pow,
math_isInfinite = isInfinity;

// These aren't math library but oh well
import std.algorithm: 
math_min   = min,
math_max   = max;

// I'm not indent matching this
import std.random: 
math_random = Random,
math_unpredictableSeed = unpredictableSeed,
math_uniform = uniform;

import doml.rounding_mode;

// All the java comments are now wrong oh nooo


/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 DOML
 +*%#$%# Translated by jordan4ibanez
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

/*
* The following implementation of an approximation of sine and cosine was
* thankfully donated by Riven from http://java-gaming.org/.
* 
* The code for linear interpolation was gratefully donated by theagentd
* from the same site.
*/

immutable double PI = math_pi;
immutable double PI2 = PI * 2.0;
immutable double PIHalf = PI * 0.5;
immutable double PI_4 = PI * 0.25;
immutable double PI_INV = 1.0 / PI;


// Credit: https://forum.dlang.org/post/bug-5900-3@http.d.puremagic.com%2Fissues%2F
/// Converts from degrees to radians.
@safe pure nothrow  Select!(isFloatingPoint!T || isIntegral!T, T, double)
radians(T)(in T x) {
    return x * (PI / 180);
}

/// Converts from radians to degrees.
@safe pure nothrow Select!(isFloatingPoint!T || isIntegral!T, T, double)
degrees(T)(in T x) {
    return x / (PI / 180);
}

@safe pure nothrow Select!(isFloatingPoint!T || isIntegral!T, T, double)
math_signum(T)(in T x) {
    return (T(0) < x) - (x < T(0));
}

// Thanks to adr, a Java function in D
double longbits(long a) {
    return *cast(double*) &a;
}
int doubleToRawIntBits(double a) {
    return *cast(int*) &a;
}
long doubleToLongBits(double a) {
    return *cast(long*) &a;
}

bool isInfinite(double value) {
    return math_isInfinite(value);
}


private const double c1 = longbits(-4_628_199_217_061_079_772L);
private const double c2 = longbits(4_575_957_461_383_582_011L);
private const double c3 = longbits(-4_671_919_876_300_759_001L);
private const double c4 = longbits(4_523_617_214_285_661_942L);
private const double c5 = longbits(-4_730_215_272_828_025_532L);
private const double c6 = longbits(4_460_272_573_143_870_633L);
private const double c7 = longbits(-4_797_767_418_267_846_529L);

/**
* @author theagentd
*/
double sin_theagentd_arith(double x){
    double xi = math_floor((x + PI_4) * PI_INV);
    double x_ = x - xi * PI;
    double sign = (cast(int)xi & 1) * -2 + 1;
    double x2 = x_ * x_;
    double sin = x_;
    double tx = x_ * x2;
    sin += tx * c1; tx *= x2;
    sin += tx * c2; tx *= x2;
    sin += tx * c3; tx *= x2;
    sin += tx * c4; tx *= x2;
    sin += tx * c5; tx *= x2;
    sin += tx * c6; tx *= x2;
    sin += tx * c7;
    return sign * sin;
}

/**
    * Reference: <a href="http://www.java-gaming.org/topics/DOML-1-8-0-release/37491/msg/361718/view.html#msg361718">http://www.java-gaming.org/</a>
    */
double sin_roquen_arith(double x) {
    double xi = math_floor((x + PI_4) * PI_INV);
    double x_ = x - xi * PI;
    double sign = (cast(int)xi & 1) * -2 + 1;
    double x2 = x_ * x_;

    // code from sin_theagentd_arith:
    // double sin = x_;
    // double tx = x_ * x2;
    // sin += tx * c1; tx *= x2;
    // sin += tx * c2; tx *= x2;
    // sin += tx * c3; tx *= x2;
    // sin += tx * c4; tx *= x2;
    // sin += tx * c5; tx *= x2;
    // sin += tx * c6; tx *= x2;
    // sin += tx * c7;
    // return sign * sin;

    double sin;
    x_  = sign*x_;
    sin =          c7;
    sin = sin*x2 + c6;
    sin = sin*x2 + c5;
    sin = sin*x2 + c4;
    sin = sin*x2 + c3;
    sin = sin*x2 + c2;
    sin = sin*x2 + c1;
    return x_ + x_*x2*sin;
}

private const double s5 = longbits(4_523_227_044_276_562_163L);
private const double s4 = longbits(-4_671_934_770_969_572_232L);
private const double s3 = longbits(4_575_957_211_482_072_852L);
private const double s2 = longbits(-4_628_199_223_918_090_387L);
private const double s1 = longbits(4_607_182_418_589_157_889L);

/**
* Reference: <a href="http://www.java-gaming.org/topics/DOML-1-8-0-release/37491/msg/361815/view.html#msg361815">http://www.java-gaming.org/</a>
*/
double sin_roquen_9(double v) {
    double i  = math_rint(v*PI_INV);
    double x  = v - i * PI;
    double qs = 1-2*(cast(int)i & 1);
    double x2 = x*x;
    double r;
    x = qs*x;
    r =        s5;
    r = r*x2 + s4;
    r = r*x2 + s3;
    r = r*x2 + s2;
    r = r*x2 + s1;
    return x*r;
}

private const double k1 = longbits(-4_628_199_217_061_079_959L);
private const double k2 = longbits(4_575_957_461_383_549_981L);
private const double k3 = longbits(-4_671_919_876_307_284_301L);
private const double k4 = longbits(4_523_617_213_632_129_738L);
private const double k5 = longbits(-4_730_215_344_060_517_252L);
private const double k6 = longbits(4_460_268_259_291_226_124L);
private const double k7 = longbits(-4_798_040_743_777_455_072L);

/**
* Reference: <a href="http://www.java-gaming.org/topics/DOML-1-8-0-release/37491/msg/361815/view.html#msg361815">http://www.java-gaming.org/</a>
*/
double sin_roquen_newk(double v) {
    double i  = math_rint(v*PI_INV);
    double x  = v - i * PI;
    double qs = 1-2*(cast(int)i & 1);
    double x2 = x*x;
    double r;
    x = qs*x;
    r =        k7;
    r = r*x2 + k6;
    r = r*x2 + k5;
    r = r*x2 + k4;
    r = r*x2 + k3;
    r = r*x2 + k2;
    r = r*x2 + k1;
    return x + x*x2*r;
}

double pow(double a, double b) {
    return math_pow(a, b);
}

double sin(double rad) {
    return math_sin(rad);
}

double cos(double rad) {
    return math_cos(rad);
}

double cosFromSin(double sin, double angle) {
    //if (Options.FASTMATH){
        // return math_sin(angle + PIHalf);
    // }
    // sin(x)^2 + cos(x)^2 = 1
    double cos = math_sqrt(1.0 - sin * sin);
    double a = angle + PIHalf;
    double b = a - cast(int)(a / PI2) * PI2;
    if (b < 0.0)
        b = PI2 + b;
    if (b >= PI)
        return -cos;
    return cos;
}

/* Other math functions not yet approximated */

double sqrt(double r) {
    return math_sqrt(r);
}

double invsqrt(double r) {
    return 1.0 / math_sqrt(r);
}

double tan(double r) {
    return math_tan(r);
}

double acos(double r) {
    return math_acos(r);
}

double safeAcos(double v) {
    if (v < -1.0)
        return PI;
    else if (v > +1.0)
        return 0.0;
    else
        return math_acos(v);
}


double atan2(double y, double x) {
    return math_atan2(y, x);
}

double asin(double r) {
    return math_asin(r);
}

double abs(double r) {
    return math_abs(r);
}

// Taken from runtime
bool equals(double a, double b, double delta) {
    return doubleToLongBits(a) == doubleToLongBits(b) || abs(a - b) <= delta;
}

bool absEqualsOne(double r) {
    return (doubleToLongBits(r) & 0x7FFFFFFFFFFFFFFFL) == 0x3FF0000000000000L;
}

int abs(int r) {
    return math_abs(r);
}

int max(int x, int y) {
    return math_max(x, y);
}

int min(int x, int y) {
    return math_min(x, y);
}

double min(double a, double b) {
    return a < b ? a : b;
}

double max(double a, double b) {
    return a > b ? a : b;
}

ulong max(ulong a, ulong b) {
    return a > b ? a : b;
}

double clamp(double a, double b, double val) {
    return max(a,math_min(b,val));
}
int clamp(int a, int b, int val) {
    return max(a, math_min(b, val));
}

double toRadians(double angles) {
    return radians(angles);
}

double toDegrees(double angles) {
    return degrees(angles);
}

double floor(double v) {
    return math_floor(v);
}

double ceil(double v) {
    return math_ceil(v);
}

long round(double v) {
    return cast(long) math_round(v);
}

double exp(double a) {
    return math_exp(a);
}

bool isFinite(double d) {
    return math_abs(d) <= double.max;
}

double fma(double a, double b, double c) {
    return math_fma(a, b, c);
}

int roundUsing(double v, int mode) {
    switch (mode) {
        case RoundingMode.TRUNCATE:
            return cast(int) v;
        case RoundingMode.CEILING:
            return cast(int) math_ceil(v);
        case RoundingMode.FLOOR:
            return cast(int) math_floor(v);
        case RoundingMode.HALF_DOWN:
            return roundHalfDown(v);
        case RoundingMode.HALF_UP:
            return roundHalfUp(v);
        case RoundingMode.HALF_EVEN:
            return roundHalfEven(v);
        default: {
            return 0;
        }
    }
}

double lerp(double a, double b, double t) {
    return math_fma(b - a, t, a);
}

double biLerp(double q00, double q10, double q01, double q11, double tx, double ty) {
    double lerpX1 = lerp(q00, q10, tx);
    double lerpX2 = lerp(q01, q11, tx);
    return lerp(lerpX1, lerpX2, ty);
}

double triLerp(double q000, double q100, double q010, double q110, double q001, double q101, double q011, double q111,
 double tx, double ty, double tz) {
    double x00 = lerp(q000, q100, tx);
    double x10 = lerp(q010, q110, tx);
    double x01 = lerp(q001, q101, tx);
    double x11 = lerp(q011, q111, tx);
    double y0 = lerp(x00, x10, ty);
    double y1 = lerp(x01, x11, ty);
    return lerp(y0, y1, tz);
}

int roundHalfEven(double v) {
    return cast(int) math_rint(v);
}
int roundHalfDown(double v) {
    return (v > 0) ? cast(int) math_ceil(v - 0.5) : cast(int) math_floor(v + 0.5);
}
int roundHalfUp(double v) {
    return (v > 0) ? cast(int) math_floor(v + 0.5) : cast(int) math_ceil(v - 0.5);
}

double random() {
    math_random random = math_random(math_unpredictableSeed());
    return math_uniform(0.0, 1.0, random);
}

double safeAsin(double r) {
    return r <= -1.0 ? -PIHalf : r >= 1.0 ? PIHalf : math_asin(r);
}

double signum(double v) {
    return math_signum(v);
}
int signum(int v) {
    int r;
    r = math_signum(v);
    r = (v >> 31) | (-v >>> 31);
    return r;
}
int signum(long v) {
    int r;
    r = cast(int)math_signum(v);
    r = cast(int) ((v >> 63) | (-v >>> 63));
    return r;
}

