----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 04:31:10 PM
-- Design Name: 
-- Module Name: Register_Bank - Behavioral
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


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Register_Bank is
    port (
        Reg_En: in std_logic_vector(2 downto 0);
        Clk: in std_logic;
        A: in std_logic_vector(3 downto 0);
        Reg_Bank_En: in std_logic;
        Reset: in std_logic;
        B0: out std_logic_vector(3 downto 0);
        B1: out std_logic_vector(3 downto 0);
        B2: out std_logic_vector(3 downto 0);
        B3: out std_logic_vector(3 downto 0);
        B4: out std_logic_vector(3 downto 0);
        B5: out std_logic_vector(3 downto 0);
        B6: out std_logic_vector(3 downto 0);
        B7: out std_logic_vector(3 downto 0)
    );
end Register_Bank;

architecture Behavioral of Register_Bank is
component Reg
    port(
          D : in STD_LOGIC_VECTOR (3 downto 0);
          En : in STD_LOGIC;
          Clk : in STD_LOGIC;
          Res : in STD_LOGIC;
          Q : out STD_LOGIC_VECTOR (3 downto 0)
    );
end component;

component Decoder_3_to_8 is
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

   signal YB : std_logic_vector(7 downto 0);
   

begin
    Decoder_3_to_8_1 : Decoder_3_to_8 port map(
        I => Reg_En,
        EN => Reg_Bank_En,
        Y => YB
    );
    
    R0: Reg port map(
        D => "0000",
        En => '1',
        Clk => Clk,
        Res => Reset,
        Q => B0
    );
    R1: Reg port map(
        D => A,
        En => YB(1),
        Clk => Clk,
        Res => Reset,
        Q => B1
    );
    R2: Reg port map(
        D => A,
        En => YB(2),
        Clk => Clk,
        Res => Reset,
        Q => B2
    );
    R3: Reg port map(
        D => A,
        En => YB(3),
        Clk => Clk,
        Res => Reset,
        Q => B3
    );
    R4: Reg port map(
        D => A,
        En => YB(4),
        Clk => Clk,
        Res => Reset,
        Q => B4
    );
    R5: Reg port map(
        D => A,
        En => YB(5),
        Clk => Clk,
        Res => Reset,
        Q => B5
    );
    R6: Reg port map(
        D => A,
        En => YB(6),
        Clk => Clk,
        Res => Reset,
        Q => B6
    );
    R7: Reg port map(
        D => A,
        En => YB(7),
        Clk => Clk,
        Res => Reset,
        Q => B7
    );

end Behavioral;
