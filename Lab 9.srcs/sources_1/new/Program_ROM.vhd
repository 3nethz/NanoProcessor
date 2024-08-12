----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/06/2023 01:52:25 PM
-- Design Name: 
-- Module Name: Program_ROM - Behavioral
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
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

ENTITY ProgramRom IS
    PORT (
        Mem_address : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        Instruction : OUT STD_LOGIC_VECTOR (11 DOWNTO 0));
END ProgramRom;

ARCHITECTURE Behavioral OF ProgramRom IS
    TYPE rom_type IS ARRAY (0 TO 7) OF STD_LOGIC_VECTOR(11 DOWNTO 0);
    SIGNAL progam_ROM : rom_type := (
        "100100000011", --MOVI R2, 3	            10 RRR 000 0011
        "101110000000", --MOVI R7, 0	            10 RRR 000 0000
        "101000001111", --MOVI R4, -1	            10 RRR 000 1110
        "001110100000", --ADD R7, R2				00 RRR RRR 0000 
        "000101000000", --ADD R2, R4				00 RRR RRR 0000
        "110100000111", --JZR R2, 8				    11 RRR 0000 111
        "110000000011", --JZR R0,4				    11 RRR 0000 100
        "001110000000" --ADD R7, R0				    00 RRR RRR 0000
    );
    
BEGIN
    Instruction <= progam_ROM(to_integer(unsigned(Mem_address)));
END Behavioral;