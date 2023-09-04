// Generator : SpinalHDL v1.7.3    git head : aeaeece704fe43c766e0d36a93f2ecbb8a9f2003
// Component : StreamAlu

`timescale 1ns/1ps

module StreamAlu (
  input               io_clk,
  input               io_rst,
  input      [4:0]    io_opcodeIn,
  input      [31:0]   io_dataIn1,
  input      [31:0]   io_dataIn2,
  output              io_stall,
  output reg [31:0]   io_streamAluOutput,
  output reg          io_streamAluValid,
  output reg          SA_multiCycleDataValid,
  output reg          SA_singleCycleDataValid,
  output reg [31:0]   SA_multiCycleDataOut,
  output reg [31:0]   SA_singleCycleDataOut,
  output reg [3:0]    SA_multiCycleDataAddress,
  output reg          SA_multiCycleAddressValid
);

  wire       [32:0]   SA_dataFifo_io_writeData;
  reg                 SA_dataFifo_io_insertEnable;
  reg        [3:0]    SA_dataFifo_io_insertAddr;
  reg        [32:0]   SA_dataFifo_io_insertData;
  reg                 SA_dataFifo_io_readEnable;
  wire       [1:0]    SA_selSignalFifo_io_writeData;
  reg                 SA_selSignalFifo_io_readEnable;
  wire       [32:0]   SA_dataFifo_io_readData;
  wire                SA_dataFifo_io_full;
  wire                SA_dataFifo_io_empty;
  wire       [3:0]    SA_dataFifo_writeAddr;
  wire       [3:0]    SA_dataFifo_readAddr;
  wire       [1:0]    SA_selSignalFifo_io_readData;
  wire                SA_selSignalFifo_io_full;
  wire                SA_selSignalFifo_io_empty;
  wire       [3:0]    SA_selSignalFifo_writeAddr;
  wire       [3:0]    SA_selSignalFifo_readAddr;
  wire                SA_opcodeRegSel_0_io_opRegEnable;
  wire                SA_opcodeRegSel_0_io_opRegNextEnable;
  wire                SA_opcodeRegSel_1_io_opRegEnable;
  wire                SA_opcodeRegSel_1_io_opRegNextEnable;
  wire                SA_opcodeRegSel_2_io_opRegEnable;
  wire                SA_opcodeRegSel_2_io_opRegNextEnable;
  wire       [35:0]   _zz_SA_multiOpOut_0;
  wire       [35:0]   _zz_threeCycle_midReg_1;
  wire       [35:0]   _zz_SA_multiOpOut_1;
  wire       [35:0]   _zz_fourCycle_midReg_1;
  wire       [35:0]   _zz_fourCycle_midReg_2;
  wire       [35:0]   _zz_SA_multiOpOut_2;
  wire                stalls_0;
  wire                stalls_1;
  wire                stalls_2;
  reg                 SA_opEnable_0;
  reg                 SA_opEnable_1;
  reg                 SA_opEnable_2;
  reg                 SA_opEnable_3;
  wire                SA_opValid;
  wire                when_StreamAlu_l43;
  reg                 SA_opValidReg;
  reg        [4:0]    SA_opcodeReg;
  wire                SA_dirFlag;
  wire                when_StreamAlu_l48;
  reg        [1:0]    SA_opcodeInterval;
  reg                 SA_keepDirectFlag;
  wire                when_StreamAlu_l57;
  reg        [31:0]   SA_dataIn1Reg;
  wire                when_StreamAlu_l58;
  reg        [31:0]   SA_dataIn2Reg;
  reg                 SA_multiOpRegState_0;
  reg                 SA_multiOpRegState_1;
  reg                 SA_multiOpRegState_2;
  reg                 SA_multiOpRegState_3;
  reg        [4:0]    SA_multiOpReg_0;
  reg        [4:0]    SA_multiOpReg_1;
  reg        [4:0]    SA_multiOpReg_2;
  reg        [4:0]    SA_multiOpReg_3;
  reg        [4:0]    SA_singleOpReg;
  reg                 SA_regFlag;
  reg                 SA_multiFlag;
  wire       [1:0]    SA_currentOpcodeType;
  wire                when_StreamAlu_l78;
  wire                SA_equalInterval;
  wire                SA_largerInterval;
  wire                when_StreamAlu_l92;
  wire                when_StreamAlu_l100;
  wire                SA_selRegFlag;
  wire                SA_selMultiFlag;
  reg        [4:0]    SA_multiOpDataAddress_0;
  reg        [4:0]    SA_multiOpDataAddress_1;
  reg        [4:0]    SA_multiOpDataAddress_2;
  wire       [4:0]    SA_insertOpDataAddress_0;
  wire       [4:0]    SA_insertOpDataAddress_1;
  wire       [4:0]    SA_insertOpDataAddress_2;
  wire                when_StreamAlu_l196;
  wire                when_StreamAlu_l196_1;
  wire                when_StreamAlu_l196_2;
  wire                when_StreamAlu_l247;
  wire                when_StreamAlu_l250;
  wire                when_StreamAlu_l255;
  wire                when_StreamAlu_l255_1;
  wire                when_StreamAlu_l235;
  wire                when_StreamAlu_l271;
  wire       [1:0]    switch_StreamAlu_l277;
  wire                when_StreamAlu_l292;
  reg        [31:0]   SA_multiOpIn1_0;
  reg        [31:0]   SA_multiOpIn1_1;
  reg        [31:0]   SA_multiOpIn1_2;
  reg        [31:0]   SA_multiOpIn2_0;
  reg        [31:0]   SA_multiOpIn2_1;
  reg        [31:0]   SA_multiOpIn2_2;
  reg                 SA_multiOpValid_0;
  reg                 SA_multiOpValid_1;
  reg                 SA_multiOpValid_2;
  wire       [31:0]   SA_multiOpOut_0;
  wire       [31:0]   SA_multiOpOut_1;
  wire       [31:0]   SA_multiOpOut_2;
  wire                SA_multiOpDataValid_0;
  wire                SA_multiOpDataValid_1;
  wire                SA_multiOpDataValid_2;
  wire                when_StreamAlu_l309;
  wire                when_StreamAlu_l309_1;
  wire                when_StreamAlu_l309_2;
  wire       [1:0]    switch_StreamAlu_l320;
  reg                 SA_multiOpReady_0;
  reg                 SA_multiOpReady_1;
  reg                 SA_multiOpReady_2;
  wire                when_StreamAlu_l349;
  wire                when_StreamAlu_l349_1;
  wire                when_StreamAlu_l349_2;
  reg        [31:0]   twoCycle_midReg;
  reg                 twoCycle_midValid;
  reg        [4:0]    twoCycle_midAddrReg;
  wire                when_StreamAlu_l382;
  reg        [31:0]   threeCycle_midReg_0;
  reg        [31:0]   threeCycle_midReg_1;
  reg                 threeCycle_midValid_0;
  reg                 threeCycle_midValid_1;
  reg        [4:0]    twoCycle_midAddrReg_0;
  reg        [4:0]    twoCycle_midAddrReg_1;
  wire                when_StreamAlu_l408;
  wire                when_StreamAlu_l408_1;
  reg        [31:0]   fourCycle_midReg_0;
  reg        [31:0]   fourCycle_midReg_1;
  reg        [31:0]   fourCycle_midReg_2;
  reg                 fourCycle_midValid_0;
  reg                 fourCycle_midValid_1;
  reg                 fourCycle_midValid_2;
  reg        [4:0]    twoCycle_midAddrReg_0_1;
  reg        [4:0]    twoCycle_midAddrReg_1_1;
  reg        [4:0]    twoCycle_midAddrReg_2;
  wire                when_StreamAlu_l440;
  wire                when_StreamAlu_l440_1;
  wire                when_StreamAlu_l440_2;

  assign _zz_SA_multiOpOut_0 = ({4'd0,twoCycle_midReg} <<< 4);
  assign _zz_threeCycle_midReg_1 = ({4'd0,threeCycle_midReg_0} <<< 4);
  assign _zz_SA_multiOpOut_1 = ({4'd0,threeCycle_midReg_1} <<< 4);
  assign _zz_fourCycle_midReg_1 = ({4'd0,fourCycle_midReg_0} <<< 4);
  assign _zz_fourCycle_midReg_2 = ({4'd0,fourCycle_midReg_1} <<< 4);
  assign _zz_SA_multiOpOut_2 = ({4'd0,fourCycle_midReg_2} <<< 4);
  FIFO SA_dataFifo (
    .io_clk          (io_clk                         ), //i
    .io_rst          (io_rst                         ), //i
    .io_writeEnable  (SA_regFlag                     ), //i
    .io_writeData    (SA_dataFifo_io_writeData[32:0] ), //i
    .io_insertEnable (SA_dataFifo_io_insertEnable    ), //i
    .io_insertAddr   (SA_dataFifo_io_insertAddr[3:0] ), //i
    .io_insertData   (SA_dataFifo_io_insertData[32:0]), //i
    .io_readEnable   (SA_dataFifo_io_readEnable      ), //i
    .io_readData     (SA_dataFifo_io_readData[32:0]  ), //o
    .io_full         (SA_dataFifo_io_full            ), //o
    .io_empty        (SA_dataFifo_io_empty           ), //o
    .writeAddr       (SA_dataFifo_writeAddr[3:0]     ), //o
    .readAddr        (SA_dataFifo_readAddr[3:0]      )  //o
  );
  FIFO_1 SA_selSignalFifo (
    .io_clk          (io_clk                            ), //i
    .io_rst          (io_rst                            ), //i
    .io_writeEnable  (SA_opValidReg                     ), //i
    .io_writeData    (SA_selSignalFifo_io_writeData[1:0]), //i
    .io_insertEnable (1'b0                              ), //i
    .io_insertAddr   (4'b0000                           ), //i
    .io_insertData   (2'b00                             ), //i
    .io_readEnable   (SA_selSignalFifo_io_readEnable    ), //i
    .io_readData     (SA_selSignalFifo_io_readData[1:0] ), //o
    .io_full         (SA_selSignalFifo_io_full          ), //o
    .io_empty        (SA_selSignalFifo_io_empty         ), //o
    .writeAddr       (SA_selSignalFifo_writeAddr[3:0]   ), //o
    .readAddr        (SA_selSignalFifo_readAddr[3:0]    )  //o
  );
  OpcodeRegSelUnit SA_opcodeRegSel_0 (
    .io_opEnable        (SA_opEnable_1                       ), //i
    .io_lastFullState   (SA_multiOpRegState_2                ), //i
    .io_opRegLastEnable (1'b0                                ), //i
    .io_opRegEnable     (SA_opcodeRegSel_0_io_opRegEnable    ), //o
    .io_opRegNextEnable (SA_opcodeRegSel_0_io_opRegNextEnable)  //o
  );
  OpcodeRegSelUnit SA_opcodeRegSel_1 (
    .io_opEnable        (SA_opEnable_2                       ), //i
    .io_lastFullState   (SA_multiOpRegState_3                ), //i
    .io_opRegLastEnable (SA_opcodeRegSel_0_io_opRegNextEnable), //i
    .io_opRegEnable     (SA_opcodeRegSel_1_io_opRegEnable    ), //o
    .io_opRegNextEnable (SA_opcodeRegSel_1_io_opRegNextEnable)  //o
  );
  OpcodeRegSelUnit SA_opcodeRegSel_2 (
    .io_opEnable        (SA_opEnable_3                       ), //i
    .io_lastFullState   (1'b0                                ), //i
    .io_opRegLastEnable (SA_opcodeRegSel_1_io_opRegNextEnable), //i
    .io_opRegEnable     (SA_opcodeRegSel_2_io_opRegEnable    ), //o
    .io_opRegNextEnable (SA_opcodeRegSel_2_io_opRegNextEnable)  //o
  );
  assign io_stall = ((stalls_0 || stalls_1) || stalls_2);
  always @(*) begin
    SA_opEnable_0 = 1'b0;
    if(when_StreamAlu_l271) begin
      SA_opEnable_0 = 1'b1;
    end
  end

  always @(*) begin
    SA_opEnable_1 = 1'b0;
    case(switch_StreamAlu_l277)
      2'b01 : begin
        SA_opEnable_1 = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    SA_opEnable_2 = 1'b0;
    case(switch_StreamAlu_l277)
      2'b10 : begin
        SA_opEnable_2 = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    SA_opEnable_3 = 1'b0;
    case(switch_StreamAlu_l277)
      2'b11 : begin
        SA_opEnable_3 = 1'b1;
      end
      default : begin
      end
    endcase
  end

  assign SA_opValid = (io_opcodeIn != 5'h0);
  assign when_StreamAlu_l43 = (! io_stall);
  assign SA_dirFlag = (((SA_opcodeReg[4 : 3] == 2'b11) && (io_opcodeIn[4 : 3] == 2'b10)) || ((SA_opcodeReg[4 : 3] == 2'b10) && (io_opcodeIn[4 : 3] == 2'b01)));
  assign when_StreamAlu_l48 = ((! io_stall) || SA_dirFlag);
  assign when_StreamAlu_l57 = (! io_stall);
  assign when_StreamAlu_l58 = (! io_stall);
  assign SA_currentOpcodeType = io_opcodeIn[4 : 3];
  assign when_StreamAlu_l78 = (SA_currentOpcodeType == 2'b00);
  assign SA_equalInterval = (SA_opcodeInterval == io_opcodeIn[4 : 3]);
  assign SA_largerInterval = (io_opcodeIn[4 : 3] < SA_opcodeInterval);
  assign when_StreamAlu_l92 = (! SA_keepDirectFlag);
  assign when_StreamAlu_l100 = (io_opcodeIn[4 : 3] != 2'b00);
  assign SA_dataFifo_io_writeData = {SA_singleCycleDataValid,SA_singleCycleDataOut};
  assign SA_selRegFlag = SA_selSignalFifo_io_readData[0];
  assign SA_selMultiFlag = SA_selSignalFifo_io_readData[1];
  assign SA_selSignalFifo_io_writeData = {SA_multiFlag,SA_regFlag};
  always @(*) begin
    if(SA_selRegFlag) begin
      SA_dataFifo_io_readEnable = 1'b1;
    end else begin
      SA_dataFifo_io_readEnable = 1'b0;
    end
  end

  always @(*) begin
    if(SA_selRegFlag) begin
      SA_selSignalFifo_io_readEnable = SA_dataFifo_io_readData[32];
    end else begin
      if(SA_selMultiFlag) begin
        SA_selSignalFifo_io_readEnable = SA_multiCycleDataValid;
      end else begin
        SA_selSignalFifo_io_readEnable = SA_singleCycleDataValid;
      end
    end
  end

  always @(*) begin
    if(SA_selRegFlag) begin
      if(SA_selSignalFifo_io_readEnable) begin
        io_streamAluOutput = SA_dataFifo_io_readData[31 : 0];
      end else begin
        io_streamAluOutput = 32'h0;
      end
    end else begin
      if(SA_selMultiFlag) begin
        if(SA_selSignalFifo_io_readEnable) begin
          io_streamAluOutput = SA_multiCycleDataOut;
        end else begin
          io_streamAluOutput = 32'h0;
        end
      end else begin
        if(SA_selSignalFifo_io_readEnable) begin
          io_streamAluOutput = SA_singleCycleDataOut;
        end else begin
          io_streamAluOutput = 32'h0;
        end
      end
    end
  end

  always @(*) begin
    if(SA_selRegFlag) begin
      if(SA_selSignalFifo_io_readEnable) begin
        io_streamAluValid = SA_dataFifo_io_readData[32];
      end else begin
        io_streamAluValid = 1'b0;
      end
    end else begin
      if(SA_selMultiFlag) begin
        if(SA_selSignalFifo_io_readEnable) begin
          io_streamAluValid = SA_multiCycleDataValid;
        end else begin
          io_streamAluValid = 1'b0;
        end
      end else begin
        if(SA_selSignalFifo_io_readEnable) begin
          io_streamAluValid = SA_singleCycleDataValid;
        end else begin
          io_streamAluValid = 1'b0;
        end
      end
    end
  end

  assign when_StreamAlu_l196 = (SA_opcodeReg[4 : 3] == 2'b01);
  always @(*) begin
    if(when_StreamAlu_l196) begin
      SA_multiOpDataAddress_0 = {SA_regFlag,SA_dataFifo_writeAddr};
    end else begin
      SA_multiOpDataAddress_0 = 5'h0;
    end
  end

  assign when_StreamAlu_l196_1 = (SA_opcodeReg[4 : 3] == 2'b10);
  always @(*) begin
    if(when_StreamAlu_l196_1) begin
      SA_multiOpDataAddress_1 = {SA_regFlag,SA_dataFifo_writeAddr};
    end else begin
      SA_multiOpDataAddress_1 = 5'h0;
    end
  end

  assign when_StreamAlu_l196_2 = (SA_opcodeReg[4 : 3] == 2'b11);
  always @(*) begin
    if(when_StreamAlu_l196_2) begin
      SA_multiOpDataAddress_2 = {SA_regFlag,SA_dataFifo_writeAddr};
    end else begin
      SA_multiOpDataAddress_2 = 5'h0;
    end
  end

  always @(*) begin
    if(SA_multiCycleAddressValid) begin
      SA_dataFifo_io_insertEnable = 1'b1;
    end else begin
      SA_dataFifo_io_insertEnable = 1'b0;
    end
  end

  always @(*) begin
    if(SA_multiCycleAddressValid) begin
      SA_dataFifo_io_insertData = {SA_multiCycleDataValid,SA_multiCycleDataOut};
    end else begin
      SA_dataFifo_io_insertData = 33'h0;
    end
  end

  always @(*) begin
    if(SA_multiCycleAddressValid) begin
      SA_dataFifo_io_insertAddr = SA_multiCycleDataAddress;
    end else begin
      SA_dataFifo_io_insertAddr = 4'b0000;
    end
  end

  assign when_StreamAlu_l247 = (SA_multiOpRegState_0 && (! SA_multiCycleDataValid));
  assign when_StreamAlu_l250 = 1'b1;
  assign when_StreamAlu_l255 = (SA_multiOpRegState_0 && (! SA_multiCycleDataValid));
  assign when_StreamAlu_l255_1 = (SA_multiOpRegState_0 && (! SA_multiCycleDataValid));
  assign when_StreamAlu_l235 = (SA_multiOpRegState_0 && (! SA_multiCycleDataValid));
  assign when_StreamAlu_l271 = (SA_opValid && (io_opcodeIn[4 : 3] == 2'b00));
  assign switch_StreamAlu_l277 = io_opcodeIn[4 : 3];
  assign when_StreamAlu_l292 = (SA_singleOpReg != 5'h0);
  always @(*) begin
    if(when_StreamAlu_l292) begin
      SA_singleCycleDataOut = (SA_dataIn1Reg + SA_dataIn2Reg);
    end else begin
      SA_singleCycleDataOut = 32'h0;
    end
  end

  always @(*) begin
    if(when_StreamAlu_l292) begin
      SA_singleCycleDataValid = SA_opValid;
    end else begin
      SA_singleCycleDataValid = 1'b0;
    end
  end

  assign when_StreamAlu_l309 = (SA_opcodeReg[4 : 3] == 2'b01);
  always @(*) begin
    if(when_StreamAlu_l309) begin
      SA_multiOpIn1_0 = SA_dataIn1Reg;
    end else begin
      SA_multiOpIn1_0 = 32'h0;
    end
  end

  always @(*) begin
    if(when_StreamAlu_l309) begin
      SA_multiOpIn2_0 = SA_dataIn2Reg;
    end else begin
      SA_multiOpIn2_0 = 32'h0;
    end
  end

  always @(*) begin
    if(when_StreamAlu_l309) begin
      SA_multiOpValid_0 = SA_opValidReg;
    end else begin
      SA_multiOpValid_0 = 1'b0;
    end
  end

  assign when_StreamAlu_l309_1 = (SA_opcodeReg[4 : 3] == 2'b10);
  always @(*) begin
    if(when_StreamAlu_l309_1) begin
      SA_multiOpIn1_1 = SA_dataIn1Reg;
    end else begin
      SA_multiOpIn1_1 = 32'h0;
    end
  end

  always @(*) begin
    if(when_StreamAlu_l309_1) begin
      SA_multiOpIn2_1 = SA_dataIn2Reg;
    end else begin
      SA_multiOpIn2_1 = 32'h0;
    end
  end

  always @(*) begin
    if(when_StreamAlu_l309_1) begin
      SA_multiOpValid_1 = SA_opValidReg;
    end else begin
      SA_multiOpValid_1 = 1'b0;
    end
  end

  assign when_StreamAlu_l309_2 = (SA_opcodeReg[4 : 3] == 2'b11);
  always @(*) begin
    if(when_StreamAlu_l309_2) begin
      SA_multiOpIn1_2 = SA_dataIn1Reg;
    end else begin
      SA_multiOpIn1_2 = 32'h0;
    end
  end

  always @(*) begin
    if(when_StreamAlu_l309_2) begin
      SA_multiOpIn2_2 = SA_dataIn2Reg;
    end else begin
      SA_multiOpIn2_2 = 32'h0;
    end
  end

  always @(*) begin
    if(when_StreamAlu_l309_2) begin
      SA_multiOpValid_2 = SA_opValidReg;
    end else begin
      SA_multiOpValid_2 = 1'b0;
    end
  end

  assign switch_StreamAlu_l320 = SA_multiOpReg_0[4 : 3];
  always @(*) begin
    case(switch_StreamAlu_l320)
      2'b01 : begin
        SA_multiCycleDataOut = SA_multiOpOut_0;
      end
      2'b10 : begin
        SA_multiCycleDataOut = SA_multiOpOut_1;
      end
      2'b11 : begin
        SA_multiCycleDataOut = SA_multiOpOut_2;
      end
      default : begin
        SA_multiCycleDataOut = 32'h0;
      end
    endcase
  end

  always @(*) begin
    case(switch_StreamAlu_l320)
      2'b01 : begin
        SA_multiCycleDataValid = SA_multiOpDataValid_0;
      end
      2'b10 : begin
        SA_multiCycleDataValid = SA_multiOpDataValid_1;
      end
      2'b11 : begin
        SA_multiCycleDataValid = SA_multiOpDataValid_2;
      end
      default : begin
        SA_multiCycleDataValid = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(switch_StreamAlu_l320)
      2'b01 : begin
        SA_multiCycleDataAddress = SA_insertOpDataAddress_0[3 : 0];
      end
      2'b10 : begin
        SA_multiCycleDataAddress = SA_insertOpDataAddress_1[3 : 0];
      end
      2'b11 : begin
        SA_multiCycleDataAddress = SA_insertOpDataAddress_2[3 : 0];
      end
      default : begin
        SA_multiCycleDataAddress = 4'b0000;
      end
    endcase
  end

  always @(*) begin
    case(switch_StreamAlu_l320)
      2'b01 : begin
        SA_multiCycleAddressValid = SA_insertOpDataAddress_0[4];
      end
      2'b10 : begin
        SA_multiCycleAddressValid = SA_insertOpDataAddress_1[4];
      end
      2'b11 : begin
        SA_multiCycleAddressValid = SA_insertOpDataAddress_2[4];
      end
      default : begin
        SA_multiCycleAddressValid = 1'b0;
      end
    endcase
  end

  assign when_StreamAlu_l349 = (SA_multiOpReg_0[4 : 3] == 2'b01);
  always @(*) begin
    if(when_StreamAlu_l349) begin
      SA_multiOpReady_0 = SA_multiOpRegState_0;
    end else begin
      SA_multiOpReady_0 = 1'b0;
    end
  end

  assign when_StreamAlu_l349_1 = (SA_multiOpReg_0[4 : 3] == 2'b10);
  always @(*) begin
    if(when_StreamAlu_l349_1) begin
      SA_multiOpReady_1 = SA_multiOpRegState_0;
    end else begin
      SA_multiOpReady_1 = 1'b0;
    end
  end

  assign when_StreamAlu_l349_2 = (SA_multiOpReg_0[4 : 3] == 2'b11);
  always @(*) begin
    if(when_StreamAlu_l349_2) begin
      SA_multiOpReady_2 = SA_multiOpRegState_0;
    end else begin
      SA_multiOpReady_2 = 1'b0;
    end
  end

  assign SA_multiOpOut_0 = _zz_SA_multiOpOut_0[31:0];
  assign SA_multiOpDataValid_0 = twoCycle_midValid;
  assign when_StreamAlu_l382 = ((! SA_multiOpReady_0) && SA_multiOpDataValid_0);
  assign stalls_0 = ((! SA_multiOpReady_0) && SA_multiOpDataValid_0);
  assign SA_insertOpDataAddress_0 = twoCycle_midAddrReg;
  assign SA_multiOpOut_1 = _zz_SA_multiOpOut_1[31:0];
  assign SA_multiOpDataValid_1 = threeCycle_midValid_1;
  assign when_StreamAlu_l408 = ((! SA_multiOpReady_1) && SA_multiOpDataValid_1);
  assign when_StreamAlu_l408_1 = ((! SA_multiOpReady_1) && SA_multiOpDataValid_1);
  assign stalls_1 = ((! SA_multiOpReady_1) && SA_multiOpDataValid_1);
  assign SA_insertOpDataAddress_1 = twoCycle_midAddrReg_1;
  assign SA_multiOpOut_2 = _zz_SA_multiOpOut_2[31:0];
  assign SA_multiOpDataValid_2 = fourCycle_midValid_2;
  assign when_StreamAlu_l440 = ((! SA_multiOpReady_2) && SA_multiOpDataValid_2);
  assign when_StreamAlu_l440_1 = ((! SA_multiOpReady_2) && SA_multiOpDataValid_2);
  assign when_StreamAlu_l440_2 = ((! SA_multiOpReady_2) && SA_multiOpDataValid_2);
  assign stalls_2 = ((! SA_multiOpReady_2) && SA_multiOpDataValid_2);
  assign SA_insertOpDataAddress_2 = twoCycle_midAddrReg_2;
  always @(posedge io_clk or negedge io_rst) begin
    if(!io_rst) begin
      SA_opValidReg <= 1'b0;
      SA_opcodeReg <= 5'h0;
      SA_opcodeInterval <= 2'b00;
      SA_keepDirectFlag <= 1'b0;
      SA_dataIn1Reg <= 32'h0;
      SA_dataIn2Reg <= 32'h0;
      SA_multiOpRegState_0 <= 1'b0;
      SA_multiOpRegState_1 <= 1'b0;
      SA_multiOpRegState_2 <= 1'b0;
      SA_multiOpRegState_3 <= 1'b0;
      SA_multiOpReg_0 <= 5'h0;
      SA_multiOpReg_1 <= 5'h0;
      SA_multiOpReg_2 <= 5'h0;
      SA_multiOpReg_3 <= 5'h0;
      SA_singleOpReg <= 5'h0;
      SA_regFlag <= 1'b0;
      SA_multiFlag <= 1'b0;
      twoCycle_midReg <= 32'h0;
      twoCycle_midValid <= 1'b0;
      twoCycle_midAddrReg <= 5'h0;
      threeCycle_midReg_0 <= 32'h0;
      threeCycle_midReg_1 <= 32'h0;
      threeCycle_midValid_0 <= 1'b0;
      threeCycle_midValid_1 <= 1'b0;
      twoCycle_midAddrReg_0 <= 5'h0;
      twoCycle_midAddrReg_1 <= 5'h0;
      fourCycle_midReg_0 <= 32'h0;
      fourCycle_midReg_1 <= 32'h0;
      fourCycle_midReg_2 <= 32'h0;
      fourCycle_midValid_0 <= 1'b0;
      fourCycle_midValid_1 <= 1'b0;
      fourCycle_midValid_2 <= 1'b0;
      twoCycle_midAddrReg_0_1 <= 5'h0;
      twoCycle_midAddrReg_1_1 <= 5'h0;
      twoCycle_midAddrReg_2 <= 5'h0;
    end else begin
      if(when_StreamAlu_l43) begin
        SA_opValidReg <= SA_opValid;
      end
      if(when_StreamAlu_l48) begin
        SA_opcodeReg <= SA_opcodeReg;
      end else begin
        SA_opcodeReg <= io_opcodeIn;
      end
      if(when_StreamAlu_l57) begin
        SA_dataIn1Reg <= io_dataIn1;
      end
      if(when_StreamAlu_l58) begin
        SA_dataIn2Reg <= io_dataIn2;
      end
      if(when_StreamAlu_l78) begin
        SA_multiFlag <= 1'b0;
      end else begin
        SA_multiFlag <= 1'b1;
      end
      if(when_StreamAlu_l92) begin
        if(SA_dirFlag) begin
          SA_opcodeInterval <= SA_opcodeInterval;
          SA_keepDirectFlag <= 1'b1;
          SA_regFlag <= 1'b0;
        end else begin
          SA_opcodeInterval <= io_opcodeIn[4 : 3];
          SA_regFlag <= 1'b0;
          if(when_StreamAlu_l100) begin
            SA_keepDirectFlag <= 1'b1;
          end
        end
      end else begin
        if(SA_dirFlag) begin
          SA_opcodeInterval <= SA_opcodeInterval;
          SA_keepDirectFlag <= 1'b1;
          SA_regFlag <= 1'b0;
        end else begin
          if(SA_largerInterval) begin
            SA_opcodeInterval <= (SA_opcodeInterval - io_opcodeIn[4 : 3]);
            SA_keepDirectFlag <= 1'b1;
            SA_regFlag <= 1'b1;
          end else begin
            if(SA_equalInterval) begin
              SA_opcodeInterval <= io_opcodeIn[4 : 3];
              SA_keepDirectFlag <= 1'b0;
              SA_regFlag <= 1'b0;
            end else begin
              SA_opcodeInterval <= io_opcodeIn[4 : 3];
              SA_keepDirectFlag <= 1'b1;
              SA_regFlag <= 1'b0;
            end
          end
        end
      end
      if(when_StreamAlu_l247) begin
        SA_multiOpReg_0 <= SA_multiOpReg_0;
        SA_multiOpRegState_0 <= SA_multiOpRegState_0;
      end else begin
        if(when_StreamAlu_l250) begin
          SA_multiOpReg_0 <= SA_multiOpReg_1;
          SA_multiOpRegState_0 <= SA_multiOpRegState_1;
        end
      end
      if(when_StreamAlu_l255) begin
        SA_multiOpReg_1 <= SA_multiOpReg_1;
        SA_multiOpRegState_1 <= SA_multiOpRegState_1;
      end else begin
        if(SA_opcodeRegSel_0_io_opRegEnable) begin
          SA_multiOpReg_1 <= io_opcodeIn;
          SA_multiOpRegState_1 <= 1'b1;
        end else begin
          SA_multiOpReg_1 <= SA_multiOpReg_2;
          SA_multiOpRegState_1 <= SA_multiOpRegState_2;
        end
      end
      if(when_StreamAlu_l255_1) begin
        SA_multiOpReg_2 <= SA_multiOpReg_2;
        SA_multiOpRegState_2 <= SA_multiOpRegState_2;
      end else begin
        if(SA_opcodeRegSel_1_io_opRegEnable) begin
          SA_multiOpReg_2 <= io_opcodeIn;
          SA_multiOpRegState_2 <= 1'b1;
        end else begin
          SA_multiOpReg_2 <= SA_multiOpReg_3;
          SA_multiOpRegState_2 <= SA_multiOpRegState_3;
        end
      end
      if(when_StreamAlu_l235) begin
        SA_multiOpReg_3 <= SA_multiOpReg_3;
        SA_multiOpRegState_3 <= SA_multiOpRegState_3;
      end else begin
        if(SA_opcodeRegSel_2_io_opRegEnable) begin
          SA_multiOpReg_3 <= io_opcodeIn;
          SA_multiOpRegState_3 <= 1'b1;
        end else begin
          SA_multiOpReg_3 <= 5'h0;
          SA_multiOpRegState_3 <= 1'b0;
        end
      end
      if(when_StreamAlu_l271) begin
        SA_singleOpReg <= io_opcodeIn;
      end else begin
        SA_singleOpReg <= 5'h0;
      end
      twoCycle_midReg <= (SA_multiOpIn1_0 + SA_multiOpIn2_0);
      twoCycle_midValid <= SA_multiOpValid_0;
      twoCycle_midAddrReg <= SA_multiOpDataAddress_0;
      if(when_StreamAlu_l382) begin
        twoCycle_midReg <= twoCycle_midReg;
      end
      if(stalls_0) begin
        twoCycle_midValid <= twoCycle_midValid;
      end
      threeCycle_midReg_0 <= (SA_multiOpIn1_1 + SA_multiOpIn2_1);
      threeCycle_midReg_1 <= _zz_threeCycle_midReg_1[31:0];
      threeCycle_midValid_0 <= SA_multiOpValid_1;
      threeCycle_midValid_1 <= threeCycle_midValid_0;
      twoCycle_midAddrReg_0 <= SA_multiOpDataAddress_1;
      twoCycle_midAddrReg_1 <= twoCycle_midAddrReg_0;
      if(when_StreamAlu_l408) begin
        threeCycle_midReg_0 <= threeCycle_midReg_0;
      end
      if(when_StreamAlu_l408_1) begin
        threeCycle_midReg_1 <= threeCycle_midReg_1;
      end
      if(stalls_1) begin
        threeCycle_midValid_0 <= threeCycle_midValid_0;
      end
      if(stalls_1) begin
        threeCycle_midValid_1 <= threeCycle_midValid_1;
      end
      fourCycle_midReg_0 <= (SA_multiOpIn1_2 + SA_multiOpIn2_2);
      fourCycle_midReg_1 <= _zz_fourCycle_midReg_1[31:0];
      fourCycle_midReg_2 <= _zz_fourCycle_midReg_2[31:0];
      fourCycle_midValid_0 <= SA_multiOpValid_2;
      fourCycle_midValid_1 <= fourCycle_midValid_0;
      fourCycle_midValid_2 <= fourCycle_midValid_1;
      twoCycle_midAddrReg_0_1 <= SA_multiOpDataAddress_2;
      twoCycle_midAddrReg_1_1 <= twoCycle_midAddrReg_0_1;
      twoCycle_midAddrReg_2 <= twoCycle_midAddrReg_1_1;
      if(when_StreamAlu_l440) begin
        fourCycle_midReg_0 <= fourCycle_midReg_0;
      end
      if(when_StreamAlu_l440_1) begin
        fourCycle_midReg_1 <= fourCycle_midReg_1;
      end
      if(when_StreamAlu_l440_2) begin
        fourCycle_midReg_2 <= fourCycle_midReg_2;
      end
      if(stalls_2) begin
        fourCycle_midValid_0 <= fourCycle_midValid_0;
      end
      if(stalls_2) begin
        fourCycle_midValid_1 <= fourCycle_midValid_1;
      end
      if(stalls_2) begin
        fourCycle_midValid_2 <= fourCycle_midValid_2;
      end
    end
  end


endmodule

//OpcodeRegSelUnit replaced by OpcodeRegSelUnit

//OpcodeRegSelUnit replaced by OpcodeRegSelUnit

module OpcodeRegSelUnit (
  input               io_opEnable,
  input               io_lastFullState,
  input               io_opRegLastEnable,
  output              io_opRegEnable,
  output              io_opRegNextEnable
);

  wire                opValid;

  assign opValid = (io_opEnable || io_opRegLastEnable);
  assign io_opRegEnable = (opValid && (! io_lastFullState));
  assign io_opRegNextEnable = (opValid && io_lastFullState);

endmodule

module FIFO_1 (
  input               io_clk,
  input               io_rst,
  input               io_writeEnable,
  input      [1:0]    io_writeData,
  input               io_insertEnable,
  input      [3:0]    io_insertAddr,
  input      [1:0]    io_insertData,
  input               io_readEnable,
  output     [1:0]    io_readData,
  output              io_full,
  output              io_empty,
  output     [3:0]    writeAddr,
  output     [3:0]    readAddr
);

  reg        [1:0]    _zz_io_readData;
  reg        [1:0]    fifoReg_0;
  reg        [1:0]    fifoReg_1;
  reg        [1:0]    fifoReg_2;
  reg        [1:0]    fifoReg_3;
  reg        [1:0]    fifoReg_4;
  reg        [1:0]    fifoReg_5;
  reg        [1:0]    fifoReg_6;
  reg        [1:0]    fifoReg_7;
  reg        [1:0]    fifoReg_8;
  reg        [1:0]    fifoReg_9;
  reg        [1:0]    fifoReg_10;
  reg        [1:0]    fifoReg_11;
  reg        [1:0]    fifoReg_12;
  reg        [1:0]    fifoReg_13;
  reg        [1:0]    fifoReg_14;
  reg        [1:0]    fifoReg_15;
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
      fifoReg_0 <= 2'b00;
      fifoReg_1 <= 2'b00;
      fifoReg_2 <= 2'b00;
      fifoReg_3 <= 2'b00;
      fifoReg_4 <= 2'b00;
      fifoReg_5 <= 2'b00;
      fifoReg_6 <= 2'b00;
      fifoReg_7 <= 2'b00;
      fifoReg_8 <= 2'b00;
      fifoReg_9 <= 2'b00;
      fifoReg_10 <= 2'b00;
      fifoReg_11 <= 2'b00;
      fifoReg_12 <= 2'b00;
      fifoReg_13 <= 2'b00;
      fifoReg_14 <= 2'b00;
      fifoReg_15 <= 2'b00;
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

module FIFO (
  input               io_clk,
  input               io_rst,
  input               io_writeEnable,
  input      [32:0]   io_writeData,
  input               io_insertEnable,
  input      [3:0]    io_insertAddr,
  input      [32:0]   io_insertData,
  input               io_readEnable,
  output     [32:0]   io_readData,
  output              io_full,
  output              io_empty,
  output     [3:0]    writeAddr,
  output     [3:0]    readAddr
);

  reg        [32:0]   _zz_io_readData;
  reg        [32:0]   fifoReg_0;
  reg        [32:0]   fifoReg_1;
  reg        [32:0]   fifoReg_2;
  reg        [32:0]   fifoReg_3;
  reg        [32:0]   fifoReg_4;
  reg        [32:0]   fifoReg_5;
  reg        [32:0]   fifoReg_6;
  reg        [32:0]   fifoReg_7;
  reg        [32:0]   fifoReg_8;
  reg        [32:0]   fifoReg_9;
  reg        [32:0]   fifoReg_10;
  reg        [32:0]   fifoReg_11;
  reg        [32:0]   fifoReg_12;
  reg        [32:0]   fifoReg_13;
  reg        [32:0]   fifoReg_14;
  reg        [32:0]   fifoReg_15;
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
      fifoReg_0 <= 33'h0;
      fifoReg_1 <= 33'h0;
      fifoReg_2 <= 33'h0;
      fifoReg_3 <= 33'h0;
      fifoReg_4 <= 33'h0;
      fifoReg_5 <= 33'h0;
      fifoReg_6 <= 33'h0;
      fifoReg_7 <= 33'h0;
      fifoReg_8 <= 33'h0;
      fifoReg_9 <= 33'h0;
      fifoReg_10 <= 33'h0;
      fifoReg_11 <= 33'h0;
      fifoReg_12 <= 33'h0;
      fifoReg_13 <= 33'h0;
      fifoReg_14 <= 33'h0;
      fifoReg_15 <= 33'h0;
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
