----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 09:49:11 PM
-- Design Name: 
-- Module Name: TB_Way2_4_MUX - Behavioral
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

entity TB_Way2_4_MUX is
--  Port ( );
end TB_Way2_4_MUX;

architecture Behavioral of TB_Way2_4_MUX is
     component Way2_4bit_MUX
        Port ( A : in STD_LOGIC_VECTOR (3 downto 0); --LS=0; D = A
               B : in STD_LOGIC_VECTOR (3 downto 0);
               LS : in STD_LOGIC;
               D : out STD_LOGIC_VECTOR (3 downto 0));
     end component;
     
     signal A, B, D : STD_LOGIC_VECTOR (3 downto 0);
     signal LS: STD_LOGIC;
 
begin
    UUT: Way2_4bit_MUX
        Port MAP(
            A=>A,
            B=>B,
            LS=> LS,
            D=> D);
            
process
    begin
        A<="1010";
        B<="0010";
        LS<='0';
        wait for 30ns;
        
        LS<='1';
        wait for 30ns;
        
        A<="1111";
        B<="0101";
        LS<='0';
        wait for 30ns;
        
        LS<='1';
        wait for 30ns;
        
        A<="1000";
        B<="1110";
        LS<='0';
        wait for 30ns;
        
        LS<='1';
        wait for 30ns;
        
        A<="1110";
        B<="0110";
        LS<='0';
        wait for 30ns;
        
        LS<='1';
        wait for 30ns;
        
        A<="1001";
        B<="0101";
        LS<='0';
        wait for 30ns;
        
        LS<='1';
        wait for 30ns;
        
        A<="1011";
        B<="1110";
        LS<='0';
        wait for 30ns;
        
        LS<='1';
        wait for 30ns;
        
 end process;           


end Behavioral;
