----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 12:11:03 AM
-- Design Name: 
-- Module Name: 2_way_3_bit_mux - Behavioral
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

ENTITY Mux_2_to_1_3bit IS
    PORT (
        S : IN STD_LOGIC;
        A : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        X : OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
END Mux_2_to_1_3bit;

ARCHITECTURE Behavioral OF Mux_2_to_1_3bit IS

BEGIN
    X <= A WHEN (S = '1') ELSE
    B;

END Behavioral;