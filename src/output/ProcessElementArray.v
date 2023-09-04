// Generator : SpinalHDL v1.7.3    git head : aeaeece704fe43c766e0d36a93f2ecbb8a9f2003
// Component : ProcessElementArray

`timescale 1ns/1ps

module ProcessElementArray (
  input               io_clock,
  input               io_reset,
  input               io_start,
  input               io_writeEnable,
  input      [15:0]   io_writeConfig_0,
  input      [15:0]   io_writeConfig_1,
  input      [15:0]   io_writeConfig_2,
  input      [15:0]   io_writeConfig_3,
  input               io_tokenIn_0,
  input               io_tokenIn_1,
  input               io_tokenIn_2,
  input               io_tokenIn_3,
  input               io_tokenIn_4,
  input               io_tokenIn_5,
  input               io_tokenIn_6,
  input               io_tokenIn_7,
  input               io_creditIn_0,
  input               io_creditIn_1,
  input               io_creditIn_2,
  input               io_creditIn_3,
  input               io_creditIn_4,
  input               io_creditIn_5,
  input               io_creditIn_6,
  input               io_creditIn_7,
  input      [7:0]    io_dataIn_0,
  input      [7:0]    io_dataIn_1,
  input      [7:0]    io_dataIn_2,
  input      [7:0]    io_dataIn_3,
  input      [7:0]    io_dataIn_4,
  input      [7:0]    io_dataIn_5,
  input      [7:0]    io_dataIn_6,
  input      [7:0]    io_dataIn_7
);

  wire       [7:0]    PEA_0_0_InterfacePlugin_setup_dataOut_0;
  wire       [7:0]    PEA_0_0_InterfacePlugin_setup_dataOut_1;
  wire       [7:0]    PEA_0_0_InterfacePlugin_setup_dataOut_2;
  wire       [7:0]    PEA_0_0_InterfacePlugin_setup_dataOut_3;
  wire                PEA_0_0_InterfacePlugin_setup_tokenOut_0;
  wire                PEA_0_0_InterfacePlugin_setup_tokenOut_1;
  wire                PEA_0_0_InterfacePlugin_setup_tokenOut_2;
  wire                PEA_0_0_InterfacePlugin_setup_tokenOut_3;
  wire                PEA_0_0_InterfacePlugin_setup_creditOut_0;
  wire                PEA_0_0_InterfacePlugin_setup_creditOut_1;
  wire                PEA_0_0_InterfacePlugin_setup_creditOut_2;
  wire                PEA_0_0_InterfacePlugin_setup_creditOut_3;
  wire       [7:0]    PEA_0_1_InterfacePlugin_setup_dataOut_0;
  wire       [7:0]    PEA_0_1_InterfacePlugin_setup_dataOut_1;
  wire       [7:0]    PEA_0_1_InterfacePlugin_setup_dataOut_2;
  wire       [7:0]    PEA_0_1_InterfacePlugin_setup_dataOut_3;
  wire                PEA_0_1_InterfacePlugin_setup_tokenOut_0;
  wire                PEA_0_1_InterfacePlugin_setup_tokenOut_1;
  wire                PEA_0_1_InterfacePlugin_setup_tokenOut_2;
  wire                PEA_0_1_InterfacePlugin_setup_tokenOut_3;
  wire                PEA_0_1_InterfacePlugin_setup_creditOut_0;
  wire                PEA_0_1_InterfacePlugin_setup_creditOut_1;
  wire                PEA_0_1_InterfacePlugin_setup_creditOut_2;
  wire                PEA_0_1_InterfacePlugin_setup_creditOut_3;
  wire       [7:0]    PEA_1_0_InterfacePlugin_setup_dataOut_0;
  wire       [7:0]    PEA_1_0_InterfacePlugin_setup_dataOut_1;
  wire       [7:0]    PEA_1_0_InterfacePlugin_setup_dataOut_2;
  wire       [7:0]    PEA_1_0_InterfacePlugin_setup_dataOut_3;
  wire                PEA_1_0_InterfacePlugin_setup_tokenOut_0;
  wire                PEA_1_0_InterfacePlugin_setup_tokenOut_1;
  wire                PEA_1_0_InterfacePlugin_setup_tokenOut_2;
  wire                PEA_1_0_InterfacePlugin_setup_tokenOut_3;
  wire                PEA_1_0_InterfacePlugin_setup_creditOut_0;
  wire                PEA_1_0_InterfacePlugin_setup_creditOut_1;
  wire                PEA_1_0_InterfacePlugin_setup_creditOut_2;
  wire                PEA_1_0_InterfacePlugin_setup_creditOut_3;
  wire       [7:0]    PEA_1_1_InterfacePlugin_setup_dataOut_0;
  wire       [7:0]    PEA_1_1_InterfacePlugin_setup_dataOut_1;
  wire       [7:0]    PEA_1_1_InterfacePlugin_setup_dataOut_2;
  wire       [7:0]    PEA_1_1_InterfacePlugin_setup_dataOut_3;
  wire                PEA_1_1_InterfacePlugin_setup_tokenOut_0;
  wire                PEA_1_1_InterfacePlugin_setup_tokenOut_1;
  wire                PEA_1_1_InterfacePlugin_setup_tokenOut_2;
  wire                PEA_1_1_InterfacePlugin_setup_tokenOut_3;
  wire                PEA_1_1_InterfacePlugin_setup_creditOut_0;
  wire                PEA_1_1_InterfacePlugin_setup_creditOut_1;
  wire                PEA_1_1_InterfacePlugin_setup_creditOut_2;
  wire                PEA_1_1_InterfacePlugin_setup_creditOut_3;

  ProcessElement PEA_0_0 (
    .peClock                           (io_clock                                    ), //i
    .reset                             (io_reset                                    ), //i
    .InterfacePlugin_setup_writeEnable (io_writeEnable                              ), //i
    .InterfacePlugin_setup_writeConfig (io_writeConfig_0[15:0]                      ), //i
    .InterfacePlugin_setup_peStart     (io_start                                    ), //i
    .InterfacePlugin_setup_dataIn_0    (io_dataIn_0[7:0]                            ), //i
    .InterfacePlugin_setup_dataIn_1    (PEA_0_1_InterfacePlugin_setup_dataOut_3[7:0]), //i
    .InterfacePlugin_setup_dataIn_2    (PEA_1_0_InterfacePlugin_setup_dataOut_0[7:0]), //i
    .InterfacePlugin_setup_dataIn_3    (io_dataIn_7[7:0]                            ), //i
    .InterfacePlugin_setup_tokenIn_0   (io_tokenIn_0                                ), //i
    .InterfacePlugin_setup_tokenIn_1   (PEA_0_1_InterfacePlugin_setup_tokenOut_3    ), //i
    .InterfacePlugin_setup_tokenIn_2   (PEA_1_0_InterfacePlugin_setup_tokenOut_0    ), //i
    .InterfacePlugin_setup_tokenIn_3   (io_tokenIn_7                                ), //i
    .InterfacePlugin_setup_creditIn_0  (io_creditIn_0                               ), //i
    .InterfacePlugin_setup_creditIn_1  (PEA_0_1_InterfacePlugin_setup_creditOut_3   ), //i
    .InterfacePlugin_setup_creditIn_2  (PEA_1_0_InterfacePlugin_setup_creditOut_0   ), //i
    .InterfacePlugin_setup_creditIn_3  (io_creditIn_7                               ), //i
    .InterfacePlugin_setup_dataOut_0   (PEA_0_0_InterfacePlugin_setup_dataOut_0[7:0]), //o
    .InterfacePlugin_setup_dataOut_1   (PEA_0_0_InterfacePlugin_setup_dataOut_1[7:0]), //o
    .InterfacePlugin_setup_dataOut_2   (PEA_0_0_InterfacePlugin_setup_dataOut_2[7:0]), //o
    .InterfacePlugin_setup_dataOut_3   (PEA_0_0_InterfacePlugin_setup_dataOut_3[7:0]), //o
    .InterfacePlugin_setup_tokenOut_0  (PEA_0_0_InterfacePlugin_setup_tokenOut_0    ), //o
    .InterfacePlugin_setup_tokenOut_1  (PEA_0_0_InterfacePlugin_setup_tokenOut_1    ), //o
    .InterfacePlugin_setup_tokenOut_2  (PEA_0_0_InterfacePlugin_setup_tokenOut_2    ), //o
    .InterfacePlugin_setup_tokenOut_3  (PEA_0_0_InterfacePlugin_setup_tokenOut_3    ), //o
    .InterfacePlugin_setup_creditOut_0 (PEA_0_0_InterfacePlugin_setup_creditOut_0   ), //o
    .InterfacePlugin_setup_creditOut_1 (PEA_0_0_InterfacePlugin_setup_creditOut_1   ), //o
    .InterfacePlugin_setup_creditOut_2 (PEA_0_0_InterfacePlugin_setup_creditOut_2   ), //o
    .InterfacePlugin_setup_creditOut_3 (PEA_0_0_InterfacePlugin_setup_creditOut_3   )  //o
  );
  ProcessElement PEA_0_1 (
    .peClock                           (io_clock                                    ), //i
    .reset                             (io_reset                                    ), //i
    .InterfacePlugin_setup_writeEnable (io_writeEnable                              ), //i
    .InterfacePlugin_setup_writeConfig (io_writeConfig_1[15:0]                      ), //i
    .InterfacePlugin_setup_peStart     (io_start                                    ), //i
    .InterfacePlugin_setup_dataIn_0    (io_dataIn_1[7:0]                            ), //i
    .InterfacePlugin_setup_dataIn_1    (io_dataIn_2[7:0]                            ), //i
    .InterfacePlugin_setup_dataIn_2    (PEA_1_1_InterfacePlugin_setup_dataOut_0[7:0]), //i
    .InterfacePlugin_setup_dataIn_3    (PEA_0_0_InterfacePlugin_setup_dataOut_1[7:0]), //i
    .InterfacePlugin_setup_tokenIn_0   (io_tokenIn_1                                ), //i
    .InterfacePlugin_setup_tokenIn_1   (io_tokenIn_2                                ), //i
    .InterfacePlugin_setup_tokenIn_2   (PEA_1_1_InterfacePlugin_setup_tokenOut_0    ), //i
    .InterfacePlugin_setup_tokenIn_3   (PEA_0_1_InterfacePlugin_setup_tokenOut_3    ), //i
    .InterfacePlugin_setup_creditIn_0  (io_creditIn_1                               ), //i
    .InterfacePlugin_setup_creditIn_1  (io_creditIn_2                               ), //i
    .InterfacePlugin_setup_creditIn_2  (PEA_1_1_InterfacePlugin_setup_creditOut_0   ), //i
    .InterfacePlugin_setup_creditIn_3  (PEA_0_0_InterfacePlugin_setup_creditOut_1   ), //i
    .InterfacePlugin_setup_dataOut_0   (PEA_0_1_InterfacePlugin_setup_dataOut_0[7:0]), //o
    .InterfacePlugin_setup_dataOut_1   (PEA_0_1_InterfacePlugin_setup_dataOut_1[7:0]), //o
    .InterfacePlugin_setup_dataOut_2   (PEA_0_1_InterfacePlugin_setup_dataOut_2[7:0]), //o
    .InterfacePlugin_setup_dataOut_3   (PEA_0_1_InterfacePlugin_setup_dataOut_3[7:0]), //o
    .InterfacePlugin_setup_tokenOut_0  (PEA_0_1_InterfacePlugin_setup_tokenOut_0    ), //o
    .InterfacePlugin_setup_tokenOut_1  (PEA_0_1_InterfacePlugin_setup_tokenOut_1    ), //o
    .InterfacePlugin_setup_tokenOut_2  (PEA_0_1_InterfacePlugin_setup_tokenOut_2    ), //o
    .InterfacePlugin_setup_tokenOut_3  (PEA_0_1_InterfacePlugin_setup_tokenOut_3    ), //o
    .InterfacePlugin_setup_creditOut_0 (PEA_0_1_InterfacePlugin_setup_creditOut_0   ), //o
    .InterfacePlugin_setup_creditOut_1 (PEA_0_1_InterfacePlugin_setup_creditOut_1   ), //o
    .InterfacePlugin_setup_creditOut_2 (PEA_0_1_InterfacePlugin_setup_creditOut_2   ), //o
    .InterfacePlugin_setup_creditOut_3 (PEA_0_1_InterfacePlugin_setup_creditOut_3   )  //o
  );
  ProcessElement PEA_1_0 (
    .peClock                           (io_clock                                    ), //i
    .reset                             (io_reset                                    ), //i
    .InterfacePlugin_setup_writeEnable (io_writeEnable                              ), //i
    .InterfacePlugin_setup_writeConfig (io_writeConfig_2[15:0]                      ), //i
    .InterfacePlugin_setup_peStart     (io_start                                    ), //i
    .InterfacePlugin_setup_dataIn_0    (PEA_0_0_InterfacePlugin_setup_dataOut_2[7:0]), //i
    .InterfacePlugin_setup_dataIn_1    (PEA_1_1_InterfacePlugin_setup_dataOut_3[7:0]), //i
    .InterfacePlugin_setup_dataIn_2    (io_dataIn_3[7:0]                            ), //i
    .InterfacePlugin_setup_dataIn_3    (io_dataIn_4[7:0]                            ), //i
    .InterfacePlugin_setup_tokenIn_0   (PEA_0_0_InterfacePlugin_setup_tokenOut_2    ), //i
    .InterfacePlugin_setup_tokenIn_1   (PEA_1_1_InterfacePlugin_setup_tokenOut_3    ), //i
    .InterfacePlugin_setup_tokenIn_2   (io_tokenIn_3                                ), //i
    .InterfacePlugin_setup_tokenIn_3   (io_tokenIn_4                                ), //i
    .InterfacePlugin_setup_creditIn_0  (PEA_0_0_InterfacePlugin_setup_creditOut_2   ), //i
    .InterfacePlugin_setup_creditIn_1  (PEA_1_1_InterfacePlugin_setup_creditOut_3   ), //i
    .InterfacePlugin_setup_creditIn_2  (io_creditIn_3                               ), //i
    .InterfacePlugin_setup_creditIn_3  (io_creditIn_4                               ), //i
    .InterfacePlugin_setup_dataOut_0   (PEA_1_0_InterfacePlugin_setup_dataOut_0[7:0]), //o
    .InterfacePlugin_setup_dataOut_1   (PEA_1_0_InterfacePlugin_setup_dataOut_1[7:0]), //o
    .InterfacePlugin_setup_dataOut_2   (PEA_1_0_InterfacePlugin_setup_dataOut_2[7:0]), //o
    .InterfacePlugin_setup_dataOut_3   (PEA_1_0_InterfacePlugin_setup_dataOut_3[7:0]), //o
    .InterfacePlugin_setup_tokenOut_0  (PEA_1_0_InterfacePlugin_setup_tokenOut_0    ), //o
    .InterfacePlugin_setup_tokenOut_1  (PEA_1_0_InterfacePlugin_setup_tokenOut_1    ), //o
    .InterfacePlugin_setup_tokenOut_2  (PEA_1_0_InterfacePlugin_setup_tokenOut_2    ), //o
    .InterfacePlugin_setup_tokenOut_3  (PEA_1_0_InterfacePlugin_setup_tokenOut_3    ), //o
    .InterfacePlugin_setup_creditOut_0 (PEA_1_0_InterfacePlugin_setup_creditOut_0   ), //o
    .InterfacePlugin_setup_creditOut_1 (PEA_1_0_InterfacePlugin_setup_creditOut_1   ), //o
    .InterfacePlugin_setup_creditOut_2 (PEA_1_0_InterfacePlugin_setup_creditOut_2   ), //o
    .InterfacePlugin_setup_creditOut_3 (PEA_1_0_InterfacePlugin_setup_creditOut_3   )  //o
  );
  ProcessElement PEA_1_1 (
    .peClock                           (io_clock                                    ), //i
    .reset                             (io_reset                                    ), //i
    .InterfacePlugin_setup_writeEnable (io_writeEnable                              ), //i
    .InterfacePlugin_setup_writeConfig (io_writeConfig_3[15:0]                      ), //i
    .InterfacePlugin_setup_peStart     (io_start                                    ), //i
    .InterfacePlugin_setup_dataIn_0    (PEA_0_1_InterfacePlugin_setup_dataOut_2[7:0]), //i
    .InterfacePlugin_setup_dataIn_1    (io_dataIn_6[7:0]                            ), //i
    .InterfacePlugin_setup_dataIn_2    (io_dataIn_5[7:0]                            ), //i
    .InterfacePlugin_setup_dataIn_3    (PEA_1_0_InterfacePlugin_setup_dataOut_1[7:0]), //i
    .InterfacePlugin_setup_tokenIn_0   (PEA_0_1_InterfacePlugin_setup_tokenOut_2    ), //i
    .InterfacePlugin_setup_tokenIn_1   (io_tokenIn_6                                ), //i
    .InterfacePlugin_setup_tokenIn_2   (io_tokenIn_5                                ), //i
    .InterfacePlugin_setup_tokenIn_3   (PEA_1_1_InterfacePlugin_setup_tokenOut_3    ), //i
    .InterfacePlugin_setup_creditIn_0  (PEA_0_1_InterfacePlugin_setup_creditOut_2   ), //i
    .InterfacePlugin_setup_creditIn_1  (io_creditIn_6                               ), //i
    .InterfacePlugin_setup_creditIn_2  (io_creditIn_5                               ), //i
    .InterfacePlugin_setup_creditIn_3  (PEA_1_0_InterfacePlugin_setup_creditOut_1   ), //i
    .InterfacePlugin_setup_dataOut_0   (PEA_1_1_InterfacePlugin_setup_dataOut_0[7:0]), //o
    .InterfacePlugin_setup_dataOut_1   (PEA_1_1_InterfacePlugin_setup_dataOut_1[7:0]), //o
    .InterfacePlugin_setup_dataOut_2   (PEA_1_1_InterfacePlugin_setup_dataOut_2[7:0]), //o
    .InterfacePlugin_setup_dataOut_3   (PEA_1_1_InterfacePlugin_setup_dataOut_3[7:0]), //o
    .InterfacePlugin_setup_tokenOut_0  (PEA_1_1_InterfacePlugin_setup_tokenOut_0    ), //o
    .InterfacePlugin_setup_tokenOut_1  (PEA_1_1_InterfacePlugin_setup_tokenOut_1    ), //o
    .InterfacePlugin_setup_tokenOut_2  (PEA_1_1_InterfacePlugin_setup_tokenOut_2    ), //o
    .InterfacePlugin_setup_tokenOut_3  (PEA_1_1_InterfacePlugin_setup_tokenOut_3    ), //o
    .InterfacePlugin_setup_creditOut_0 (PEA_1_1_InterfacePlugin_setup_creditOut_0   ), //o
    .InterfacePlugin_setup_creditOut_1 (PEA_1_1_InterfacePlugin_setup_creditOut_1   ), //o
    .InterfacePlugin_setup_creditOut_2 (PEA_1_1_InterfacePlugin_setup_creditOut_2   ), //o
    .InterfacePlugin_setup_creditOut_3 (PEA_1_1_InterfacePlugin_setup_creditOut_3   )  //o
  );

endmodule

//ProcessElement replaced by ProcessElement

//ProcessElement replaced by ProcessElement

//ProcessElement replaced by ProcessElement

module ProcessElement (
  input               peClock,
  input               reset,
  input               InterfacePlugin_setup_writeEnable,
  input      [15:0]   InterfacePlugin_setup_writeConfig,
  input               InterfacePlugin_setup_peStart,
  input      [7:0]    InterfacePlugin_setup_dataIn_0,
  input      [7:0]    InterfacePlugin_setup_dataIn_1,
  input      [7:0]    InterfacePlugin_setup_dataIn_2,
  input      [7:0]    InterfacePlugin_setup_dataIn_3,
  input               InterfacePlugin_setup_tokenIn_0,
  input               InterfacePlugin_setup_tokenIn_1,
  input               InterfacePlugin_setup_tokenIn_2,
  input               InterfacePlugin_setup_tokenIn_3,
  input               InterfacePlugin_setup_creditIn_0,
  input               InterfacePlugin_setup_creditIn_1,
  input               InterfacePlugin_setup_creditIn_2,
  input               InterfacePlugin_setup_creditIn_3,
  output reg [7:0]    InterfacePlugin_setup_dataOut_0,
  output reg [7:0]    InterfacePlugin_setup_dataOut_1,
  output reg [7:0]    InterfacePlugin_setup_dataOut_2,
  output reg [7:0]    InterfacePlugin_setup_dataOut_3,
  output reg          InterfacePlugin_setup_tokenOut_0,
  output reg          InterfacePlugin_setup_tokenOut_1,
  output reg          InterfacePlugin_setup_tokenOut_2,
  output reg          InterfacePlugin_setup_tokenOut_3,
  output              InterfacePlugin_setup_creditOut_0,
  output              InterfacePlugin_setup_creditOut_1,
  output              InterfacePlugin_setup_creditOut_2,
  output              InterfacePlugin_setup_creditOut_3
);

  reg        [15:0]   _zz_AssignPlugin_setup_config;
  reg                 _zz_DecodePlugin_setup_credit;
  reg        [7:0]    _zz_DecodePlugin_setup_input1;
  reg                 _zz_DecodePlugin_setup_token1;
  reg        [7:0]    _zz_DecodePlugin_setup_input2;
  reg                 _zz_DecodePlugin_setup_token2;
  reg                 _zz_when_WriteBack_l31;
  reg        [15:0]   FetchPlugin_setup_configMem_0;
  reg        [15:0]   FetchPlugin_setup_configMem_1;
  reg        [15:0]   FetchPlugin_setup_configMem_2;
  reg        [15:0]   FetchPlugin_setup_configMem_3;
  reg        [15:0]   FetchPlugin_setup_configMem_4;
  reg        [15:0]   FetchPlugin_setup_configMem_5;
  reg        [15:0]   FetchPlugin_setup_configMem_6;
  reg        [15:0]   FetchPlugin_setup_configMem_7;
  reg        [2:0]    FetchPlugin_setup_configNum;
  reg        [2:0]    FetchPlugin_setup_pcReg;
  reg                 FetchPlugin_setup_working;
  reg                 FetchPlugin_setup_filling;
  wire                FetchPlugin_setup_finishing;
  reg                 FetchPlugin_setup_incFlag;
  reg        [15:0]   AssignPlugin_setup_config;
  reg                 AssignPlugin_setup_filling;
  reg        [15:0]   DecodePlugin_setup_config;
  wire       [1:0]    DecodePlugin_setup_inputIndex1;
  wire       [1:0]    DecodePlugin_setup_inputIndex2;
  wire       [1:0]    DecodePlugin_setup_outputIndex;
  wire       [3:0]    DecodePlugin_setup_countNumber;
  wire                DecodePlugin_setup_imm1;
  wire                DecodePlugin_setup_imm2;
  wire                DecodePlugin_setup_lock;
  wire       [2:0]    DecodePlugin_setup_lockCount;
  reg                 DecodePlugin_setup_credit;
  reg                 DecodePlugin_setup_token1;
  reg                 DecodePlugin_setup_token2;
  wire                DecodePlugin_setup_token;
  wire                DecodePlugin_setup_valid;
  wire                DecodePlugin_setup_configValid;
  reg        [7:0]    DecodePlugin_setup_input1;
  reg        [7:0]    DecodePlugin_setup_input2;
  reg        [7:0]    ExecutePlugin_setup_input1;
  reg        [7:0]    ExecutePlugin_setup_input2;
  wire       [7:0]    ExecutePlugin_setup_output;
  reg                 ExecutePlugin_setup_token;
  reg        [1:0]    ExecutePlugin_setup_outputIndex;
  reg        [3:0]    ExecutePlugin_setup_countNumber;
  wire                ExecutePlugin_setup_lock;
  wire       [2:0]    ExecutePlugin_setup_lockCount;
  reg                 ExecutePlugin_setup_credit;
  wire                ExecutePlugin_setup_aluStall;
  reg        [1:0]    WriteBackPlugin_setup_outputIndex;
  reg        [7:0]    WriteBackPlugin_setup_output;
  reg                 WriteBackPlugin_setup_token;
  reg        [7:0]    WriteBackPlugin_setup_dataOut;
  reg                 WriteBackPlugin_setup_tokenOut;
  reg        [1:0]    WriteBackPlugin_setup_outIndex;
  wire                when_Fetch_l27;
  wire       [7:0]    _zz_1;
  wire                when_Fetch_l42;
  wire                when_Fetch_l48;
  wire                when_Fetch_l45;
  wire                when_Fetch_l68;
  wire                when_Assign_l23;
  reg                 pathSelect0;
  reg                 pathSelect1;
  reg                 pathSelect2;
  reg                 pathSelect3;
  wire                when_WriteBack_l31;

  always @(*) begin
    case(FetchPlugin_setup_pcReg)
      3'b000 : _zz_AssignPlugin_setup_config = FetchPlugin_setup_configMem_0;
      3'b001 : _zz_AssignPlugin_setup_config = FetchPlugin_setup_configMem_1;
      3'b010 : _zz_AssignPlugin_setup_config = FetchPlugin_setup_configMem_2;
      3'b011 : _zz_AssignPlugin_setup_config = FetchPlugin_setup_configMem_3;
      3'b100 : _zz_AssignPlugin_setup_config = FetchPlugin_setup_configMem_4;
      3'b101 : _zz_AssignPlugin_setup_config = FetchPlugin_setup_configMem_5;
      3'b110 : _zz_AssignPlugin_setup_config = FetchPlugin_setup_configMem_6;
      default : _zz_AssignPlugin_setup_config = FetchPlugin_setup_configMem_7;
    endcase
  end

  always @(*) begin
    case(DecodePlugin_setup_outputIndex)
      2'b00 : _zz_DecodePlugin_setup_credit = InterfacePlugin_setup_creditIn_0;
      2'b01 : _zz_DecodePlugin_setup_credit = InterfacePlugin_setup_creditIn_1;
      2'b10 : _zz_DecodePlugin_setup_credit = InterfacePlugin_setup_creditIn_2;
      default : _zz_DecodePlugin_setup_credit = InterfacePlugin_setup_creditIn_3;
    endcase
  end

  always @(*) begin
    case(DecodePlugin_setup_inputIndex1)
      2'b00 : begin
        _zz_DecodePlugin_setup_input1 = InterfacePlugin_setup_dataIn_0;
        _zz_DecodePlugin_setup_token1 = InterfacePlugin_setup_tokenIn_0;
      end
      2'b01 : begin
        _zz_DecodePlugin_setup_input1 = InterfacePlugin_setup_dataIn_1;
        _zz_DecodePlugin_setup_token1 = InterfacePlugin_setup_tokenIn_1;
      end
      2'b10 : begin
        _zz_DecodePlugin_setup_input1 = InterfacePlugin_setup_dataIn_2;
        _zz_DecodePlugin_setup_token1 = InterfacePlugin_setup_tokenIn_2;
      end
      default : begin
        _zz_DecodePlugin_setup_input1 = InterfacePlugin_setup_dataIn_3;
        _zz_DecodePlugin_setup_token1 = InterfacePlugin_setup_tokenIn_3;
      end
    endcase
  end

  always @(*) begin
    case(DecodePlugin_setup_inputIndex2)
      2'b00 : begin
        _zz_DecodePlugin_setup_input2 = InterfacePlugin_setup_dataIn_0;
        _zz_DecodePlugin_setup_token2 = InterfacePlugin_setup_tokenIn_0;
      end
      2'b01 : begin
        _zz_DecodePlugin_setup_input2 = InterfacePlugin_setup_dataIn_1;
        _zz_DecodePlugin_setup_token2 = InterfacePlugin_setup_tokenIn_1;
      end
      2'b10 : begin
        _zz_DecodePlugin_setup_input2 = InterfacePlugin_setup_dataIn_2;
        _zz_DecodePlugin_setup_token2 = InterfacePlugin_setup_tokenIn_2;
      end
      default : begin
        _zz_DecodePlugin_setup_input2 = InterfacePlugin_setup_dataIn_3;
        _zz_DecodePlugin_setup_token2 = InterfacePlugin_setup_tokenIn_3;
      end
    endcase
  end

  always @(*) begin
    case(WriteBackPlugin_setup_outputIndex)
      2'b00 : _zz_when_WriteBack_l31 = InterfacePlugin_setup_creditIn_0;
      2'b01 : _zz_when_WriteBack_l31 = InterfacePlugin_setup_creditIn_1;
      2'b10 : _zz_when_WriteBack_l31 = InterfacePlugin_setup_creditIn_2;
      default : _zz_when_WriteBack_l31 = InterfacePlugin_setup_creditIn_3;
    endcase
  end

  assign FetchPlugin_setup_finishing = 1'b0;
  assign DecodePlugin_setup_inputIndex1 = DecodePlugin_setup_config[14 : 13];
  assign DecodePlugin_setup_inputIndex2 = DecodePlugin_setup_config[11 : 10];
  assign DecodePlugin_setup_outputIndex = DecodePlugin_setup_config[9 : 8];
  assign DecodePlugin_setup_countNumber = DecodePlugin_setup_config[7 : 4];
  assign DecodePlugin_setup_imm1 = DecodePlugin_setup_config[15];
  assign DecodePlugin_setup_imm2 = DecodePlugin_setup_config[12];
  assign DecodePlugin_setup_lock = DecodePlugin_setup_config[3];
  assign DecodePlugin_setup_lockCount = DecodePlugin_setup_config[2 : 0];
  assign DecodePlugin_setup_token = (DecodePlugin_setup_token1 && DecodePlugin_setup_token2);
  assign DecodePlugin_setup_configValid = (DecodePlugin_setup_countNumber != 4'b0000);
  assign ExecutePlugin_setup_lock = 1'b0;
  assign ExecutePlugin_setup_lockCount = 3'b000;
  assign ExecutePlugin_setup_aluStall = (ExecutePlugin_setup_countNumber[3 : 1] != 3'b000);
  assign when_Fetch_l27 = (FetchPlugin_setup_configNum < 3'b010);
  always @(*) begin
    if(when_Fetch_l27) begin
      FetchPlugin_setup_incFlag = (FetchPlugin_setup_pcReg < FetchPlugin_setup_configNum);
    end else begin
      FetchPlugin_setup_incFlag = (FetchPlugin_setup_pcReg < 3'b010);
    end
  end

  assign _zz_1 = ({7'd0,1'b1} <<< FetchPlugin_setup_pcReg);
  assign when_Fetch_l42 = (FetchPlugin_setup_pcReg != 3'b111);
  assign when_Fetch_l48 = (DecodePlugin_setup_valid || FetchPlugin_setup_filling);
  assign when_Fetch_l45 = (InterfacePlugin_setup_peStart || FetchPlugin_setup_finishing);
  assign when_Fetch_l68 = (DecodePlugin_setup_valid || FetchPlugin_setup_filling);
  assign when_Assign_l23 = (DecodePlugin_setup_valid || AssignPlugin_setup_filling);
  assign DecodePlugin_setup_valid = ((ExecutePlugin_setup_credit && DecodePlugin_setup_token) && (! ExecutePlugin_setup_aluStall));
  always @(*) begin
    if(DecodePlugin_setup_configValid) begin
      DecodePlugin_setup_credit = _zz_DecodePlugin_setup_credit;
    end else begin
      DecodePlugin_setup_credit = 1'b1;
    end
  end

  always @(*) begin
    if(DecodePlugin_setup_configValid) begin
      if(DecodePlugin_setup_imm1) begin
        DecodePlugin_setup_input1 = {6'd0, DecodePlugin_setup_inputIndex1};
      end else begin
        DecodePlugin_setup_input1 = _zz_DecodePlugin_setup_input1;
      end
    end else begin
      DecodePlugin_setup_input1 = 8'h0;
    end
  end

  always @(*) begin
    if(DecodePlugin_setup_configValid) begin
      if(DecodePlugin_setup_imm1) begin
        DecodePlugin_setup_token1 = 1'b1;
      end else begin
        DecodePlugin_setup_token1 = _zz_DecodePlugin_setup_token1;
      end
    end else begin
      DecodePlugin_setup_token1 = 1'b0;
    end
  end

  always @(*) begin
    if(DecodePlugin_setup_configValid) begin
      if(DecodePlugin_setup_imm2) begin
        DecodePlugin_setup_input2 = {6'd0, DecodePlugin_setup_inputIndex2};
      end else begin
        DecodePlugin_setup_input2 = _zz_DecodePlugin_setup_input2;
      end
    end else begin
      DecodePlugin_setup_input2 = 8'h0;
    end
  end

  always @(*) begin
    if(DecodePlugin_setup_configValid) begin
      if(DecodePlugin_setup_imm2) begin
        DecodePlugin_setup_token2 = 1'b1;
      end else begin
        DecodePlugin_setup_token2 = _zz_DecodePlugin_setup_token2;
      end
    end else begin
      DecodePlugin_setup_token2 = 1'b0;
    end
  end

  assign InterfacePlugin_setup_creditOut_0 = (! (pathSelect0 && (! ExecutePlugin_setup_credit)));
  assign InterfacePlugin_setup_creditOut_1 = (! (pathSelect1 && (! ExecutePlugin_setup_credit)));
  assign InterfacePlugin_setup_creditOut_2 = (! (pathSelect2 && (! ExecutePlugin_setup_credit)));
  assign InterfacePlugin_setup_creditOut_3 = (! (pathSelect3 && (! ExecutePlugin_setup_credit)));
  assign ExecutePlugin_setup_output = (ExecutePlugin_setup_input1 + ExecutePlugin_setup_input2);
  assign when_WriteBack_l31 = _zz_when_WriteBack_l31;
  always @(*) begin
    if(when_WriteBack_l31) begin
      WriteBackPlugin_setup_dataOut = ExecutePlugin_setup_output;
    end else begin
      WriteBackPlugin_setup_dataOut = WriteBackPlugin_setup_output;
    end
  end

  always @(*) begin
    if(when_WriteBack_l31) begin
      WriteBackPlugin_setup_tokenOut = ExecutePlugin_setup_token;
    end else begin
      WriteBackPlugin_setup_tokenOut = WriteBackPlugin_setup_token;
    end
  end

  always @(*) begin
    if(when_WriteBack_l31) begin
      WriteBackPlugin_setup_outIndex = ExecutePlugin_setup_outputIndex;
    end else begin
      WriteBackPlugin_setup_outIndex = WriteBackPlugin_setup_outputIndex;
    end
  end

  always @(*) begin
    case(WriteBackPlugin_setup_outIndex)
      2'b00 : begin
        InterfacePlugin_setup_dataOut_0 = WriteBackPlugin_setup_output;
      end
      2'b01 : begin
        InterfacePlugin_setup_dataOut_0 = 8'h0;
      end
      2'b10 : begin
        InterfacePlugin_setup_dataOut_0 = 8'h0;
      end
      default : begin
        InterfacePlugin_setup_dataOut_0 = 8'h0;
      end
    endcase
  end

  always @(*) begin
    case(WriteBackPlugin_setup_outIndex)
      2'b00 : begin
        InterfacePlugin_setup_tokenOut_0 = WriteBackPlugin_setup_token;
      end
      2'b01 : begin
        InterfacePlugin_setup_tokenOut_0 = 1'b0;
      end
      2'b10 : begin
        InterfacePlugin_setup_tokenOut_0 = 1'b0;
      end
      default : begin
        InterfacePlugin_setup_tokenOut_0 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(WriteBackPlugin_setup_outIndex)
      2'b00 : begin
        InterfacePlugin_setup_dataOut_1 = 8'h0;
      end
      2'b01 : begin
        InterfacePlugin_setup_dataOut_1 = WriteBackPlugin_setup_output;
      end
      2'b10 : begin
        InterfacePlugin_setup_dataOut_1 = 8'h0;
      end
      default : begin
        InterfacePlugin_setup_dataOut_1 = 8'h0;
      end
    endcase
  end

  always @(*) begin
    case(WriteBackPlugin_setup_outIndex)
      2'b00 : begin
        InterfacePlugin_setup_tokenOut_1 = 1'b0;
      end
      2'b01 : begin
        InterfacePlugin_setup_tokenOut_1 = WriteBackPlugin_setup_token;
      end
      2'b10 : begin
        InterfacePlugin_setup_tokenOut_1 = 1'b0;
      end
      default : begin
        InterfacePlugin_setup_tokenOut_1 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(WriteBackPlugin_setup_outIndex)
      2'b00 : begin
        InterfacePlugin_setup_dataOut_2 = 8'h0;
      end
      2'b01 : begin
        InterfacePlugin_setup_dataOut_2 = 8'h0;
      end
      2'b10 : begin
        InterfacePlugin_setup_dataOut_2 = WriteBackPlugin_setup_output;
      end
      default : begin
        InterfacePlugin_setup_dataOut_2 = 8'h0;
      end
    endcase
  end

  always @(*) begin
    case(WriteBackPlugin_setup_outIndex)
      2'b00 : begin
        InterfacePlugin_setup_tokenOut_2 = 1'b0;
      end
      2'b01 : begin
        InterfacePlugin_setup_tokenOut_2 = 1'b0;
      end
      2'b10 : begin
        InterfacePlugin_setup_tokenOut_2 = WriteBackPlugin_setup_token;
      end
      default : begin
        InterfacePlugin_setup_tokenOut_2 = 1'b0;
      end
    endcase
  end

  always @(*) begin
    case(WriteBackPlugin_setup_outIndex)
      2'b00 : begin
        InterfacePlugin_setup_dataOut_3 = 8'h0;
      end
      2'b01 : begin
        InterfacePlugin_setup_dataOut_3 = 8'h0;
      end
      2'b10 : begin
        InterfacePlugin_setup_dataOut_3 = 8'h0;
      end
      default : begin
        InterfacePlugin_setup_dataOut_3 = WriteBackPlugin_setup_output;
      end
    endcase
  end

  always @(*) begin
    case(WriteBackPlugin_setup_outIndex)
      2'b00 : begin
        InterfacePlugin_setup_tokenOut_3 = 1'b0;
      end
      2'b01 : begin
        InterfacePlugin_setup_tokenOut_3 = 1'b0;
      end
      2'b10 : begin
        InterfacePlugin_setup_tokenOut_3 = 1'b0;
      end
      default : begin
        InterfacePlugin_setup_tokenOut_3 = WriteBackPlugin_setup_token;
      end
    endcase
  end

  always @(posedge peClock or negedge reset) begin
    if(!reset) begin
      FetchPlugin_setup_configMem_0 <= 16'h0;
      FetchPlugin_setup_configMem_1 <= 16'h0;
      FetchPlugin_setup_configMem_2 <= 16'h0;
      FetchPlugin_setup_configMem_3 <= 16'h0;
      FetchPlugin_setup_configMem_4 <= 16'h0;
      FetchPlugin_setup_configMem_5 <= 16'h0;
      FetchPlugin_setup_configMem_6 <= 16'h0;
      FetchPlugin_setup_configMem_7 <= 16'h0;
      FetchPlugin_setup_configNum <= 3'b000;
      FetchPlugin_setup_pcReg <= 3'b000;
      FetchPlugin_setup_working <= 1'b0;
      FetchPlugin_setup_filling <= 1'b0;
      AssignPlugin_setup_config <= 16'h0;
      AssignPlugin_setup_filling <= 1'b0;
      DecodePlugin_setup_config <= 16'h0;
      ExecutePlugin_setup_input1 <= 8'h0;
      ExecutePlugin_setup_input2 <= 8'h0;
      ExecutePlugin_setup_token <= 1'b0;
      ExecutePlugin_setup_outputIndex <= 2'b00;
      ExecutePlugin_setup_countNumber <= 4'b0000;
      ExecutePlugin_setup_credit <= 1'b1;
      WriteBackPlugin_setup_outputIndex <= 2'b00;
      WriteBackPlugin_setup_output <= 8'h0;
      WriteBackPlugin_setup_token <= 1'b0;
      pathSelect0 <= 1'b0;
      pathSelect1 <= 1'b0;
      pathSelect2 <= 1'b0;
      pathSelect3 <= 1'b0;
    end else begin
      FetchPlugin_setup_filling <= FetchPlugin_setup_incFlag;
      if(InterfacePlugin_setup_writeEnable) begin
        if(_zz_1[0]) begin
          FetchPlugin_setup_configMem_0 <= InterfacePlugin_setup_writeConfig;
        end
        if(_zz_1[1]) begin
          FetchPlugin_setup_configMem_1 <= InterfacePlugin_setup_writeConfig;
        end
        if(_zz_1[2]) begin
          FetchPlugin_setup_configMem_2 <= InterfacePlugin_setup_writeConfig;
        end
        if(_zz_1[3]) begin
          FetchPlugin_setup_configMem_3 <= InterfacePlugin_setup_writeConfig;
        end
        if(_zz_1[4]) begin
          FetchPlugin_setup_configMem_4 <= InterfacePlugin_setup_writeConfig;
        end
        if(_zz_1[5]) begin
          FetchPlugin_setup_configMem_5 <= InterfacePlugin_setup_writeConfig;
        end
        if(_zz_1[6]) begin
          FetchPlugin_setup_configMem_6 <= InterfacePlugin_setup_writeConfig;
        end
        if(_zz_1[7]) begin
          FetchPlugin_setup_configMem_7 <= InterfacePlugin_setup_writeConfig;
        end
        if(when_Fetch_l42) begin
          FetchPlugin_setup_pcReg <= (FetchPlugin_setup_pcReg + 3'b001);
        end
      end else begin
        if(when_Fetch_l45) begin
          FetchPlugin_setup_pcReg <= 3'b000;
        end else begin
          if(FetchPlugin_setup_working) begin
            if(when_Fetch_l48) begin
              FetchPlugin_setup_pcReg <= (FetchPlugin_setup_pcReg + 3'b001);
            end
          end
        end
      end
      if(InterfacePlugin_setup_peStart) begin
        FetchPlugin_setup_working <= 1'b1;
        FetchPlugin_setup_configNum <= FetchPlugin_setup_pcReg;
      end else begin
        if(FetchPlugin_setup_finishing) begin
          FetchPlugin_setup_working <= 1'b0;
          FetchPlugin_setup_configNum <= 3'b000;
        end
      end
      if(FetchPlugin_setup_working) begin
        if(when_Fetch_l68) begin
          AssignPlugin_setup_config <= _zz_AssignPlugin_setup_config;
        end
      end else begin
        AssignPlugin_setup_config <= 16'h0;
      end
      AssignPlugin_setup_filling <= FetchPlugin_setup_filling;
      if(when_Assign_l23) begin
        DecodePlugin_setup_config <= AssignPlugin_setup_config;
      end
      if(DecodePlugin_setup_valid) begin
        ExecutePlugin_setup_input1 <= DecodePlugin_setup_input1;
        ExecutePlugin_setup_input2 <= DecodePlugin_setup_input2;
        ExecutePlugin_setup_token <= DecodePlugin_setup_token;
        ExecutePlugin_setup_outputIndex <= DecodePlugin_setup_outputIndex;
        ExecutePlugin_setup_countNumber <= DecodePlugin_setup_countNumber;
      end
      pathSelect0 <= (((((DecodePlugin_setup_inputIndex1 == 2'b00) && DecodePlugin_setup_token1) && (! DecodePlugin_setup_token2)) && (! DecodePlugin_setup_imm1)) || ((((DecodePlugin_setup_inputIndex2 == 2'b00) && DecodePlugin_setup_token2) && (! DecodePlugin_setup_token1)) && (! DecodePlugin_setup_imm2)));
      pathSelect1 <= (((((DecodePlugin_setup_inputIndex1 == 2'b01) && DecodePlugin_setup_token1) && (! DecodePlugin_setup_token2)) && (! DecodePlugin_setup_imm1)) || ((((DecodePlugin_setup_inputIndex2 == 2'b01) && DecodePlugin_setup_token2) && (! DecodePlugin_setup_token1)) && (! DecodePlugin_setup_imm2)));
      pathSelect2 <= (((((DecodePlugin_setup_inputIndex1 == 2'b10) && DecodePlugin_setup_token1) && (! DecodePlugin_setup_token2)) && (! DecodePlugin_setup_imm1)) || ((((DecodePlugin_setup_inputIndex2 == 2'b10) && DecodePlugin_setup_token2) && (! DecodePlugin_setup_token1)) && (! DecodePlugin_setup_imm2)));
      pathSelect3 <= (((((DecodePlugin_setup_inputIndex1 == 2'b11) && DecodePlugin_setup_token1) && (! DecodePlugin_setup_token2)) && (! DecodePlugin_setup_imm1)) || ((((DecodePlugin_setup_inputIndex2 == 2'b11) && DecodePlugin_setup_token2) && (! DecodePlugin_setup_token1)) && (! DecodePlugin_setup_imm2)));
      ExecutePlugin_setup_credit <= DecodePlugin_setup_credit;
      if(DecodePlugin_setup_credit) begin
        WriteBackPlugin_setup_outputIndex <= ExecutePlugin_setup_outputIndex;
        WriteBackPlugin_setup_output <= ExecutePlugin_setup_output;
        WriteBackPlugin_setup_token <= ExecutePlugin_setup_token;
      end
      if(ExecutePlugin_setup_aluStall) begin
        ExecutePlugin_setup_countNumber <= (ExecutePlugin_setup_countNumber - 4'b0001);
      end
    end
  end


endmodule
