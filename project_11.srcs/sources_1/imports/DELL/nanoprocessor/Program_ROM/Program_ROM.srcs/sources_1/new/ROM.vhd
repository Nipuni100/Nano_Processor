----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 11:06:54 PM
-- Design Name: 
-- Module Name: ROM - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM is
    Port ( PC : in STD_LOGIC_VECTOR (2 downto 0);
           Ins : out STD_LOGIC_VECTOR (11 downto 0));
end ROM;

architecture Behavioral of ROM is

type rom_type is array (0 to 7) of std_logic_vector(11 downto 0);

signal ROM: rom_type := (
--  
   
--          "100010000011",
--    "100010000011",
--    "100100000001",
--    "010100000000",
--    "001110010000",
--    "000010100000",
--    "110010000111",
--    "110000000011",
--    "110000000111");
           
--           "100010000011",--mov r1,3
--           "100100000001",--mov  r2 ,1
--           "010100000000",--neg r2 ,
--           "001110010000",--add r7,r1->r7
--           "000010100000", --add r2,r1 ->r1
 
--           "110010000111",
--           "110000000011",
--           "110000000111");
           "101110000000",
           "100010000001",
           "100100000010",
           "100110000011",
           "001110010000",
           "001110100000",
           "001110110000",
           "110000000111");
           
           
           
begin

    Ins<= ROM(to_integer(unsigned(PC)));

end Behavioral;
  