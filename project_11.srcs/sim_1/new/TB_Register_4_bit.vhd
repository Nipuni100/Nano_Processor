----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 10:39:04 AM
-- Design Name: 
-- Module Name: TB_Register_4_bit - Behavioral
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

entity TB_Register_4_bit is
--  Port ( );
end TB_Register_4_bit;

architecture Behavioral of TB_Register_4_bit is
Component Register_4_bit is 
    port( D : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           Res : in STD_LOGIC;
           En : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Component;

signal D : STD_LOGIC_VECTOR (3 downto 0);
signal Clk : STD_LOGIC:= '0';
signal Res : STD_LOGIC;
signal En : STD_LOGIC:='1';
signal Q : STD_LOGIC_VECTOR (3 downto 0):="0000";

begin

UUT : Register_4_bit
Port map (
          D => D,
          Clk => Clk,
          Res => Res,
          En => En,
          Q => Q
          );
process 
begin
Clk <= not Clk;
wait for 50 ns;
end process;

process 
begin
D <= "0000";
Res <= '1';
wait for 100ns;

D<= "0100";
Res <= '0';
wait for 100ns;

D<= "0101";
wait for 100ns;

D<= "0110";
wait for 100ns;


end process;

          


end Behavioral;
