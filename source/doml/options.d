/**
* Utility class for reading system properties.
* 
* @author Kai Burjack
*/
module doml.options;

/*
 * The MIT License
 *
 * Copyright (c) 2016-2021 DOML
 @#$#@@ Translated by jordan4ibanez
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
 
// import std.format: format;
//#ifndef __GWT__
//#endif

/**
* Utility class for reading system properties.
* 
* @author Kai Burjack
*/
public static struct Options {
    /**
    * Whether certain debugging checks should be made, such as that only direct NIO Buffers are used when Unsafe is active,
    * and a proxy should be created on calls to readOnlyView().
    */
    public static const bool DEBUG = false;//hasOption(System.getProperty("DOML.debug", "false"));

    //#ifdef __HAS_UNSAFE__
    /**
    * Whether <i>not</i> to use sun.misc.Unsafe when copying memory with MemUtil.
    */
    public static const bool NO_UNSAFE = false;//hasOption(System.getProperty("DOML.nounsafe", "false"));
    /**
    * Whether to <i>force</i> the use of sun.misc.Unsafe when copying memory with MemUtil.
    */
    public static const bool FORCE_UNSAFE = false; //hasOption(System.getProperty("DOML.forceUnsafe", "false"));
    //#endif

    /**
    * Whether fast approximations of some java.lang.Math operations should be used.
    */
    public static const bool FASTMATH = false;//hasOption(System.getProperty("DOML.fastmath", "false"));

    /**
    * When {@link #FASTMATH} is <code>true</code>, whether to use a lookup table for sin/cos.
    */
    public static const bool SIN_LOOKUP = false;//hasOption(System.getProperty("DOML.sinLookup", "false"));

    /**
    * When {@link #SIN_LOOKUP} is <code>true</code>, this determines the table size.
    */
    public static const int SIN_LOOKUP_BITS = 14;//Integer.parseInt(System.getProperty("DOML.sinLookup.bits", "14"));

    //#ifndef __GWT__
    /**
    * Whether to use a {@link NumberFormat} producing scientific notation output when formatting matrix,
    * vector and quaternion components to strings.
    */
    public static const bool useNumberFormat = true;// hasOption(System.getProperty("DOML.format", "true"));
    //#endif

    //#ifdef __HAS_MATH_FMA__
    /**
    * Whether to try using java.lang.Math.fma() in most matrix/vector/quaternion operations if it is available.
    * If the CPU does <i>not</i> support it, it will be a lot slower than `a*b+c` and potentially generate a lot of memory allocations
    * for the emulation with `java.util.BigDecimal`, though.
    */
    public static const bool USE_MATH_FMA = false;//hasOption(System.getProperty("DOML.useMathFma", "false"));
    //#endif

    //#ifndef __GWT__
    /**
    * When {@link #useNumberFormat} is <code>true</code> then this determines the number of decimal digits
    * produced in the formatted numbers.
    */
    //#else
    /**
    * Determines the number of decimal digits produced in the formatted numbers.
    */
    //#endif
    public static const int numberFormatDecimals = 3;//Integer.parseInt(System.getProperty("DOML.format.decimals", "3"));

    /**
    * The {@link NumberFormat} used to format all numbers throughout all DOML classes.
    */
    // public const NumberFormat NUMBER_FORMAT = decimalFormat();
    /*
    private Options(){
    }

    private static NumberFormat decimalFormat() {
    NumberFormat df;
    //#ifndef __GWT__
    if (useNumberFormat) {
    //#endif
        char[] prec = new char[numberFormatDecimals];
        Arrays.fill(prec, '0');
        df = new DecimalFormat(" 0." + new String(prec) + "E0;-");
    //#ifndef __GWT__
    } else {
        df = NumberFormat.getNumberInstance(Locale.ENGLISH);
        df.setGroupingUsed(false);
    }
    //#endif
    return df;
    }

    private static boolean hasOption(String v) {
    if (v == null)
        return false;
    if (v.trim().length() == 0)
        return true;
    return Boolean.valueOf(v).booleanValue();
    }
    */
}