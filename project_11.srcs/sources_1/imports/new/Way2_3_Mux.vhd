----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 07:35:24 AM
-- Design Name: 
-- Module Name: Way2_3_Mux - Behavioral
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

entity Way2_3_Mux is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           B : in STD_LOGIC_VECTOR (2 downto 0);
           JF : in STD_LOGIC;
           To_PC : out STD_LOGIC_VECTOR (2 downto 0));
end Way2_3_Mux;

architecture Behavioral of Way2_3_Mux is
    component MUX_2to1
    Port ( MUX2_1_In : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           MUX2_1_Out : out STD_LOGIC);
    end component;

begin
    MUX_2_1_0 : MUX_2to1
    PORT MAP(
        MUX2_1_In(0)=>A(0),
        MUX2_1_In(1)=>B(0),
        EN=>JF,
        MUX2_1_Out=>To_PC(0));
    
   MUX_2_1_1 : MUX_2to1
   PORT MAP(
       MUX2_1_In(0)=>A(1),
       MUX2_1_In(1)=>B(1),
       EN=>JF,
       MUX2_1_Out=>To_PC(1));
   
   MUX_2_1_2 : MUX_2to1
   PORT MAP(
      MUX2_1_In(0)=>A(2),
      MUX2_1_In(1)=>B(2),
      EN=>JF,
      MUX2_1_Out=>To_PC(2));

end Behavioral;
