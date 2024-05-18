----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 08:28:22 AM
-- Design Name: 
-- Module Name: Way2_4bit_MUX - Behavioral
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

entity Way2_4bit_MUX is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0); --LS=0; D = A
           B : in STD_LOGIC_VECTOR (3 downto 0);
           LS : in STD_LOGIC;
           D : out STD_LOGIC_VECTOR (3 downto 0));
end Way2_4bit_MUX;

architecture Behavioral of Way2_4bit_MUX is
    component MUX_2to1
    Port ( MUX2_1_In : in STD_LOGIC_VECTOR (1 downto 0);
           EN : in STD_LOGIC;
           MUX2_1_Out : out STD_LOGIC);
    end component;

begin
    
    MUX_2_to_1_0: MUX_2to1
        PORT MAP(
            MUX2_1_In(0)=>A(0),
            MUX2_1_In(1)=>B(0),
            MUX2_1_Out=>D(0),
            EN=> LS
            );

    MUX_2_to_1_1: MUX_2to1
        PORT MAP(
            MUX2_1_In(0)=>A(1),
            MUX2_1_In(1)=>B(1),
            MUX2_1_Out=>D(1),
            EN=> LS
            );
    MUX_2_to_1_2: MUX_2to1
        PORT MAP(
            MUX2_1_In(0)=>A(2),
            MUX2_1_In(1)=>B(2),
            MUX2_1_Out=>D(2),
            EN=> LS
            );
    MUX_2_to_1_3: MUX_2to1
        PORT MAP(
            MUX2_1_In(0)=>A(3),
            MUX2_1_In(1)=>B(3),
            MUX2_1_Out=>D(3),
            EN=> LS
            );
end Behavioral;
