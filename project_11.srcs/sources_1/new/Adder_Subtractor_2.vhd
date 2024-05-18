----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/02/2023 08:53:20 AM
-- Design Name: 
-- Module Name: Adder_Subtractor_2 - Behavioral
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

entity Adder_Subtractor_2 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           C_in : in STD_LOGIC;
           C_out : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC);
end Adder_Subtractor_2;

architecture Behavioral of Adder_Subtractor_2 is
      component FA
      port( A : in STD_LOGIC;
                 B : in STD_LOGIC;
                 C_in : in STD_LOGIC;
                 S : out STD_LOGIC;
                 C_Out : out STD_LOGIC);
       end component;
       
       signal FA0_C,FA1_C,FA2_C, FA3_C :STD_LOGIC;
       signal FA0_B,FA1_B,FA2_B,FA3_B :STD_LOGIC;
       signal S_0,S_1,S_2,S_3 :STD_LOGIC;
       
       
      

begin
     FA0 : FA
     PORT MAP(
     A => A(0),
     B => FA0_B,
     S => S_0,
     C_in => C_in,
     C_Out => FA0_C);
     
FA1 : FA
          PORT MAP(
          A => A(1),
          B => FA1_B,
          S => S_1,
          C_in => FA0_C,
          C_Out => FA1_C);

FA2 : FA
     PORT MAP(
     A => A(2),
     B => FA2_B,
     S => S_2,
     C_in => FA1_C,
     C_Out => FA2_C);

FA3 : FA
     PORT MAP(
     A => A(3),
     B => FA3_B,
     S => S_3,
     C_in => FA2_C,
     C_Out => FA3_C);
     
FA0_B <= B(0) XOR C_in;
FA1_B <= B(1) XOR C_in;
FA2_B <= B(2) XOR C_in;
FA3_B <= B(3) XOR C_in;

--S_0 <= FA0_B XOR A(0) XOR C_in;
--S_1 <= FA1_B XOR A(1) XOR FA0_C;
--S_2 <= FA2_B XOR A(2) XOR FA1_C;
--S_3 <= FA3_B XOR A(3) XOR FA2_C;

S(0) <= S_0;
S(1) <= S_1;
S(2) <= S_2;
S(3) <= S_3;

Zero <= not(S_0 or S_1 or S_2 or S_3);


C_out <= FA3_C;


end Behavioral;
