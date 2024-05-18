----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 07:28:06 AM
-- Design Name: 
-- Module Name: MUX_2to1 - Behavioral
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

entity MUX_2to1 is
    Port ( MUX2_1_In : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           MUX2_1_Out : out STD_LOGIC);
end MUX_2to1;

architecture Behavioral of MUX_2to1 is
   
begin
    MUX2_1_Out<=((NOT EN) AND MUX2_1_In(1)) OR (EN AND MUX2_1_In(0));


end Behavioral;
