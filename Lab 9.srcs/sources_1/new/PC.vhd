----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 03:58:14 PM
-- Design Name: 
-- Module Name: PC - Behavioral
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

ENTITY PC IS
    PORT (
        D_in : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
        Res : IN STD_LOGIC;
        Clk : IN STD_LOGIC;
        Q_out : OUT STD_LOGIC_VECTOR (2 DOWNTO 0));
END PC;

ARCHITECTURE Behavioral OF PC IS
    COMPONENT D_FF
        PORT (
            D : IN STD_LOGIC;
            Res : IN STD_LOGIC;
            Clk : IN STD_LOGIC;
            Q : OUT STD_LOGIC);
    END COMPONENT;

BEGIN

    D_FF0 : D_FF
    PORT MAP(
        D => D_in(0),
        Res => Res,
        Clk => Clk,
        Q => Q_out(0)
    );

    D_FF1 : D_FF
    PORT MAP(
        D => D_in(1),
        Res => Res,
        Clk => Clk,
        Q => Q_out(1)
    );

    D_FF2 : D_FF
    PORT MAP(
        D => D_in(2),
        Res => Res,
        Clk => Clk,
        Q => Q_out(2)
    );
END Behavioral;