# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_cla(dut):
    dut._log.info("Start CLA test")

    # Set the clock period to 10 us (100 KHz)
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())
    await ClockCycles(dut.clk, 1)
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 2  # Selecting cla
    dut.rst_n.value = 0  # Reset
    await ClockCycles(dut.clk, 1)
    dut.rst_n.value = 1  # Normal operation

    a = [0x01, 0x23, 0x45, 0x67]
    b = [0xDE, 0xAD, 0xBE, 0xEF]

    # A
    dut.ui_in.value = a[0]
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = a[1]
    await ClockCycles(dut.clk, 1)
    # dut.ui_in.value = a[2]
    # await ClockCycles(dut.clk, 1)
    # dut.ui_in.value = a[3]
    # await ClockCycles(dut.clk, 1)

    # B
    dut.ui_in.value = b[0]
    await ClockCycles(dut.clk, 1)
    dut.ui_in.value = b[1]
    await ClockCycles(dut.clk, 1)
    # dut.ui_in.value = b[2]
    # await ClockCycles(dut.clk, 1)
    # dut.ui_in.value = b[3]
    await ClockCycles(dut.clk, 6)
    dut.uio_in.value = 0b00000110  # start_calc
    await ClockCycles(dut.clk, 10)
    dut.uio_in.value = 0b00001110  # output_result

    # Reading
    # await ClockCycles(dut.clk, 2)
    # tmp = dut.uo_out.value
    # tmp = tmp << 8
    # await ClockCycles(dut.clk, 1)
    # tmp = tmp | dut.uo_out.value
    # tmp = tmp << 8
    await ClockCycles(dut.clk, 2)
    tmp = dut.uo_out.value
    tmp = tmp << 8
    await ClockCycles(dut.clk, 1)
    tmp = tmp | dut.uo_out.value

    print(tmp)
    print(0x01234567 + 0xDEADBEEF)
    assert tmp == (((a[0] << 8) | a[1]) + ((b[0] << 8) | b[1]))


@cocotb.test()
async def test_baverage(dut):
    dut._log.info("Start baverage test")
    # Setup
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())
    await ClockCycles(dut.clk, 1)
    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.ui_in.value = 0
    dut.uio_in.value = 0  # Selecting baverage
    dut.rst_n.value = 0  # reset
    await ClockCycles(dut.clk, 1)
    dut.rst_n.value = 1

    dut._log.info("Test project baverage")

    # 50 cent input
    dut.ui_in.value = 1
    await ClockCycles(dut.clk, 1)

    # 1 euro input
    dut.ui_in.value = 2
    await ClockCycles(dut.clk, 1)
    await ClockCycles(dut.clk, 1)

    assert dut.uo_out.value == 1
