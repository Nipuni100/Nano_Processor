----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 11:53:13 AM
-- Design Name: 
-- Module Name: Way8_TB - Behavioral
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

entity Way8_TB is
--  Port ( );
end Way8_TB;

architecture Behavioral of Way8_TB is
    component Way8_4_MUX
    Port ( D0, D1, D2, D3, D4, D5, D6, D7 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    signal D0, D1, D2, D3, D4, D5, D6, D7 : STD_LOGIC_VECTOR (3 downto 0);
    signal S: STD_LOGIC_VECTOR (2 downto 0);
    signal Y: STD_LOGIC_VECTOR (3 downto 0);
    --signal EN: STD_LOGIC;

begin 
    UUT: Way8_4_MUX
    PORT MAP(
        D0=>D0,
        D1=>D1,
        D2=>D2,
        D3=>D3,
        D4=>D4,
        D5=>D5,
        D6=>D6,
        D7=>D7,
        S=>S,
        --EN=>EN,
        Y=>Y
        );
    process
    begin
    --210257= 0011 0011 1010 1010 0001
    --EN<='1';
    D0<="0000";
    D1<="0001";
    D2<="0010";
    D3<="0011";
    D4<="0100";
    D5<="0101";
    D6<="0110";
    D7<="0111";
    
    S<="000";
    wait for 100ns;
    S<="001";
    wait for 50ns;
    S<="010";
    wait for 50ns;
    S<="011";
    wait for 50ns;
    S<="100";
    wait for 50ns;
    S<="101";
    wait for 50ns;
    S<="110";
    wait for 50ns;
    S<="111";
    wait;
    end process;    
             
end Behavioral;
