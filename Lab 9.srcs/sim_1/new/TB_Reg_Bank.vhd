----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 08:16:32 PM
-- Design Name: 
-- Module Name: TB_Reg_Bank - Behavioral
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

ENTITY TB_Reg_Bank IS
    --  Port ( );
END TB_Reg_Bank;

ARCHITECTURE Behavioral OF TB_Reg_Bank IS
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
        B7 : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
        );
    END COMPONENT;

    SIGNAL Reg_En : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL Clk : STD_LOGIC := '0';
    SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL Reg_Bank_En : STD_LOGIC;
    SIGNAL Reset : STD_LOGIC;
    SIGNAL B0 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B1 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B2 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B3 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B4 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B5 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B6 : STD_LOGIC_VECTOR(3 DOWNTO 0);
    SIGNAL B7 : STD_LOGIC_VECTOR(3 DOWNTO 0);

    CONSTANT clk_period : TIME := 10 ns;

BEGIN
    UUT : Register_Bank PORT MAP(
        Reg_En => Reg_En,
        Clk => Clk,
        A => A,
        Reg_Bank_En => Reg_Bank_En,
        Reset => Reset,
        B0 => B0,
        B1 => B1,
        B2 => B2,
        B3 => B3,
        B4 => B4,
        B5 => B5,
        B6 => B6,
        B7 => B7
    );
    Clk <= NOT Clk AFTER clk_period / 2;

    PROCESS
        --index 11 0011 0100 1111 1111
    BEGIN
        Reg_En <= "001";
        A <= "1111";
        Reg_Bank_En <= '1';
        Reset <= '0';

        WAIT FOR clk_period;
        Reg_En <= "001";
        A <= "1111";
        Reg_Bank_En <= '1';
        Reset <= '1';

        WAIT FOR clk_period;
        Reg_En <= "010";
        A <= "0100";
        Reg_Bank_En <= '1';
        Reset <= '0';

        WAIT FOR clk_period;
        Reg_En <= "011";
        A <= "0011";
        Reg_Bank_En <= '1';
        Reset <= '0';

        WAIT FOR clk_period;
        Reg_En <= "100";
        A <= "0010";
        Reg_Bank_En <= '1';
        Reset <= '0';

        WAIT FOR clk_period;
        Reg_En <= "110";
        A <= "0110";
        Reg_Bank_En <= '1';
        Reset <= '0';

        WAIT FOR clk_period;
        Reg_En <= "111";
        A <= "0101";
        Reg_Bank_En <= '1';
        Reset <= '0';

        WAIT;
    END PROCESS;
END Behavioral;