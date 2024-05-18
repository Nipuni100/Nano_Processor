----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 10:32:56 PM
-- Design Name: 
-- Module Name: TB_PC - Behavioral
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

entity TB_PC is
--  Port ( );
end TB_PC;

architecture Behavioral of TB_PC is
    component Program_Counter
    Port ( Input : in STD_LOGIC_VECTOR (2 downto 0);
           Output : out STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC);
    end component;
    
    signal Input, Output : STD_LOGIC_VECTOR(2 downto 0);
    signal Res : STD_LOGIC;
    signal clk: STD_LOGIC := '0';
    

begin
    UUT : Program_Counter
        PORT MAP(
            Input=>Input,
            Output=>Output,
            Clk=>clk,
            Reset=>Res);
            
process
begin
    clk<= NOT(clk);
    wait for 10ns;
end process;

process
begin
    Input<="000";
    Res<='1';
    wait for 50ns;
    
    Res<='0';
    wait for 50ns;
    
    Input<="001";
    wait for 50ns;
    
    Input<="110";
    wait for 50ns;
    
    Input<="011";
    wait for 50ns;
    
    Input<="111";
    wait for 50ns;
   
                   
end process;

end Behavioral;
