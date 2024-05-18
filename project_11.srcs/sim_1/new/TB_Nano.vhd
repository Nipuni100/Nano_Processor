----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/08/2023 05:17:54 PM
-- Design Name: 
-- Module Name: TB_Nano - Behavioral
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

entity TB_Nano is
--  Port ( );
end TB_Nano;

architecture Behavioral of TB_Nano is
    component Nano
    port(     Clk : in STD_LOGIC;
              Res : in STD_LOGIC;
              C : out STD_LOGIC;
              Z : out STD_LOGIC;
              R7_out : out STD_LOGIC_VECTOR (3 downto 0);
              S7_seg : out STD_LOGIC_VECTOR (6 downto 0);
              Anode : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    signal R ,c ,z : STD_LOGIC;
    signal r_out,anode : STD_LOGIC_VECTOR (3 downto 0);
    signal S : STD_LOGIC_VECTOR (6 downto 0);
    signal clk : STD_LOGIC := '0';
    
begin
    UUT : Nano
    port map(
          Clk => clk,
          Res => R,
          C => c,
          Z => z,
          R7_out => r_out,
          S7_seg => S,
          Anode => anode);
process
begin
    clk <= NOT (clk);
    wait for 2ns;
end process;


process
begin
        R <= '1';
        wait for 40ns;
        
         R <= '0';
         wait;
end process;

end Behavioral;
