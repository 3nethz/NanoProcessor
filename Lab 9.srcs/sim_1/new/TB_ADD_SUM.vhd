----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2023 12:19:53 PM
-- Design Name: 
-- Module Name: TB_4_RCA - Behavioral
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

ENTITY TB_ADD_SUM IS
    --  Port ( );
END TB_ADD_SUM;

ARCHITECTURE Behavioral OF TB_ADD_SUM IS
    COMPONENT Add_Sub
        PORT (
            A0, A1, A2, A3, B0, B1, B2, B3, M : IN STD_LOGIC;
            S0, S1, S2, S3, Zero_flag, Sign_flag, Overflow_flag, Carry_flag : OUT STD_LOGIC);
    END COMPONENT;
    SIGNAL A0, A1, A2, A3, B0, B1, B2, B3, M : STD_LOGIC;
    SIGNAL S0, S1, S2, S3, Zero_flag, Sign_flag, Overflow_flag, Carry_flag : STD_LOGIC;

BEGIN
    UUT : Add_Sub PORT MAP(
        M => M,
        A0 => A0,
        A1 => A1,
        A2 => A2,
        A3 => A3,
        B0 => B0,
        B1 => B1,
        B2 => B2,
        B3 => B3,
        S0 => S0,
        S1 => S1,
        S2 => S2,
        S3 => S3,
        Sign_flag => Sign_flag,
        Zero_flag => Zero_flag,
        Overflow_flag => Overflow_flag,
        Carry_flag => Carry_flag
    );

    PROCESS
    BEGIN
        --2. 11 0011 0101 1111 1101
        M <= '0';
        A0 <= '0';
        A1 <= '0';
        A2 <= '0';
        A3 <= '0';
        B0 <= '0';
        B1 <= '0';
        B2 <= '0';
        B3 <= '0';
        WAIT FOR 100ns;
        A0 <= '1';
        A1 <= '0';
        A2 <= '1';
        A3 <= '1';
        B0 <= '1';
        B1 <= '1';
        B2 <= '1';
        B3 <= '1';
        WAIT FOR 100ns;
        M <= '1';
        A0 <= '1';
        A1 <= '0';
        A2 <= '1';
        A3 <= '0';
        B0 <= '0';
        B1 <= '0';
        B2 <= '0';
        B3 <= '0';
        WAIT FOR 100ns;
        M <= '0';
        A0 <= '1';
        A1 <= '0';
        A2 <= '1';
        A3 <= '0';
        B0 <= '1';
        B1 <= '1';
        B2 <= '0';
        B3 <= '0';
        WAIT FOR 100ns;
        M <= '0';
        A0 <= '1';
        A1 <= '1';
        A2 <= '1';
        A3 <= '1';
        B0 <= '1';
        B1 <= '1';
        B2 <= '1';
        B3 <= '0';
        WAIT FOR 100ns;
        M <= '1';
        A0 <= '1';
        A1 <= '1';
        A2 <= '0';
        A3 <= '1';
        B0 <= '1';
        B1 <= '0';
        B2 <= '1';
        B3 <= '0';
        WAIT FOR 100ns;
        M <= '1';
        A0 <= '1';
        A1 <= '0';
        A2 <= '1';
        A3 <= '0';
        B0 <= '1';
        B1 <= '0';
        B2 <= '1';
        B3 <= '0';
        WAIT FOR 100ns;
        M <= '0';
        A0 <= '1';
        A1 <= '1';
        A2 <= '0';
        A3 <= '0';
        B0 <= '1';
        B1 <= '1';
        B2 <= '0';
        B3 <= '0';
        WAIT FOR 100ns;
        A0 <= '1';
        A1 <= '1';
        A2 <= '1';
        A3 <= '1';
        B0 <= '0';
        B1 <= '1';
        B2 <= '1';
        B3 <= '1';

        WAIT FOR 100ns;
        A0 <= '0';
        A1 <= '0';
        A2 <= '0';
        A3 <= '0';
        B0 <= '1';
        B1 <= '0';
        B2 <= '1';
        B3 <= '0';
        WAIT;
    END PROCESS;

END Behavioral;