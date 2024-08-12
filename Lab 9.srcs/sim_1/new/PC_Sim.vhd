----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 04:18:04 PM
-- Design Name: 
-- Module Name: PC_Sim - Behavioral
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

ENTITY PC_Sim IS
    --  Port ( );
END PC_Sim;

ARCHITECTURE Behavioral OF PC_Sim IS
    COMPONENT PC
        PORT (
            D_in : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            Res : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            Q_out : OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
    END COMPONENT;

    SIGNAL D_in : STD_LOGIC_VECTOR(2 DOWNTO 0);
    SIGNAL Res, Clk : STD_LOGIC;
    SIGNAL Q_out : STD_LOGIC_VECTOR(2 DOWNTO 0);

    CONSTANT Clk_period : TIME := 10 ns;

BEGIN
    UUT : PC PORT MAP(
        D_in => D_in,
        Res => Res,
        Clk => Clk,
        Q_out => Q_out
    );

    Clk_process : PROCESS
    BEGIN
        Clk <= '0';
        WAIT FOR Clk_period/2;
        Clk <= '1';
        WAIT FOR Clk_period/2;
    END PROCESS;

    PROCESS
    BEGIN
        D_in(0) <= '0';
        D_in(1) <= '0';
        D_in(2) <= '0';
        Res <= '1';

        WAIT FOR 100ns;
        Res <= '0';
        D_in(0) <= '0';
        D_in(1) <= '0';
        D_in(2) <= '1';

        WAIT FOR 100ns;
        D_in(0) <= '1';
        D_in(1) <= '0';
        D_in(2) <= '1';

        WAIT FOR 100ns;
        D_in(0) <= '1';
        D_in(1) <= '1';
        D_in(2) <= '1';        
        WAIT;
    END PROCESS;
END Behavioral;