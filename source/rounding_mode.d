module rounding_mode;

/*
 * The MIT License
 *
 * Copyright (c) 2020-2021 DOML
 $@#$#@ Translated by jordan4ibanez
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
 * Rounding modes.
 * 
 * @author Kai Burjack
 */
 
enum RoundingMode {
    /**
     * Discards the fractional part.
     */
    TRUNCATE = 0,
    /**
     * Round towards positive infinity.
     */
    CEILING = 1,
    /**
     * Round towards negative infinity.
     */
    FLOOR = 2,
    /**
     * Round towards the nearest neighbor. If both neighbors are equidistant, round
     * towards the even neighbor.
     */
    HALF_EVEN = 3,
    /**
     * Round towards the nearest neighbor. If both neighbors are equidistant, round
     * down.
     */
    HALF_DOWN = 4,
    /**
     * Round towards the nearest neighbor. If both neighbors are equidistant, round
     * up.
     */
    HALF_UP = 5
}
