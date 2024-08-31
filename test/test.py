# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0  # Selecting baverage
    dut.rst_n.value = 0  # reset
    dut.uio_in.value = int('0b10000000', base=0)
    await ClockCycles(dut.clk, 10)
    dut.rst_n.value = 1
    dut.uio_in.value = int('0b00000000', base=0)
    await ClockCycles(dut.clk, 1)

    dut._log.info("Test project baverage")

    # 50 cent input
    dut.ui_in.value = 1
    dut.uio_in.value = int('0b10000000', base=0)
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = int('0b00000000', base=0)
    await ClockCycles(dut.clk, 1)

    # 1 euro input
    dut.ui_in.value = 2
    dut.uio_in.value = int('0b10000000', base=0)
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = int('0b00000000', base=0)
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = int('0b10000000', base=0)
    await ClockCycles(dut.clk, 1)
    dut.uio_in.value = int('0b00000000', base=0)
    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 1
