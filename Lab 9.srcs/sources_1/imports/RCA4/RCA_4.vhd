----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2023 11:47:57 AM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

ENTITY Add_Sub IS
    PORT (
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
END Add_Sub;

ARCHITECTURE Behavioral OF Add_Sub IS
    COMPONENT FA
        PORT (
            A : IN STD_LOGIC;
            B : IN STD_LOGIC;
            C_in : IN STD_LOGIC;
            S : OUT STD_LOGIC;
            C_out : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C : STD_LOGIC;
    SIGNAL NB0, NB1, NB2, NB3 : STD_LOGIC;
    SIGNAL S : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN

    NB0 <= (B0 XOR M);
    NB1 <= (B1 XOR M);
    NB2 <= (B2 XOR M);
    NB3 <= (B3 XOR M);

    FA_0 : FA
    PORT MAP(
        A => A0,
        B => NB0,
        C_in => M,
        S => S(0),
        C_Out => FA0_C);

    FA_1 : FA
    PORT MAP(
        A => A1,
        B => NB1,
        C_in => FA0_C,
        S => S(1),
        C_Out => FA1_C);

    FA_2 : FA
    PORT MAP(
        A => A2,
        B => NB2,
        C_in => FA1_C,
        S => S(2),
        C_Out => FA2_C);
    FA_3 : FA
    PORT MAP(
        A => A3,
        B => NB3,
        C_in => FA2_C,
        S => S(3),
        C_Out => Carry_flag);
    S0 <= S(0);
    S1 <= S(1);
    S2 <= S(2);
    S3 <= S(3);

    Zero_flag <= (NOT S(0)) AND (NOT S(1)) AND (NOT S(2)) AND (NOT S(3));

    Sign_flag <= S(3);

    Overflow_flag <= (NOT M) AND (A3 XNOR B3) AND (A3 XOR S(3));

END Behavioral;