----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 11:50:52 PM
-- Design Name: 
-- Module Name: TB_ROM - Behavioral
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

entity TB_ROM is
--  Port ( );
end TB_ROM;

architecture Behavioral of TB_ROM is
    component ROM
    Port ( PC : in STD_LOGIC_VECTOR (2 downto 0);
           Ins : out STD_LOGIC_VECTOR (11 downto 0));
    end component;
    
    signal PC: STD_LOGIC_VECTOR (2 downto 0);
    signal Ins : STD_LOGIC_VECTOR (11 downto 0);

begin
    UUT: ROM
        PORT MAP(
            PC=>PC,
            Ins=>Ins);
    
process 
begin

    PC<="000";
    wait for 50ns;
    
    PC<="001";
    wait for 50ns;
    
    PC<="010";
    wait for 50ns;
    
    PC<="011";
    wait for 50ns;
    
    PC<="100";
    wait for 50ns;
    
    PC<="101";
    wait for 50ns;
    
end process;

end Behavioral;
