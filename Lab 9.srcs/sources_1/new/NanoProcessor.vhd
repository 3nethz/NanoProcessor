----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 02:47:24 PM
-- Design Name: 
-- Module Name: NanoProcessor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY NanoProcessor IS
    PORT (
        Clk : IN STD_LOGIC;
        Res : IN STD_LOGIC;
        Zero : OUT STD_LOGIC;
        Overflow : OUT STD_LOGIC;
        S_7Seg : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
        OUT_REG : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Anode : out STD_LOGIC_VECTOR (3 downto 0)
    );
END NanoProcessor;

ARCHITECTURE Behavioral OF NanoProcessor IS
    COMPONENT InstructionDecoder PORT (
        Instruction : IN STD_LOGIC_VECTOR (11 DOWNTO 0);
        Jump_sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Imd_val : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        Reg_en : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
        Reg_selA : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
        Load_sel : OUT STD_LOGIC;
        Reg_selB : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
        --MUX_EN_A : OUT STD_LOGIC;
        --MUX_EN_B : OUT STD_LOGIC;
        REG_BANK_EN : OUT STD_LOGIC;
        --Mux_2_to_1_EN : OUT STD_LOGIC;
        Add_sub_sel : OUT STD_LOGIC;
        Jump_address : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
        Jump : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT PC PORT (
        D_in : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        Res : IN STD_LOGIC;
        Clk : IN STD_LOGIC;
        Q_out : OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
    END COMPONENT;

    COMPONENT Add_Sub PORT (
        M : IN STD_LOGIC;
        A0 : IN STD_LOGIC;
        A1 : IN STD_LOGIC;
        A2 : IN STD_LOGIC;
        A3 : IN STD_LOGIC;
        B0 : IN STD_LOGIC;
        B1 : IN STD_LOGIC;
        B2 : IN STD_LOGIC;
        B3 : IN STD_LOGIC;
        S0 : OUT STD_LOGIC;
        S1 : OUT STD_LOGIC;
        S2 : OUT STD_LOGIC;
        S3 : OUT STD_LOGIC;
        Zero_flag : OUT STD_LOGIC;
        Sign_flag : OUT STD_LOGIC;
        Overflow_flag : OUT STD_LOGIC;
        Carry_flag : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT adder_3bit PORT (
        A0 : IN STD_LOGIC;
        A1 : IN STD_LOGIC;
        A2 : IN STD_LOGIC;
        B0 : IN STD_LOGIC;
        B1 : IN STD_LOGIC;
        B2 : IN STD_LOGIC;
        C_in : IN STD_LOGIC;
        S0 : OUT STD_LOGIC;
        S1 : OUT STD_LOGIC;
        S2 : OUT STD_LOGIC;
        C_out : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT Register_Bank PORT (
        Reg_En : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        Clk : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        Reg_Bank_En : IN STD_LOGIC;
        Reset : IN STD_LOGIC;
        B0 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        B1 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        B2 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        B3 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        B4 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        B5 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        B6 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
        B7 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
    END COMPONENT;

    COMPONENT ProgramRom PORT (
        Mem_address : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        Instruction : OUT STD_LOGIC_VECTOR (11 DOWNTO 0));
    END COMPONENT;

    COMPONENT Mux_2_to_1_3bit PORT (
        S : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        X : OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
    END COMPONENT;

    COMPONENT Mux_2_to_1_4bit PORT (
        S : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        X : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
    END COMPONENT;

    COMPONENT Mux_8_to_1_4bit PORT (
        S : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
        A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        C : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        D : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        E : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        F : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        G : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        H : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        X : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
    END COMPONENT;

    COMPONENT Slow_Clk PORT (
        Clk_in : IN STD_LOGIC;
        Clk_out : OUT STD_LOGIC);
    END COMPONENT;

    COMPONENT LUT_16_7 PORT (
        address : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        data : OUT STD_LOGIC_VECTOR (6 DOWNTO 0));
    END COMPONENT;

    SIGNAL Imd_val_out : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Output of InstructionDecoder: Immediate value
    SIGNAL Reg_en_out : STD_LOGIC_VECTOR(2 DOWNTO 0); -- Output of InstructionDecoder: Register enable
    SIGNAL Reg_selA_out : STD_LOGIC_VECTOR(2 DOWNTO 0); -- Output of InstructionDecoder: Register select A
    SIGNAL Load_sel_out : STD_LOGIC; -- Output of InstructionDecoder: Load select
    SIGNAL Reg_selB_out : STD_LOGIC_VECTOR(2 DOWNTO 0); -- Output of InstructionDecoder: Register select B
    --SIGNAL MUX_EN_A_out : STD_LOGIC; -- Output of InstructionDecoder: Multiplexer A enable
    --SIGNAL MUX_EN_B_out : STD_LOGIC; -- Output of InstructionDecoder: Multiplexer B enable
    SIGNAL REG_BANK_EN_out : STD_LOGIC; -- Output of InstructionDecoder: Register bank enable
    --SIGNAL Mux_2_to_1_EN_out : STD_LOGIC; -- Output of InstructionDecoder: Multiplexer 2-to-1 enable
    SIGNAL Add_sub_sel_out : STD_LOGIC; -- Output of InstructionDecoder: Add/subtract select
    SIGNAL Jump_address_out : STD_LOGIC_VECTOR(2 DOWNTO 0); -- Output of InstructionDecoder: Jump address
    SIGNAL Jump_out : STD_LOGIC; -- Output of InstructionDecoder: Jump

    SIGNAL PC_out : STD_LOGIC_VECTOR(2 DOWNTO 0); -- Output of PC: Current address
    SIGNAL S4bit : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Outputs of Add_Sub: Sum bits
    SIGNAL Zero_flag, Sign_flag, Overflow_flag, Carry_flag : STD_LOGIC; -- Outputs of Add_Sub: Flags
    SIGNAL Counter : STD_LOGIC_VECTOR(2 DOWNTO 0); -- output of 3bit adder
    SIGNAL C_out : STD_LOGIC; -- Output of adder_3bit: Carry-out

    SIGNAL RB0, RB1, RB2, RB3, RB4, RB5, RB6, RB7 : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Outputs of Register_Bank: Register values
    SIGNAL Instruction : STD_LOGIC_VECTOR(11 DOWNTO 0); -- Output of ProgramRom: Instruction
    SIGNAL X_2_Way_3bit : STD_LOGIC_VECTOR(2 DOWNTO 0); -- Output of Mux_2_to_1_3bit: Selected input
    SIGNAL X_2_way_4bit : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Output of Mux_2_to_1_4bit: Selected input
    SIGNAL X_8_way_4bitA : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Output of Mux_8_to_1_4bit A : Selected input
    SIGNAL X_8_way_4bitB : STD_LOGIC_VECTOR(3 DOWNTO 0); -- Output of Mux_8_to_1_4bit B : Selected input
    SIGNAL Clk_out : STD_LOGIC; -- Output of Slow_Clk: Slow clock
    SIGNAL S_7Seg_out : STD_LOGIC_VECTOR(6 DOWNTO 0);

BEGIN

    LUT : LUT_16_7 PORT MAP(
        address => RB7,
        data => S_7Seg_out
    );

    InstructionDecoder_0 : InstructionDecoder PORT MAP(
        -- Port map connections
        Instruction => Instruction,
        Jump_sel => X_8_way_4bitA,
        Imd_val => Imd_val_out,
        Reg_en => Reg_en_out,
        Reg_selA => Reg_selA_out,
        Load_sel => Load_sel_out,
        Reg_selB => Reg_selB_out,
        --MUX_EN_A => MUX_EN_A_out,
        --MUX_EN_B => MUX_EN_B_out,
        REG_BANK_EN => REG_BANK_EN_out,
        --Mux_2_to_1_EN => Mux_2_to_1_EN_out,
        Add_sub_sel => Add_sub_sel_out,
        Jump_address => Jump_address_out,
        Jump => Jump_out
    );

    PC_0 : PC PORT MAP(
        -- Port map connections
        D_in => X_2_Way_3bit,
        Res => Res,
        Clk => Clk_out,
        Q_out => PC_out
    );

    Add_Sub_0 : Add_Sub PORT MAP(
        -- Port map connections
        M => Add_sub_sel_out,
        A0 => X_8_way_4bitA(0),
        A1 => X_8_way_4bitA(1),
        A2 => X_8_way_4bitA(2),
        A3 => X_8_way_4bitA(3),
        B0 => X_8_way_4bitB(0),
        B1 => X_8_way_4bitB(1),
        B2 => X_8_way_4bitB(2),
        B3 => X_8_way_4bitB(3),
        S0 => S4bit(0),
        S1 => S4bit(1),
        S2 => S4bit(2),
        S3 => S4bit(3),
        Zero_flag => Zero_flag,
        Sign_flag => Sign_flag,
        Overflow_flag => Overflow_flag,
        Carry_flag => Carry_flag
    );

    adder_3bit_0 : adder_3bit PORT MAP(
        A0 => PC_out(0),
        A1 => PC_out(1),
        A2 => PC_out(2),
        B0 => '0',
        B1 => '0',
        B2 => '0',
        C_in => '1',
        S0 => Counter(0),
        S1 => Counter(1),
        S2 => Counter(2),
        C_out => C_out
    );

    Register_Bank_0 : Register_Bank PORT MAP(
        -- Port map connections
        Reg_En => Reg_en_out,
        Clk => Clk_out,
        A => X_2_way_4bit,
        Reg_Bank_En => REG_BANK_EN_out,
        Reset => Res,
        B0 => RB0,
        B1 => RB1,
        B2 => RB2,
        B3 => RB3,
        B4 => RB4,
        B5 => RB5,
        B6 => RB6,
        B7 => RB7
    );

    ProgramRom_0 : ProgramRom PORT MAP(
        -- Port map connections
        Mem_Address => PC_out,
        Instruction => Instruction
    );

    Mux_2_to_1_3bit_0 : Mux_2_to_1_3bit PORT MAP(
        -- Port map connections
        S => Jump_out,
        A => Jump_address_out,
        B => Counter,
        X => X_2_Way_3bit
    );

    Mux_2_to_1_4bit_0 : Mux_2_to_1_4bit PORT MAP(
        -- Port map connections
        S => Load_sel_out,
        A => Imd_val_out,
        B => S4bit,
        X => X_2_way_4bit
    );

    Mux_8_to_1_4bit_A : Mux_8_to_1_4bit PORT MAP(
        -- Port map connections
        S => Reg_selA_out,
        A => RB0,
        B => RB1,
        C => RB2,
        D => RB3,
        E => RB4,
        F => RB5,
        G => RB6,
        H => RB7,
        X => X_8_way_4bitA
    );

    Mux_8_to_1_4bit_B : Mux_8_to_1_4bit PORT MAP(
        -- Port map connections
        S => Reg_selB_out,
        A => RB0,
        B => RB1,
        C => RB2,
        D => RB3,
        E => RB4,
        F => RB5,
        G => RB6,
        H => RB7,
        X => X_8_way_4bitB
    );

    Slow_Clk_0 : Slow_Clk PORT MAP(
        Clk_in => Clk,
        Clk_out => Clk_out
    );

    OUT_REG <= RB7;
    Overflow <= Overflow_flag;
    Zero <= Zero_flag;
    S_7Seg <= S_7Seg_out;
    Anode <= "1110";

END Behavioral;