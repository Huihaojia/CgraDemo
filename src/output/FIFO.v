// Generator : SpinalHDL v1.7.3    git head : aeaeece704fe43c766e0d36a93f2ecbb8a9f2003
// Component : FIFO

`timescale 1ns/1ps

module FIFO (
  input               io_clk,
  input               io_rst,
  input               io_writeEnable,
  input      [31:0]   io_writeData,
  input               io_insertEnable,
  input      [3:0]    io_insertAddr,
  input      [31:0]   io_insertData,
  input               io_readEnable,
  output     [31:0]   io_readData,
  output              io_full,
  output              io_empty,
  output     [3:0]    writeAddr,
  output     [3:0]    readAddr
);

  reg        [31:0]   _zz_io_readData;
  reg        [31:0]   fifoReg_0;
  reg        [31:0]   fifoReg_1;
  reg        [31:0]   fifoReg_2;
  reg        [31:0]   fifoReg_3;
  reg        [31:0]   fifoReg_4;
  reg        [31:0]   fifoReg_5;
  reg        [31:0]   fifoReg_6;
  reg        [31:0]   fifoReg_7;
  reg        [31:0]   fifoReg_8;
  reg        [31:0]   fifoReg_9;
  reg        [31:0]   fifoReg_10;
  reg        [31:0]   fifoReg_11;
  reg        [31:0]   fifoReg_12;
  reg        [31:0]   fifoReg_13;
  reg        [31:0]   fifoReg_14;
  reg        [31:0]   fifoReg_15;
  reg        [4:0]    writeCount;
  reg        [4:0]    readCount;
  wire                writeFlag;
  wire                readFlag;
  reg                 writeEnables_0;
  reg                 writeEnables_1;
  reg                 writeEnables_2;
  reg                 writeEnables_3;
  reg                 writeEnables_4;
  reg                 writeEnables_5;
  reg                 writeEnables_6;
  reg                 writeEnables_7;
  reg                 writeEnables_8;
  reg                 writeEnables_9;
  reg                 writeEnables_10;
  reg                 writeEnables_11;
  reg                 writeEnables_12;
  reg                 writeEnables_13;
  reg                 writeEnables_14;
  reg                 writeEnables_15;
  reg                 insertEnables_0;
  reg                 insertEnables_1;
  reg                 insertEnables_2;
  reg                 insertEnables_3;
  reg                 insertEnables_4;
  reg                 insertEnables_5;
  reg                 insertEnables_6;
  reg                 insertEnables_7;
  reg                 insertEnables_8;
  reg                 insertEnables_9;
  reg                 insertEnables_10;
  reg                 insertEnables_11;
  reg                 insertEnables_12;
  reg                 insertEnables_13;
  reg                 insertEnables_14;
  reg                 insertEnables_15;
  wire                when_FIFO_l50;
  wire                when_FIFO_l50_1;
  wire                when_FIFO_l50_2;
  wire                when_FIFO_l50_3;
  wire                when_FIFO_l50_4;
  wire                when_FIFO_l50_5;
  wire                when_FIFO_l50_6;
  wire                when_FIFO_l50_7;
  wire                when_FIFO_l50_8;
  wire                when_FIFO_l50_9;
  wire                when_FIFO_l50_10;
  wire                when_FIFO_l50_11;
  wire                when_FIFO_l50_12;
  wire                when_FIFO_l50_13;
  wire                when_FIFO_l50_14;
  wire                when_FIFO_l50_15;
  wire                when_FIFO_l58;
  wire                when_FIFO_l58_1;
  wire                when_FIFO_l58_2;
  wire                when_FIFO_l58_3;
  wire                when_FIFO_l58_4;
  wire                when_FIFO_l58_5;
  wire                when_FIFO_l58_6;
  wire                when_FIFO_l58_7;
  wire                when_FIFO_l58_8;
  wire                when_FIFO_l58_9;
  wire                when_FIFO_l58_10;
  wire                when_FIFO_l58_11;
  wire                when_FIFO_l58_12;
  wire                when_FIFO_l58_13;
  wire                when_FIFO_l58_14;
  wire                when_FIFO_l58_15;
  wire                when_FIFO_l84;
  wire                when_FIFO_l89;

  always @(*) begin
    case(readAddr)
      4'b0000 : _zz_io_readData = fifoReg_0;
      4'b0001 : _zz_io_readData = fifoReg_1;
      4'b0010 : _zz_io_readData = fifoReg_2;
      4'b0011 : _zz_io_readData = fifoReg_3;
      4'b0100 : _zz_io_readData = fifoReg_4;
      4'b0101 : _zz_io_readData = fifoReg_5;
      4'b0110 : _zz_io_readData = fifoReg_6;
      4'b0111 : _zz_io_readData = fifoReg_7;
      4'b1000 : _zz_io_readData = fifoReg_8;
      4'b1001 : _zz_io_readData = fifoReg_9;
      4'b1010 : _zz_io_readData = fifoReg_10;
      4'b1011 : _zz_io_readData = fifoReg_11;
      4'b1100 : _zz_io_readData = fifoReg_12;
      4'b1101 : _zz_io_readData = fifoReg_13;
      4'b1110 : _zz_io_readData = fifoReg_14;
      default : _zz_io_readData = fifoReg_15;
    endcase
  end

  assign writeAddr = writeCount[3 : 0];
  assign readAddr = readCount[3 : 0];
  assign writeFlag = writeCount[4];
  assign readFlag = readCount[4];
  assign io_full = (((writeFlag ^ readFlag) && (writeAddr == readAddr)) && (! io_readEnable));
  assign io_empty = ((! (writeFlag ^ readFlag)) && (writeAddr == readAddr));
  assign when_FIFO_l50 = (writeAddr == 4'b0000);
  always @(*) begin
    if(when_FIFO_l50) begin
      writeEnables_0 = io_writeEnable;
    end else begin
      writeEnables_0 = 1'b0;
    end
  end

  assign when_FIFO_l50_1 = (writeAddr == 4'b0001);
  always @(*) begin
    if(when_FIFO_l50_1) begin
      writeEnables_1 = io_writeEnable;
    end else begin
      writeEnables_1 = 1'b0;
    end
  end

  assign when_FIFO_l50_2 = (writeAddr == 4'b0010);
  always @(*) begin
    if(when_FIFO_l50_2) begin
      writeEnables_2 = io_writeEnable;
    end else begin
      writeEnables_2 = 1'b0;
    end
  end

  assign when_FIFO_l50_3 = (writeAddr == 4'b0011);
  always @(*) begin
    if(when_FIFO_l50_3) begin
      writeEnables_3 = io_writeEnable;
    end else begin
      writeEnables_3 = 1'b0;
    end
  end

  assign when_FIFO_l50_4 = (writeAddr == 4'b0100);
  always @(*) begin
    if(when_FIFO_l50_4) begin
      writeEnables_4 = io_writeEnable;
    end else begin
      writeEnables_4 = 1'b0;
    end
  end

  assign when_FIFO_l50_5 = (writeAddr == 4'b0101);
  always @(*) begin
    if(when_FIFO_l50_5) begin
      writeEnables_5 = io_writeEnable;
    end else begin
      writeEnables_5 = 1'b0;
    end
  end

  assign when_FIFO_l50_6 = (writeAddr == 4'b0110);
  always @(*) begin
    if(when_FIFO_l50_6) begin
      writeEnables_6 = io_writeEnable;
    end else begin
      writeEnables_6 = 1'b0;
    end
  end

  assign when_FIFO_l50_7 = (writeAddr == 4'b0111);
  always @(*) begin
    if(when_FIFO_l50_7) begin
      writeEnables_7 = io_writeEnable;
    end else begin
      writeEnables_7 = 1'b0;
    end
  end

  assign when_FIFO_l50_8 = (writeAddr == 4'b1000);
  always @(*) begin
    if(when_FIFO_l50_8) begin
      writeEnables_8 = io_writeEnable;
    end else begin
      writeEnables_8 = 1'b0;
    end
  end

  assign when_FIFO_l50_9 = (writeAddr == 4'b1001);
  always @(*) begin
    if(when_FIFO_l50_9) begin
      writeEnables_9 = io_writeEnable;
    end else begin
      writeEnables_9 = 1'b0;
    end
  end

  assign when_FIFO_l50_10 = (writeAddr == 4'b1010);
  always @(*) begin
    if(when_FIFO_l50_10) begin
      writeEnables_10 = io_writeEnable;
    end else begin
      writeEnables_10 = 1'b0;
    end
  end

  assign when_FIFO_l50_11 = (writeAddr == 4'b1011);
  always @(*) begin
    if(when_FIFO_l50_11) begin
      writeEnables_11 = io_writeEnable;
    end else begin
      writeEnables_11 = 1'b0;
    end
  end

  assign when_FIFO_l50_12 = (writeAddr == 4'b1100);
  always @(*) begin
    if(when_FIFO_l50_12) begin
      writeEnables_12 = io_writeEnable;
    end else begin
      writeEnables_12 = 1'b0;
    end
  end

  assign when_FIFO_l50_13 = (writeAddr == 4'b1101);
  always @(*) begin
    if(when_FIFO_l50_13) begin
      writeEnables_13 = io_writeEnable;
    end else begin
      writeEnables_13 = 1'b0;
    end
  end

  assign when_FIFO_l50_14 = (writeAddr == 4'b1110);
  always @(*) begin
    if(when_FIFO_l50_14) begin
      writeEnables_14 = io_writeEnable;
    end else begin
      writeEnables_14 = 1'b0;
    end
  end

  assign when_FIFO_l50_15 = (writeAddr == 4'b1111);
  always @(*) begin
    if(when_FIFO_l50_15) begin
      writeEnables_15 = io_writeEnable;
    end else begin
      writeEnables_15 = 1'b0;
    end
  end

  assign when_FIFO_l58 = (io_insertAddr == 4'b0000);
  always @(*) begin
    if(when_FIFO_l58) begin
      insertEnables_0 = io_insertEnable;
    end else begin
      insertEnables_0 = 1'b0;
    end
  end

  assign when_FIFO_l58_1 = (io_insertAddr == 4'b0001);
  always @(*) begin
    if(when_FIFO_l58_1) begin
      insertEnables_1 = io_insertEnable;
    end else begin
      insertEnables_1 = 1'b0;
    end
  end

  assign when_FIFO_l58_2 = (io_insertAddr == 4'b0010);
  always @(*) begin
    if(when_FIFO_l58_2) begin
      insertEnables_2 = io_insertEnable;
    end else begin
      insertEnables_2 = 1'b0;
    end
  end

  assign when_FIFO_l58_3 = (io_insertAddr == 4'b0011);
  always @(*) begin
    if(when_FIFO_l58_3) begin
      insertEnables_3 = io_insertEnable;
    end else begin
      insertEnables_3 = 1'b0;
    end
  end

  assign when_FIFO_l58_4 = (io_insertAddr == 4'b0100);
  always @(*) begin
    if(when_FIFO_l58_4) begin
      insertEnables_4 = io_insertEnable;
    end else begin
      insertEnables_4 = 1'b0;
    end
  end

  assign when_FIFO_l58_5 = (io_insertAddr == 4'b0101);
  always @(*) begin
    if(when_FIFO_l58_5) begin
      insertEnables_5 = io_insertEnable;
    end else begin
      insertEnables_5 = 1'b0;
    end
  end

  assign when_FIFO_l58_6 = (io_insertAddr == 4'b0110);
  always @(*) begin
    if(when_FIFO_l58_6) begin
      insertEnables_6 = io_insertEnable;
    end else begin
      insertEnables_6 = 1'b0;
    end
  end

  assign when_FIFO_l58_7 = (io_insertAddr == 4'b0111);
  always @(*) begin
    if(when_FIFO_l58_7) begin
      insertEnables_7 = io_insertEnable;
    end else begin
      insertEnables_7 = 1'b0;
    end
  end

  assign when_FIFO_l58_8 = (io_insertAddr == 4'b1000);
  always @(*) begin
    if(when_FIFO_l58_8) begin
      insertEnables_8 = io_insertEnable;
    end else begin
      insertEnables_8 = 1'b0;
    end
  end

  assign when_FIFO_l58_9 = (io_insertAddr == 4'b1001);
  always @(*) begin
    if(when_FIFO_l58_9) begin
      insertEnables_9 = io_insertEnable;
    end else begin
      insertEnables_9 = 1'b0;
    end
  end

  assign when_FIFO_l58_10 = (io_insertAddr == 4'b1010);
  always @(*) begin
    if(when_FIFO_l58_10) begin
      insertEnables_10 = io_insertEnable;
    end else begin
      insertEnables_10 = 1'b0;
    end
  end

  assign when_FIFO_l58_11 = (io_insertAddr == 4'b1011);
  always @(*) begin
    if(when_FIFO_l58_11) begin
      insertEnables_11 = io_insertEnable;
    end else begin
      insertEnables_11 = 1'b0;
    end
  end

  assign when_FIFO_l58_12 = (io_insertAddr == 4'b1100);
  always @(*) begin
    if(when_FIFO_l58_12) begin
      insertEnables_12 = io_insertEnable;
    end else begin
      insertEnables_12 = 1'b0;
    end
  end

  assign when_FIFO_l58_13 = (io_insertAddr == 4'b1101);
  always @(*) begin
    if(when_FIFO_l58_13) begin
      insertEnables_13 = io_insertEnable;
    end else begin
      insertEnables_13 = 1'b0;
    end
  end

  assign when_FIFO_l58_14 = (io_insertAddr == 4'b1110);
  always @(*) begin
    if(when_FIFO_l58_14) begin
      insertEnables_14 = io_insertEnable;
    end else begin
      insertEnables_14 = 1'b0;
    end
  end

  assign when_FIFO_l58_15 = (io_insertAddr == 4'b1111);
  always @(*) begin
    if(when_FIFO_l58_15) begin
      insertEnables_15 = io_insertEnable;
    end else begin
      insertEnables_15 = 1'b0;
    end
  end

  assign io_readData = _zz_io_readData;
  assign when_FIFO_l84 = (! io_full);
  assign when_FIFO_l89 = (! io_empty);
  always @(posedge io_clk or negedge io_rst) begin
    if(!io_rst) begin
      fifoReg_0 <= 32'h0;
      fifoReg_1 <= 32'h0;
      fifoReg_2 <= 32'h0;
      fifoReg_3 <= 32'h0;
      fifoReg_4 <= 32'h0;
      fifoReg_5 <= 32'h0;
      fifoReg_6 <= 32'h0;
      fifoReg_7 <= 32'h0;
      fifoReg_8 <= 32'h0;
      fifoReg_9 <= 32'h0;
      fifoReg_10 <= 32'h0;
      fifoReg_11 <= 32'h0;
      fifoReg_12 <= 32'h0;
      fifoReg_13 <= 32'h0;
      fifoReg_14 <= 32'h0;
      fifoReg_15 <= 32'h0;
      writeCount <= 5'h0;
      readCount <= 5'h0;
    end else begin
      if(writeEnables_0) begin
        fifoReg_0 <= io_writeData;
      end else begin
        if(insertEnables_0) begin
          fifoReg_0 <= io_insertData;
        end
      end
      if(writeEnables_1) begin
        fifoReg_1 <= io_writeData;
      end else begin
        if(insertEnables_1) begin
          fifoReg_1 <= io_insertData;
        end
      end
      if(writeEnables_2) begin
        fifoReg_2 <= io_writeData;
      end else begin
        if(insertEnables_2) begin
          fifoReg_2 <= io_insertData;
        end
      end
      if(writeEnables_3) begin
        fifoReg_3 <= io_writeData;
      end else begin
        if(insertEnables_3) begin
          fifoReg_3 <= io_insertData;
        end
      end
      if(writeEnables_4) begin
        fifoReg_4 <= io_writeData;
      end else begin
        if(insertEnables_4) begin
          fifoReg_4 <= io_insertData;
        end
      end
      if(writeEnables_5) begin
        fifoReg_5 <= io_writeData;
      end else begin
        if(insertEnables_5) begin
          fifoReg_5 <= io_insertData;
        end
      end
      if(writeEnables_6) begin
        fifoReg_6 <= io_writeData;
      end else begin
        if(insertEnables_6) begin
          fifoReg_6 <= io_insertData;
        end
      end
      if(writeEnables_7) begin
        fifoReg_7 <= io_writeData;
      end else begin
        if(insertEnables_7) begin
          fifoReg_7 <= io_insertData;
        end
      end
      if(writeEnables_8) begin
        fifoReg_8 <= io_writeData;
      end else begin
        if(insertEnables_8) begin
          fifoReg_8 <= io_insertData;
        end
      end
      if(writeEnables_9) begin
        fifoReg_9 <= io_writeData;
      end else begin
        if(insertEnables_9) begin
          fifoReg_9 <= io_insertData;
        end
      end
      if(writeEnables_10) begin
        fifoReg_10 <= io_writeData;
      end else begin
        if(insertEnables_10) begin
          fifoReg_10 <= io_insertData;
        end
      end
      if(writeEnables_11) begin
        fifoReg_11 <= io_writeData;
      end else begin
        if(insertEnables_11) begin
          fifoReg_11 <= io_insertData;
        end
      end
      if(writeEnables_12) begin
        fifoReg_12 <= io_writeData;
      end else begin
        if(insertEnables_12) begin
          fifoReg_12 <= io_insertData;
        end
      end
      if(writeEnables_13) begin
        fifoReg_13 <= io_writeData;
      end else begin
        if(insertEnables_13) begin
          fifoReg_13 <= io_insertData;
        end
      end
      if(writeEnables_14) begin
        fifoReg_14 <= io_writeData;
      end else begin
        if(insertEnables_14) begin
          fifoReg_14 <= io_insertData;
        end
      end
      if(writeEnables_15) begin
        fifoReg_15 <= io_writeData;
      end else begin
        if(insertEnables_15) begin
          fifoReg_15 <= io_insertData;
        end
      end
      if(io_writeEnable) begin
        if(when_FIFO_l84) begin
          writeCount <= (writeCount + 5'h01);
        end
      end
      if(io_readEnable) begin
        if(when_FIFO_l89) begin
          readCount <= (readCount + 5'h01);
        end
      end
    end
  end


endmodule
