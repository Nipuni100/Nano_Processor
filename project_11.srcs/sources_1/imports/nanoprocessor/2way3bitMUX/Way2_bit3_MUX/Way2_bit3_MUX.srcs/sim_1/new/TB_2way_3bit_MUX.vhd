----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/07/2023 07:54:17 PM
-- Design Name: 
-- Module Name: TB_2way_3bit_MUX - Behavioral
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

entity TB_2way_3bit_MUX is
--  Port ( );
end TB_2way_3bit_MUX;

architecture Behavioral of TB_2way_3bit_MUX is
    component Way2_3_Mux
        Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
               B : in STD_LOGIC_VECTOR (2 downto 0);
               JF : in STD_LOGIC;
               To_PC : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    signal A,B, To_PC : STD_LOGIC_VECTOR(2 downto 0);
    signal JF: STD_LOGIC;

begin
    UUT: Way2_3_Mux
        PORT MAP(
            A=>A,
            B=>B,
            JF=>JF,
            To_PC=>To_PC);
    process
    begin
        A<="001";
        B<="100";
        JF<='1';
        
        wait for 40ns;
        
        A<="001";
        B<="100";
        JF<='0';
        
        wait for 40ns;
        
        A<="101";
        B<="111";
        JF<='1';
        
        wait for 40ns;
        
        A<="101";
        B<="111";
        JF<='0';
        
        wait for 40ns;
        
        A<="011";
        B<="110";
        JF<='1';
        
        wait for 40ns;
        
        A<="011";
        B<="110";
        JF<='0';
        
        wait for 40ns;

               
    end process;
    

end Behavioral;
