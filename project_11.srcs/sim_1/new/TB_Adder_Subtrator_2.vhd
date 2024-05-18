----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 09:23:43 AM
-- Design Name: 
-- Module Name: TB_Adder_Subtrator_2 - Behavioral
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

entity TB_Adder_Subtrator_2 is
--  Port ( );
end TB_Adder_Subtrator_2;

architecture Behavioral of TB_Adder_Subtrator_2 is 
      component Adder_Subtractor_2
      port(     A : in STD_LOGIC_VECTOR (3 downto 0);
                B : in STD_LOGIC_VECTOR (3 downto 0);
                C_in : in STD_LOGIC;
                C_out : out STD_LOGIC;
                S : out STD_LOGIC_VECTOR (3 downto 0);
                Zero : out STD_LOGIC);
      end component;
      signal C_in , C_out , Zero : STD_LOGIC;
      signal A,B,S : STD_LOGIC_VECTOR (3 downto 0);

begin
UUT : Adder_Subtractor_2
    port map(
    A => A,
    B => B,
    S => S,
    C_in => C_in,
    C_out => C_out,
    Zero => Zero);  
    
 process
 begin
 C_in <= '0';
 A <= "1001";
 B <= "0111";
 WAIT FOR 100ns;
  
 A <= "1000";
  B <= "0011";
   WAIT FOR 100ns;
   
    A <= "1001";
   B <= "1011";
    WAIT FOR 100ns;
    
    C_in <= '1';
     A <= "1111";
    B <= "1101";
     WAIT FOR 100ns;
     
      A <= "1101";
     B <= "1001";
      WAIT FOR 100ns;
      
       A <= "1011";
      B <= "0111";
       WAIT FOR 100ns;
    
     A <= "1001";
    B <= "1000";
     WAIT FOR 100ns;
  wait;
 end process;
 
   

end Behavioral;
