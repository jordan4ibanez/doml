/**
 * This is an implementation of the <a
 * href="http://www.cg.cs.tu-bs.de/media/publications/fast-rayaxis-aligned-bounding-box-overlap-tests-using-ray-slopes.pdf">Fast Ray/Axis-Aligned Bounding Box
 * Overlap Tests using Ray Slopes</a> paper.
 * <p>
 * It is an efficient implementation when testing many axis-aligned boxes against the same ray.
 * <p>
 * This class is thread-safe and can be used in a multithreaded environment when testing many axis-aligned boxes against the same ray concurrently.
 * 
 * @author Kai Burjack
 */
module doml.ray_aabb_intersection;

import Math = doml.math;

import std.math.traits: isNaN;

/*
 * The MIT License
 *
 * Copyright (c) 2015-2021 Kai Burjack
 %#%# Translated by jordan4ibanez
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
 * This is an implementation of the <a
 * href="http://www.cg.cs.tu-bs.de/media/publications/fast-rayaxis-aligned-bounding-box-overlap-tests-using-ray-slopes.pdf">Fast Ray/Axis-Aligned Bounding Box
 * Overlap Tests using Ray Slopes</a> paper.
 * <p>
 * It is an efficient implementation when testing many axis-aligned boxes against the same ray.
 * <p>
 * This class is thread-safe and can be used in a multithreaded environment when testing many axis-aligned boxes against the same ray concurrently.
 * 
 * @author Kai Burjack
 */
struct RayAabIntersection {
    private double originX, originY, originZ;
    private double dirX, dirY, dirZ;

    /* Needed for ray slope intersection method */
    private double c_xy, c_yx, c_zy, c_yz, c_xz, c_zx;
    private double s_xy, s_yx, s_zy, s_yz, s_xz, s_zx;
    private byte classification;

    /**
     * Create a new {@link RayAabIntersection} and initialize it with a ray with origin <code>(originX, originY, originZ)</code>
     * and direction <code>(dirX, dirY, dirZ)</code>.
     * <p>
     * In order to change the direction and/or origin of the ray later, use {@link #set(double, double, double, double, double, double) set()}.
     * 
     * @see #set(double, double, double, double, double, double)
     * 
     * @param originX
     *          the x coordinate of the origin
     * @param originY
     *          the y coordinate of the origin
     * @param originZ
     *          the z coordinate of the origin
     * @param dirX
     *          the x coordinate of the direction
     * @param dirY
     *          the y coordinate of the direction
     * @param dirZ
     *          the z coordinate of the direction
     */
    this(double originX, double originY, double originZ, double dirX, double dirY, double dirZ) {
        set(originX, originY, originZ, dirX, dirY, dirZ);
    }

    /**
     * Update the ray stored by this {@link RayAabIntersection} with the new origin <code>(originX, originY, originZ)</code>
     * and direction <code>(dirX, dirY, dirZ)</code>.
     * 
     * @param originX
     *          the x coordinate of the ray origin
     * @param originY
     *          the y coordinate of the ray origin
     * @param originZ
     *          the z coordinate of the ray origin
     * @param dirX
     *          the x coordinate of the ray direction
     * @param dirY
     *          the y coordinate of the ray direction
     * @param dirZ
     *          the z coordinate of the ray direction
     */
    public void set(double originX, double originY, double originZ, double dirX, double dirY, double dirZ) {
        this.originX = originX;
        this.originY = originY;
        this.originZ = originZ;
        this.dirX = dirX;
        this.dirY = dirY;
        this.dirZ = dirZ;
        precomputeSlope();
    }
    /**
     * Precompute the values necessary for the ray slope algorithm.
     */
    private void precomputeSlope() {
        double invDirX = 1.0f / dirX;
        double invDirY = 1.0f / dirY;
        double invDirZ = 1.0f / dirZ;
        s_yx = dirX * invDirY;
        s_xy = dirY * invDirX;
        s_zy = dirY * invDirZ;
        s_yz = dirZ * invDirY;
        s_xz = dirZ * invDirX;
        s_zx = dirX * invDirZ;
        c_xy = originY - s_xy * originX;
        c_yx = originX - s_yx * originY;
        c_zy = originY - s_zy * originZ;
        c_yz = originZ - s_yz * originY;
        c_xz = originZ - s_xz * originX; // <- original paper had a bug here. It switched originZ/originX
        c_zx = originX - s_zx * originZ; // <- original paper had a bug here. It switched originZ/originX
        int sgnX = cast(int)Math.math_signum(dirX);
        int sgnY = cast(int)Math.math_signum(dirY);
        int sgnZ = cast(int)Math.math_signum(dirZ);
        classification = cast(byte) ((sgnZ+1) << 4 | (sgnY+1) << 2 | (sgnX+1));
    }

