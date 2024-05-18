----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 11:49:48 AM
-- Design Name: 
-- Module Name: TB_RCA_3 - Behavioral
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

entity TB_RCA_3 is
--  Port ( );
end TB_RCA_3;

architecture Behavioral of TB_RCA_3 is
COMPONENT RCA_3
PORT(A : in STD_LOGIC_VECTOR (2 downto 0);
          -- B : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC);
END COMPONENT;
SIGNAL C_out : STD_LOGIC;
SIGNAL A,S:  STD_LOGIC_VECTOR (2 downto 0);

begin
UUT : RCA_3 PORT MAP(
 A(0) =>A(0),
 A(1)=>A(1),
 A(2)=>A(2),
 
-- B(0)=>B(0),
-- B(1)=>B(1),
-- B(2)=>B(2),
 
 C_in =>'0',
 
 S(0) =>S(0),
 S(1) =>S(1),
 S(2) =>S(2),
 
 C_out =>C_out);

process
begin
---------------------------- Index No =210203M----------- 0011 0011 0101 0001 1011 ------
-- 0001 +1011
 A(0)<= '1';
 A(1)<= '0';
 A(2)<= '0';
 
---- B(0)<='1';
 --B(1)<='1';
 --B(2)<='0';
 
 wait for 100ns;
 
 A(0)<= '1';
 A(1)<= '1';
 A(2)<= '0';
 
-- B(0)<='1';
-- B(1)<='1';
-- B(2)<='0';
 
 wait for 100ns;
 
  A(0)<= '1';
 A(1)<= '0';
 A(2)<= '1';
 
-- B(0)<='1';
-- B(1)<='1';
-- B(2)<='0';
 
 wait for 100ns;
 
  A(0)<= '1';
 A(1)<= '0';
 A(2)<= '1';
 
-- B(0)<='1';
-- B(1)<='1';
-- B(2)<='1';
 
 wait for 100ns;
 
 A(0)<= '0';
 A(1)<= '0';
 A(2)<= '1';
 
-- B(0)<='1';
-- B(1)<='1';
-- B(2)<='1';
 
 wait for 100ns;
 end process;
 


end Behavioral;
