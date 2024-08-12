----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 12:38:17 AM
-- Design Name: 
-- Module Name: TB_Mux_8_to_1_4bit - Behavioral
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

ENTITY TB_Mux_8_to_1_4bit IS
    --  Port ( );
END TB_Mux_8_to_1_4bit;

ARCHITECTURE Behavioral OF TB_Mux_8_to_1_4bit IS

    COMPONENT Mux_8_to_1_4bit
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
    END COMPONENT;

    SIGNAL S : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL A : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";
    SIGNAL B : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0011";
    SIGNAL C : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0010";
    SIGNAL D : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0111";
    SIGNAL E : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1000";
    SIGNAL F : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1001";
    SIGNAL G : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1010";
    SIGNAL H : STD_LOGIC_VECTOR (3 DOWNTO 0) := "1100";
    SIGNAL X : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0001";

BEGIN
    UUT : Mux_8_to_1_4bit PORT MAP(
        S => S,
        A => A,
        B => B,
        C => C,
        D => D,
        E => E,
        F => F,
        G => G,
        H => H,
        X => X
    );

    PROCESS
    BEGIN

        S <= "001";

        WAIT FOR 100ns;
        S <= "010";

        WAIT;
    END PROCESS;

END Behavioral;