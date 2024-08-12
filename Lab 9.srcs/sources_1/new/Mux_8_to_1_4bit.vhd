----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 12:50:47 AM
-- Design Name: 
-- Module Name: Mux_8_to_1_4bit - Behavioral
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

ENTITY Mux_8_to_1_4bit IS
    PORT (
        S : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        C : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        D : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        E : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        F : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        G : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        H : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
        X : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
END Mux_8_to_1_4bit;

ARCHITECTURE Behavioral OF Mux_8_to_1_4bit IS

BEGIN
    WITH s SELECT
        X <= A WHEN "000",
        B WHEN "001",
        C WHEN "010",
        D WHEN "011",
        E WHEN "100",
        F WHEN "101",
        G WHEN "110",
        H WHEN OTHERS;

END behavioral;