    /**
     * Test whether the ray stored in this {@link RayAabIntersection} intersect the axis-aligned box
     * given via its minimum corner <code>(minX, minY, minZ)</code> and its maximum corner <code>(maxX, maxY, maxZ)</code>.
     * <p>
     * This implementation uses a tableswitch to dispatch to the correct intersection method.
     * <p>
     * This method is thread-safe and can be used to test many axis-aligned boxes concurrently.
     * 
     * @param minX
     *          the x coordinate of the minimum corner
     * @param minY
     *          the y coordinate of the minimum corner
     * @param minZ
     *          the z coordinate of the minimum corner
     * @param maxX
     *          the x coordinate of the maximum corner
     * @param maxY
     *          the y coordinate of the maximum corner
     * @param maxZ
     *          the z coordinate of the maximum corner
     * @return <code>true</code> iff the ray intersects the given axis-aligned box; <code>false</code> otherwise
     */
    public bool test(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        // tableswitch with dense and consecutive cases (will be a simple jump based on the switch argument)
        switch (classification) {
        case 0: // 0b000000: // MMM
            return MMM(minX, minY, minZ, maxX, maxY, maxZ);
        case 1: // 0b000001: // OMM
            return OMM(minX, minY, minZ, maxX, maxY, maxZ);
        case 2: // 0b000010: // PMM
            return PMM(minX, minY, minZ, maxX, maxY, maxZ);
        case 3: // 0b000011: // not used
            return false;
        case 4: // 0b000100: // MOM 
            return MOM(minX, minY, minZ, maxX, maxY, maxZ);
        case 5: // 0b000101: // OOM
            return OOM(minX, minY, minZ, maxX, maxY);
        case 6: // 0b000110: // POM
            return POM(minX, minY, minZ, maxX, maxY, maxZ);
        case 7: // 0b000111: // not used
            return false;
        case 8: // 0b001000: // MPM
            return MPM(minX, minY, minZ, maxX, maxY, maxZ);
        case 9: // 0b001001: // OPM
            return OPM(minX, minY, minZ, maxX, maxY, maxZ);
        case 10: // 0b001010: // PPM
            return PPM(minX, minY, minZ, maxX, maxY, maxZ);
        case 11: // 0b001011: // not used
        case 12: // 0b001100: // not used
        case 13: // 0b001101: // not used
        case 14: // 0b001110: // not used
        case 15: // 0b001111: // not used
            return false;
        case 16: // 0b010000: // MMO
            return MMO(minX, minY, minZ, maxX, maxY, maxZ);
        case 17: // 0b010001: // OMO
            return OMO(minX, minY, minZ, maxX, maxZ);
        case 18: // 0b010010: // PMO
            return PMO(minX, minY, minZ, maxX, maxY, maxZ);
        case 19: // 0b010011: // not used
            return false;
        case 20: // 0b010100: // MOO
            return MOO(minX, minY, minZ, maxY, maxZ);
        case 21: // 0b010101: // OOO
            return false; // <- degenerate case
        case 22: // 0b010110: // POO
            return POO(minY, minZ, maxX, maxY, maxZ);
        case 23: // 0b010111: // not used
            return false;
        case 24: // 0b011000: // MPO
            return MPO(minX, minY, minZ, maxX, maxY, maxZ);
        case 25: // 0b011001: // OPO
            return OPO(minX, minZ, maxX, maxY, maxZ);
        case 26: // 0b011010: // PPO
            return PPO(minX, minY, minZ, maxX, maxY, maxZ);
        case 27: // 0b011011: // not used
        case 28: // 0b011100: // not used
        case 29: // 0b011101: // not used
        case 30: // 0b011110: // not used
        case 31: // 0b011111: // not used
            return false;
        case 32: // 0b100000: // MMP
            return MMP(minX, minY, minZ, maxX, maxY, maxZ);
        case 33: // 0b100001: // OMP
            return OMP(minX, minY, minZ, maxX, maxY, maxZ);
        case 34: // 0b100010: // PMP
            return PMP(minX, minY, minZ, maxX, maxY, maxZ);
        case 35: // 0b100011: // not used
            return false;
        case 36: // 0b100100: // MOP
            return MOP(minX, minY, minZ, maxX, maxY, maxZ);
        case 37: // 0b100101: // OOP
            return OOP(minX, minY, maxX, maxY, maxZ);
        case 38: // 0b100110: // POP
            return POP(minX, minY, minZ, maxX, maxY, maxZ);
        case 39: // 0b100111: // not used
            return false;
        case 40: // 0b101000: // MPP
            return MPP(minX, minY, minZ, maxX, maxY, maxZ);
        case 41: // 0b101001: // OPP
            return OPP(minX, minY, minZ, maxX, maxY, maxZ);
        case 42: // 0b101010: // PPP
            return PPP(minX, minY, minZ, maxX, maxY, maxZ);
        default:
            return false;
        }
    }

