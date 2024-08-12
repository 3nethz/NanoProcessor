----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 12:47:27 AM
-- Design Name: 
-- Module Name: TB_InstructionDecoder - Behavioral
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

ENTITY TB_InstructionDecoder IS
END TB_InstructionDecoder;

ARCHITECTURE Behavioral OF TB_InstructionDecoder IS

    -- Instantiate the entity you want to test
    COMPONENT InstructionDecoder IS
        PORT (
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

    -- Declare signals for inputs and outputs
    SIGNAL clk : STD_LOGIC;
    SIGNAL instruction : STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL jump_sel : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL imd_val : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL reg_en : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL reg_selA : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL load_sel : STD_LOGIC;
    SIGNAL reg_selB : STD_LOGIC_VECTOR(2 DOWNTO 0);
    --SIGNAL mux_en_A : STD_LOGIC;
    --SIGNAL mux_en_B : STD_LOGIC;
    SIGNAL reg_bank_en : STD_LOGIC;
    --SIGNAL mux_2_to_1_en : STD_LOGIC;
    SIGNAL add_sub_sel : STD_LOGIC;
    SIGNAL jump_address : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL jump : STD_LOGIC;

BEGIN

    -- Instantiate the unit under test (UUT)
    uut : InstructionDecoder
    PORT MAP(
        Instruction => instruction,
        Jump_sel => jump_sel,
        Imd_val => imd_val,
        Reg_en => reg_en,
        Reg_selA => reg_selA,
        Load_sel => load_sel,
        Reg_selB => reg_selB,
        --MUX_EN_A => mux_en_A,
        --MUX_EN_B => mux_en_B,
        REG_BANK_EN => reg_bank_en,
        --Mux_2_to_1_EN => mux_2_to_1_en,
        Add_sub_sel => add_sub_sel,
        Jump_address => jump_address,
        Jump => jump
    );

    -- Clock generation process
    PROCESS
    BEGIN
        clk <= '0';
        WAIT FOR 10 ns;
        clk <= '1';
        WAIT FOR 10 ns;
    END PROCESS;

    -- Input stimuli process
    PROCESS
    BEGIN
        instruction <= "010110011010";
        jump_sel <= "1010";

        WAIT FOR 20 ns;
        instruction <= "100010000111";
        jump_sel <= "1010";

        WAIT FOR 20ns;
        instruction <= "100100000101";
        jump_sel <= "1010";
        WAIT FOR 20ns;
        instruction <= "000101000000";
        jump_sel <= "1010";

        WAIT FOR 20ns;
        instruction <= "110100000001";
        jump_sel <= "0000";

        WAIT;

    END PROCESS;

END Behavioral;
