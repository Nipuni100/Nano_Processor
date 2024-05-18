----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/04/2023 11:49:50 AM
-- Design Name: 
-- Module Name: Program_Counter - Behavioral
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

entity Program_Counter is
    Port ( Input : in STD_LOGIC_VECTOR (2 downto 0):="000";
           Output : out STD_LOGIC_VECTOR (2 downto 0);
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC);
end Program_Counter;

architecture Behavioral of Program_Counter is
    component D_FF
        Port( D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
    end component;
begin
    D_FF_0: D_FF
        PORT MAP(
        D=>Input(0),
        Res=> Reset,
        Clk=>Clk,
        Q=>Output(0));
    
    D_FF_1: D_FF
        PORT MAP(
        D=>Input(1),
        Res=> Reset,
        Clk=>Clk,
        Q=>Output(1));
    
     D_FF_2: D_FF
       PORT MAP(
       D=>Input(2),
       Res=> Reset,
       Clk=>Clk,
       Q=>Output(2));


end Behavioral;
