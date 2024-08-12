----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 12:37:52 AM
-- Design Name: 
-- Module Name: TB_Mux_2_to_1_4bit - Behavioral
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

ENTITY TB_Mux_2_to_1_4bit IS
    --  Port ( );
END TB_Mux_2_to_1_4bit;

ARCHITECTURE Behavioral OF TB_Mux_2_to_1_4bit IS
    COMPONENT Mux_2_to_1_4bit
        PORT (
            S : IN STD_LOGIC;
            A : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            B : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
            X : OUT STD_LOGIC_VECTOR (3 DOWNTO 0));
    END COMPONENT;

    SIGNAL S : STD_LOGIC;
    SIGNAL A : STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
    SIGNAL B : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1110";
    SIGNAL X : STD_LOGIC_VECTOR(3 DOWNTO 0);

BEGIN
    UUT : Mux_2_to_1_4bit PORT MAP(
        S => S,
        A => A,
        B => B,
        X => X
    );
    PROCESS
    BEGIN

        S <= '0';

        WAIT FOR 100ns;
        S <= '1';

        WAIT FOR 100ns;
        S <= '0';
        A <= "0101";

        WAIT FOR 100ns;
        S <= '1';
        B <= "0010";

        WAIT;

    END PROCESS;
END Behavioral;