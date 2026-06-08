/*
 * SPDX-FileCopyrightText: 2025 Paranoid Android
 * SPDX-License-Identifier: Apache-2.0
 */

package com.xiaomi.settings.utils

import android.content.ComponentName
import android.content.Context
import android.content.Intent
import android.util.Log

object CitLauncher {

    private const val TAG = "CitLauncher"

    // ── CIT Calibration ──────────────────────────────────────────────────
    private const val CIT_PACKAGE = "com.miui.cit"
    private const val CIT_ACTIVITY = "com.miui.cit.home.HomeActivity"    
    
    // ── Fingerprint Calibration ─────────────────────────────────────────
    private const val FP_PACKAGE  = "com.jiiov.fingerprint_factorytest"
    private const val FP_ACTIVITY = "com.jiiov.fingerprint_factorytest.xiaomi.XiaomiAfterSalesCalibrationActivity"


    /**
     * Launches the CIT Calibration / Main Test
     */
    fun launchCitCalibration(context: Context): Boolean {
        return runCatching {
            val intent = Intent().apply {
                component = ComponentName(CIT_PACKAGE, CIT_ACTIVITY)
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_MULTIPLE_TASK)
            }
            context.startActivity(intent)
            Log.d(TAG, "CIT launched")
            true
        }.onFailure { e ->
            Log.e(TAG, "Unable to launch CIT calibration", e)
        }.getOrDefault(false)
    }

    /**
     * Launches the Fingerprint Calibration Test
     */
    fun launchFingerprintCalibration(context: Context): Boolean {
        return runCatching {
            val intent = Intent().apply {
                component = ComponentName(FP_PACKAGE, FP_ACTIVITY)
                addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_SINGLE_TOP)
                }
            context.startActivity(intent)
            Log.d(TAG, "Fingerprint CIT launched")
            true
        }.onFailure { e ->
            Log.e(TAG, "Unable to launch Fingerprint CIT calibration", e)
        }.getOrDefault(false)
    }
}