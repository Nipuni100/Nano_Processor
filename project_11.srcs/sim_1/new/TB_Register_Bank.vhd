----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 01:50:10 PM
-- Design Name: 
-- Module Name: TB_Register_Bank - Behavioral
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

entity TB_Register_Bank is
--  Port ( );
end TB_Register_Bank;

architecture Behavioral of TB_Register_Bank is
component Register_Bank
         port( Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           Reg_In : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC_VECTOR (2 downto 0);
           R0 : out STD_LOGIC_VECTOR (3 downto 0);
           R1 : out STD_LOGIC_VECTOR (3 downto 0);
           R2 : out STD_LOGIC_VECTOR (3 downto 0);
           R3 : out STD_LOGIC_VECTOR (3 downto 0);
           R4 : out STD_LOGIC_VECTOR (3 downto 0);
           R5 : out STD_LOGIC_VECTOR (3 downto 0);
           R6 : out STD_LOGIC_VECTOR (3 downto 0);
           R7 : out STD_LOGIC_VECTOR (3 downto 0));
end component;
signal Clk :  STD_LOGIC := '0';
signal Res :  STD_LOGIC;
signal Reg_In :  STD_LOGIC_VECTOR (3 downto 0);
signal En :  STD_LOGIC_VECTOR (2 downto 0);
signal R0,R1,R2,R3,R4,R5,R6,R7 :  STD_LOGIC_VECTOR (3 downto 0);
          

begin
UUT : Register_Bank
     PORT MAP(Clk => Clk,
              Res => Res,
              Reg_In => Reg_In,
              En => En,
              R0 => R0,
              R1 => R1,
              R2 => R2,
              R3 => R3,
              R4 => R4,
              R5 => R5,
              R6 => R6,
              R7 => R7);

Process
begin
    wait for 5ns;
    Clk <= NOT(Clk);
end Process;

process
begin
    Res <= '1';
    wait for 50ns; 
    Res <= '0';
    R0 <= "0000";
    Reg_In <= "0110";
    En <= "001";
    wait for 50ns;
    En <= "010";
    wait for 50ns;
    En <= "011";
    wait for 50ns;
    En <= "100";
    wait for 50ns;
    En <= "101";
    wait for 50ns;
    En <= "110";
    wait for 50ns;
    En <= "111";
    wait for 50ns;
    wait;
end process;
   
end Behavioral;
