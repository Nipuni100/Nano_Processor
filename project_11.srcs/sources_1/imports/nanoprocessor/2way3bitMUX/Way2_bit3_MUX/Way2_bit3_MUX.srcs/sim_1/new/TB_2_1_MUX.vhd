----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 09:18:24 PM
-- Design Name: 
-- Module Name: TB_2_1_MUX - Behavioral
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

entity TB_2_1_MUX is
--  Port ( );
end TB_2_1_MUX;

architecture Behavioral of TB_2_1_MUX is
    component  MUX_2to1
        Port ( MUX2_1_In : in STD_LOGIC_VECTOR (1 downto 0);
               EN : in STD_LOGIC;
               MUX2_1_Out : out STD_LOGIC);
    end component;
    
signal MUX2_1_In: STD_LOGIC_VECTOR(1 downto 0);
signal EN, MUX2_1_Out: STD_LOGIC;   

begin

    UUT: MUX_2to1
       PORT MAP(
        MUX2_1_In=>MUX2_1_In,
        EN=>EN,
        MUX2_1_Out=> MUX2_1_Out);

process
begin
    MUX2_1_In(0)<='0';
    MUX2_1_In(1)<='1';
    EN<='1';
    wait for 40ns;
    
    MUX2_1_In(0)<='1';
    MUX2_1_In(1)<='0';
    EN<='1';
    wait for 40ns;
    
    MUX2_1_In(0)<='0';
    MUX2_1_In(1)<='1';
    EN<='0';
    wait for 40ns;
    
    MUX2_1_In(0)<='0';
    MUX2_1_In(1)<='1';
    EN<='1';
    wait for 40ns;


end process;        


end Behavioral;