    /* Intersection tests for all possible ray direction cases */

    private bool MMM(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originX >= minX && originY >= minY && originZ >= minZ
            && s_xy * minX - maxY + c_xy <= 0.0f
            && s_yx * minY - maxX + c_yx <= 0.0f
            && s_zy * minZ - maxY + c_zy <= 0.0f
            && s_yz * minY - maxZ + c_yz <= 0.0f
            && s_xz * minX - maxZ + c_xz <= 0.0f
            && s_zx * minZ - maxX + c_zx <= 0.0f;
    }
    private bool OMM(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originX >= minX && originX <= maxX && originY >= minY && originZ >= minZ
            && s_zy * minZ - maxY + c_zy <= 0.0f
            && s_yz * minY - maxZ + c_yz <= 0.0f;
    }
    private bool PMM(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originX <= maxX && originY >= minY && originZ >= minZ
            && s_xy * maxX - maxY + c_xy <= 0.0f
            && s_yx * minY - minX + c_yx >= 0.0f
            && s_zy * minZ - maxY + c_zy <= 0.0f
            && s_yz * minY - maxZ + c_yz <= 0.0f
            && s_xz * maxX - maxZ + c_xz <= 0.0f
            && s_zx * minZ - minX + c_zx >= 0.0f;
    }
    private bool MOM(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originY >= minY && originY <= maxY && originX >= minX && originZ >= minZ
            && s_xz * minX - maxZ + c_xz <= 0.0f
            && s_zx * minZ - maxX + c_zx <= 0.0f;
    }
    private bool OOM(double minX, double minY, double minZ, double maxX, double maxY) {
        return originZ >= minZ && originX >= minX && originX <= maxX && originY >= minY && originY <= maxY;
    }
    private bool POM(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originY >= minY && originY <= maxY && originX <= maxX && originZ >= minZ
            && s_xz * maxX - maxZ + c_xz <= 0.0f
            && s_zx * minZ - minX + c_zx >= 0.0f;
    }
    private bool MPM(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originX >= minX && originY <= maxY && originZ >= minZ
            && s_xy * minX - minY + c_xy >= 0.0f
            && s_yx * maxY - maxX + c_yx <= 0.0f
            && s_zy * minZ - minY + c_zy >= 0.0f
            && s_yz * maxY - maxZ + c_yz <= 0.0f
            && s_xz * minX - maxZ + c_xz <= 0.0f
            && s_zx * minZ - maxX + c_zx <= 0.0f;
    }
    private bool OPM(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originX >= minX && originX <= maxX && originY <= maxY && originZ >= minZ
            && s_zy * minZ - minY + c_zy >= 0.0f
            && s_yz * maxY - maxZ + c_yz <= 0.0f;
    }
    private bool PPM(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originX <= maxX && originY <= maxY && originZ >= minZ
            && s_xy * maxX - minY + c_xy >= 0.0f
            && s_yx * maxY - minX + c_yx >= 0.0f
            && s_zy * minZ - minY + c_zy >= 0.0f
            && s_yz * maxY - maxZ + c_yz <= 0.0f
            && s_xz * maxX - maxZ + c_xz <= 0.0f
            && s_zx * minZ - minX + c_zx >= 0.0f;
    }
    private bool MMO(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originZ >= minZ && originZ <= maxZ && originX >= minX && originY >= minY
            && s_xy * minX - maxY + c_xy <= 0.0f
            && s_yx * minY - maxX + c_yx <= 0.0f;
    }
    private bool OMO(double minX, double minY, double minZ, double maxX, double maxZ) {
        return originY >= minY && originX >= minX && originX <= maxX && originZ >= minZ && originZ <= maxZ;
    }
    private bool PMO(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originZ >= minZ && originZ <= maxZ && originX <= maxX && originY >= minY
            && s_xy * maxX - maxY + c_xy <= 0.0f
            && s_yx * minY - minX + c_yx >= 0.0f;
    }
    private bool MOO(double minX, double minY, double minZ, double maxY, double maxZ) {
        return originX >= minX && originY >= minY && originY <= maxY && originZ >= minZ && originZ <= maxZ;
    }
    private bool POO(double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originX <= maxX && originY >= minY && originY <= maxY && originZ >= minZ && originZ <= maxZ;
    }
    private bool MPO(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originZ >= minZ && originZ <= maxZ && originX >= minX && originY <= maxY
            && s_xy * minX - minY + c_xy >= 0.0f
            && s_yx * maxY - maxX + c_yx <= 0.0f;
    }
    private bool OPO(double minX, double minZ, double maxX, double maxY, double maxZ) {
        return originY <= maxY && originX >= minX && originX <= maxX && originZ >= minZ && originZ <= maxZ;
    }
    private bool PPO(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originZ >= minZ && originZ <= maxZ && originX <= maxX && originY <= maxY
            && s_xy * maxX - minY + c_xy >= 0.0f
            && s_yx * maxY - minX + c_yx >= 0.0f;
    }
    private bool MMP(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originX >= minX && originY >= minY && originZ <= maxZ
            && s_xy * minX - maxY + c_xy <= 0.0f
            && s_yx * minY - maxX + c_yx <= 0.0f
            && s_zy * maxZ - maxY + c_zy <= 0.0f
            && s_yz * minY - minZ + c_yz >= 0.0f
            && s_xz * minX - minZ + c_xz >= 0.0f
            && s_zx * maxZ - maxX + c_zx <= 0.0f;
    }
    private bool OMP(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originX >= minX && originX <= maxX && originY >= minY && originZ <= maxZ
            && s_zy * maxZ - maxY + c_zy <= 0.0f
            && s_yz * minY - minZ + c_yz >= 0.0f;
    }
    private bool PMP(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originX <= maxX && originY >= minY && originZ <= maxZ
            && s_xy * maxX - maxY + c_xy <= 0.0f
            && s_yx * minY - minX + c_yx >= 0.0f
            && s_zy * maxZ - maxY + c_zy <= 0.0f
            && s_yz * minY - minZ + c_yz >= 0.0f
            && s_xz * maxX - minZ + c_xz >= 0.0f
            && s_zx * maxZ - minX + c_zx >= 0.0f;
    }
    private bool MOP(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originY >= minY && originY <= maxY && originX >= minX && originZ <= maxZ
            && s_xz * minX - minZ + c_xz >= 0.0f
            && s_zx * maxZ - maxX + c_zx <= 0.0f;
    }
    private bool OOP(double minX, double minY, double maxX, double maxY, double maxZ) {
        return originZ <= maxZ && originX >= minX && originX <= maxX && originY >= minY && originY <= maxY;
    }
    private bool POP(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originY >= minY && originY <= maxY && originX <= maxX && originZ <= maxZ
            && s_xz * maxX - minZ + c_xz >= 0.0f
            && s_zx * maxZ - minX + c_zx <= 0.0f;
    }
    private bool MPP(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originX >= minX && originY <= maxY && originZ <= maxZ
            && s_xy * minX - minY + c_xy >= 0.0f
            && s_yx * maxY - maxX + c_yx <= 0.0f
            && s_zy * maxZ - minY + c_zy >= 0.0f
            && s_yz * maxY - minZ + c_yz >= 0.0f
            && s_xz * minX - minZ + c_xz >= 0.0f
            && s_zx * maxZ - maxX + c_zx <= 0.0f;
    }
    private bool OPP(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originX >= minX && originX <= maxX && originY <= maxY && originZ <= maxZ
            && s_zy * maxZ - minY + c_zy <= 0.0f
            && s_yz * maxY - minZ + c_yz <= 0.0f;
    }
    private bool PPP(double minX, double minY, double minZ, double maxX, double maxY, double maxZ) {
        return originX <= maxX && originY <= maxY && originZ <= maxZ
            && s_xy * maxX - minY + c_xy >= 0.0f
            && s_yx * maxY - minX + c_yx >= 0.0f
            && s_zy * maxZ - minY + c_zy >= 0.0f
            && s_yz * maxY - minZ + c_yz >= 0.0f
            && s_xz * maxX - minZ + c_xz >= 0.0f
            && s_zx * maxZ - minX + c_zx >= 0.0f;
    }
}
