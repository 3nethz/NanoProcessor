----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 03:41:39 PM
-- Design Name: 
-- Module Name: RCA_3 - Behavioral
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

ENTITY Adder_3bit IS
    PORT (
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
END Adder_3bit;

ARCHITECTURE Behavioral OF Adder_3bit IS
    COMPONENT FA
        PORT (
            A : IN STD_LOGIC;
            B : IN STD_LOGIC;
            C_in : IN STD_LOGIC;
            S : OUT STD_LOGIC;
            C_out : OUT STD_LOGIC);
    END COMPONENT;

    SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C : STD_LOGIC;

BEGIN
    FA_0 : FA
    PORT MAP(
        A => A0,
        B => B0,
        C_in => C_in,
        S => S0,
        C_Out => FA0_C);

    FA_1 : FA
    PORT MAP(
        A => A1,
        B => B1,
        C_in => FA0_C,
        S => S1,
        C_Out => FA1_C);

    FA_2 : FA
    PORT MAP(
        A => A2,
        B => B2,
        C_in => FA1_C,
        S => S2,
        C_Out => C_out);
END Behavioral;